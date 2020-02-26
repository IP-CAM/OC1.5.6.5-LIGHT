<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons controls">
			<span><?php echo $text_you_edit_now; ?></span>
			<a href="<?php echo $frontend; ?>" class="<?php if (!isset($_GET['backend']) || !$_GET['backend']) { ?>active<?php } ?>"><span class="reds-btn4"><?php echo $button_frontend; ?></a></span>
			<a href="<?php echo $backend; ?>" class="<?php if (isset($_GET['backend']) && $_GET['backend']) { ?>active<?php } ?>"><span class="reds-btn4"><?php echo $button_backend; ?></a></span>
		</div>
    </div>
    <div class="content">
	  <div id="help">
			<h3><?php echo $text_help; ?></h3>
			<?php echo $text_help_description; ?>
	  </div>
	  <div id="top-panel"></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
            <table class="dataTable">
                <thead></thead>
                <tbody></tbody>
            </table>
			<p style="text-align: center; font-size: 25px; padding: 50px 0;" id="loader"><?php echo $text_loading; ?></p>
			<div id="load-more"><a href="#"><i class="icon-download"> </i>&nbsp;<?php echo $button_load_more; ?></a></div>
      </form>
    </div>
  </div>
</div>
<script type="text/html" id="translationsHeader">
    <tr>
        <th style="width: 15%;"><?php echo $table_page; ?></th>
        <th style="width: 15%;"><?php echo $table_key; ?></th>
        <% _.each(languages, function(lang) { %>
        <th style="width: <%= 70/languagesCount %>%;"><%= lang %></th>
        <% }); %>
    </tr>
    <tr class="filter-row">
        <td>
            <select id="filter-page">
                <option value=""><?php echo $filter_any_page; ?></option>
            <% _.each(pages, function(page) { %>
                <% 
                if (page.indexOf("/") != -1) {
                    var group = page.substr(0, page.indexOf("/"));
                    if (typeof(current_group) == "undefined" || current_group != group) {
                        if (typeof(current_group) != "undefined") {
                            print("</optgroup>");
                        }
                        print("<optgroup label=\"" + group + "\" />");
                        current_group = group;
                    }
                }
                %>
                <option value="<%= page %>" <% if (filter.page == page) { print("selected"); } %> ><%= page.indexOf("/") == -1 ? page : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + page.substr(page.indexOf("/") + 1) %></option>
            <% }); %>
                </optgroup>
            </select>
        </td>
        <td>
            <input type="text" id="filter-key" value="<%= filter.key %>" placeholder="<?php echo $filter_by_key; ?>"/>
        </td>
        <td colspan="<%= languagesCount %>">
            <input type="text" id="filter-translation" value="<%= filter.translation %>" placeholder="<?php echo $filter_by_text_of_translation; ?>"/>
        </td>
    </tr>
	<tr class="filter-row">
		<td colspan="<%= 2+languagesCount %>">
			<input type="checkbox" name="only_not_translated" id="only_not_translated" value="1" <% if (filter.only_not_translated == 1) { print("checked"); } %> /><label for="only_not_translated"><?php echo $filter_show_only_not_translated; ?></label>
		</td>
	</tr>
</script>
<script type="text/html" id="translationsList">
    <% _.each(pages, function(page) { %>
        <% _.each(keys[page], function(translations, key) { %>
        <% totalKeys++; %>
        <tr data-key="<%= key %>" data-page="<%= page %>">
            <td><%= page %></td>
            <td><%= key %></td>
            <% _.each(languages, function(lang) { %>
            <td class="translation-cell" data-lang="<%= [lang] %>"><% if (translations[lang]) { print(escapeTranslation(translations[lang])) } else { print("<span class=\"error\">No translation</span>"); } %></td>
            <% }) %>
        </tr>
        <% 
		}) %>
    <% }) %>
</script>
<script type="text/javascript" src="<?php echo HTTP_SERVER; ?>view/javascript/underscore-min.js"></script>
<script type="text/javascript">

function escapeTranslation(str) {
	return str.replace(/<([/]?)script.*?>/gmi, "[$1script]");
}

function unescapeTranslation(str) {
	return str.replace(/\[([/]?)script.*?\]/gmi, "<$1script>");
}

(function($) {
    function MagicTranslations() {
        this.ajaxUrl = "<?php echo str_replace('&amp;', '&', $action); ?>";
        this.languages = {};
        this.pages = {};
        this.keys = [];
		this.pagination = false;
		this.page = 1;
		this.pageSize = 100;
		this.totalRows = 0;
        this.focusElem = null;
        this.filterParams = {
            'page': null,
            'key' : null,
            'translation' : null,
			'only_not_translated' : null
        }
        this.currentTranslation = '';
        
        //init
        this.init = function() {
            var self = this;
            this.load();
        }
		
		//error
		this.error = function(err) {
			$('#top-panel').html('<p class="err"><span class="error"><b>Error occured:</b></span>' + err + '</p>');
		}

        
        //get keys with translations
        this.load = function() {
            var self = this;
            var main_pages = {};
            
            var sort_object = function(map) {
                var keys = _.sortBy(_.keys(map), function(a) { return a; });
                var newmap = main_pages;
                _.each(keys, function(k) {
                    newmap[k] = map[k];
                });
                return newmap;
            }
            
            $.ajax(self.ajaxUrl, {
				data : {'action' : 'load'}, 
				dataType : 'text',
				success: function(response) {
					//check if JSON is valid
					if (/^[\],:{}\s]*$/.test(response.replace(/\\["\\\/bfnrtu]/g, '@').
						replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
						replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
						json = $.parseJSON(response);
					} else {
					//show error message
						self.error(response);
						return false;
					}
				
					for (var lang in json) {
						//array of languages
						self.languages[lang] = lang;
						
						for (var page in json[lang]) {
							//array of pages
							if (page.indexOf('/') != -1) {
								self.pages[page] = page;
							} else {
								main_pages[page] = page;
							}
							
							for (var key in json[lang][page]) {
								if (typeof(self.keys[page]) == 'undefined') {
									self.keys[page] = {};
								}
								
								if (typeof(self.keys[page][key]) == 'undefined') {
									self.keys[page][key] = {};
								}
								
								self.keys[page][key][lang] = json[lang][page][key];
							}
						}
					}

					self.pages = sort_object(self.pages);

					self.initFilter();
					
					//render view
					self.renderHeader();
					$('#loader').remove();					
					self.renderList();
					
					
					
					//init events
					self.initHandlers();
				},
				
				error: function() {
					self.error('Your server returned 500 error, please enable \'display_errors\' on PHP or .htaccess to see details of error');
				}
			});
		}
        
        //render header with filter
        this.renderHeader = function() {
            var self = this;
            var languagesCount = 0;
            
            //get languages count
            for (var i in self.languages) {
                languagesCount++;
            }
            
            //render template
            var template = $("#translationsHeader").html();
            $("#form thead").html(_.template(template,{
                languages: self.languages,
                pages: self.pages,
                languagesCount: languagesCount,
                filter: self.filterParams
            }));
        }
        
        //render list
        this.renderList = function(append) {
		
			var self = this;
			if (typeof(append) == 'undefined') {
				append = false;
			}

			self.updateHash();
			
			//fade out list
            $('#form').fadeTo(500, 0.25);
            
            //to make fade out effect smooth we wait 500ms and then filter data and render list
            setTimeout(function() {
                var template = $("#translationsList").html();
				var listCode = _.template(template,{
                    languages: self.languages,
                    pages: self.pages,
                    keys: self.filter(),
                    filter: self.filterParams,
                    totalKeys: (self.page-1) * self.pageSize
                });
				
				if (!append) {
					$("#form tbody").html(listCode);
				} else {
					$("#form tbody").append(listCode);
				}
				
				if (self.pagination) {
					$('#load-more').show();
				} else {
					$('#load-more').hide();
				}

                //fade in list
                $('#form').fadeTo(500, 1);
            },500);
        }
        
        //filter keys
        this.filter = function() {
            var self = this;
            
            //clone object of ALL keys
            var keys = jQuery.extend(true, {}, self.keys);

            //filter by page
            if (self.filterParams.page != null) {
                var keys_ = keys[self.filterParams.page];
                keys = {}
                keys[self.filterParams.page]= keys_;
            }
			
			//filter only not translated
            if (self.filterParams.only_not_translated != null && self.filterParams.only_not_translated == true) {
				var bTranslated;
                for (var page in keys) {
                    for (var key in keys[page]) {
                        bTranslated = true;
                        for (var language in self.languages) {
                            if (typeof keys[page][key][language] == 'undefined' || keys[page][key][language] == null) {
                                bTranslated = false;
                            }
                        }
                        if (bTranslated) {
                            delete keys[page][key];
                        }
                    }
                }
            }
            
            //filter by key
            if (self.filterParams.key != null) {
                for (var page in keys) {
                    for (var key in keys[page]) {
                        if (key.indexOf(self.filterParams.key) == -1) {
                            delete keys[page][key];
                        }
                    }
                }
            }

            //filter by translation (check all languages)
            if (self.filterParams.translation != null) {
                var bTranslationFound;
                for (var page in keys) {
                    for (var key in keys[page]) {
                        bTranslationFound = false;
                        for (var language in keys[page][key]) {
                            if (keys[page][key][language] != null && $('<div />').text(keys[page][key][language]).text().toLowerCase().indexOf(self.filterParams.translation) != -1) {
                                bTranslationFound = true;
								break;
                            }
                        }
                        if (!bTranslationFound) {
                            delete keys[page][key];
                        }
                    }
                }
            }

			var iStart = (self.page-1) * self.pageSize;
			var iEnd = self.page * self.pageSize;
			var i = 0;
			for (var p in keys) {
				for (var k in keys[p]) {
					i++;
					if (i <= iStart || i > iEnd) {
						delete keys[p][k];
					}
				}
			}
			
			self.totalKeys = i;

			if (iEnd >= self.totalKeys) {
				self.pagination = false;
			} else {
				self.pagination = true;
			}

            return keys;
        }
		
		//init filter from hash
		this.initFilter = function() {
			var self = this;
			if (location.hash != '') {
				var aPairs = location.hash.substr(1).split('&');
				for (var i in aPairs) {
					var aVals = aPairs[i].split('=');
					self.filterParams[aVals[0]] = aVals[1];
				}
			}
		}
        
        //init handlers for filter and buttons
        this.initHandlers = function() {
            var self = this;
            var keyUpTimeout = null;
            
            //pages filter
            $('#form').on('change', '#filter-page', function() {
                self.filterParams.page = $(this).val() != '' ? $(this).val() : null;
				self.page = 1;
                self.renderList();
            });
            
            //key filter
            $('#form').on('keyup', '#filter-key', function(e) {
                var $this = $(this);
                if (self.filterParams.key == $this.val()) {
                    return;
                }

                clearTimeout(keyUpTimeout);
                keyUpTimeout = setTimeout(function() {
                    self.filterParams.key = $this.val() != '' ? $this.val() : null;
					self.page = 1;
                    self.renderList();
                }, 500);
            });
            
            //translations filter
            $('#form').on('keyup', '#filter-translation', function(e) {
                var $this = $(this);

                if (self.filterParams.translation == $this.val()) {
                    return;
                }

                clearTimeout(keyUpTimeout);
                keyUpTimeout = setTimeout(function() {
                    self.filterParams.translation = $this.val() != '' ? $this.val().toLowerCase() : null;
					self.page = 1;
                    self.renderList();
                }, 500);
            });
			
			//filter not translated keys
			$('#form').on('click', '#only_not_translated', function() {
				self.filterParams.only_not_translated = $(this).attr('checked') ? 1 : null;
				self.page = 1;
				self.renderList();
			});
            
            //click on translation
            $('#form').on('click', '.translation-cell', function(e) {
                e.stopPropagation();
            
                //clear other translation textareas
                $('.translation-textarea').each(function() {
                    $(this).closest('td').html(escapeTranslation($(this).val()));
                });
            
                var $cell = $(this);
                var currentValue = $cell.html();
                
                if (currentValue == '<span class="error">No translation</span>') {
                    currentValue = '';
                }
                self.currentTranslation = unescapeTranslation(currentValue);
                
                var $textarea = $('<textarea />');
                $textarea.attr({
                    'name' : 'translation',
                    'class' : 'translation-textarea',
                    'value' : self.currentTranslation
                });
                
                //show editor, controls(Save, Cancel) and semi-transparent BG
                $cell.html($textarea);
                self.showCtrls($textarea);
                self.showLayer();
				
				$textarea.focus();
				$textarea.get(0).select();
				
            });
            
            //kill click event on parent TD
            $('#form').on('click', '.translation-cell textarea, .translation-cell a', function(e) {
                e.stopPropagation();
            });
            
			//hotkeys handler
			$('#form').on('keyup', '.translation-cell textarea', function(e) {
				//ctrl + Enter
				if ((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey) {
					$('#ctrls-holder [href="#ok"]').click();
				}
				
				//ctrl + x
				if( e.which === 90 && e.ctrlKey ){
					$('#ctrls-holder [href="#cancel"]').click();
				}
			});
			
            //click on control buttons - Save or Cancel
            $('body').on('click', '#ctrls-holder a', function(e) {
                e.preventDefault();
                
                //cancel editing
                if ($(this).attr('href') == '#cancel') {
                    $('.translation-textarea:first').closest('td').html(escapeTranslation(self.currentTranslation));
                    $('#ctrls-holder').remove();
                    self.hideLayer();
                }
                
                //save translation
                if ($(this).attr('href') == '#ok') {
                    self.currentTranslation = $('.translation-textarea:first').val();
                    self.saveCurrentTranslation();
                    $('[href="#cancel"]').click();
                }
            });
			
			$('#load-more').on('click', function(e) {
				e.preventDefault();
				self.page++;
				self.renderList(true);
			});
        }
		
		this.updateHash = function() {
			var self = this;
			
			var hash = '';
			for (var key in self.filterParams) {
				if (self.filterParams[key] != null) {
					hash += key + '=' + self.filterParams[key] + '&';
				}
			}
			
			location.hash = hash.substr(0, hash.length - 1);
		}

        this.showCtrls = function($textarea) {
            //remove old controls if exists
            $('#ctrls-holder').remove();
        
            //create new controls
            var $ctrls = $('<div />').attr({
                'id' : 'ctrls-holder'
            });
            
            //get position of textarea
            var oPos = $textarea.position();

            //control buttons  
            var $ctrlOk = $('<a href="#ok" title="Save translation"><i class="icon-ok">&nbsp;</i></a>');
            var $ctrlCancel = $('<a href="#cancel" title="Cancel"><i class="icon-remove">&nbsp;</i></a>');
            
            $ctrls.append($ctrlOk).append($ctrlCancel);
            
            $ctrls.css({
                'top' : oPos.top -15,
                'left' : oPos.left + $textarea.outerWidth()
            });
            
            //append new controls to the DOM
            $('body:first').append($ctrls);
        }
        
        this.saveCurrentTranslation = function() {
            var self = this;
            var page = $('.translation-textarea:first').closest('tr').data('page');
            var key = $('.translation-textarea:first').closest('tr').data('key');
            var lang = $('.translation-textarea:first').closest('td').data('lang');
            
            $.post(self.ajaxUrl, {
                'action' : 'save',
                'page' : page,
                'key' : key,
                'translation' : self.currentTranslation,
                'lang' : lang
                }, function(response) {
                    if (response == 'ok') {
                        self.keys[page][key][lang] = self.currentTranslation;
                    } else {
						self.error(response.substr(0, response.length-2));
					}
                }, 'text');
                
        }
        
        //show semi-transparent BG
        this.showLayer = function() {
            $('#layer').remove();
            var $layer = $('<div />').attr({
                'id' : 'layer'
            }).height($(document).height());
            
            $('body:first').append($layer);
            
            //cancel editing on click
            $layer.fadeTo(500, 0.65).click(function() {
                $('[href="#cancel"]').click();
            });
        }
        
        //hide semi-transparent BG
        this.hideLayer = function() {
            $('#layer').fadeOut(500, function() {
                $('#layer').remove();
            });
        }
        
        
    }
    
    $(function() {
        var TR = new MagicTranslations();
        TR.init();
    });
})(jQuery);
</script>
<style>
.dataTable {
    width: 100%;
    padding: 0;
    border-collapse: collapse;
}

.dataTable th:first-letter {
    text-transform: uppercase;
}

.dataTable td, .dataTable th {
    padding: 8px 0;
    text-align: left;
}

.dataTable th {
    border-bottom: 3px solid #000;
	padding-left: 8px;
}

.dataTable td {
    border-bottom: 1px solid #ddd;
}

.dataTable .translation-cell {
    padding-right: 10px;
}

.dataTable .filter-row td {
	padding-left: 5px;
	background: #eee;
}

.dataTable .filter-row input[type="text"],
.dataTable .filter-row select {
    width: 94%; padding: 5px 0; text-indent: 5px;
}

.dataTable .filter-row select {
    text-indent: 0;
    padding: 5px;
}

.dataTable .translation-textarea {
    width: 90%;
    height: 75px;
    padding: 2%;
    border: 1px solid #ccc;
    margin-top: 15px;
    position: relative;
    z-index: 1;
}

[class^="icon-"], [class*=" icon-"] {
    background-image: url("./view/image/magic-translations/glyphicons-halflings.png");
    background-position: 14px 14px;
    background-repeat: no-repeat;
    display: inline-block;
    height: 14px;
    line-height: 14px;
    margin-top: 1px;
    vertical-align: text-top;
    width: 14px;
}

.icon-ok {
    background-position: -288px 0;
}

.icon-remove {
    background-position: -312px 0;
}

.icon-download {
	background-position: -120px -24px;
}

#ctrls-holder {
	margin-top: 14px;
	margin-left: -54px;
	position: absolute;
	float: right;
	background: #fff;
	border: 1px solid #ccc;
	border-bottom: none;
	z-index: 1;
	padding: 2px;
}

#ctrls-holder a {
    margin:2px 5px;
    
}

#layer {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background: #fff;
    display: none;
}

.controls {
	padding-top: 10px !important;
}

.controls a {
	font-size: 15px;
	margin: 0 0 0 10px;
	color: #000;
}

.controls a.active {
	background: #000;
	color: #fff;
	text-decoration: none;
	padding: 2px 5px;
}

.controls span {
	font-weight: 700;
}

#load-more {
	display: none;
	margin: 15px auto;
	width: 350px;
	padding: 10px;
	border: 1px solid #666;
}

#load-more a {
	display: block;
	text-align: center;
	color: #000;
	text-decoration: none;
	font-weight: 700;
}

#top-panel p.err {
	border: 1px solid #c00;
	padding: 20px 25px;
}

code {
	background: #efefef;
	padding: 0 2px;
}

#help {
	border-bottom: 1px solid #eee;
}

#help h3 {
	border-bottom: 1px solid #eee;
}

#help p {
	margin: 0 0 10px 15px;
}
</style>
<?php echo $footer; ?>
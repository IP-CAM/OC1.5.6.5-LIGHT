<?php 
// Image Manager Plus
// author: Dotbox - www.dotbox.eu
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
<meta name="author" content="Dotbox - www.dotbox.eu">
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/jquery/ui/themes/base/jquery.ui.all.css" />
<script type="text/javascript" src="view/javascript/jquery/ui/external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="view/javascript/jquery/jstree/jquery.tree.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script>
<script src="view/javascript/image_manager_plus/elfinder.min.js"></script>	
<script src="view/javascript/image_manager_plus/proxy/elFinderSupportVer1.js"></script>

<!-- MAIN -->
<link rel="stylesheet" type="text/css" media="screen" href="view/stylesheet/image_manager_pro/implus-elfinder.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="view/stylesheet/image_manager_pro/implus-elfinder.theme.css">

<!-- COLORS -->
<?php $pathtoimage = 'view/image/image_manager_pro/toolbars/toolbar-' . $toolbar_image . '.png'; ?>
<style type="text/css">.elfinder-lock,.elfinder-perms,.elfinder-symlink{position:absolute;width:20px;height:20px;background-image:url("<?php echo $pathtoimage; ?>");background-repeat:no-repeat;background-position:0 -528px}.elfinder-drag-helper-icon-plus{position:absolute;width:20px;height:20px;left:43px;top:55px;background:url("<?php echo $pathtoimage; ?>") 0 -544px no-repeat;display:none}.elfinder-navbar-icon{width:20px;height:20px;position:absolute;top:50%;margin-top:-8px;background-image:url("<?php echo $pathtoimage; ?>");background-repeat:no-repeat;background-position:0 -20px}.elfinder-quicklook .ui-resizable-se{width:14px;height:14px;right:5px;bottom:3px;background:url("<?php echo $pathtoimage; ?>") 0 -620px no-repeat}.elfinder-button-icon{width:20px;height:20px;display:block;background:url("<?php echo $pathtoimage; ?>") no-repeat}.ui-icon.ui-icon-circle-close{width: 16px!important;}</style>

<link rel="stylesheet" type="text/css" media="screen" href="view/stylesheet/image_manager_pro/toolbar-positions.css">

<!-- LANGUAGES -->
<?php if ($image_manager_language) { ?>
<script type="text/javascript" src="view/javascript/image_manager_plus/i18n/elfinder.<?php echo $image_manager_language;?>.js"></script>  
<?php } ?>

</head>
<body>
<div id="container">

</div>
<script type="text/javascript" charset="utf-8">
	$().ready(function() {
		var elfinder = $('#container').elfinder({
			url : 'index.php?route=common/filemanager/connector&token=<?php echo $token; ?>',
			lang : '<?php echo $image_manager_language;?>', 
			container: '<?php echo $field;?>',
			dirimage: '<?php echo HTTP_CATALOG."image/";?>', 
			height: '<?php echo ($this->config->get('implus_height')-65);?>',
			defaultView: 'list',
      dragUploadAllow: <?php echo $this->config->get('implus_drag_upload_allow')?$this->config->get('implus_drag_upload_allow'):1;?>,
      showFiles: <?php echo $this->config->get('implus_lazy_load')?$this->config->get('implus_lazy_load'):30;?>,
      showThreshold: <?php echo $this->config->get('implus_lazy_load_treshold')?$this->config->get('implus_lazy_load_treshold'):50;?>,
<?php  if ($this->config->get('implus_only_images')) {?>
      onlyMimes: ["image"], // display all images
<?php }; ?>

      uiOptions : {toolbar : [
        ['home', 'back', 'forward','up'],
        ['reload'],
        ['mkdir', 'upload'],
        ['open', 'download', 'getfile'],
        ['info'],
        ['quicklook'],
        ['copy', 'cut', 'paste'],
        ['rm'],
        ['duplicate', 'rename', 'edit', 'resize'],
        ['extract', 'archive', 'sort'],
        ['search'],
        ['view'],
        ['help']
        ]}, 		
     
      contextmenu: {navbar: ["open", "|", "copy", "cut", "paste", "duplicate", "|", "rm", "|", "info"],cwd: ["reload", "back", "|", "upload", "mkdir", "mkfile", "paste", "|", "sort", "|", "info"],files: ["getfile", "|", "open", "quicklook", "|", "download", "|", "copy", "cut", "paste", "duplicate", "|", "rm", "|", "edit", "rename", "resize", "|", "archive", "extract", "|", "info"]},

      //neccesary injection CALLBACK to add file
			getFileCallback: function (file) {
        // elFinder page being called by CKEditor
    		<?php if ($fckeditor) { ?>
    		window.opener.CKEDITOR.tools.callFunction(<?php echo $fckeditor; ?>, file.url);        		
    		self.close();	
    		<?php } else { ?>  
    		    link = decodeURIComponent(file.url);
            zmena = link.replace('<?php echo HTTP_CATALOG."image/";?>','');	
            //HTTPS CHECK	
             <?php if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {?>
          			zmena = link.replace('<?php echo HTTPS_CATALOG."image/";?>','');		
          		<?php } else { ?>
          			zmena = link.replace('<?php echo HTTP_CATALOG."image/";?>','');		
          		<?php } ?>  
             //REPLACE BLANK GAPS
            zmena = zmena.replace(new RegExp('%20', 'g'),' ');
            // REPLACE
        		parent.$('#<?php echo $field; ?>').attr('value', decodeURIComponent(zmena));
        		parent.$('#dialog').dialog('close');
        		parent.$('#dialog').remove();	
        		<?php } ?>			   
        }

		}).elfinder('instance');
      
      // ELFINDER REPACK TESTING  - in DEV...!!!
     /* elfinder.bind('upload', function(event) { 

        var uploadedFiles = event.data.added;
          var archives = ['application/zip', 'application/x-gzip', 'application/x-tar', 'application/x-bzip2', 'application/x-rar', 'application/x-rar-compressed'];
            for (i in uploadedFiles) {
                var file = uploadedFiles[i];
                if (jQuery.inArray(file.mime, archives) >= 0) {
                    instance.exec('extract', file.hash);
                }
            }

      });*/

	});

</script>
<?php if (isset($theme_status)) {?>
<style type="text/css">.elfinder-toolbar {background-color: <?php echo $this->config->get('implus_theme_toolbar_bg_color'); ?>!important; background-image: none!important; padding: 0px;}.elfinder .elfinder-navbar {background: <?php echo $this->config->get('implus_theme_left_panel'); ?>;}.ui-corner-all, .ui-corner-bottom, .ui-corner-left, .ui-corner-bl,.elfinder .ui-corner-all, .elfinder .ui-corner-top, .elfinder .ui-corner-right, .elfinder .ui-corner-tr{-webkit-border-radius: <?php echo $this->config->get('implus_theme_toolbar_round'); ?>px!important; -moz-border-radius: <?php echo $this->config->get('implus_theme_toolbar_round'); ?>px!important; border-radius: <?php echo $this->config->get('implus_theme_toolbar_round'); ?>px!important;} .ui-state-hover, .ui-widget-content .ui-state-hover{background-color: <?php echo $this->config->get('implus_theme_hower'); ?>;}.ui-corner-all.ui-state-hover{background-image: none!important;background-color: <?php echo $this->config->get('implus_theme_hower'); ?>; }.elfinder-navbar .ui-state-active.ui-state-hover{  border-color: <?php echo $this->config->get('implus_theme_hower'); ?>;}.ui-droppable.ui-draggable.ui-state-hover{  border-color: <?php echo $this->config->get('implus_theme_hower'); ?>;}.ui-widget-content .ui-state-default {background-color: <?php echo $this->config->get('implus_theme_left_panel'); ?>;}.elfinder .elfinder-button {background: <?php echo $this->config->get('implus_theme_icon_active'); ?>;}.elfinder .elfinder-button.ui-state-disabled {background: <?php echo $this->config->get('implus_theme_icon_inactive'); ?>;}.elfinder .elfinder-button.ui-state-hover{background: <?php echo $this->config->get('implus_theme_icon_hover'); ?>;}.elfinder-workzone .elfinder-cwd-wrapper{border: 0px;background: <?php echo $this->config->get('implus_theme_right_panel'); ?>;}.elfinder .elfinder-button{webkit-border-radius: <?php echo $this->config->get('implus_theme_icon_round'); ?>px!important;-moz-border-radius: <?php echo $this->config->get('implus_theme_icon_round'); ?>px!important;border-radius: <?php echo $this->config->get('implus_theme_icon_round'); ?>px!important;}.elfinder-cwd-view-icons .elfinder-cwd-file .ui-state-hover {background: <?php echo $this->config->get('implus_theme_selected'); ?>;}.elfinder .elfinder-button{border: <?php echo $this->config->get('implus_theme_icon_border'); ?>px solid;}.elfinder .elfinder-button.elfinder-button-search{background: none;}
</style>
<?php } ?>

</body>
</html>
<?php echo $header; ?>
	<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
	<?php echo $content_top; ?>
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
	</div>
	<div class="row">
	<?php $image_span = 0; if ($thumb || $images) { 
	if ($this->config->get('config_image_thumb_width') > 450 && ($span < 10)) { $image_span = 8;
	} elseif ($this->config->get('config_image_thumb_width') > 350) { $image_span = 7;
	} elseif ($this->config->get('config_image_thumb_width') > 250) { $image_span = 6;
	} else { $image_span = 5; } ?>
	<div id="gallery" class="col-sm-<?php echo $image_span; ?>" data-toggle="modal-gallery" data-target="#modal-gallery">
	<div class="slim-row spacer" id="links">
	
	<?php if ($thumb) { ?>
	<div class="slim-col-sm-12"><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" data-gallery><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" itemprop="image" id="image"></a></div>
	<?php } ?>
	<?php foreach ($images as $image) { ?>
	<div class="slim-col-xs-4 slim-col-sm-3"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" data-gallery><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"></a></div>
	<?php } ?>
	</div>
	<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-slide-error-class="icon icon-ban" data-close-class="blueimp-close">
	<div class="slides"></div>
	<a class="prev" href="#">&lsaquo;</a>
	<a class="next" href="#">&rsaquo;</a>
	<a class="blueimp-close" href="#">&times;</a>
	</div>
	<hr>

	<ul class="nav nav-tabs">
	<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
	<li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
	<?php if ($review_status) { ?>
	<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
	<?php } ?>
	</ul>

	<div class="tab-content">
	<div id="tab-description" class="tab-pane active" itemprop="description">
	<?php echo $description; ?>
	</div>
	<div id="tab-attribute" class="tab-pane">
	<table class="table table-striped">
	<thead>
	<tr>
	<th colspan="2"><?php echo $tab_attribute; ?></th>
	</tr>
	</thead>
	<tbody>
	<?php if ($manufacturer) { ?>
	<tr>
	<td><?php echo $text_manufacturer; ?></td>
	<td><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></td>
	</tr>
	<?php } ?>
	<tr>
	<td class="col-sm-3"><?php echo $text_model; ?></td>
	<td><?php echo $model; ?></td>
	</tr>
	<?php if ($reward) { ?>
	<tr>
	<td><?php echo $text_reward; ?></td>
	<td><?php echo $reward; ?></td>
	</tr>
	<?php } ?>
	<tr>
	<td><?php echo $text_stock; ?></td>
	<td><?php echo $stock; ?></td>
	</tr>
	</tbody>
	<?php foreach ($attribute_groups as $attribute_group) { ?>
	<thead>
	<tr>
	<th colspan="2"><?php echo $attribute_group['name']; ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
	<tr>
	<td><?php echo $attribute['name']; ?></td>
	<td><?php echo $attribute['text']; ?></td>
	</tr>
	<?php } ?>
	</tbody>
	<?php } ?>
	</table>
	</div>

	<?php if ($review_status) { ?>
	<div id="tab-review" class="tab-pane">
	<div id="review" class="clearfix"></div>
	<fieldset id="write-review">
	<legend><?php echo $text_write; ?></legend>
	<form id="review-form" class="form-horizontal">
	<div class="form-group">
	<label class="control-label col-sm-3"><?php echo $entry_rating; ?></label>
	<div class="col-sm-6">
	<label class="radio-inline" style="padding-left:0;"><?php echo $entry_bad; ?></label>
	<?php for ($i=1;$i<5;$i++){ ?>
	<label class="radio-inline"><input type="radio" name="rating" value="<?php echo $i; ?>"></label>
	<?php } ?>
	<label class="radio-inline"><input type="radio" name="rating" value="5"><?php echo $entry_good; ?></label>
	</div>
	</div>
	<div class="form-group">
	<label class="control-label col-sm-3" for="name"><?php echo $entry_name; ?></label>
	<div class="col-sm-6">
	<input type="text" name="name" value="" class="form-control" id="name">
	</div>
	</div>
	<div class="form-group">
	<label class="control-label col-sm-3" for="text"><?php echo $entry_review; ?></label>
	<div class="col-sm-6">
	<textarea name="text" class="form-control" rows="4" id="text" spellcheck="false"></textarea>
	<div class="help-block"><?php echo $text_note; ?></div>
	</div>
	</div>
	<div class="form-group">
	<label class="control-label col-sm-3"><?php echo $entry_captcha; ?></label>
	<div class="col-sm-6">
	<input type="text" name="captcha" value="" class="form-control">
	<p class="help-block"><img src="index.php?route=product/product/captcha" alt="" id="captcha"></p>
	</div>
	</div>
	<div class="form-actions">
	<div class="row">
	<div class="col-sm-6 col-sm-offset-3" style="text-align:center;">
	<button type="button" id="button-review" onclick="addReview(<?php echo $product_id; ?>,this);" class="btn btn-primary"><?php echo $button_continue; ?></button>
	</div>
	</div>
	</div>
	</form>
	</fieldset>
	</div>
	<?php } ?>
	</div>
	</div>
	<?php } ?>

	<div class="col-sm-<?php echo 12 - $image_span; ?>">
	<h4 itemprop="name"><?php echo $heading_title; ?></h4>
	<div class="description">
	<?php if ($manufacturer) { ?>
	<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
	<?php } ?>
	<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
	<?php if ($reward) { ?>
	<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
	<?php } ?>
	<span><?php echo $text_stock; ?></span> <?php echo $stock; ?></div>
	<form id="product-info">
	<?php if ($location) { ?>
	<span><?php echo $text_location; ?></span> <?php echo $location; ?><br />
	<?php } ?>
	<?php if ($price) { ?>
	<p class="price" title="<?php echo $text_price; ?>">
	<?php if (!$special) { ?>
	<span class="lead"><span class="updated-price"><?php echo $price; ?></span></span>
	<?php } else { ?>
	<span class="lead"><?php echo $special; ?><br /><small><s><span class="updated-price"><?php echo $price; ?></span></s></small></span>
	<?php } ?>
	<?php if ($points) { ?>
	&nbsp;<i class="text-muted"><?php echo $text_points; ?> <?php echo $points; ?></i>
	<?php } ?>
	</p>
	<?php if ($tax && $tax != $price && $tax != $special) { ?>
	<p class="help"><?php echo $text_tax; ?> <?php echo $tax; ?></p>
	<?php } ?>
	<?php if ($discounts) { ?>
	<ul>
	<?php foreach ($discounts as $discount) { ?>
	<li><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></li>
	<?php } ?>
	</ul>
	<?php } ?>
	<br>
	<?php } ?>

	<?php foreach ($options as $option) { ?>
	<div class="form-group" id="option-<?php echo $option['product_option_id']; ?>">
	<label for="opt<?php echo $option['product_option_id']; ?>"><?php echo $option['required'] ? '<b class="required">*</b> ' : ''; echo $option['name']; ?>:</label>
	<?php if ($option['type'] == 'select') { ?>
	<select name="option[<?php echo $option['product_option_id']; ?>]" class="form-control" id="opt<?php echo $option['product_option_id']; ?>">
	<option value=""><?php echo $text_select; ?></option>
	<?php foreach ($option['option_value'] as $option_value) { ?>
	<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; echo ($option_value['price']) ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''; ?></option>
	<?php } ?>
	</select>
	<?php } elseif ($option['type'] == 'radio') { ?>
	<div class="list-group">
	<?php foreach ($option['option_value'] as $option_value) { ?>
	<label class="list-group-item"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>"> <?php echo $option_value['name']; echo $option_value['price'] ? '<b class="badge badge-info">' . $option_value['price_prefix'] . $option_value['price'] . '</b>' : ''; ?></label>
	<?php } ?>
	</div>
	<?php } elseif ($option['type'] == 'checkbox') { ?>
	<div class="list-group">
	<?php foreach ($option['option_value'] as $option_value) { ?>
	<label class="list-group-item"><input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>"> <?php echo $option_value['name']; echo $option_value['price'] ? '<b class="badge badge-info">' . $option_value['price_prefix'] . $option_value['price'] . '</b>' : ''; ?></label>
	<?php } ?>
	</div>
	<?php } elseif ($option['type'] == 'image') { ?>
	<?php foreach ($option['option_value'] as $option_value) { ?>
	<label>
	<img class="img-polaroid" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>">
	<div class="radio-inline">
	<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
	<?php echo $option_value['name']; echo $option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''; ?>
	</div>
	</label>
	<?php } ?>
	<?php } elseif ($option['type'] == 'text') { ?>
	<input type="text" class="form-control" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" id="opt<?php echo $option['product_option_id']; ?>">
	<?php } elseif ($option['type'] == 'textarea') { ?>
	<textarea name="option[<?php echo $option['product_option_id']; ?>]" class="form-control" id="opt<?php echo $option['product_option_id']; ?>" rows="4"><?php echo $option['option_value']; ?></textarea>
	<?php } elseif ($option['type'] == 'file') { ?>
	<button type="button" class="btn btn-default" id="button-upload-<?php echo $option['product_option_id']; ?>"><?php echo $button_upload; ?></button>
	<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="">
	<?php } elseif ($option['type'] == 'date') { ?>
	<label class="input-group">
	<input type="text" class="form-control date" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" id="opt<?php echo $option['product_option_id']; ?>" data-date-today-btn="1" data-min-view="2" data-date-format="yyyy-mm-dd" autocomplete="off">
	<span style="color:white" class="input-group-addon"><i class="fa fa-calendar"></i></span>
	</label>
	<?php } elseif ($option['type'] == 'datetime') { ?>
	<label class="input-group">
	<input type="text" class="form-control date" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" id="opt<?php echo $option['product_option_id']; ?>" data-show-meridian="1" data-date-today-btn="1" data-min-view="0" data-date-format="yyyy-mm-dd hh:mm" autocomplete="off">
	<span style="color:white" class="input-group-addon"><i class="fa fa-calendar"></i></span>
	</label>
	<?php } elseif ($option['type'] == 'time') { ?>
	<label class="input-group time">
	<input type="text" class="form-control date" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" id="opt<?php echo $option['product_option_id']; ?>" data-max-view="1" data-start-view="1" data-show-meridian="1" data-min-view="0" data-date-format="hh:ii" autocomplete="off">
	<span style="color:white"class="input-group-addon"><i class="fa fa-clock-o"></i></span>
	</label>
	<?php } ?>
	</div>
	<?php } ?>

	<div class="well well-lg">
	<?php if ($minimum > 1) { ?>
	<p class="help"><?php echo $text_minimum; ?></p>
	<?php } ?>
	<div class="form-inline" style="text-align:center">
	<label for="quantity" class="btn btn-default"><?php echo $text_qty; ?></label>&nbsp;
	<input type="number" name="quantity" id="quantity" class="form-control" value="<?php echo $minimum; ?>" min="1" autocomplete="off">
	<input type="hidden" name="product_id" value="<?php echo $product_id; ?>">
	<hr>	
	<div class="btn-wrap-block">
	<button type="button" id="button-cart" data-toggle="tooltip" title="Add Product to Cart" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?> <i class="fa fa-shopping-cart"></i></button></p>
	</div>
	</div>
	<hr>	

	<?php require_once(DIR_SYSTEM . 'library/user.php');
	$this->registry->set('user', new User($this->registry));
	if ($this->user->isLogged()) { $userLogged = true; } else { $userLogged = false;} if ($userLogged) { ?>
	<div class="edit">
	<a class="btn btn-primary btn-md btn-block" tooltip-item" data-toggle="tooltip" title="Admin Edit Product" target="_blank" href="admin/index.php?route=catalog/product/update&token=<?php echo $this->session->data['token']; ?>&product_id=<?php echo $product_id; ?>">Admin Edit Product</a>
	</div>
	<hr>
	<?php } ?>  

	<div class="wishlist" style="text-align:center">
	<a style="text-decoration: none"; onclick="addToWishList('<?php echo $product_id; ?>');"><i class="fa fa-pencil-square-o fa-2x" ></i> <?php echo $button_wishlist; ?></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a style="text-decoration: none"; onclick="addToCompare('<?php echo $product_id; ?>');"><i class="fa fa-exchange fa-2x"></i>&nbsp;&nbsp;<?php echo $button_compare; ?></a>
	</div>
	</div>
	</form>

	<?php $href = urlencode($this->config->get('config_url') . 'index.php?route=product/product&product_id=' . $product_id);
	$desc = urlencode($heading_title . "\n" . substr(str_replace("\t", "", strip_tags($description)), 0, 500)."..."); ?>
	<hr>
	<ul class="list-inline btn-social clearfix"  style="text-align:center">
	<li><a class="btn btn-default btn-fb" href="http://facebook.com/sharer.php?s=100&amp;p[title]=<?php echo $heading_title; ?>&amp;p[summary]=<?php echo $desc; ?>&amp;p[url]=<?php echo $href; ?>" target="_blank"><i class="fa fa-facebook-square"></i> Share</a></li>
	<li><a class="btn btn-default btn-tw" href="http://twitter.com/share?url=<?php echo urlencode($href); ?>&text=<?php echo $heading_title;?>" target="_blank"><i class="fa fa-twitter"></i> Tweet</a></li>
	<li><a class="btn btn-default btn-pn" href="http://pinterest.com/pin/create/button/?url=<?php echo $href; ?>&media=<?php echo urlencode($popup); ?>&description=<?php echo $desc; ?>" target="_blank"><i class="fa fa-pinterest"></i> Pin It</a></li>
	</ul>
	<hr>
	<?php if ($review_status) { ?>
	<div class="spacer"><?php if ($rating) { ?><i class="stars-<?php echo $rating; ?>" title="<?php echo $reviews; ?>"></i>&nbsp;&nbsp;<?php } ?><a onclick="$('a[href=\'#tab-review\']').click();"><?php echo $reviews; ?></a>&nbsp;&nbsp;&bull;&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').click();$('html,body').animate({scrollTop:$('#write-review').offset().top - 100},'slow');"><?php echo $text_write; ?></a></div>
	<?php } ?>
	</div>
	</div>

	<?php if ($tags) { ?>
	<hr size="1" width="99%"><?php echo $text_tags; ?>
	<?php for ($i = 0; $i < count($tags); $i++) { ?>
	<?php if ($i < (count($tags) - 1)) { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
	<?php } else { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
	<?php } ?>
	<?php } ?>
	<hr size="1" width="99%">
	<?php } ?>

	<?php if ($products) { ?>
	<h4 class="text-muted"><?php echo $tab_related; ?></h4>
	<?php $image_width = $this->config->get('config_image_related_width');
	include(DIR_TEMPLATE . 'default/template/common/template-product-grid.tpl'); ?>
	<?php } ?>
	</div>
	<?php echo $content_bottom; ?>
	<?php echo $column_right; ?>
	<?php if ($options) { ?>
	<script src="catalog/view/theme/default/js/bootstrap-datetimepicker.js"></script>
	<?php } ?>
	<div class="hidden-xs"><hr></div>
<?php echo $footer; ?>
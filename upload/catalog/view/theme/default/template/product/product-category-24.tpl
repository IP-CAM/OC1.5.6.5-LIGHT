<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php echo $content_top; ?>
	
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
	
					</div>
				</div>
			<?php } ?>
			<div class="col-sm-<?php echo 12 - $image_span; ?>">
			<h1 itemprop="name"><?php echo $heading_title; ?></h1>
			
		<div class="description">


			<form id="product-info">
				<?php if ($price) { ?>
					<p class="price" title="<?php echo $text_price; ?>">
						<?php if (!$special) { ?>
							<span class="lead"><span class="updated-price"><?php echo $price; ?></span></span>
						<?php } else { ?>
							<span class="lead"><?php echo $special; ?><br /><small><s><span class="updated-price"><?php echo $price; ?></span></s></small></span>
						<?php } ?>
					</div>
				<?php } ?>
				<div class="well well-lg" style="text-align:center">
		This is a Custom Product Page Layout, to create category-specific designed Product Pages and/or Product Information Pages without Order Function!
	<hr>
	based on this fine OC v.1.5.6.x VqMod:<br />
	<strong>Template for product in category OR category</strong><p>
	<div><a class="btn btn-success" href="https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=9934" target="_new"> found here</a></div>

	<?php require_once(DIR_SYSTEM . 'library/user.php');
            $this->registry->set('user', new User($this->registry));
            if ($this->user->isLogged()) { $userLogged = true; } else { $userLogged = false;} if ($userLogged) { ?>
			<hr>
			<div class="edit">
            <a class="btn btn-primary btn-md btn-block" tooltip-item" data-toggle="tooltip" title="Admin Edit Product" target="_blank" href="admin/index.php?route=catalog/product/update&token=<?php echo $this->session->data['token']; ?>&product_id=<?php echo $product_id; ?>">Admin Edit Product</a>
            </div>

			<?php } ?>  
			</div>
			</form>
			<?php if ($review_status) { ?>
				<?php $href = urlencode($this->config->get('config_url') . 'index.php?route=product/product&product_id=' . $product_id);
				$desc = urlencode($heading_title . "\n" . substr(str_replace("\t", "", strip_tags($description)), 0, 500)."..."); ?>
				<hr>
				<ul class="list-inline btn-social clearfix">
					<li class="pull-left"><a class="btn btn-default btn-fb" href="http://facebook.com/sharer.php?s=100&amp;p[title]=<?php echo $heading_title; ?>&amp;p[summary]=<?php echo $desc; ?>&amp;p[url]=<?php echo $href; ?>" target="_blank"><i class="fa fa-facebook-square"></i> Share</a></li>
					<li class="pull-left"><a class="btn btn-default btn-tw" href="http://twitter.com/share?url=<?php echo urlencode($href); ?>&text=<?php echo $heading_title;?>" target="_blank"><i class="fa fa-twitter"></i> Tweet</a></li>
					<li><a class="btn btn-default btn-pn" href="http://pinterest.com/pin/create/button/?url=<?php echo $href; ?>&media=<?php echo urlencode($popup); ?>&description=<?php echo $desc; ?>" target="_blank"><i class="fa fa-pinterest"></i> Pin It</a></li>
				</ul>
				<hr>
				<div class="spacer"><?php if ($rating) { ?><i class="stars-<?php echo $rating; ?>" title="<?php echo $reviews; ?>"></i>&nbsp;&nbsp;<?php } ?><a onclick="$('a[href=\'#tab-review\']').click();"><?php echo $reviews; ?></a>&nbsp;&nbsp;&bull;&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').click();$('html,body').animate({scrollTop:$('#write-review').offset().top - 100},'slow');"><?php echo $text_write; ?></a></div>
			<?php } ?>
			</div>
		</div>
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
	</div>
		<?php echo $content_bottom; ?>
	<?php echo $column_right; ?>
<?php if ($options) { ?>
<script src="catalog/view/theme/default/js/bootstrap-datetimepicker.js"></script>
<?php } ?>
<div class="hidden-xs"><hr></div>
<?php echo $footer; ?>
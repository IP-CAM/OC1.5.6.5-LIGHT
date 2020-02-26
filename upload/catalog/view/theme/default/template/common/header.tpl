<!doctype html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<base href="<?php echo $base; ?>">
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>">
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>">
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.openshop.li/light/" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if ($icon) { ?>
<link rel="shortcut icon" href="<?php echo $icon; ?>">
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>">
<?php } ?>
<script>if(!window.jQuery){document.write('<script src="http://openshop.li/light/catalog/view/theme/default/js/headcompress.js"><\/script>');}</script>
<link rel="stylesheet" href="http://openshop.li/light/catalog/view/theme/default/stylesheet/stylesheet-dark.css" media="screen" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" href="http://openshop.li/light/<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>">
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="http://openshop.li/light/<?php echo $script; ?>"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body itemscope itemtype="http://schema.org/Product">
<div class="color0" id="change1">
<div class="navbar navbar-default navbar-static-top spacer">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-top"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
			<a class="navbar-brand" href="<?php echo $home; ?>"><?php echo $name; ?></a>
		</div>
		<div class="collapse navbar-collapse" id="nav-top">
			<ul class="nav navbar-nav">
				<li id="nav-home" class="hidden-md"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
				<li id="nav-wishlist"><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
				<li id="nav-account"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li id="nav-cart"><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
				<li id="nav-checkout"><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
			</ul>
			<form id="search-navbar" class="navbar-form navbar-right">
				<div class="form-group">
					<input type="search" name="search" value="<?php echo $search; ?>" class="form-control" placeholder="<?php echo $text_search; ?>">
				</div>
				<button type="submit" form="search-navbar" class="btn btn-default hidden-xs"><i class="fa fa-search"></i> <?php echo $text_search; ?></button>
			</form>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-6 spacer">
		<?php if ($logo) { ?>
			<h1 class="logo"><a href="<?php echo $home; ?>"><img class="img-responsive" width="325" height="71" src="http://openshop.li/light/image/data/logo2.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"></a></h1>
		<?php } else { ?>
			<h1 class="logo"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
		<?php } ?>
		</div>
		<div class="col-xs-12 col-sm-6 spacer">
			<div class="clearfix">
				<div class="btn-toolbar pull-right">
					<?php echo $currency; ?>
					<?php echo $language; ?>
					<?php echo $cart; ?>
				</div>
			</div>
			<div class="clearfix text-right">
				<span><?php echo ($logged) ? $text_logged : $text_welcome; ?></span>
			</div>
		</div>
	</div>
<?php if ($categories) { ?>
<div id="menu" class="navbar navbar-inverse">
<div id="cat-title" class="navbar-header"><span class="hidden-lg hidden-md" style="padding-left:10px;font-size:32px;color:#848A2E;">Categories</span>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-categories"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
</div>
<div class="collapse navbar-collapse" id="nav-categories">
<ul class="nav navbar-nav">
<?php $mid = floor(count($categories)/2); ?>
<?php foreach ($categories as $z => $category) { ?>
<?php if ($category['children']) { ?>
<li class="dropdown dropdown-columns">
<a href="<?php echo $category['href']; ?>" data-toggle="dropdown" class="dropdown-toggle"><?php echo $category['name']; ?> <b class="caret"></b></a>
<ul style="min-width:<?php echo (180 * $category['column']); ?>px;" class="dropdown-menu slim-row<?php echo ($z > $mid) ? ' dropdown-menu-right' : ''; ?>">
<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
<li class="slim-col-sm-<?php echo (12 / $category['column']); ?>">
<ul class="nav">
<?php foreach ($children as $child) { ?>
<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
<?php } ?>
</ul>
</li>
<?php } ?>
<li role="presentation" class="slim-col-sm-12 divider"></li>
<li class="slim-col-sm-12"><a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $category['name']; ?></a></li>
</ul>
</li>
<?php } else { ?>
<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
<?php } ?>
<?php } ?>
<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
</ul>
</div>
</div>
<?php } ?>
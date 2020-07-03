<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
	<head>
		<meta charset="UTF-8" />
		<title><?php echo $title; ?></title>
		<base href="<?php echo $base; ?>" />
		<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
		<?php } ?>
		<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
		<?php } ?>
		<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
		<?php } ?>
		<link rel="stylesheet" type="text/css" href="view/stylesheet/stylesheet.css" />
		<?php foreach ($styles as $style) { ?>
		<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
		<?php } ?>
		<link rel="stylesheet" href="view/javascript/invoice/font-awesome/css/font-awesome.min.css">
		<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
		<link type="text/css" href="view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="view/javascript/jquery/tabs.js"></script>
		<script type="text/javascript" src="view/javascript/jquery/superfish/js/superfish.js"></script>
		<script type="text/javascript" src="view/javascript/common.js"></script>
		<?php foreach ($scripts as $script) { ?>
		<script type="text/javascript" src="<?php echo $script; ?>"></script>
		<?php } ?>
		<script type="text/javascript">
		//-----------------------------------------
		// Confirm Actions (delete, uninstall)
		//-----------------------------------------
		$(document).ready(function(){
			// Confirm Delete
			$('#form').submit(function(){
				if ($(this).attr('action').indexOf('delete',1) != -1) {
					if (!confirm('<?php echo $text_confirm; ?>')) {
						return false;
					}
				}
			});
			// Confirm Uninstall
			$('a').click(function(){
				if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall', 1) != -1) {
					if (!confirm('<?php echo $text_confirm; ?>')) {
						return false;
					}
				}
			});
				});
			</script>
	</head>
<body>
<div id="container">
    <div id="header">
  <div class="div1">
    <div class="div2"><img src="view/image/logo.png" title="<?php echo $heading_title; ?>" onclick="location = '<?php echo $home; ?>'" /></div>
    <?php if ($logged) { ?>
    <div class="div3"><img src="view/image/lock.png" alt="" style="position: relative; top: 3px;" />&nbsp;<?php echo $logged; ?></div>
    <?php } ?>
  </div>
  <?php if ($logged) { ?>
  <div id="menu">
    <ul class="left" style="display: none;">
      <li id="dashboard"><a href="<?php echo $home; ?>" class="top"><i class="fa fa-home fa-2x"></i></a></li>
      <li id="catalog"><a class="top"><i class="fa fa-list-alt fa-1x"></i><?php echo $text_catalog; ?></a>
        <ul>
          <li><a href="<?php echo $category; ?>"><i class="fa fa-list fa-1x"></i><?php echo $text_category; ?></a></li>
          <li><a href="<?php echo $product; ?>"><i class="fa fa-cubes fa-1x"></i><?php echo $text_product; ?></a></li>
          <li><a href="<?php echo $filter; ?>"><i class="fa fa-filter fa-1x"></i><?php echo $text_filter; ?></a></li>
          <li><a href="<?php echo $profile; ?>"><i class="fa fa-umbrella fa-1x"></i><?php echo $text_profile; ?></a></li>
          <li><a class="parent"><i class="fa fa-tags fa-1x"></i><?php echo $text_attribute; ?></a>
            <ul>
              <li><a href="<?php echo $attribute; ?>"><i class="fa fa-tag fa-1x"></i><?php echo $text_attribute; ?></a></li>
              <li><a href="<?php echo $attribute_group; ?>"><i class="fa fa-tags fa-1x"></i><?php echo $text_attribute_group; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $option; ?>"><i class="fa fa-cog fa-1x"></i><?php echo $text_option; ?></a></li>
          <li><a href="<?php echo $manufacturer; ?>"><i class="fa fa-asterisk fa-1x"></i><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $download; ?>"><i class="fa fa-cloud-download fa-1x"></i><?php echo $text_download; ?></a></li>
          <li><a href="<?php echo $review; ?>"><i class="fa fa-comments fa-1x"></i><?php echo $text_review; ?></a></li>
          <li><a href="<?php echo $information; ?>">&nbsp;<i class="fa fa-info fa-1x"></i>&nbsp;<?php echo $text_information; ?></a></li>
        </ul>
      </li>
      <li id="extension"><a class="top"><i class="fa fa-plug fa-1x"></i><?php echo $text_extension; ?></a>
        <ul>
          <li><a href="<?php echo $module; ?>"><i class="fa fa-puzzle-piece fa-1x"></i><?php echo $text_module; ?></a></li>
          <li><a href="<?php echo $shipping; ?>"><i class="fa fa-truck fa-1x"></i><?php echo $text_shipping; ?></a></li>
          <li><a href="<?php echo $payment; ?>"><i class="fa fa-credit-card fa-1x"></i><?php echo $text_payment; ?></a></li>
          <li><a href="<?php echo $total; ?>"><i class="fa fa-cart-arrow-down fa-1x"></i><?php echo $text_total; ?></a></li>
          <li><a href="<?php echo $feed; ?>"><i class="fa fa-sitemap fa-1x"></i><?php echo $text_feed; ?></a></li>
        </ul>
      </li>
      <li id="sale"><a class="top"><i class="fa fa-shopping-cart fa-1x"></i><?php echo $text_sale; ?></a>
        <ul>
          <li><a href="<?php echo $order; ?>"><i class="fa fa-credit-card fa-1x"></i><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $recurring_profile; ?>"><i class="fa fa-user-plus fa-1x"></i><?php echo $text_recurring_profile; ?></a></li>
          <li><a href="<?php echo $return; ?>"><i class="fa fa-reply fa-1x"></i><?php echo $text_return; ?></a></li>
          <li><a class="parent"><i class="fa fa-user fa-1x"></i><?php echo $text_customer; ?></a>
            <ul>
              <li><a href="<?php echo $customer; ?>"><i class="fa fa-user fa-1x"></i><?php echo $text_customer; ?></a></li>
              <li><a href="<?php echo $customer_group; ?>"><i class="fa fa-users fa-1x"></i><?php echo $text_customer_group; ?></a></li>
              <li><a href="<?php echo $customer_ban_ip; ?>"><i class="fa fa-user-times fa-1x"></i><?php echo $text_customer_ban_ip; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $affiliate; ?>"><i class="fa fa-users fa-1x"></i><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $coupon; ?>"><i class="fa fa-ticket fa-1x"></i><?php echo $text_coupon; ?></a></li>
          <li><a class="parent"><i class="fa fa-gift fa-1x"></i><?php echo $text_voucher; ?></a>
            <ul>
              <li><a href="<?php echo $voucher; ?>"><i class="fa fa-gift fa-1x"></i><?php echo $text_voucher; ?></a></li>
              <li><a href="<?php echo $voucher_theme; ?>"><i class="fa fa-edit fa-1x"></i><?php echo $text_voucher_theme; ?></a></li>
            </ul>
          </li>
          <!-- PAYPAL MANAGE NAVIGATION LINK -->
          <?php if ($pp_express_status) { ?>
           <li><a class="parent" href="<?php echo $paypal_express; ?>"><?php echo $text_paypal_express; ?></a>
             <ul>
               <li><a href="<?php echo $paypal_express_search; ?>"><?php echo $text_paypal_express_search; ?></a></li>
             </ul>
           </li>
          <?php } ?>
          <!-- PAYPAL MANAGE NAVIGATION LINK END -->
          <li><a href="<?php echo $contact; ?>"><i class="fa fa-envelope fa-1x"></i><?php echo $text_contact; ?></a></li>
        </ul>
      </li>
      <li id="system"><a class="top"><i class="fa fa-cogs fa-1x"></i><?php echo $text_system; ?></a>
        <ul>
          <li><a href="<?php echo $setting; ?>"><i class="fa fa-cogs fa-1x"></i><?php echo $text_setting; ?></a></li>
          <li><a class="parent"><i class="fa fa-paint-brush fa-1x"></i><?php echo $text_design; ?></a>
            <ul>
              <li><a href="<?php echo $layout; ?>"><i class="fa fa-th fa-1x"></i><?php echo $text_layout; ?></a></li>
              <li><a href="<?php echo $banner; ?>"><i class="fa fa-th fa-1x"></i><?php echo $text_banner; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><i class="fa fa-lock fa-1x"></i><?php echo $text_users; ?></a>
            <ul>
              <li><a href="<?php echo $user; ?>"><i class="fa fa-user fa-1x"></i><?php echo $text_user; ?></a></li>
              <li><a href="<?php echo $user_group; ?>"><i class="fa fa-user-plus fa-1x"></i><?php echo $text_user_group; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><i class="fa fa-globe fa-1x"></i><?php echo $text_localisation; ?></a>
            <ul>
              <li><a href="<?php echo $language; ?>"><i class="fa fa-flag fa-1x"></i><?php echo $text_language; ?></a></li>
              <li><a href="<?php echo $currency; ?>"><i class="fa fa-money fa-1x"></i><?php echo $text_currency; ?></a></li>
              <li><a href="<?php echo $stock_status; ?>"><i class="fa fa-cubes fa-1x"></i><?php echo $text_stock_status; ?></a></li>
              <li><a href="<?php echo $order_status; ?>"><i class="fa fa-check fa-1x"></i><?php echo $text_order_status; ?></a></li>
              <li><a class="parent"><i class="fa fa-reply-all fa-1x"></i><?php echo $text_return; ?></a>
                <ul>
                  <li><a href="<?php echo $return_status; ?>"><i class="fa fa-reply fa-1x"></i><?php echo $text_return_status; ?></a></li>
                  <li><a href="<?php echo $return_action; ?>"><i class="fa fa-reply fa-1x"></i><?php echo $text_return_action; ?></a></li>
                  <li><a href="<?php echo $return_reason; ?>"><i class="fa fa-reply fa-1x"></i><?php echo $text_return_reason; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $country; ?>"><i class="fa fa-globe fa-1x"></i><?php echo $text_country; ?></a></li>
              <li><a href="<?php echo $zone; ?>"><i class="fa fa-map-marker fa-1x"></i><?php echo $text_zone; ?></a></li>
              <li><a href="<?php echo $geo_zone; ?>"><i class="fa fa-location-arrow fa-1x"></i><?php echo $text_geo_zone; ?></a></li>
              <li><a class="parent"><i class="fa fa-usd fa-1x"></i><?php echo $text_tax; ?></a>
                <ul>
                  <li><a href="<?php echo $tax_class; ?>"><i class="fa fa-usd fa-1x"></i><?php echo $text_tax_class; ?></a></li>
                  <li><a href="<?php echo $tax_rate; ?>"><i class="fa fa-usd fa-1x"></i><?php echo $text_tax_rate; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $length_class; ?>"><i class="fa fa-arrows fa-1x"></i><?php echo $text_length_class; ?></a></li>
              <li><a href="<?php echo $weight_class; ?>"><i class="fa fa-crop fa-1x"></i><?php echo $text_weight_class; ?></a></li>
            </ul>
          </li>
        <li><a href="<?php echo $this->url->link('module/magic_translations', 'token=' . $this->session->data['token'], 'SSL'); ?>"><i class="fa fa-language fa-1x"></i>Lang.Translations</a></li>
        <li><a href="<?php echo $this->url->link('tool/editor', 'token=' . $this->session->data['token'], 'SSL'); ?>"><i class="fa fa-pencil-square-o fa-1x"></i>File Code Editor</a></li>
		<li><a href="<?php echo $this->url->link('tool/tweaks', 'token=' . $this->session->data['token'], 'SSL'); ?>"><i class="fa fa-code-fork fa-1x"></i><?php if (!isset($tweaks)) $tweaks='Tweaks VqManager'; echo $tweaks; ?></a></li>
		<li><a href="<?php echo $this->url->link('tool/seo_keyword_checker', 'token=' . $this->session->data['token'], 'SSL'); ?>"><i class="fa fa-link fa-1x"></i>SEO Keyword Check</a></li>
        <li><a href="<?php echo $backup; ?>"><i class="fa fa-refresh fa-1x"></i><?php echo $text_backup; ?></a></li>
        </ul>
      </li>
      <li id="reports"><a class="top"><i class="fa fa-bar-chart fa-1x"></i><?php echo $text_reports; ?></a>
        <ul>
	         <li><a class="parent"><i class="fa fa-line-chart fa-1x"></i><?php echo $text_sale; ?></a>
            <ul>
              <li><a href="<?php echo $report_sale_order; ?>"><i class="fa fa-money fa-1x"></i><?php echo $text_report_sale_order; ?></a></li>
              <li><a href="<?php echo $report_sale_tax; ?>"><i class="fa fa-pie-chart fa-1x"></i><?php echo $text_report_sale_tax; ?></a></li>
              <li><a href="<?php echo $report_sale_shipping; ?>"><i class="fa fa-truck fa-1x"></i><?php echo $text_report_sale_shipping; ?></a></li>
              <li><a href="<?php echo $report_sale_return; ?>"><i class="fa fa-reply fa-1x"></i><?php echo $text_report_sale_return; ?></a></li>
              <li><a href="<?php echo $report_sale_coupon; ?>"><i class="fa fa-ticket fa-1x"></i><?php echo $text_report_sale_coupon; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><i class="fa fa-cubes fa-1x"></i><?php echo $text_product; ?></a>
            <ul>
              <li><a href="<?php echo $report_product_viewed; ?>"><i class="fa fa-eye fa-1x"></i><?php echo $text_report_product_viewed; ?></a></li>
              <li><a href="<?php echo $report_product_purchased; ?>"><i class="fa fa-cart-plus fa-1x"></i><?php echo $text_report_product_purchased; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><i class="fa fa-user fa-1x"></i><?php echo $text_customer; ?></a>
            <ul>
              <li><a href="<?php echo $report_customer_online; ?>"><i class="fa fa-thumbs-o-up fa-1x"></i><?php echo $text_report_customer_online; ?></a></li>
              <li><a href="<?php echo $report_customer_order; ?>"><i class="fa fa-thumbs-up fa-1x"></i><?php echo $text_report_customer_order; ?></a></li>
              <li><a href="<?php echo $report_customer_reward; ?>"><i class="fa fa-cc fa-1x"></i><?php echo $text_report_customer_reward; ?></a></li>
              <li><a href="<?php echo $report_customer_credit; ?>"><i class="fa fa-usd fa-1x"></i><?php echo $text_report_customer_credit; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><i class="fa fa-users fa-1x"></i><?php echo $text_affiliate; ?></a>
            <ul>
              <li><a href="<?php echo $report_affiliate_commission; ?>"><i class="fa fa-usd fa-1x"></i><?php echo $text_report_affiliate_commission; ?></a></li>
		  </ul>
		  </li>
		  <li><a href="<?php echo $error_log; ?>"><i class="fa fa-eraser fa-1x"></i><?php echo $text_error_log; ?></a></li>
		  <li><a href="<?php echo $this->url->link('module/systemcheck', 'token=' . $this->session->data['token'], 'SSL'); ?>"><i class="fa fa-check-square-o fa-1x"></i>System Check</a></li>
        </ul>
      </li>
	  
      <li id="help"><a class="top"><i class="fa fa-support fa-1x"></i><?php echo $text_help; ?></a>
	  
        <ul>
			<li><a href="<?php echo $this->url->link('tool/helpme', 'token=' . $this->session->data['token'], 'SSL'); ?>"><i class="fa fa-ambulance fa-1x"></i><?php if (!isset($send_inv)) $send_inv='Help Invitation'; echo $send_inv; ?></a></li>
			<li><a href="http://opencart.boards.net/" target="_blank"><i class="fa fa-twitch fa-1x"></i>OpenCart LIGHT Forum</a></li>
			<li><a href="http://www.opencart.com" target="_blank"><i class="fa fa-home fa-1x"></i>OC <?php echo $text_opencart; ?></a></li>
			<li><a href="http://www.opencart.com/index.php?route=documentation/introduction" target="_blank"><i class="fa fa-file-text fa-1x"></i>OC <?php echo $text_documentation; ?></a></li>
			<li><a href="http://forum.opencart.com" target="_blank"><i class="fa fa-bullhorn fa-1x"></i>OC <?php echo $text_support; ?></a></li>
			</ul>
      </li>

		<li id="clear-all-caches"><a class="top"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_caches; ?></a>

				<ul>
					<li><a href="<?php echo $this->url->link('tool/clearcache/butimage', 'token=' . $this->session->data['token'], 'SSL') ?>"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_allbutimage; ?></a></li>
					<li><a href="<?php echo $this->url->link('tool/clearcache/vqmod', 'token=' . $this->session->data['token'], 'SSL') ?>"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_vqmod; ?></a></li>
					<li><a href="<?php echo $this->url->link('tool/clearcache/system', 'token=' . $this->session->data['token'], 'SSL') ?>"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_system; ?></a></li>
					<li><a href="<?php echo $this->url->link('tool/clearcache/seo', 'token=' . $this->session->data['token'], 'SSL') ?>"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_seo; ?></a></li>
					<li><a href="<?php echo $this->url->link('tool/clearcache/minify', 'token=' . $this->session->data['token'], 'SSL') ?>"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_minify; ?></a></li>
					<li><a href="<?php echo $this->url->link('tool/clearcache/image', 'token=' . $this->session->data['token'], 'SSL') ?>"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_image; ?></a></li>
					<li><a href="<?php echo $this->url->link('tool/clearcache', 'token=' . $this->session->data['token'], 'SSL') ?>"><i class="fa fa-trash fa-1x"></i><?php echo $text_clear_all; ?></a></li>
				</ul>
			</li>

	
	      <li id="store"><a href="<?php echo $store; ?>" target="_blank" class="top"><i class="fa fa-share fa-1x"></i><?php echo $text_front; ?></a>
        <ul>
          <?php foreach ($stores as $stores) { ?>
          <li><a href="<?php echo $stores['href']; ?>" target="_blank"><?php echo $stores['name']; ?></a></li>
          <?php } ?>
        </ul>
      </li>
      <li><a class="top" href="<?php echo $logout; ?>"><i class="fa fa-sign-out fa-1x"></i><?php echo $text_logout; ?></a></li>
    </ul>
  </div>
  <?php } ?>
</div>
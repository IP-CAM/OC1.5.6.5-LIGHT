<div class="well well-lg">
	<ul id="carousel<?php echo $module; ?>" class="center-block jcarousel-skin-opencart">
		<?php foreach ($banners as $banner) { ?>
			<?php if ($banner['link']) { ?>
				<li><div><a class="thumbnail" href="<?php echo $banner['link']; ?>"><img class="rounded" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>"></a></div></li>
			<?php } else { ?>
				<li><div><span class="thumbnail"><img  class="rounded"  src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>"></span></div></li>
			<?php } ?>
		<?php } ?>
	</ul>
</div>
<script>
$(function(){
	$('#carousel<?php echo $module; ?>').jcarousel({
		wrap:'circular',
		buttonNextHTML:'<div>&rsaquo;</div>',
		buttonPrevHTML:'<div>&lsaquo;</div>',
		setupCallback:function(a){
			a.reload();
		},
		reloadCallback:function(a){
			if(a.clipping()<480&&<?php echo $limit; ?>>2){
				a.options.scroll=1;
				a.options.visible=2;
			}else if(a.clipping()<768&&<?php echo $limit; ?>>6){
				a.options.scroll=<?php echo $scroll > 2 ? 2 : $scroll; ?>;
				a.options.visible=6;
			}else{
				a.options.scroll=<?php echo $scroll; ?>;
				a.options.visible=<?php echo $limit; ?>;
			}
		}
	});
});
</script>
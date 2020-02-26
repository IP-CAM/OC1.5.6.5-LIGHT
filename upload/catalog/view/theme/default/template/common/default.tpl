<?php echo $header; ?>
	<div class="row">
		<?php echo $column_left; ?>
		<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
			<?php echo $content_top; ?>
			<?php echo $content_bottom; ?>
			<h1 class="hide"><?php echo $heading_title; ?></h1>
		</div>
		<?php echo $column_right; ?>
	</div>
</div><!--end .container-->
			
<div class="container text-center">
	<h1><i class="fa fa-film fa-lg"></i></h1>
	<h2>Recommended Videos</h2>
</div>
<br>
<div class="jumbotron">
	<div id="videos" class="slim-container">
		<div class="slim-row">
		<?php $z = 0;
		for ($i = 0; $i < count($results);) {
			$x = ($z % 2) ? 2 : 3;
			$j = $i + $x;
			for (; $i < $j; $i++) { ?>
				<?php if (isset($results[$i])) { ?>
				<div class="slim-col-sm-6 slim-col-md-<?php echo (12 / $x); ?>">
					<div class="embed-responsive embed-responsive-thumb" title="<?php echo $results[$i]['title']; ?>">
						<?php if (!empty($results[$i]['iframe'])) { ?>
						<a data-toggle="modal" data-target="#modal-video" data-vimeo="<?php echo $results[$i]['iframe']; ?>" href="<?php echo $results[$i]['url']; ?>">
							<img class="img-responsive" src="<?php echo $results[$i]['thumbnail']; ?>" alt="<?php echo $results[$i]['title']; ?>" title="<?php echo $results[$i]['title']; ?>">
						</a>
						<?php } else { ?>
						<img class="img-responsive" data-src="holder.js/640x100%/auto/error" alt="">
						<?php } ?>
					</div>
				</div>
				<?php } ?>
			<?php } 
			$z++; ?>
		<?php } ?>
		</div>
	</div>
	<div class="modal fade" id="modal-video" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div id="video-wrap" class="embed-responsive embed-responsive-16by9"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
jQuery(document).ready(function($){
	$('[data-toggle="modal"]').on('click',function(e){
		e.preventDefault();
		$('#video-wrap').html('<iframe src="'+$(this).data('vimeo')+'" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>');
	});
	
	$('#modal-video').on('hidden.bs.modal',function(){
		$('#video-wrap').html('');
	});
});
</script>


<div class="container">
<?php echo $footer; ?>
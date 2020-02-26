<link href='http://fonts.googleapis.com/css?family=Great+Vibes|Sacramento|Dawning+of+a+New+Day' rel='stylesheet' type='text/css'>
<!-- font-family: 'Great Vibes', cursive; font-family: 'Sacramento', cursive; font-family: 'Dawning of a New Day', cursive; -->
</div><!-- /#content -->
</div><!-- /.white -->
</div><!-- /.container -->

<?php if( count($banners) ) { ?>
	<?php $id = rand(1,10);?>
   <div id="fullslider<?php echo $id;?>" class="carousel slide fullslider">
	
		<div class="carousel-inner">
			 <?php foreach ($banners as $i => $banner) {  ?>
				<div class="item <?php if($i==0) {?>active<?php } ?>">
					<?php if ($banner['link']) { ?>
					<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['thumb']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
					<?php } else { ?>
					<img src="<?php echo $banner['thumb']; ?>" alt="<?php echo $banner['title']; ?>" />
					<?php } ?>
							<?php if( $banner['title']  || $banner['description'] ) { ?>
							<div class="banner-info">
                            <div class="container">
								<h2><?php echo $banner['title']; ?></h2>
								<div><?php echo $banner['description']; ?></div>
							</div>
                            </div>
							<?php } ?>
		
				</div>
			<?php } ?>
		</div>
		<?php if( count($banners) > 1 ){ ?>	
		<a class="carousel-control left" href="#fullslider<?php echo $id;?>" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#fullslider<?php echo $id;?>" data-slide="next">&rsaquo;</a>
		<?php } ?>

		<?php if( count($banners)  > 1 ) { ?>	
			<?php if( isset($setting['image_navigator']) && $setting['image_navigator'] ) { ?>
			<ol class="carousel-indicators thumb-indicators">
			<?php foreach ( $banners as $j=>$item )  : ?>
				<li data-target="#fullslider<?php echo $id;?>" data-slide-to="<?php echo $j;?>" class="<?php if($j==0) {?>active<?php } ?>">
					<img src="<?php echo $item['image_navigator'];?>"/>
				</li>
			<?php endforeach ?>
			</ol>
			<?php } else { ?>
			<ol class="carousel-indicators">
			<?php foreach ( $banners as $j=>$item )  : ?>
				<li data-target="#fullslider<?php echo $id;?>" data-slide-to="<?php echo $j;?>" class="<?php if($j==0) {?>active<?php } ?>"></li>
			<?php endforeach ?>
			</ol>
			<?php } ?>
		<?php } ?>
		
		
		
    </div>
	<?php if( count($banners) > 1 ){ ?>
	<script type="text/javascript">
	<!--
		$('#fullslider<?php echo $id;?>').carousel({interval:5000});
	-->
	</script>
	<?php } ?>
<?php } ?>

<div class="container">
    <div style="background-color: #fff; padding: 0px 10px;"><!-- for white container background -->   
        <div id="content1">
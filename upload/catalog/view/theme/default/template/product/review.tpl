<?php if ($reviews) { ?>
	<?php foreach ($reviews as $review) { ?>
	<div class="media">
		<h1 class="pull-left media-heading"><i class="fa fa-quote-left"></i></h1>
		<div class="media-body">
			<div class="row">
				<div class="col-sm-9">
					<div class="reviews"><?php for ($i = 1; $i <= 5; $i++) {
						if ($review['rating'] < $i) {
							echo '<i class="glyphicon glyphicon-star-empty"></i>';
						} else {
							echo '<i class="glyphicon glyphicon-star"></i>';
						}
					} ?></div>
					<p><?php echo $review['text']; ?></p>
					<small class="text-muted">&mdash; <?php echo $review['author']; ?> <?php echo $text_on; ?> <?php echo $review['date_added']; ?></small>
				</div>
			</div>
		</div>
	</div>
	<?php } ?>
	<div class="pagination"><?php echo str_replace('....','',$pagination); ?></div>
	<hr>		
<?php } else { ?>
	<div class="alert alert-warning"><?php echo $text_no_reviews; ?></div>
<?php } ?>

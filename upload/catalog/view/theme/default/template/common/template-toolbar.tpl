<div class="btn-toolbar">
	<a href="<?php echo $compare; ?>" class="btn btn-default hidden-xs" id="compare-total"><?php echo $text_compare; ?></a>
	<div class="btn-group pull-right">
		<button type="button" class="btn btn-default" data-toggle="dropdown"><?php echo $text_limit; ?></button>
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <span class="caret"></span></button>
		<ul class="dropdown-menu" id="limit">
			<?php foreach ($limits as $limits) { ?>
				<?php if ($limits['value'] == $limit) { ?>
					<li class="active"><a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a></li>
				<?php } else { ?>
					<li><a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a></li>
				<?php } ?>
			<?php } ?>
		</ul>
	</div>
	<div class="btn-group pull-right">
		<button type="button" class="btn btn-default" data-toggle="dropdown"><?php echo $text_sort; ?></button>
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <span class="caret"></span></button>
		<ul class="dropdown-menu dropdown-menu-right" id="sort">
			<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
					<li class="active"><a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
				<?php } else { ?>
					<li><a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
				<?php } ?>
			<?php } ?>
		</ul>
	</div>
	<div class="btn-group pull-right" data-toggle="buttons">
		<label class="btn btn-default" id="display-list" title="<?php echo $text_list; ?>"><input type="radio" name="display" value="list"><i class="fa fa-list"></i></label>
		<label class="btn btn-default" id="display-grid" title="<?php echo $text_grid; ?>"><input type="radio" name="display" value="grid"><i class="fa fa-th"></i></label>
	</div>
</div>
<hr>
<div class="center">
<div class="panel panel-primary">
	<div class="panel-heading"><?php echo $heading_title; ?></div>
	<div class="list-group">
		<?php foreach ($filter_groups as $filter_group) { ?>
			<div class="list-group-item"><strong><?php echo $filter_group['name']; ?></strong><span class="pull-right"><i class="fa fa-bars"></i></span></div>
			<div class="panel-scrollable" id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
			<?php foreach ($filter_group['filter'] as $filter) { ?>
				<label class="list-group-item list-group-subitem">
				<?php if (in_array($filter['filter_id'], $filter_category)) { ?>
					<input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="">
				<?php } else { ?>
					<input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>">
				<?php } ?>
				<?php echo $filter['name']; ?></label>
			<?php } ?>
			</div>
		<?php } ?>
	</div>
	<div class="panel-footer">
		<button type="button" id="button-filter" class="btn btn-success btn-block"><?php echo $button_filter; ?></button>
	</div>
</div>
<script>
$('#button-filter').on('click',function(e){
	e.stopPropagation();
	filter = [];
	$('input[name^="filter"]:checked').each(function(element){
		filter.push(this.value);
	});
	location='<?php echo $action; ?>&filter='+filter.join(',');
});
</script> 

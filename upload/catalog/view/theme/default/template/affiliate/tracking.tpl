<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<p><?php echo $text_description; ?></p>
		<p><?php echo $text_code; ?></p>
		<div class="form-group">
			<input type="text" value="<?php echo $code; ?>" class="form-control" id="code">
		</div>
		<p><?php echo $text_generator; ?></p>
		<div class="form-group">
			<input type="text" name="product" value="" class="form-control" id="product" autocomplete="off">
		</div>
			<p><?php echo $text_link; ?></p>
		<div class="form-group">
			<textarea name="link" class="form-control" rows="2" id="link" spellcheck="false"></textarea>
		</div>
		<div class="form-actions">
			<div class="form-actions-inner text-right">
				<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<script src="catalog/view/theme/default/js/bootstrap-typeahead.js"></script>
<script>
$(function(){
	var mapped={};
	$('input[name="product"]').typeahead({
		source:function(q,process){
			return $.getJSON('index.php?route=affiliate/tracking/autocomplete&filter_name='+encodeURIComponent(q),function(json){
				var data=[];
				$.each(json,function(i,item){
					mapped[item.name]=item.link;
					data.push(item.name);
				});
				process(data);
			});
		},
		updater:function(item){
			$('textarea[name="link"]').val(mapped[item]);
			return item;
		}
	});
});
</script>
<?php echo $footer; ?>
<div class="panel panel-default">
	<div class="panel-heading"><?php echo $heading_title; ?></div>
	<div class="panel-body">
		<p><?php echo $text_store; ?></p>
		<select name="store" onchange="location=this.value" class="form-control">
			<?php foreach ($stores as $store) { ?>
			<?php if ($store['store_id'] == $store_id) { ?>
			<option value="<?php echo $store['url']; ?>" selected=""><?php echo $store['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></option>
			<?php } ?>
			<?php } ?>
		</select>
	</div>
</div>

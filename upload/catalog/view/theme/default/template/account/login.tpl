<?php echo $header; ?>
<?php if ($success) { ?>
<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#"><?php echo $text_returning_customer; ?></a></li>
			<li><a href="<?php echo $register; ?>"><?php echo $text_new_customer; ?></a></li>
		</ul>
		<div class="tab-content">
			<div class="row">
				<div class="col-sm-6">
					<p class="alert alert-warning"><?php echo $text_i_am_returning_customer; ?></p>
					<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-sm-4" for="email"><?php echo $entry_email; ?></label>
							<div class="col-sm-8">
								<input type="email" name="email" value="<?php echo $email; ?>" class="form-control" id="email" autofocus="">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="password"><?php echo $entry_password; ?></label>
							<div class="col-sm-8">
								<input type="password" name="password" value="<?php echo $password; ?>" class="form-control" id="password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-4">
								<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-4">
								<button type="submit" class="btn btn-primary"><?php echo $button_login; ?></button>
							</div>
						</div>
						<?php if ($redirect) { ?>
						<input type="hidden" name="redirect" value="<?php echo $redirect; ?>">
						<?php } ?>
					</form>
				</div>
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading"><strong><?php echo $text_register; ?></strong></div>
						<div class="panel-body">
							<p><?php echo $text_register_account; ?></p>
						</div>
						<div class="panel-footer"><a href="<?php echo $register; ?>" class="btn btn-default"><?php echo $button_continue; ?></a></div>
					</div>
				</div>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<hr>
<?php echo $footer; ?>
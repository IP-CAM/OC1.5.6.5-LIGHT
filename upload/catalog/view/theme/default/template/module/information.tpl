<div class="list-group">
	<div class="list-group-item list-group-heading"><?php echo $heading_title; ?></div>
	<?php foreach ($informations as $information) { ?>
		<a class="list-group-item" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
	<?php } ?>
	<a class="list-group-item" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
	<a class="list-group-item" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
</div>

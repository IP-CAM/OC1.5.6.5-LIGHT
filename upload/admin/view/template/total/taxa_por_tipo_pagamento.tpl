<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/total.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<table class="form">
					<tr>
						<td><?php echo $entry_status; ?></td>
						<td><select name="taxa_por_tipo_pagamento_status">
								<?php if ($taxa_por_tipo_pagamento_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_sort_order; ?></td>
						<td><input type="text" name="taxa_por_tipo_pagamento_sort_order" value="<?php echo $taxa_por_tipo_pagamento_sort_order; ?>" size="1" /></td>
					</tr>
				</table>
				
				
			<div id="tab-metodopagamento">
	          <table id="metodopagamento" class="list">
	            <thead>
	              <tr>
	                <td class="left"><?php echo $entry_metodo_pagamento; ?></td>
	                <td class="left"><?php echo $entry_operador; ?></td>
	                <td class="left"><?php echo $entry_taxa; ?></td>
	                <td class="left"><?php echo $entry_tipo_taxa; ?></td>
	                <td class="left"><?php echo $entry_valor_minimo; ?></td>
	                <td class="left"><?php echo $entry_valor_maximo; ?></td>
	                <td class="left"><?php echo $entry_descricao; ?></td>
	                <td></td>
	              </tr>
	            </thead>
        
				<?php
					$select_html = "";
					//Cria as Opcoes do Select Com os Metodos de Pagamento para Passar ao Javascript
					for($i=0; $i < count($payment_methods); $i++) {					
						$select_html .= '<option value="'.$payment_methods[$i]['payment_code'].'" >'.$payment_methods[$i]['title'].'</option>';
					}
				?>

	            <?php $metodo_pagamento_row = 0; ?>
	            <?php if ($taxa_por_tipo_pagamento_metodos) : ?>
					<?php foreach ($taxa_por_tipo_pagamento_metodos as $metodo) { ?>
					<tbody id="metodopagamento-row<?php echo $metodo_pagamento_row; ?>">
					  <tr>
						
						<td class="left">
							<select name="taxa_por_tipo_pagamento_metodos[<?php echo $metodo_pagamento_row; ?>][metodo_pagamento]" >
							<?php foreach($payment_methods as $payment_method): ?>
								<?php if ($payment_method['payment_code'] == $metodo['metodo_pagamento']) { ?>								
									<option value="<?php echo $payment_method['payment_code']; ?>" id="<?php echo $payment_method['payment_code']; ?>" selected="selected" /><?=$payment_method['title'];?></option>
								<?php } else { ?>
									<option value="<?php echo $payment_method['payment_code']; ?>" id="<?php echo $payment_method['payment_code']; ?>" /><?=$payment_method['title'];?></option>
								<?php } ?>							
							<?php endforeach; ?>
							</select>
						</td>
						
						<td class="left">
							<select name="taxa_por_tipo_pagamento_metodos[<?php echo $metodo_pagamento_row; ?>][operador]" >
								<option value="+" <?php if ($metodo['operador'] == "+") { echo 'selected="selected"'; } ?> >+</option>
								<option value="-" <?php if ($metodo['operador'] == "-") { echo 'selected="selected"'; } ?> >-</option>
							</select>
						</td>
						
						<td>
							<input type="text" name="taxa_por_tipo_pagamento_metodos[<?php echo $metodo_pagamento_row; ?>][taxa]" value="<?php echo $metodo['taxa']; ?>" size="5" />
						</td>
						
						<td class="left">
							<select name="taxa_por_tipo_pagamento_metodos[<?php echo $metodo_pagamento_row; ?>][tipo_taxa]" >
								<option value="%" <?php if ($metodo['tipo_taxa'] == "%") { echo 'selected="selected"'; } ?> >%</option>
								<option value="$" <?php if ($metodo['tipo_taxa'] == "$") { echo 'selected="selected"'; } ?> >$</option>
							</select>
						</td>
							
						</td>
						
						<td class="left"><input type="text" name="taxa_por_tipo_pagamento_metodos[<?php echo $metodo_pagamento_row; ?>][valor_minimo]" value="<?php echo $metodo['valor_minimo']; ?>" maxlength="10" size="10" /></td>

						<td class="left"><input type="text" name="taxa_por_tipo_pagamento_metodos[<?php echo $metodo_pagamento_row; ?>][valor_maximo]" value="<?php echo $metodo['valor_maximo']; ?>" maxlength="10" size="10" /></td>
						
						<td class="left"><input type="text" name="taxa_por_tipo_pagamento_metodos[<?php echo $metodo_pagamento_row; ?>][descricao]" value="<?php echo $metodo['descricao']; ?>" maxlength="50" size="50" /></td>
						<td class="left"><a onclick="$('#metodopagamento-row<?php echo $metodo_pagamento_row; ?>').remove();" class="button"><?php echo $button_remove_metodo; ?></a></td>
						
						</tr>
					</tbody>
					<?php $metodo_pagamento_row++; ?>
					<?php } ?>
	            <?php endif; ?>
	            <tfoot>
	              <tr>
	                <td colspan="6"></td>
	                <td colspan="2" class="left"><a onclick="addFaixa();" class="button"><?php echo $button_add_metodo; ?></a></td>
	              </tr>
	            </tfoot>
	          </table>
	        </div>
			
			</form>
		</div>
	</div>
</div>

<script type="text/javascript"><!--
var metodo_pagamento_row = <?php echo $metodo_pagamento_row; ?>;
var select_html = '<?php echo $select_html; ?>';

function addFaixa() {
	html  = '<tbody id="metodopagamento-row'+metodo_pagamento_row+'">';
	html += '  <tr>'; 		
  
    html += '    <td class="left"><select name="taxa_por_tipo_pagamento_metodos['+metodo_pagamento_row+'][metodo_pagamento]">'+select_html+'</select></td>';
    
    html += '    <td class="left"><select name="taxa_por_tipo_pagamento_metodos['+metodo_pagamento_row+'][operador]" ><option value="+">+</option><option value="-" >-</option></select></td>';
    
    html += '    <td class="left"><input type="text" name="taxa_por_tipo_pagamento_metodos['+metodo_pagamento_row+'][taxa]" value="" size="5" /></td>';
    
    html += '    <td class="left"><select name="taxa_por_tipo_pagamento_metodos['+metodo_pagamento_row+'][tipo_taxa]" ><option value="%">%</option><option value="$" >$</option></select></td>';
    
    html += '    <td class="left"><input type="text" name="taxa_por_tipo_pagamento_metodos['+metodo_pagamento_row+'][valor_minimo]" value="" maxlength="10" size="10" /></td>';
    
    html += '    <td class="left"><input type="text" name="taxa_por_tipo_pagamento_metodos['+metodo_pagamento_row+'][valor_maximo]" value="" maxlength="10" size="10" /></td>';
    
    html += '    <td class="left"><input type="text" name="taxa_por_tipo_pagamento_metodos['+metodo_pagamento_row+'][descricao]" value="" maxlength="50" size="50" /></td>';    

    html += '    <td class="left"><a onclick="$(\'#metodopagamento-row' + metodo_pagamento_row + '\').remove();" class="button"><?php echo $button_remove_metodo; ?></a></td>';   
	html += '  </tr>';	
    html += '</tbody>';
	
	$('#metodopagamento tfoot').before(html);
	
	metodo_pagamento_row++;
}
//--></script>
<?php echo $footer; ?>
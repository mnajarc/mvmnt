# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



checaMarcas = ->
	modelos = $('#producto_modelo_producto_id').html()
	$('#producto_modelo_producto_id').empty()
	marca = $('#producto_marca_producto_id :selected').text()
	opcionesmodelos = $(modelos).filter("optgroup[label='#{marca}']").html()
	if opcionesmodelos
		$('#producto_modelo_producto_id').html(opcionesmodelos)
	else
		$('#producto_modelo_producto_id').empty()

	$('#producto_marca_producto_id').change ->
		marca = $('#producto_marca_producto_id :selected').text()
		opcionesmodelos = $(modelos).filter("optgroup[label='#{marca}']").html()
		if opcionesmodelos
			$('#producto_modelo_producto_id').html(opcionesmodelos)
		else
			$('#producto_modelo_producto_id').empty()


$(document).on("page:load ready", checaMarcas)




# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


checaModeloVehiculos = ->
	modelos = $('#vehiculo_modelo_vehiculo_id').html()
	marca_vehiculo = $('#vehiculo_marca_vehiculo_id :selected').text()
	opciones_modelo_vehiculo = $(modelos).filter("optgroup[label='#{marca_vehiculo}']").html()
	if opciones_modelo_vehiculo
		$('#vehiculo_modelo_vehiculo_id').html(opciones_modelo_vehiculo)
	else
		$('#vehiculo_modelo_vehiculo_id').empty()

	$('#vehiculo_marca_vehiculo_id').change ->
		marca_vehiculo = $('#vehiculo_marca_vehiculo_id :selected').text()
		opciones_modelo_vehiculo = $(modelos).filter("optgroup[label='#{marca_vehiculo}']").html()
		if opciones_modelo_vehiculo
			$('#vehiculo_modelo_vehiculo_id').html(opciones_modelo_vehiculo)
		else
			$('#vehiculo_modelo_vehiculo_id').empty()

$(document).on("page:load ready", checaModeloVehiculos)




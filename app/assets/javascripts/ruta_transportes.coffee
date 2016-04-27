# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
checaNacions = ->
	lnacionesa = $('#pa #nacion_nacion_id').html()
	lestadosa = $('#pa #estado_estado_id').html()
	llocalidadesa = $('#ruta_transporte_punto_a_id').html()

	lnacionesb = $('#pb #nacion_nacion_id').html()
	lestadosb = $('#pb #estado_estado_id').html()
	llocalidadesb = $('#ruta_transporte_punto_b_id').html()

	estado_inicio_a = $('#ruta_transporte_punto_a_id :selected').parent().attr('label')
	estado_inicio_b = $('#ruta_transporte_punto_b_id :selected').parent().attr('label')

	nacion_inicio_a = $('#pa #estado_estado_id :selected').parent().attr('label')
	nacion_inicio_b = $('#pb #estado_estado_id :selected').parent().attr('label')

	opciones_estadosa = $(lestadosa).filter("optgroup[label='#{nacion_inicio_a}']").html()
	opciones_estadosb = $(lestadosb).filter("optgroup[label='#{nacion_inicio_b}']").html()

	opciones_localidadesa = $(llocalidadesa).filter("optgroup[label='#{estado_inicio_a}']").html()
	opciones_localidadesb = $(llocalidadesb).filter("optgroup[label='#{estado_inicio_b}']").html()

	$('#pa #estado_estado_id').html(opciones_estadosa)
	$('#ruta_transporte_punto_a_id').html(opciones_localidadesa)

	$('#pb #estado_estado_id').html(opciones_estadosb)
	$('#ruta_transporte_punto_b_id').html(opciones_localidadesb)

	$('#pa #nacion_nacion_id').change ->
		naciona = $('#pa #nacion_nacion_id :selected').text()
		opciones_estadosa = $(lestadosa).filter("optgroup[label='#{naciona}']").html()
		estadoa = $('#pa #estado_estado_id :selected').text()
		opciones_localidadesa = $(llocalidadesa).filter("optgroup[label='#{estadoa}']").html()
		if opciones_estadosa
			$('#pa #estado_estado_id').html(opciones_estadosa)
			estadoa = $('#pa #estado_estado_id :selected').text()
			opciones_localidadesa = $(llocalidadesa).filter("optgroup[label='#{estadoa}']").html()
			$('#ruta_transporte_punto_a_id').html(opciones_localidadesa)
		else
			$('#pa #estado_estado_id').empty()
			$('#ruta_transporte_punto_a_id').empty()

	$('#pb #nacion_nacion_id').change ->
		nacionb = $('#pb #nacion_nacion_id :selected').text()
		opciones_estadosb = $(lestadosb).filter("optgroup[label='#{nacionb}']").html()
		estadob = $('#pb #estado_estado_id :selected').text()
		opciones_localidadesb = $(llocalidadesb).filter("optgroup[label='#{estadob}']").html()
		if opciones_estadosb
			$('#pb #estado_estado_id').html(opciones_estadosb)
			estadob = $('#pb #estado_estado_id :selected').text()
			opciones_localidadesb = $(llocalidadesb).filter("optgroup[label='#{estadob}']").html()
			$('#ruta_transporte_punto_b_id').html(opciones_localidadesb)
		else
			$('#pb #estado_estado_id').empty()
			$('#ruta_transporte_punto_b_id').empty()
	
	$('#pa #estado_estado_id').change ->
		estadoa = $('#pa #estado_estado_id :selected').text()
		opciones_localidadesa = $(llocalidadesa).filter("optgroup[label='#{estadoa}']").html()
		if opciones_estadosa
			$('#ruta_transporte_punto_a_id').html(opciones_localidadesa)
		else
			$('#ruta_transporte_punto_a_id').empty()
	
	$('#pb #estado_estado_id').change ->
		estadob = $('#pb #estado_estado_id :selected').text()
		opciones_localidadesb = $(llocalidadesb).filter("optgroup[label='#{estadob}']").html()
		if opciones_estadosb
			$('#ruta_transporte_punto_b_id').html(opciones_localidadesb)
		else
			$('#ruta_transporte_punto_b_id').empty()
	

$(document).on("page:load ready", checaNacions)

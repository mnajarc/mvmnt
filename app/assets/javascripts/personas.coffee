# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




checaRoles = ->
	roles = $('#rol_persona_id').html()
	$('#rol_persona_id').empty()
	tipo_persona = $('#tipo_persona_id :selected').text()
	opcionesrol = $(roles).filter("optgroup[label='#{tipo_persona}']").html()
	if opcionesrol
		$('#rol_persona_id').html(opcionesrol)
	else
		$('#rol_persona_id').empty()

	$('#tipo_persona_id').change ->
		tipo_persona = $('#tipo_persona_id :selected').text()
		opcionesrol = $(roles).filter("optgroup[label='#{tipo_persona}']").html()
		if opcionesrol
			$('#rol_persona_id').html(opcionesrol)
		else
			$('#rol_persona_id').empty()


$(document).on("page:load ready", checaRoles)




extends Control

"""Rehacer todo"""

var esta_tocando: bool = true

var espacios_culturales: Array = [
	'biblioteca', 'teatro', 'museo', 'libreria', 'casa_artesania', 'galeria', 'universidad', 'centro_cultural', 'centro_desarrollo_indigena', 'comp_cine',
	'fototeca', 'fonoteca', 'catedral', 'patrimonio_humanidad', 'zona_arqueologica', 'fnme', 'frpintangible', 'centro_educacion', 
	'centro_investigacion_artistica', 'educacion_artistica', 'festival', 'grupo_etnico'
]

var ec_seleccionado: String

func _ready() -> void:
	#AccesoDatos.obtener_json()
	
	randomize()
	#print(espacios_culturales[randi() % espacios_culturales.size()])
	
	ec_seleccionado = espacios_culturales[randi() % espacios_culturales.size()]
	
	print(ec_seleccionado)
	
	$VBoxContainer2/SeleccionEstado.theme = Theme.new()
	$VBoxContainer2/SeleccionEstado.theme.default_font = DynamicFont.new()
	$VBoxContainer2/SeleccionEstado.theme.default_font.font_data = load("res://Activos/Kenney Rocket Square.ttf")
	$VBoxContainer2/SeleccionMunicipio.theme = Theme.new()
	$VBoxContainer2/SeleccionMunicipio.theme.default_font = DynamicFont.new()
	$VBoxContainer2/SeleccionMunicipio.theme.default_font.font_data = load("res://Activos/Kenney Rocket Square.ttf")
	
#	for estado in AccesoDatos.contenido.keys():
#		$VBoxContainer2/SeleccionEstado.add_item(estado)
#		$VBoxContainer2/SeleccionEstado.text = 'Selecciona tu estado'
	
	$VBoxContainer2/SeleccionMunicipio.get_popup().connect("gui_input", self, "_on_gui_input")
	
	
func _on_gui_input(event: InputEvent) -> void:

	if event is InputEventScreenDrag and esta_tocando:
		$VBoxContainer2/SeleccionMunicipio.get_popup().hide_on_item_selection = false
		$VBoxContainer2/SeleccionMunicipio.get_popup().hide_on_checkable_item_selection = false
		$VBoxContainer2/SeleccionMunicipio.get_popup().rect_global_position.y += event.relative.y
	else:
		$VBoxContainer2/SeleccionMunicipio.get_popup().hide_on_item_selection = true
		$VBoxContainer2/SeleccionMunicipio.get_popup().hide_on_checkable_item_selection = true
		
		
func _on_InicioJuego_pressed() -> void:
	$VBoxContainer/HTTPRequest.request('https://sic.cultura.gob.mx/opendata/d/0_' + ec_seleccionado + '_directorio.json')
	$VBoxContainer/HTTPRequest.request('https://sic.cultura.gob.mx/opendata/d/0_libreria_directorio.json')
	$VBoxContainer2.visible = true

func _on_SeleccionEstado_item_selected(index) -> int:
	AccesoDatos.estado_seleccionado = index
	$VBoxContainer2/SeleccionMunicipio.clear()
	$VBoxContainer2/SeleccionMunicipio.disabled = false
	print('¡Has seleccionado el estado de ' + AccesoDatos.contenido.keys()[AccesoDatos.estado_seleccionado] + '!')
	
	for municipio in AccesoDatos.contenido.values()[AccesoDatos.estado_seleccionado]:
		$VBoxContainer2/SeleccionMunicipio.add_item(municipio)
		$VBoxContainer2/SeleccionMunicipio.text = 'Selecciona tu municipio'
	
	return AccesoDatos.estado_seleccionado

func _on_SeleccionMunicipio_item_selected(index) -> int:
	AccesoDatos.municipio_seleccionado = index
	$VBoxContainer2/Confirmacion.disabled = false
	print('¡Has seleccionado el municipio de ' + AccesoDatos.contenido.values()[AccesoDatos.estado_seleccionado][AccesoDatos.municipio_seleccionado] + '!')
	
	esta_tocando = false
	
	return AccesoDatos.municipio_seleccionado

func _on_AnimationPlayer_animation_finished(anim_name) -> void:
	if anim_name == 'intro':
		$AnimationPlayer.play("disolvencias")

func _on_ContinuarJuego_pressed() -> void:
	pass # Replace with function body.

func _on_Confirmacion_pressed() -> void:
	get_tree().change_scene("res://Escenas/PantallaPersonalizacion.tscn")
	pass # Replace with function body.





func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	AccesoDatos.contenido = JSON.parse((body.get_string_from_utf8()))
	for r in AccesoDatos.contenido.result:
		print(r[ec_seleccionado + '_nombre'])
	for estado in AccesoDatos.contenido.result:
		$VBoxContainer2/SeleccionEstado.add_item(estado['nom_ent'])
		$VBoxContainer2/SeleccionEstado.text = 'Selecciona tu estado'
		#print(r['nom_ent'] + ' ' + r['nom_mun'])


















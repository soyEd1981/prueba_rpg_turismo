extends Control

func _ready():
	ObtencionArchivos.obtener_json()
	
	$VBoxContainer2/SeleccionEstado.theme = Theme.new()
	$VBoxContainer2/SeleccionEstado.theme.default_font = DynamicFont.new()
	$VBoxContainer2/SeleccionEstado.theme.default_font.font_data = load("res://Activos/Kenney Rocket Square.ttf")
	$VBoxContainer2/SeleccionMunicipio.theme = Theme.new()
	$VBoxContainer2/SeleccionMunicipio.theme.default_font = DynamicFont.new()
	$VBoxContainer2/SeleccionMunicipio.theme.default_font.font_data = load("res://Activos/Kenney Rocket Square.ttf")
	
	for estado in ObtencionArchivos.contenido.keys():
		$VBoxContainer2/SeleccionEstado.add_item(estado)
		$VBoxContainer2/SeleccionEstado.text = 'Selecciona tu estado'

func _on_InicioJuego_pressed():
	$VBoxContainer2.visible = true

func _on_SeleccionEstado_item_selected(index):
	ObtencionArchivos.estado_seleccionado = index
	$VBoxContainer2/SeleccionMunicipio.clear()
	$VBoxContainer2/SeleccionMunicipio.disabled = false
	print('¡Has seleccionado el estado de ' + ObtencionArchivos.contenido.keys()[ObtencionArchivos.estado_seleccionado] + '!')
	
	for municipio in ObtencionArchivos.contenido.values()[ObtencionArchivos.estado_seleccionado]:
		$VBoxContainer2/SeleccionMunicipio.add_item(municipio)
		$VBoxContainer2/SeleccionMunicipio.text = 'Selecciona tu municipio'



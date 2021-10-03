extends Control

var estados: PoolStringArray = [
	'Aguascalientes', 'Baja California', 'Baja California Sur', 'Campeche', 'Chiapas', 'Chihuahua', 'Coahuila', 'Colima', 'Ciudad de México',
	'Durango', 'Guanajuato', 'Guerrero', 'Hidalgo', 'Jalisco', 'Estado de México', 'Michoacán', 'Morelos', 'Nayarit', 'Nuevo León', 'Oaxaca',
	'Puebla', 'Querétaro', 'Quintana Roo', 'San Luis Potosí', 'Sinaloa', 'Sonora', 'Tabasco', 'Tamaulipas', 'Tlaxcala', 'Veracruz', 'Yucatán',
	'Zacatecas'
]
var indice_estado: int = 0

var tipo_aventura: PoolStringArray = [
	'Aventura medieval', 'Aventura futurista', 'Apocalipsis de supervivencia'
]
var indice_aventura: int = 0

func _ready() -> void:
	$CenterContainer/VBoxContainer/SelectorEstado.theme = Theme.new()
	$CenterContainer/VBoxContainer/SelectorEstado.theme.default_font = DynamicFont.new()
	$CenterContainer/VBoxContainer/SelectorEstado.theme.default_font.font_data = load("res://Activos/Fonts/Kenney High.ttf")
	$CenterContainer/VBoxContainer/SelectorEstado.theme.default_font.size = 32
	$CenterContainer/VBoxContainer/SelectorAventura.theme = Theme.new()
	$CenterContainer/VBoxContainer/SelectorAventura.theme.default_font = DynamicFont.new()
	$CenterContainer/VBoxContainer/SelectorAventura.theme.default_font.font_data = load("res://Activos/Fonts/Kenney High.ttf")
	$CenterContainer/VBoxContainer/SelectorAventura.theme.default_font.size = 32
	
	for e in estados:
		$CenterContainer/VBoxContainer/SelectorEstado.add_item(e)
	$CenterContainer/VBoxContainer/SelectorEstado.text = 'Selecciona tu estado'
	for a in tipo_aventura:
		$CenterContainer/VBoxContainer/SelectorAventura.add_item(a)
	$CenterContainer/VBoxContainer/SelectorAventura.text = 'Selecciona tu tipo de aventura'
	
func _on_SelectorEstado_item_selected(index: int) -> void:
	indice_estado = index
	DatosGenerales.estado_seleccionado = estados[indice_estado]

func _on_SelectorAventura_item_selected(index: int) -> void:
	indice_aventura = index
	DatosGenerales.aventura_seleccionada = tipo_aventura[indice_aventura]
	
	$CenterContainer/VBoxContainer/BotonInicio.disabled = false

func _on_BotonInicio_pressed() -> void:
	get_tree().change_scene("res://prueba.tscn")
	



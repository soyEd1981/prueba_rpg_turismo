extends CanvasLayer

var contenido: Dictionary = {}

var estado_seleccionado: int = 0
var municipio_seleccionado: int = 0

func _ready() -> void:
	var archivo: File = File.new()
	archivo.open("res://Activos/estados-municipios.json", File.READ)
	contenido = parse_json(archivo.get_line())
	archivo.close()
	
	for estado in contenido.keys():
		$ContenedorSelectorEstado/SelectorEstado.add_item(estado)
		$ContenedorSelectorEstado/SelectorEstado.text = 'Selecciona un estado de la república'
		
	$ContenedorSelectorEstado/SelectorEstado.theme = Theme.new()
	$ContenedorSelectorEstado/SelectorEstado.theme.default_font = DynamicFont.new()
	$ContenedorSelectorEstado/SelectorEstado.theme.default_font.font_data = load("res://Activos/Kenney Rocket Square.ttf")
	$ContenedorSelectorEstado/SelectorMunicipio.theme = Theme.new()
	$ContenedorSelectorEstado/SelectorMunicipio.theme.default_font = DynamicFont.new()
	$ContenedorSelectorEstado/SelectorMunicipio.theme.default_font.font_data = load("res://Activos/Kenney Rocket Square.ttf")
	$ContenedorListadoMisiones/ListadoMisiones.theme = Theme.new()
	$ContenedorListadoMisiones/ListadoMisiones.theme.default_font = DynamicFont.new()
	$ContenedorListadoMisiones/ListadoMisiones.theme.default_font.font_data = load("res://Activos/Kenney Rocket Square.ttf")
	

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	
	for r in json.result:
		if r['nom_ent'] == contenido.keys()[estado_seleccionado]  and r['nom_mun'] == contenido.values()[estado_seleccionado][municipio_seleccionado]:
			$ContenedorListadoMisiones/ListadoMisiones.add_item(r['museo_nombre'])
			
#	Revisar si se puede diseñar toda la lógica sin requerir otros archivos, sólo empleando la solicitud a la API
#	for r in json.result:
#		if r['nom_ent'] == 'Nuevo León':
#			print(r['museo_nombre'])
	if $ContenedorListadoMisiones/ListadoMisiones.get_popup().is_item_checked(0):
		$ContenedorListadoMisiones/MensajeMisionSeleccionada.text = 'Has seleccionado '

func _on_SeleccionEstado_item_selected(index):
	$ContenedorSelectorEstado/SelectorMunicipio.clear()
	estado_seleccionado = index
	$ContenedorSelectorEstado/MensajeEstadoSeleccionado.text = '¡Has seleccionado el estado de ' + contenido.keys()[estado_seleccionado] + '!'
	$ContenedorSelectorEstado/SelectorMunicipio.disabled = false
	$ContenedorSelectorEstado/MensajeMunicipioSeleccionado.visible = true
	
	for municipio in contenido.values()[estado_seleccionado]:
		$ContenedorSelectorEstado/SelectorMunicipio.add_item(municipio)
		$ContenedorSelectorEstado/SelectorMunicipio.text = 'Selecciona un municipio'

func _on_SelectorMunicipio_item_selected(index):
	municipio_seleccionado = index
	$ContenedorSelectorEstado/MensajeMunicipioSeleccionado.text = '¡Has seleccionado el estado de ' + contenido.values()[estado_seleccionado][index] + '!'
	$ContenedorListadoMisiones/ListadoMisiones.clear()

func _on_Encargos_pressed():
	$HTTPRequest.request('https://sic.cultura.gob.mx/opendata/d/0_museo_directorio.json')

func _on_ListadoMisiones_item_selected(index):
	$ContenedorListadoMisiones/MensajeMisionSeleccionada.text = 'Has seleccionado '












extends Control

var espacios_culturales: Array = [
	'biblioteca', 'teatro', 'museo', 'libreria', 'casa_artesania', 'galeria', 'universidad', 'centro_cultural', 'centro_desarrollo_indigena', 'comp_cine',
	'fototeca', 'fonoteca', 'catedral', 'patrimonio_humanidad', 'zona_arqueologica', 'fnme_nombre', 'frpintangible', 'centro_educacion', 
	'centro_investigacion_artistica', 'educacion_artistica', 'festival', 'grupo_etnico'
]

var ec_seleccionado: String

func _ready() -> void:
	randomize()
	#print(espacios_culturales[randi() % espacios_culturales.size()])
	
	ec_seleccionado = espacios_culturales[randi() % espacios_culturales.size()]
	
	print(ec_seleccionado)
	
#	if ec_seleccionado in ['biblioteca', 'teatro', 'museo', 'libreria', 'casa_artesania', 'galeria',]:
#		print('Es uno de los valores de la lista')
	
	#print(AccesoDatos.contenido.keys()[AccesoDatos.estado_seleccionado])
	#print(AccesoDatos.contenido.values()[AccesoDatos.estado_seleccionado][AccesoDatos.municipio_seleccionado])
	
	$HTTPRequest.request('https://sic.cultura.gob.mx/opendata/d/0_' + ec_seleccionado + '_directorio.json')
	
	print($ScrollContainer/VBoxContainer/CheckBox.get_class())
	
	
	pass

func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	#var json = JSON.parse(body.get_string_from_utf8())
	
	AccesoDatos.contenido = JSON.parse((body.get_string_from_utf8()))
	for r in AccesoDatos.contenido.result:
		print(r['nom_ent'] + ' ' + r['nom_mun'])
	
#	for r in json.result:
#		if r['nom_ent'] == AccesoDatos.contenido.keys()[AccesoDatos.estado_seleccionado] and r['nom_mun'] == AccesoDatos.contenido.values()[AccesoDatos.estado_seleccionado][AccesoDatos.municipio_seleccionado]:
#			#$OptionButton.add_item(r[ec_seleccionado + '_nombre'])
#			print(r[ec_seleccionado + '_nombre'])




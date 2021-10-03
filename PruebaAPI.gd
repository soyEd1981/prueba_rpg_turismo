extends Control

var lista: = []

func _ready() -> void:
	pass

func _on_Button_pressed() -> void:
	$HTTPRequest.request('https://sic.cultura.gob.mx/opendata/d/0_teatro_directorio.json')

func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse(body.get_string_from_utf8())
	for j in json.result:
		if j['nom_ent'] == 'Nuevo León':
			lista.append(j)
			
	var archivo: File = File.new()
	archivo.open('user://prueba.json', File.WRITE)
	archivo.store_string(to_json(lista))
	archivo.close()

func _on_Button2_pressed() -> void:
	var archivo: File = File.new()
	archivo.open('user://prueba.json', File.READ)
	var contenido = parse_json(archivo.get_line())
	archivo.close()
	
	for i in contenido:
		print(i['teatro_nombre'])
		$RichTextLabel.add_text('\n' + i['nom_mun'] + ' - ' + i['teatro_nombre'])





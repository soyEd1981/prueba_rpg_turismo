extends CanvasLayer

var otra_lista: PoolStringArray = []

func _ready():
	pass

func _on_Button_pressed():
	#$HTTPRequest.request('https://www.inegi.org.mx/app/api/denue/v1/consulta/BuscarEntidad/restaurantes/32/3/10/54919c47-9647-4a48-be27-7c67183f964e')
	$HTTPRequest.request('https://sic.cultura.gob.mx/opendata/d/0_teatro_directorio.json')


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	for i in json.result:
		if i['nom_ent'] == 'Nuevo León':
			otra_lista.append(i)
			
	var archivo: File = File.new()
	archivo.open("user://prueba_teatros.json", File.WRITE)
	archivo.store_line(to_json(otra_lista))
	archivo.close()
	
#	var archivo: File = File.new()
#	archivo.open("user://teatros.json", File.WRITE)
#	archivo.store_line(to_json(json.result))
#	archivo.close()

		#if r['nom_ent'] == 'Nuevo León':
	
			
#			var archivo: File = File.new()
#			archivo.open("user://teatros.json", File.WRITE)
#			archivo.store_line(to_json(diccionario_provisional))
#			archivo.close()
			
	
	#for i in json.result:
		#if i['nom_ent'] == 'Nuevo León':
#	var archivo: File = File.new()
#	archivo.open("user://teatros.json", File.WRITE)
#	archivo.store_string(to_json(json.result))
#	archivo.close()
	
#	for i in json.result:
#		if i['nom_ent'] == 'Nuevo León':
#			var archivo: File = File.new()
#			archivo.open("user://teatros.json", File.WRITE)
#			archivo.store_line(str(i))
#			archivo.close()
			#print(i)
	


		#print(i['galeria_nombre'], '\n', i['nom_ent'])
	#print(json.result[0]['galeria_nombre'])
	#print(json.result[0]['Clase_actividad'])



func _on_Button2_pressed() -> void:
	var archivo: File = File.new()
	archivo.open("user://prueba_teatros.json", File.READ)
	var contenido: Dictionary = parse_json(archivo.get_as_text())
	archivo.close()
	
	for i in contenido:
		print(i)
	
#	for c in contenido:
#		if c['nom_ent'] == 'Nuevo León':
#			print(c)
#			otra_lista.append(c)
#
#	print(otra_lista)
#	for c in contenido:
#		if c['nom_ent'] == 'Nuevo León':
#			print(c['teatro_nombre'])
	

	
























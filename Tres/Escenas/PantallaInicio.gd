extends Control

func _ready() -> void:
	for s in $Solicitudes.get_children():
		s.request('https://sic.cultura.gob.mx/opendata/d/0_' + s.name + '_directorio.json')

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == 'intro':
		$AnimationPlayer.play("disolvencias")

func _on_biblioteca_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://bibliotecas.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_teatro_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://teatros.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_museo_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://museos.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_libreria_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://librerías.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_casa_artesania_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://casas_artesanías.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_galeria_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://galerías.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_universidad_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://universidades.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_centro_cultural_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://centros_culturales.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_centro_desarrollo_indigena_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://centros_desarrollo_indígena.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_comp_cine_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://comp_cine.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_fototeca_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://fototecas.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_fonotecas_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://fonotecas.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_catedral_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://catedrales.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()

func _on_festival_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var json = JSON.parse((body.get_string_from_utf8()))
	var archivo: File = File.new()
	archivo.open("user://festivales.json", File.WRITE)
	archivo.store_line(to_json(json.result))
	archivo.close()
	$VBoxContainer/JuegoNuevo.disabled = false
	$VBoxContainer/ContinuarJuego.disabled = false

func _on_JuegoNuevo_pressed() -> void:
	get_tree().change_scene("res://Escenas/PantallaSeleccion.tscn")

func _on_ContinuarJuego_pressed() -> void:
	pass # Replace with function body.





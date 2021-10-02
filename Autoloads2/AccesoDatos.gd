extends Node

var contenido: JSONParseResult

var estado_seleccionado: int = 0
var municipio_seleccionado: int = 0

func _ready() -> void:
	pass
	
#func obtener_json() -> JSONParseResult:
#	var archivo: File = File.new()
#	archivo.open("res://Activos/estados-municipios.json", File.READ)
#	contenido = parse_json(archivo.get_line())
#	archivo.close()
#	return contenido

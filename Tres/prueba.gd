extends Node2D


func _ready() -> void:
	print(DatosGenerales.estado_seleccionado)
	
	var archivo: File = File.new()
	archivo.open("user://galerías.json", File.READ)
	DatosGenerales.contenido = JSON.parse(archivo.get_line()).result
	for i in DatosGenerales.contenido:
		if i.has('Nuevo León'):
			print(i)
	
	pass

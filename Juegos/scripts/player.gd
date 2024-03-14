extends Dinosaurios


func _ready():
	pass

func _process(delta):
	Cambiar_Datos()


func _on_base_pressed():
	Atacar(damage)


func _on_terminar_turo_pressed():
	energia += 1

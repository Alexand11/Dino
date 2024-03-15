extends Dinosaurios


func _ready():
	Signs.enviar_daño.connect(Recibir_Daño)
	Signs.pedir_info.connect(Enviar_effect)

func _process(delta):
	Cambiar_Datos()

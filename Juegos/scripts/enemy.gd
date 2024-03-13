extends Dinosaurios


func _ready():
	Signs.enviar_daño.connect(Recibir_Daño)

func _process(delta):
	Cambiar_Datos()

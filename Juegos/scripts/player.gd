extends Dinosaurios

@onready var labelataque_unico = $"ataqueÚnico/LabelataqueÚnico".text
@onready var labelataque_avanzado = $ataqueAvanzado/LabelataqueAvanzado.text
@onready var labelataque_basico = $ataqueBasico/LabelataqueBasico.text

func _ready():
	Signs.eviar_info.connect(Recibir_effect)

func _process(delta):
	Cambiar_Datos()


func _on_terminar_turo_pressed():
	energia += 1



func _on_ataque_basico_pressed():
	Atacar(damage,labelataque_basico)

func _on_ataque_avanzado_pressed():
	Atacar(damage,labelataque_avanzado)

func _on_ataqueúnico_pressed():
	Atacar(damage,labelataque_unico)

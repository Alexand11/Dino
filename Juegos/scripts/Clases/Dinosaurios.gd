extends Node

class_name Dinosaurios

@onready var sangrado = $efectos/Sangrado
@onready var desangrar = $efectos/Desangrar
@onready var reduci_n_de_da_o = $"efectos/ReduciónDeDaño"
@onready var aturdido = $efectos/Aturdido
@onready var sigilo = $efectos/Sigilo
@onready var contraataque = $efectos/Contraataque
@onready var inmunidad = $efectos/Inmunidad
@onready var furia = $efectos/Furia
@onready var perforaci_n = $"efectos/Perforación"
@onready var siuperioridad = $efectos/Siuperioridad
@onready var miedo = $efectos/Miedo


var life_max := 500
var life := 500
var damage := 40
var damage_crítico := 69
var resistencia := 14
var prob_Crítico := 15
var energia_max := 20
var energia := 1
var effect_obtained := {
	"Bleeding" : 0
	
}

var dañoAumentarSangrado

func Atacar(daño,nombre):
	if nombre == "Coletazo":
		if energia >= 2:
			if Calcular_Crítico() == true:
				daño = damage_crítico
			daño = daño * 78 / 100
			Signs.emit_signal("enviar_daño",daño,"")
			energia -= 2
			print("")
	if nombre == "Rasguño X2":
		if energia >= 3:
			if Calcular_Crítico() == true:
				daño = damage_crítico
			daño = daño * 71 / 100
			Signs.emit_signal("enviar_daño",daño,"Bleeding")
			daño = damage
			if Calcular_Crítico() == true:
				daño = damage_crítico
			daño = daño * 71 / 100
			Signs.emit_signal("enviar_daño",daño,"Bleeding")
			energia -= 3
			print("")
	if nombre == "Ataque Crítico":
		if energia >= 7:
			pass
	if nombre == "Mordida Desgarradora":
		if energia >= 7:
			if Calcular_Crítico() == true:
				daño = damage_crítico
			daño = daño * 355 / 100
			Signs.emit_signal("pedir_info",)
			daño = daño + dañoAumentarSangrado
			Signs.emit_signal("enviar_daño",daño,"")
			energia -= 7
			print("")


func Recibir_Daño(daño,effect):
	if effect == "Bleeding":
		effect_obtained.Bleeding += 1
	daño -= resistencia
	life -= daño


func Recibir_effect(effect):
	if effect > 0:
		effect = effect * 10
		dañoAumentarSangrado = effect

func Enviar_effect():
	Signs.emit_signal("eviar_info",effect_obtained.Bleeding)

func  Calcular_Crítico():
	var num = randi_range(0,100)
	if num < prob_Crítico:
		return true
	else:
		return false


func Cambiar_Datos():
	if energia > energia_max:
		energia = energia_max
	if effect_obtained.Bleeding > 0:
		sangrado.visible = true
	$Vida.max_value = life_max
	$Vida.value = life
	$Energia.max_value = energia_max
	$Energia.value = energia


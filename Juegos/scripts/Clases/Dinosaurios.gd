extends Node

class_name Dinosaurios

var life_max = 500
var life = 500
var damage = 40
var damage_crítico = 69
var resistencia = 14
var prob_Crítico = 15
var energia_max = 20
var energia = 1

func Atacar(daño):
	if energia >= 2:
		if Calcular_Crítico() == true:
			daño = damage_crítico
		Signs.emit_signal("enviar_daño",daño)
		energia -= 2

func Recibir_Daño(daño):
	daño -= resistencia
	life -= daño
	print("me causo :"+str(daño))

func  Calcular_Crítico():
	var num = randi_range(0,100)
	print(num)
	if num < prob_Crítico:
		print("crítico :D "+ str(num))
		return true
	else:
		print("no crítico :( " + str(num))
		return false


func Cambiar_Datos():
	$Vida.max_value = life_max
	$Vida.value = life
	$Energia.max_value = energia_max
	$Energia.value = energia

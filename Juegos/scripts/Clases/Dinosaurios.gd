extends Node

class_name Dinosaurios

var life = 10
var damage = 2

func Atacar(daño):
	Signs.emit_signal("enviar_daño",damage)

func Recibir_Daño(daño):
	life -= daño
	print("me has quitado vida")

func Cambiar_Datos():
	$Vida.value = life

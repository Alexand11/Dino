extends Control


func _on_touch_screen_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu_principal.tscn")



func _on_base_2_pressed():
	get_tree().quit()


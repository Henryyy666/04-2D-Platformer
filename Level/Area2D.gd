extends Area2D

export var to : String


func _on_Area2D_body_entered(body):
	get_tree().change_scene(to)

extends Node

export var speed : int = 1000
export var duration : float = 0.5

var velocity = Vector2(0, 0)


onready var SM = get_parent()
onready var player = get_node("../..")


func _ready():
	yield(player, "ready")


func start():
	$Timer.start(duration)
	velocity = player.global_position.direction_to(player.get_global_mouse_position())
	velocity *= speed


func _physics_process(delta):
	if $Timer.time_left > 0:
		player.move_and_slide(velocity, Vector2.UP)
		if player.get_slide_count() > 0:
			SM.set_state("Idle")
			$Timer.stop()


func _on_Timer_timeout():
	SM.set_state("Idle")

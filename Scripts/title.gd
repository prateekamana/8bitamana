extends Node2D

onready var tween = get_node("sprite/tween")
onready var sprite  = get_node("sprite")
func _ready():
	tween.interpolate_property(sprite, "scale", 
    sprite.get_scale(), Vector2(1.1, 1.1), 0.4,
	Tween.TRANS_BACK, Tween.EASE_OUT)
	
	set_process(true)
	
func _process(delta):
	tween.start()


func _on_tween_tween_completed(object, key):
	tween.reset(sprite)
	tween.start()

extends Area2D
onready var anim = $AnimationPlayer


export (int) var damage := 10

func attack():
	anim.play("swing")
	print(position)
	


func _on_Weapon_body_entered(body: Node) -> void:
	if body.has_method("handle_hit"):
		body.handle_hit(damage)

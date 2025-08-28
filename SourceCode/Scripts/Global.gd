extends Control

@onready var anim: AnimationPlayer = $Node/AnimationPlayer

func transition(target_scene) -> void:
	anim.play("Trans_in")
	await anim.animation_finished
	typeof(target_scene)
	match(typeof(target_scene)):
		4:
			get_tree().change_scene_to_file(target_scene)
		24:
			get_tree().get_root().call_deferred("add_child",target_scene)
			get_tree().get_root().call_deferred("remove_child",get_tree().current_scene)
			get_tree().call_deferred("set_current_scene", target_scene)
		_:
			print("type of target unknown: '"+target_scene+"'")
			anim.play("Trans_out")
			return
	
	await get_tree().tree_changed
	anim.play("Trans_out") 

func _ready() -> void:
	if !DirAccess.dir_exists_absolute("user://CardLib"):
		DirAccess.make_dir_recursive_absolute("user://CardLib")
	
	
	
	
	
	
	
	

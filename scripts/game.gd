extends Node2D

@onready var platform_parent = $PlatformParent

var camera_scene = preload ("res://scenes/game_camera.tscn")
var camera = null

var platform_scene = preload("res://scenes/platform.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = camera_scene.instantiate()
	camera.setup_camera($Player)
	add_child(camera)
	pass # Replace with function body.

	# Generate the ground
	var viewport_size =get_viewport_rect().size
	var platform_width = 134
	var ground_layer_platform_count = (viewport_size.x / platform_width)
	+1 
	
	var ground_layer_y_offset = 62
	print(ground_layer_platform_count)
	for i in range(ground_layer_platform_count):
		var ground_location = Vector2(i * platform_width, viewport_size.y -ground_layer_y_offset)
		create_platform(ground_location)
	
	
	create_platform(Vector2(100, 300))
	create_platform(Vector2(100, 500))
	create_platform(Vector2(100, 800))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(("quit")):
		get_tree().quit()
	if Input.is_action_just_pressed(("reset")):
		get_tree().reload_current_scene()



func create_platform(location: Vector2):
	var platform = platform_scene.instantiate()
	platform.global_position = location
	platform_parent.add_child(platform)
	return platform
	

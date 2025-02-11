extends Camera2D

var viewport_size

var player: Player = null
	

func _ready():
	viewport_size = get_viewport_rect().size
	global_position.x = viewport_size.x /2
	
	limit_bottom = viewport_size.y
	limit_left = 0
	limit_right = viewport_size.x
	


func _process(delta):
	if player:
		var limit_distance = 420
		if limit_bottom > player.global_position.y + limit_distance:
			limit_bottom = player.global_position.y + limit_distance
	pass

func setup_camera(_player: Player):
	if _player != null:
		player = _player
	pass

func _physics_process(delta):
	if player:
		global_position.y = player.global_position.y

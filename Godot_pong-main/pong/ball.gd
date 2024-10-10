extends Area2D

var speed: int = 350
var initial_position: Vector2 = Vector2(640,360)
var initial_direction: Vector2 = Vector2(0,0)
var new_direction: Vector2 = Vector2(0,0)

var y_min: float = 0
var y_max: float = 720

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_ball() 

func reset_ball() -> void:
	position = initial_position
	choose_direction()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ball_move(delta)
	colid_wall()

func choose_direction() -> void:
	var x = [1,-1].pick_random()
	var y = [1,-1].pick_random()
	
	initial_direction = Vector2(x,y)
	new_direction = initial_direction
	
func ball_move(delta: float) -> void:
	position += new_direction * speed * delta
	
func colid_wall() -> void:
	if position.y >= y_max or position.y <= y_min:
		new_direction.y *= -1	
		
	
		


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		new_direction.x *= -1

extends StaticBody2D
var  SPEED: int  = 360 
var  Y_MAX: int  = 52
var  Y_MIN: int  = 666

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("paddles")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_down_paddle_right"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("move_up_paddle_right"):
		position.y += SPEED * delta
		
	position.y	= clamp(position.y,Y_MAX, Y_MIN)

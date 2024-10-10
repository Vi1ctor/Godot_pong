extends RigidBody2D

# Velocidade inicial da bola
var speed = 20

func _ready():
	# Definindo a velocidade inicial da bola
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	linear_velocity = direction * speed

func _on_Bola_body_entered(body):
	# Verifica se a bola colidiu com um paddle
	if body.is_in_group("paddles"):
		# Reflete a bola ao colidir com um paddle
		var reflection = (linear_velocity.bounce(body.get_collision_normal()))
		linear_velocity = reflection.normalized() * speed

func _on_Bola_area_entered(area):
	# Aqui você pode gerenciar colisões com limites se necessário
	if area.name == "LimiteSuperior" or area.name == "LimiteInferior":
		# Reflete a bola ao colidir com os limites
		linear_velocity.y = -linear_velocity.y

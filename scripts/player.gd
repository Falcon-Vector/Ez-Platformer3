extends CharacterBody2D

@onready var checkpoint_manager = get_tree().current_scene.get_node("checkpoint_manager")
@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var jumpsound: AudioStreamPlayer = $jumpsound
@onready var deathsound: AudioStreamPlayer = $deathsound
@onready var background: AudioStreamPlayer = $background
@onready var coin_label = $Label
@onready var timer_label = $timer_label

var survival_time = 0.0
var timer_running = true
var coin_counter = 0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	print("Checkpoint ready")
	background.play()


func _physics_process(delta: float) -> void:
	if timer_running:
		survival_time += delta
		
		var minutes = int(survival_time) / 60
		var seconds = int(survival_time) % 60
		
		timer_label.text = "%02d:%02d" % [minutes, seconds]
	

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumpsound.play()

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		#flip h if moving left
		if direction < 0.1:
			animation.flip_h = true
		else:
			animation.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if is_on_floor():
		if abs(velocity.x) > 0.1:
			animation.play("run")
		else:
			animation.play("idle")
	else:
		animation.play("jump")
	
	if position.y > 900:
		#respawn
		respawn()
		
func respawn():
	deathsound.play()
	global_position = checkpoint_manager.last_location
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"):
		set_coin(coin_counter + 1)
		print(coin_counter)
	
func set_coin(new_coin_count: int) -> void:
	coin_counter = new_coin_count
	coin_label.text = "coins - " + str(coin_counter)
	

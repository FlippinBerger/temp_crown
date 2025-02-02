extends CharacterBody2D
class_name Player

const SPEED := 325.0

func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:
    var move_dir := Vector2.ZERO

    if Input.is_action_pressed("move_up"):
        move_dir.y -= 1
    if Input.is_action_pressed("move_down"):
        move_dir.y += 1
    if Input.is_action_pressed("move_right"):
        move_dir.x += 1
    if Input.is_action_pressed("move_left"):
        move_dir.x -= 1

    if Input.is_action_just_pressed("movement_ability"):
        dash()

    velocity = move_dir * SPEED 

    move_and_slide()

func dash():
    pass

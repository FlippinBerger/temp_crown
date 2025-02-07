extends CharacterBody2D
class_name Player

signal equipped(t: Tool.ToolType)

const SPEED := 325.0

var equipped_tools: Array[Tool.ToolType]

func _ready() -> void:
    pass


func _process(delta: float) -> void:
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


func equip(t: Tool.ToolType):
    equipped_tools = [t]
    equipped.emit(t)

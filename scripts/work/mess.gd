extends Node2D

@onready var area2d: Area2D = $Area2D
@onready var pickup_label = load("res://scenes/ui/pickup_label.tscn")

var player: Player
var label: Control
var work_ready := false


func _ready() -> void:
    player = get_tree().current_scene.get_node("Player")

    area2d.body_entered.connect(show_action_ui)
    area2d.body_exited.connect(hide_action_ui)

func _process(delta: float) -> void:
    if not player:
        return

    if work_ready and Input.is_action_just_pressed("use"):
        self.queue_free()


func show_action_ui(body: Node2D) -> void:
    if not body is Player:
        return
    

    if Tool.ToolType.MOP in body.equipped_tools:
        label = pickup_label.instantiate()
        add_child(label)
        work_ready = true

    # player = other


func hide_action_ui(other: Node2D):
    if not label:
        print("label doesn't exist")
        return

    if not other is Player:
        return

    work_ready = false
    label.queue_free()

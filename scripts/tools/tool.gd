extends Node2D
class_name Tool

enum ToolType {
    DRILL,
    MOP,
    MIRROR,
    SYRINGE
}

static func get_tool_type_name(tt: ToolType) -> String: 
    return ToolType.keys()[tt]

@export var tool_type: ToolType

@onready var area2d = $Area2D
@onready var pickup_label = load("res://scenes/ui/pickup_label.tscn")

var label: Control

var player: Player

func _ready() -> void:
    area2d.body_entered.connect(show_pickup_ui)
    area2d.body_exited.connect(hide_pickup_ui)


func _process(delta: float) -> void:
    if not player:
        return

    if Input.is_action_just_pressed("use"):
        player.equip(tool_type)
        self.queue_free()


func show_pickup_ui(other: Node2D) -> void:
    if not other is Player:
        return

    player = other

    label = pickup_label.instantiate()
    add_child(label)


func hide_pickup_ui(other: Node2D):
    if not label:
        print("label doesn't exist")
        return

    if not player:
        print("player doesn't exist")
        return

    label.queue_free()
    player = null


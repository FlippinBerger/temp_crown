extends Control

@onready var score_label: Label = $ScoreLabel
@onready var clock_label: Label = $ClockLabel
@onready var tool_sprite: Sprite2D = $CenterContainer/ToolSprite

const DRILL = preload("res://assets/drill.png")
const MOP = preload("res://assets/mop.png")
const MIRROR = preload("res://assets/mirror.png")
const SYRINGE = preload("res://assets/syringe.png")

var clock: Clock
var player: Player

var score := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    clock = get_tree().current_scene.get_node("Clock")
    player = get_tree().current_scene.get_node("Player")

    player.equipped.connect(on_tool_equipped)
    Events.add_score.connect(on_score_updated)
    

func _process(delta: float) -> void:
    clock_label.text = clock.get_time_for_display()


func on_score_updated(new_score: int):
    score += new_score
    score_label.text = str(score)


func on_tool_equipped(t: Tool.ToolType):
    var texture := DRILL

    match t:
        Tool.ToolType.DRILL:
            texture = DRILL
        Tool.ToolType.MOP:
            texture = MOP
        Tool.ToolType.MIRROR:
            texture = MIRROR
        Tool.ToolType.SYRINGE:
            texture = SYRINGE

    tool_sprite.texture = texture

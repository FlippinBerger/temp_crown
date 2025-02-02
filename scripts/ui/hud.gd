extends Control

@onready var score_label: Label = $ScoreLabel
@onready var clock_label: Label = $ClockLabel

var clock: Clock

var score := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    Events.add_score.connect(on_score_updated)

    clock = get_tree().current_scene.get_node("Clock")

func _process(delta: float) -> void:
    clock_label.text = clock.get_time_for_display()

func on_score_updated(new_score: int):
    score += new_score
    score_label.text = str(score)

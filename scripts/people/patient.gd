class_name Patient
extends Node2D

enum PatientType {
    CLEANING,
    OP,
    ADMIN
}

const SPEED = 300.0

var patient_type: PatientType

var total_wait_time := 0.0

var is_being_seen := false
var is_waiting := true

# func _physics_process(delta: float) -> void:
#     move_and_slide()


func _process(delta: float) -> void:
    if is_waiting:
        total_wait_time += delta

    if total_wait_time > 3.0:
        print("cya")
        queue_free()

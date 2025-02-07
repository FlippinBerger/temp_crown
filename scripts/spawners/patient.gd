class_name PatientSpawner
extends Node

@onready var patient_scene: PackedScene = preload("res://scenes/people/patient.tscn")
@onready var spawn_point: Marker2D = $SpawnPoint

@export var spawn_rate := 5.0

func _process(delta: float) -> void:
    if spawn_rate <= 0:
        spawn_random_patient()
        spawn_rate = 5.0
    else:
        spawn_rate -= delta
        

func spawn_random_patient() -> void:
    var patient_type: Patient.PatientType
    var val := randf()

    if val < .15:
        patient_type = Patient.PatientType.ADMIN
    elif val < .5:
        patient_type = Patient.PatientType.CLEANING
    else:
        patient_type = Patient.PatientType.OP

    var patient: Patient = patient_scene.instantiate()
    patient.position = spawn_point.position
    patient.patient_type = patient_type

    print("New patient is a ", Patient.PatientType.keys()[patient_type])

    get_tree().current_scene.add_child(patient)

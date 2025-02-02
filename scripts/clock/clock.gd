extends Node
class_name Clock

var timer: Timer
const timer_length := 0.1

var clock_time := 0.0

func _ready() -> void:
    timer = Timer.new()
    timer.wait_time = timer_length
    timer.timeout.connect(on_timeout)

    add_child(timer)
    timer.start() 


func on_timeout():
    clock_time += timer_length
    Events.tick_clock.emit(timer_length)


func get_time() -> float:
    return clock_time


func get_time_for_display() -> String:
    if clock_time > 60:
        var minutes = clock_time / 60
        var sec = int(clock_time) % 60

        return "%d:%02d" %[minutes, sec]
    
    return "%.2f" % clock_time



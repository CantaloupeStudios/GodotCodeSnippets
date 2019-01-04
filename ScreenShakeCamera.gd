# Add this script to a Camera2D

extends Camera2D

export(int) var screen_shake_duration_ms = 300 # Screenshake duration in miliseconds
export(int) var screen_shake_intensity = 20 # Screenshake intensity

var last_screen_shake = 0
var starting_position = Vector2()

func _ready():
	starting_position = offset

func _process(delta):
	var new_position = Vector2()
	if OS.get_ticks_msec() - last_screen_shake < screen_shake_duration_ms:
		offset.x += rand_range(-screen_shake_intensity, screen_shake_intensity)
		offset.y += rand_range(-screen_shake_intensity, screen_shake_intensity)
	else:
		offset = starting_position

# Call this function to start the screenshake
func start_screen_shake():
	last_screen_shake = OS.get_ticks_msec()

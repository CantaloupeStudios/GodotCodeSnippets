# Add this script to a Camera2D

extends Camera2D

export(int) var screen_shake_duration_ms = 300 # Screenshake duration in miliseconds
export(int) var screen_shake_intensity = 20 # Screenshake intensity

var last_screen_shake = 0
var starting_position = Vector2()
var intensity = 0
var odd_even = 0

func _ready():
	starting_position = offset

func _process(delta):
	odd_even += 1
	if OS.get_ticks_msec() - last_screen_shake < screen_shake_duration_ms && odd_even % 2 == 0:
		offset.x += rand_range(-intensity, intensity)
		offset.y += rand_range(-intensity, intensity)
	else:
		offset = starting_position
		odd_even = 1

# Call this function to start the screenshake
func start_screen_shake(_intensity):
	last_screen_shake = OS.get_ticks_msec()
	if _intensity:
		intensity = _intensity
	else:
		intensity = screen_shake_intensity

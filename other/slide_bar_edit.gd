extends HBoxContainer


signal on_changed(value)

@export var max_value = 1000

var value = 0

func _ready():
	$HSlider.max_value = max_value
	$Label.text = name
	

func _on_h_slider_value_changed(value):
	on_changed.emit(value)

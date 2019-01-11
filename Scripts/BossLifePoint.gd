extends Control
var isEmpty=false
signal changeEmptyLifePoint


func _on_BossLifePoint_changeEmptyLifePoint():
	$TextureRect.texture=preload("res://Assets/Heart_contour_(big).png")
	isEmpty=true

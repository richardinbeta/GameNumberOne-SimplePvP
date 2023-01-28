extends Area2D

signal collect_coin
var screensize = Vector2.ZERO

func pickup():
	# node removal
	queue_free()


func _on_Coin_body_entered(body: Node) -> void:
	print("coin has been entered.")
	print(body)
	emit_signal("collect_coin")
	queue_free()

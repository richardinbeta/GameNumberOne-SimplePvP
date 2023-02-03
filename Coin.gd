extends Area2D

signal collect_coin_player_1
signal collect_coin_player_2
var screensize = Vector2.ZERO

func _on_Coin_body_entered(body: Node) -> void:
	print("coin has been entered.")
	print(body)
	var player_name = body.name
	
	if player_name == "Player-1":
		emit_signal("collect_coin_player_1")
		print("player-1 signal emitted")
	elif player_name == "Player-2":
		emit_signal("collect_coin_player_2")
		print("player-2 signal emitted")
	
	queue_free()


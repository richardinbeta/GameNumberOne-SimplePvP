extends Node2D

export (PackedScene) var Coin
export (int) var number_coins = 10
var screensize
var score_player1
var score_player2
export (int) var time = 10

# load scene
var coin_scene = load("res://Coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	# set seed
	randomize()
	screensize = get_viewport().get_visible_rect().size
	
	new_game()

func new_game():
	spawn_coins()

## Spawn random coins in level
func spawn_coins():
	# Take into account tilemap collisions to exclude coin generation
	for i in range(number_coins):
		var instance = coin_scene.instance()
		$CoinContainer.add_child(instance)
		instance.screensize = screensize
		instance.position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))

func collect_coins():
	pass
	
func hud_coin_score():
	pass
	
func hud_timer():
	pass
	
	

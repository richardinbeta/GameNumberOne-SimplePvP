extends Node2D

# still not clear why this is needed. commenting out disables coin spawning.
# my understanding was the load() was all that was needed....what am i not understanding?
export (PackedScene) var Coin
export (int) var number_coins = 10
var screensize
var score_player1: int  = 0
var score_player2: int = 0
export (int) var time = 10

# load scene
var coin_scene = load("res://Coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# set seed
	randomize()
	screensize = get_viewport().get_visible_rect().size
	
	new_game()
	
	# get reference to Coin to connect to custom signal
	#print($CoinContainer.connect("collect_coin_player_1", self, "increment_player_1_score"))
	#$CoinContainer.connect("collect_coin_player_1", self, "increment_player_1_score")
	#$CoinContainer.connect("collect_coin_player_2", self, "increment_player_2_score")

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

func increment_player_1_score():
	print("incrementing player 1 score")
	score_player1 += 1

func increment_player_2_score():
	score_player2 += 1

func _process(delta: float) -> void:
#	print(score_player1)
#	print(score_player2)
	pass

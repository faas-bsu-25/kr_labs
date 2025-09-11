extends Node2D

@export var cardScene: PackedScene
const SPACE_BETWEEN_CARDS = Vector2(115, 150)
const PADDING_FROM_TOP_LEFT = Vector2(75, 100)

var cardPool = [
	"ClubsA", "ClubsA", "DiamondsA", "DiamondsA",
	"HeartsA", "HeartsA", "SpadesA", "SpadesA",
	"Clubs2", "Clubs2", "Diamonds2", "Diamonds2",
	"Hearts2", "Hearts2", "Spades2", "Spades2"
]

var cards = []

func _ready() -> void:
	var c = 0
	
	for y in range(4):
		for x in range(4):
			c += 1
			var newCard = cardScene.instantiate()
			newCard.position = Vector2(x, y) * SPACE_BETWEEN_CARDS + PADDING_FROM_TOP_LEFT
			
			var arrayIndex = randi_range(0, cardPool.size() - 1)
			var cardValue = cardPool.pop_at(arrayIndex)
			newCard.set_value(cardValue)
			self.add_child(newCard)

func card_clicked(card):
	cards.append(card)
	
	if cards.size() > 1:
		check_match()

func check_match():
	if cards[0].value == cards[1].value:
		cards[0].queue_free()
		cards[1].queue_free()
	else:
		cards[0].flip_back()
		cards[1].flip_back()
	
	cards = []

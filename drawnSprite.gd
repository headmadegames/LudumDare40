extends Sprite

export(int) var width = 100
export(int) var height = 100

var myTex
var drawStart
var drawEnd
var color
var brushWidth

func _ready():
	myTex = load("res://icon.png")
	set_texture(myTex)
	print("preview ", myTex)
#	var sprite = Sprite.new()
#	sprite.set_texture(myTex)
#	add_child(sprite)
	
	var tex = ImageTexture.new()
	var image = Image.new()
	image.load("res://icon.png")
	set_texture(tex.create_from_image(image))
	set_process(true)
	pass

func _process(delta):
#   var tex = sprite.getTexture()
#   var image = tex.get_data()
#   image.put_pixel(x, y, color) # Or using brush transfer or something
#   tex.set_data(image)
#	sprite.setTexture(tex)
	update()
	pass


func _on_drawnSprite_draw():
#	draw_line(drawStart, drawEnd, color, brushWidth)
	pass # replace with function body

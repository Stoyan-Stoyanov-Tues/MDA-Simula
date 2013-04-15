require 'gosu'
require 'texplay'
require './point'
require './constructor'
require './mobject'
require './map'
require './base_collision'
require './sprite'
require 'benchmark'
# require './game'
require './player'

class GameWindow < Gosu::Window
def initialize width, height, fullscreen = false
$window = self
@width = width
@height = height
@fullscreen = fullscreen	

super(@width, @height, @fullscreen)

$map = Map.new

@x = 32
@y = 418
@x2 = 456
@y2 = 476
@x3 = 512
@y3 = 415
@tile0 = Gosu::Image.new(self, 'media/tiles/tile0.bmp', false)

# add some tiles ... or the objects will fall down

@model = Constructor::create_virtual_model(@tile0)

@jumpStone = Tile.new(true, true, @model, @x, @y)
@jumpStone2 = Tile.new(true, true, @model, @x2, @y2)
@jumpStone3 = Tile.new(true, true, @model, @x3, @y3)
@jumpStone4 = Tile.new(true, true, @model, @x3+64, @y3)
@jumpStone5 = Tile.new(true, true, @model, @x3+128, @y3)

def draw_line_one
	@stoneA = Array.new
	for i in 0..12
		@stoneA[i] = Tile.new(true, true, @model, i*64-32, 568)
	end
end	

def update
	
end

def draw
	for i in 0..12
		@stoneA[i].draw
	end
	@jumpStone.draw
	@jumpStone2.draw
	@jumpStone3.draw
	@jumpStone4.draw
	@jumpStone5.draw
end
end

end
game = GameWindow.new(800, 600)
game.draw_line_one
game.show

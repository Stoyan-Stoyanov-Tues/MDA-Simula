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
@y = 568
@x2 = 96
@y2 = 568
@x3 = 160
@y3 = 568

@tile0 = Gosu::Image.new(self, 'media/tiles/tile0.bmp', false)

# add some tiles ... or the objects will fall down

@model = Constructor::create_virtual_model(@tile0)
@model2 = Constructor::create_virtual_model(@tile0)
@model3 = Constructor::create_virtual_model(@tile0)

@stone = Tile.new(true, true, @model, @x, @y)
@stone2 = Tile.new(true, true, @model2, @x2, @y2)
@stone3 = Tile.new(true, true, @model2, @x3, @y3)

$map.add(@stone)
$map.add(@stone2)
$map.add(@stone3)

def update
@stone.update
@stone2.update
@stone3.update

end
def draw
@stone.draw
@stone2.draw
@stone3.draw
end
end
end
game = GameWindow.new(800, 600)
game.show

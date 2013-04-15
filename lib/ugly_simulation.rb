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
		
		@x = 400
		@y = 100
		@x2 = 400
		@y2 = 500
		
		@image = Gosu::Image.new(self, 'put image here', false)
		@image2 = Gosu::Image.new(self, 'put image here', false)
		
		# add some tiles ... or the objects will fall down
		
		@model = Constructor::create_virtual_model(@image)
		@model2 = Constructor::create_virtual_model(@image2)
		
		@mob = Player.new(true, true, @model, @x, @y, 5)
		@mob2 = Sprite.new(true, true, @model2, @x2, @y2, 5)
		
		$map.add(@mob)
		$map.add(@mob2)
		
		def update
				@mob.update
				@mob2.update
		end
		def draw
				@mob.draw
				@mob2.draw
		end
	end
end
game = GameWindow.new(800, 600)
game.show

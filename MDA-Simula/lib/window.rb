require 'gosu'
require './map'
# require './game'
# require './player'

class GameWindow < Gosu::Window
	def initialize width, height, fullscreen = false
		
		@width = width
		@height = height
		@fullscreen = fullscreen		
		
		super(@width, @height, @fullscreen)
	
		# @game = Game.new
		# @player = Player.new
		@map = Map.new(800, 600)
		@image = Gosu::Image.new(self, 'fire2-1.png', false)
		@x = 0
		@y = 0
		
		def update
	
				# @game.update
				# @player.update
				# @map.update
			
			if self.button_down?(Gosu::KbLeft) or self.button_down?(Gosu::GpLeft)
		 		@x-=5
	   		end
	   		if self.button_down?(Gosu::KbRight) or self.button_down?(Gosu::GpRight)
		 		@x+=5
			end
			if self.button_down?(Gosu::KbUp) or self.button_down?(Gosu::GpUp)
		  		@y-=5
			end
			if self.button_down?(Gosu::KbDown) or self.button_down?(Gosu::GpDown)
		  		@y+=5
			end
		
			def draw
		
				# @player.draw
				# @map.draw
				@image.draw(@x, @y, 0)
			end
		end
	end
end
g = GameWindow.new(800, 600)
g.show

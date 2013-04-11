require 'rubygems'
require 'gosu'

class GameWindow < Gosu::Window
	
	def initialize
		super(800, 600, false)
		self.caption = "Update/Draw Demo"
		
		@menuC = 0
		@menuPics = menu_init 
	end
	
	def update
	
	end
	
	def draw
		draw_menu
	
	end
	
	def button_down(id)
		menu_control(id)
	end
	
	def menu_control(id)
		close if id == Gosu::KbEscape
		@menuC += 1 if (id == Gosu::KbS) || (id == Gosu::KbD) 
		@menuC -= 1 if (id == Gosu::KbW) || (id == Gosu::KbA)
		if @menuC == 4
			@menuC = 0
			return
		end
		@menuC = 3 if @menuC == -1
	end
	
	def draw_menu
		@menuPics[@menuC].draw(0,0, 255)
	end
		
	def menu_init
		pictures = Array.new(4)
		pictures[0] = Gosu::Image.new(self, 'media/menu/new game.png', true)
		pictures[1] = Gosu::Image.new(self, 'media/menu/load game.png', true)
		pictures[2] = Gosu::Image.new(self, 'media/menu/highscores.png', true)
		pictures[3] = Gosu::Image.new(self, 'media/menu/exit.png', true)
		return pictures
	end
	
end

GameWindow.new.show

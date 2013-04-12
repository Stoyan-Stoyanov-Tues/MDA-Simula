require 'rubygems'
require 'gosu'

class Menu
@menuPos
@menuSeq
@playlist

@window

	
	def initialize(window)
		@window = window
		@menuPos = 0
		@menuSeq = seq_init
		@playlist = plist_init
		@playlist.play(true)
		@font = Gosu::Font.new(@window, Gosu::default_font_name, 20)
		@playlist.stop
	end
	
	def menu_control(id)
		@window.close if id == Gosu::KbEscape
		@menuPos += 1 if (id == Gosu::KbS) || (id == Gosu::KbD) 
		@menuPos -= 1 if (id == Gosu::KbW) || (id == Gosu::KbA)
		if @menuPos == 4
			@menuPos = 0
			return
		end
		@menuPos = 3 if @menuPos == -1
	end
	
	def draw_menu
		@menuSeq[@menuPos].draw(0,0, 255)
		@font.draw("Is music being played?: #{@playlist.playing?}", 0, 0, 255, 1.0, 1.0, 0xffffff00)
	end
		
	def seq_init
		pictures = Array.new(4)
		pictures[0] = Gosu::Image.new(@window, 'media/menu/new game.png', true)
		pictures[1] = Gosu::Image.new(@window, 'media/menu/load game.png', true)
		pictures[2] = Gosu::Image.new(@window, 'media/menu/highscores.png', true)
		pictures[3] = Gosu::Image.new(@window, 'media/menu/exit.png', true)
		return pictures
	end
	
	def plist_init
		playlist = Gosu::Song.new(@window, 'media/menu/train-interior-1.wav');
	end
	
end

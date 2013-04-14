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
		@playlist = Gosu::Song.new(@window, 'media/menu/title_screen.ogg');
		@playlist.play
		@moveSound = Gosu::Sample.new(@window, 'media/menu/sfx.ogg')
		
	end

	def menu_control
		#@window.close if button_down? Gosu::KbEscape
		if @window.button_down? Gosu::KbA or @window.button_down? Gosu::KbW then
			@menuPos-=1
		end
		@menuPos = 3 if @menuPos == -1
		sleep 0.12
	end
	
	def draw_menu
		@menuSeq[@menuPos].draw(0,0, 255)
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

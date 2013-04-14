require 'rubygems'
require 'gosu'

class Menu

TIME_INTERVAL = 24	
	
@menuPos
@menuSeq
@playlist

@window

@lKeyP #last key press
@keyHold = false #is key currently being held?
@holdC = 0
	
	def initialize(window)
		@window = window
		@menuPos = 0
		@menuSeq = seq_init
		@playlist = Gosu::Song.new(@window, 'media/menu/title_screen.ogg');
		@playlist.play
		@moveSound = Gosu::Sample.new(@window, 'media/menu/sfx.ogg')
		
	end
	
	def menu_control_hold(keyHold) #key being currently held
		unless @keyHold
			@holdC = 0
			return
		if @holdC%TIME_INTERVAL == 0
			self.reposition(keyHold)
		end
		@holdC += 1
	end
	
	def reposition(key)
		if key.eql? Gosu::KbA or key.eql? Gosu::KbW
			@menuPos -= 1
		elsif key.eql? Gosu::KbD or key.eql? Gosu::KbW
			@menuPos += 1
		end
		if @menuPos == -1
			@menuPos = 3
			return
		elsif @menuPos == 4
			@menuPos = 0
			return
		end
	end
		
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

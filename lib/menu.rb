require 'rubygems'
require 'gosu'

class Menu

TIME_INTERVAL = 24	
	
@menuPos
@menuSeq
@playlist

@window

@lastKP #last key press
@keyHold = false #is key currently being held?
@holdC = 0
@lockC #lock counter

attr_accessor :lastKP

	def initialize(window)
		@window = window
		@menuPos = 0
		@menuSeq = seq_init
		@playlist = Gosu::Song.new(@window, 'media/menu/title_screen.ogg');
		@playlist.play
		@moveSound = Gosu::Sample.new(@window, 'media/menu/sfx.ogg')
		@font = Gosu::Font.new(@window, Gosu::default_font_name, 20)
		@lockC = 0
		
	end
	
	def key_check(key)
		if key == @lastKP
			@keyHold = true
		else @keyHold = false
		end
	end
	
	def catch_key(id)
		@lastKP = id
		self.reposition(id)
		@keyDown = false
	end
	
	def control_hold(key) #key being currently held
		self.key_check(key)
		unless @keyHold
			@holdC = 0
			return
		end
		unless holdLocked?
			reposition(key)
		end			
	end
	
	def reposition(key)
		if key == Gosu::KbA or key == Gosu::KbW
			@menuPos -= 1
		elsif key == Gosu::KbD or key == Gosu::KbS
			@menuPos += 1
		elsif key == Gosu::KbEscape 
			@window.close
		end
		if @menuPos == -1
			@menuPos = 3
			return
		elsif @menuPos == 4
			@menuPos = 0
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
	
	def  holdLocked?		
		@lockC += 1
		if @lockC >= 22
			@lockC = 0
			return false
		end
		return true
	end
end

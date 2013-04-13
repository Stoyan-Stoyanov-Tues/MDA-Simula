require 'rubygems'
require 'gosu'
require_relative 'menu'

 

class GameWindow < Gosu::Window

	def initialize
		super(800, 600, false)
		self.caption = "Menu Demo"
		@menu = Menu.new(self)
		@playlist = Gosu::Song.new(self, 'media/menu/title_screen.ogg');
		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	end
	
	def update
		#Gosu::Song.new(self, "media/menu/train_interior_1.ogg").play
	#	puts Gosu::Song.current_song
		@playlist.play
	end
	
	def draw
		@menu.draw_menu
		@font.draw("Is music being played?: #{@playlist.playing?}", 0, 0, 255, 1.0, 1.0, 0xffffff00)
	end
	
	def button_down(id)
		@menu.menu_control(id)
	end
	
	
end

GameWindow.new.show

require 'rubygems'
require 'gosu'
require_relative 'menu'

 

class GameWindow < Gosu::Window

	def initialize
		super(800, 600, false)
		self.caption = "Menu Demo"
		@menu = Menu.new(self)
		
	end
	
	def update
		@menu.menu_control
	end
	
	def draw
		@menu.draw_menu
	end
	
	#def button_down?(id)
	#	@menu.menu_control_once(id)
	#end
	
	
end

GameWindow.new.show

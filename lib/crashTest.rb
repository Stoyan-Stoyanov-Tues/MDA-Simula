require 'rubygems'
require 'gosu'
require_relative 'menu'

class GameWindow < Gosu::Window
	@window
	def initialize
		super(800, 600, false)
		self.caption = "Menu Demo"
		@menu = Menu.new(self)
	end
	
	def update
	
	end
	
	def draw
		@menu.draw_menu
	end
	
	def button_down(id)
		@menu.menu_control(id)
	end
	
	
end

GameWindow.new.show

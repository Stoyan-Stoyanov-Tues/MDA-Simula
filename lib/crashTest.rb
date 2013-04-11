require 'rubygems'
require 'gosu'
require_relative 'menu'

class GameWindow < Gosu::Window
	def initialize
		super(800, 600, false)
		self.caption = "Menu Demo"
	end
	
	def init_menu
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

MyWindow = GameWindow.new
MyWindow.init_menu
MyWindow.show

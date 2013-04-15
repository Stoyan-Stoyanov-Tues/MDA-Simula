require 'gosu'
require 'rubygems'
require 'texplay'
require './point'
require './constructor'
require './mobject'
require './map'
require './base_collision'
require './sprite'
require 'benchmark'
# require './game'
require './player'
require_relative 'menu'

class GameWindow < Gosu::Window
	def initialize width, height, fullscreen = false
		
		
		$window = self
		@width = width
		@height = height
		@fullscreen = fullscreen	

		super(@width, @height, @fullscreen)
		
		self.caption = "Menu Demo"
		@menu = Menu.new(self)

		$map = Map.new

		@x = 32
		@y = 418
		@x2 = 456
		@y2 = 476
		@x3 = 512
		@y3 = 415

		@tile0 = Gosu::Image.new(self, 'media/tiles/tile0.bmp', false)
		@image = Gosu::Image.new(self, 'pr4.png', false)

		@model = Constructor::create_virtual_model(@tile0)
		@player_model = Constructor::create_virtual_model(@image)

		@jumpStone = Tile.new(true, true, @model, @x, @y)
		@jumpStone2 = Tile.new(true, true, @model, @x2, @y2)
		@jumpStone3 = Tile.new(true, true, @model, @x3, @y3)
		@jumpStone4 = Tile.new(true, true, @model, @x3+64, @y3)
		@jumpStone5 = Tile.new(true, true, @model, @x3+128, @y3)
		@player = Player.new(true, true, @player_model, 100, 100, 5, Hash.new)

		$map.add(@jumpStone)
		$map.add(@jumpStone2)
		$map.add(@jumpStone3)
		$map.add(@jumpStone4)
		$map.add(@jumpStone5)
		$map.add(@player)
		
		draw_line_one
	end

	def draw_line_one
		@stoneA = Array.new
		for i in 0..12
			@stoneA[i] = Tile.new(true, true, @model, i*64-32, 568)
			$map.add(@stoneA[i])
		end
	end
	def update
		$map.each { |object| object.update }
		
		@menu.turn_on if self.button_down(Gosu::KbEscape)
		
		if button_down?(@menu.lastKP)
			@menu.control_hold(@menu.lastKP)
		end
	end

	def draw
		@menu.draw_menu if @menu.isOn
		$map.each { |object| object.draw }
		
	end
	
	def button_down(id)
		@menu.catch_key(id)
	end
end
game = GameWindow.new(800, 600)
game.show

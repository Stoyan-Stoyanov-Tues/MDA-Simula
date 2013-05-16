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
require './unit'
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
		
		generate
		spawn
	end
	
	def spawn
		@unit = Unit.new(true, true, @player_model, 500, 300, Hash.new)
		$map.add(@unit)
	end
	
	def generate
		$map = Map.new(8000, 6000, -8000, -6000)

		@x = 32
		@y = 418
		@x2 = 456
		@y2 = 476
		@x3 = 512
		@y3 = 415

		@tile0 = Gosu::Image.new(self, 'media/tiles/tile0.bmp', false)
		@image = Gosu::Image.new(self, 'media/sprites/drabon.png', false)
		@bullet = Gosu::Image.new(self, 'bullet.png', false)
		@sprite = Gosu::Image.new(self, 'pr4.png', false)

		@model = Constructor::create_virtual_model(@tile0)
		@player_model = Constructor::create_virtual_model(@image)
		@sprite_model = Constructor::create_virtual_model(@sprite)
		@jumpStone = Tile.new(true, true, @model, @x, @y)
		@jumpStone2 = Tile.new(true, true, @model, @x2, @y2)
		@jumpStone3 = Tile.new(true, true, @model, @x3, @y3)
		@jumpStone4 = Tile.new(true, true, @model, @x3+64, @y3)
		@jumpStone5 = Tile.new(true, true, @model, @x3+128, @y3)
		$player = Player.new(true, true, @player_model, 400, 300, Hash.new)
		@sprite = Sprite.new(true, true, @sprite_model, 100, 100, Hash.new)

		$map.add(@jumpStone)
		$map.add(@jumpStone2)
		$map.add(@jumpStone3)
		$map.add(@jumpStone4)
		$map.add(@jumpStone5)
		$map.add(@sprite)
		$map.add($player)
		@stoneA = Array.new
		for i in 0..42
			@stoneA[i] = Tile.new(true, true, @model, i*64-32, 568)
			$map.add(@stoneA[i])
		end
		for i in 0..11
			$map.add(Tile.new(true, true, @model, -32, i*64))
		end
		for i in 0..11
			$map.add(Tile.new(true, true, @model, 600, i*64))
		end
		@game_over = Gosu::Image.new(self, 'media/game_over.png', false)
	end
	def update
		#@menu.turn_on if self.button_down(Gosu::KbEscape)
		$map.each { |object| object.update }
		if @menu.isOn
			if button_down?(@menu.lastKP)
				@menu.control_hold(@menu.lastKP)
			end
		end
	end

	def draw
		if @menu.isOn
			@menu.draw_menu
			return
		end
		unless @menu.isOn
			if @menu.lastKP == Gosu::KbP
				@menu.turn_on
				return
			end
		end
		$map.each { |object| object.draw }
		if !$map.include?($player)
			@game_over.draw(0, 0, 0.5)
		end
	end
	
	def button_down(id)
		@menu.catch_key(id)
	end
end
game = GameWindow.new(800, 600)
game.show

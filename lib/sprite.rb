require './mobject'
require './move.rb'
require './base_collision'

class Sprite < Mobject
	include Move
	include Base_collision
	
	attr_accessor :move_distance
	
	def initialize(do_collision, solid, virtual_model, pos_x, pos_y, move_distance, animations)
		super(do_collision, solid, virtual_model, pos_x, pos_y)
		@move_distance = move_distance
		@animations = animations
		self.init	# initialize some instance variables
	end
	
	def update
		self.moving
	end
	
	def command?(key)
		false
	end
end

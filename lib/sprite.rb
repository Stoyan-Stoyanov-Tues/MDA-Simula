require './mobject'
require './move.rb'
require './base_collision'

class Sprite < Mobject
	include Move
	include Base_collision
	
	attr_accessor :move_distance
	
	def initialize(do_collision, solid, virtual_model, pos_x, pos_y, move_distance)
		super(do_collision, solid, virtual_model, pos_x, pos_y)
		@move_distance = move_distance
	end
	
	def move(move_type)
		self.method(move_type).call
	end
end

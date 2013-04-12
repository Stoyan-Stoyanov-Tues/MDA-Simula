require './mobject'
require './move.rb'

class Sprite < Mobject
	include Move
	
	attr_accessor :move_distance
	
	def initialize(do_collision, solid, virtual_model, move_distance)
		super(do_collision, solid, virtual_model)
		@move_distance = move_distance
	end
	
	def move(move_type)
		self.method(move_type).call
	end
end

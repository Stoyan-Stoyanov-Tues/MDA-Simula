require './move.rb'
=begin
	Probaly all obejcts will inherit Mobject.
=end
class Mobject
	attr_accessor :do_collision, :solid, :virtual_model
	
	def initialize(do_collision, solid, virtual_model)
		@do_collision = do_collision 	# boolean
		@solid = solid 					# boolean
		@virtual_model = virtual_model  # center, radius, width, height
	end
	
	# every object can be "drawn"
	def draw
	end
	
	# every object can be "update
	def	update 
	end
	
	# in case we need it for every mobject
	def move(move_type)
	end
end

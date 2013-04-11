=begin
	Probaly all obejcts will inherit Mobject.
=end
class Mobject
	attr_accessor :do_collision, :solid, :virtual_model
	attr_reader :type
	
	def initialize(do_collision, solid, virtual_model, type = :unit)
		@do_collision = do_collision 	# boolean
		@solid = solid 					# boolean
		@virtual_model = virtual_model  # center, radius, width, height
		@type = type 					# unit, effect et cetera
	end
	
	# every object can be "drawn"
	def draw
	end
	
	# every object can be "update
	def	update 
	end
	
	# in case we need it for every mobject
	def move(move_type, direction)
	end
end

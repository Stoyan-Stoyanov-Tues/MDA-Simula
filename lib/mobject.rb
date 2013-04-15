require './move.rb'
=begin
	Probaly all obejcts will inherit Mobject.
=end
class Mobject
	attr_accessor :do_collision, :solid, :virtual_model, :pos_x, :pos_y, :rectangle_x, :rectangle_y
	
	def initialize(do_collision, solid, virtual_model, pos_x, pos_y)
		@do_collision = do_collision 	# boolean
		@solid = solid 					# boolean
		@virtual_model = virtual_model  # center, radius, width, height
		@pos_x = pos_x					# position of the circle's center
		@pos_y = pos_y					# position of the circle's center	
		@rectangle_x = pos_x - virtual_model.distance_centers_x # rectangle center.x
		@rectangle_y = pos_y - virtual_model.distance_centers_y # rectangle center.y
	end
	
	# every object can be "drawn"
	def draw
		@virtual_model.image.draw_rot(@pos_x, @pos_y, 0, 0,
		 1-@virtual_model.center.x.to_f/@virtual_model.image.width, 1-@virtual_model.center.y.to_f/@virtual_model.image.height)
	end
	
	# every object can be "update
	def	update 
	end
	
	# in case we need it for every mobject
	def move(move_type)
	end
end

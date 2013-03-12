require './z_order'

class Unit
	def initialize 
		solid = true, model, rows, cols,
		center_x, center_y, radius,
		height, width, vision = , attack_when,
		spells, movement_speed, damage_type, damage,
		health, health_regen, 
	
	
		super(solid)
	end
end

class Attack

end
class Defense

end
class Point
	
end
class Virtual_model
	attr_accessor 
		:solid, :model,
		:rows, :cols,
		:center_x, :center_y,
		:radius, :height, :width
	
	def initialize 
		solid = true, model = nil,
		rows = 0, cols = 0,
		center_x = 0, center_y = 0, radius,
		height, width
		
		@solid = solid
		@model = model
		@rows, @cols = rows, cols
		@ceter_x, @center_y = center_x, center_y
		@radius = radius
		@height, @width = height, width
	end
end
class VirtualModel
	attr_accessor :center, :radius, :height, :width, :distance_centers_x , :distance_centers_y, :collision
	
	def initialize(center, radius, width, height, distance_centers_x, distance_centers_y, preferred_collision)
		@center = center
		@radius = radius
		@width, @height = width, height
		
		# distance between circle's center and reactangle's center
		@distance_centers_x = distance_centers_x 
		@distance_centers_y = distance_centers_y
		
		@collision = preferred_collision
	end
end

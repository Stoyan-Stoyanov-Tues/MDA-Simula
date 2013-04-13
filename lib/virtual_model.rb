class VirtualModel
	attr_accessor :center, :radius, :height, :width, :distance_centers_x , :distance_centers_y
	
	def initialize(center, radius, width, height, distance_centers_x, distance_centers_y)
		@center = center
		@radius = radius
		@width, @height = width, height
		@distance_centers_x = distance_centers_x 
		@distance_centers_y = distance_centers_y
	end
end

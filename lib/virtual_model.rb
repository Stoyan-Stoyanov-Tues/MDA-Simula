class VirtualModel
	attr_accessor :center, :radius, :height, :width
	
	def initialize(center, radius, width, height)
		@ceter = center
		@radius = radius
		@width, @height = width, height
	end
end

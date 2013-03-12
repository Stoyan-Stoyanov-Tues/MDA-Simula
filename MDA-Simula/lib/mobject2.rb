=begin
	Probaly all obejcts will inherit Mobject.
	@type is an integer. Take a look of mobject_types.
=end
class Mobject
	attr_accessor :type, :center_x, :center_y, :radius, :height, :width
	def initialize (type, center_x, center_y, radius, height, width)
		@type = type
		@center_x = center_x
		@center_y = center_y
		@radius = radius
		@height = height
		@width = width
	end
end

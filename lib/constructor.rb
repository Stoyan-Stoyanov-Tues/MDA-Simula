require 'gosu'
require './point'
require './virtual_model'

class Constructor
	def	self.create_virtual_model(image)
	
		# upside down
		top = Point.new(0, image.height-1)
		bottom = Point.new(0, 0)
		left = Point.new(image.width-1, 0)
		right = Point.new(0, 0)
		
		image.each do |pixel, x ,y|
			if pixel[3] != 0 # check alpha channel
				if top.y > y
					top.y = y
					top.x = x
				end
				if bottom.y < y
					bottom.y = y
					bottom.x = x
				end
				if left.x > x
					left.x = x
					left.y = y
				end
				if right.x < x
					right.x = x
					right.y = y
				end
			end
		end
		
		get_stats(top, bottom, left, right) # return instance of VirtualModel
	end
	
	# returns object with the info about the "actual object" inside an image
	def self.get_stats(top, bottom, left, right)
		array = [ 
 			 [top, bottom, Gosu::distance(top.x, top.y, bottom.x, bottom.y) ],
			 [top, left, Gosu::distance(top.x, top.y, left.x, left.y) ],
			 [top, right, Gosu::distance(top.x, top.y, right.x, right.y) ],
			 [bottom, left, Gosu::distance(bottom.x, bottom.y, left.x, left.y) ],
			 [bottom, right, Gosu::distance(bottom.x, bottom.y, right.x, right.y) ],
			 [left, right, Gosu::distance(left.x, left.y, right.x, right.y) ],
		]
		array.sort! {|p1, p2| p2[2] <=> p1[2]}
		
		# the radius of the optimal circle,
		# build around the "actual object" inside an image
		radius = array[0][2]/2
		center = Point.new( (array[0][0].x - array[0][1].x).abs/2 , (array[0][0].y - array[0][1].y).abs/2 )
		height = bottom.y - top.y 
		width = right.x - left.x
		distance_centers_x = center.x - width/2  # distance between circle center.x and rectangle center.x
		distance_centers_y = center.y - height/2 # distance between circle center.y and rectangle center.y
		p height*width
		p radius*radius*Math::PI
		preferred_collision = height*width > radius*radius*Math::PI ? :circle : :rectangle
		  
		VirtualModel.new(center, radius, width, height, distance_centers_x, distance_centers_y, preferred_collision)
	end
end

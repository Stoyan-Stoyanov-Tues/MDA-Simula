module Move
	def self.extended(base)
 	end
 	
	def left
		@pos_x-=@move_distance
		@rectangle_x-=@move_distance
	end
	
	def right
		@pos_x+=@move_distance
		@rectangle_x+=@move_distance
	end
	
	def up
		@pos_y-=@move_distance
		@rectangle_y-=@move_distance
	end
	
	def down
		@pos_y+=@move_distance
		@rectangle_y+=@move_distance
	end
	
	def squat
	end
	
	def jump
	end
end

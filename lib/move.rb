module Move
 	def init
 		@oposite_move = {:up => :down, :down => :up, :left => :right, :right => :left}
		@activated_effects = Array.new
    	end
    
 	def move(move_type)
		self.method(move_type).call
		if try_move?
			@activated_effects.each { |effect| effect.do_effect(self) }
			@activated_effects.clear
		else
			self.method(@oposite_move[move_type]).call	
		end
	end
	
	def try_move?
		$map.each do |object|
			if object.do_collision && self != object
				if object.solid
					return false if self.method(object.virtual_model.collision).call(object)
				else
					if self.method(object.virtual_model.collision).call(object) 
						@activated_effects << object if object.method_defined?(:do_effect)
					end 
				end
			end
		end	
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

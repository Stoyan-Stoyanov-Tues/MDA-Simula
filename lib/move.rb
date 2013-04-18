module Move
	def init
		@oposite_move = {:up => :down, :down => :up, :left => :right, :right => :left}
		@activated_effects = Array.new
		@jumping = false
	
		@speed = 5
		@gravity = 2
		
		@scale_x = Math.cos(0 * Math::PI / 180)
		@scale_y = Math.sin(90 * Math::PI / 180)
		
		@velocity_x = @speed*@scale_x	
		@velocity_y = 3*@speed*@scale_y
	end
	
	def moving
		# while the jumping is active, the object cannot fall
		if @jumping
			self.down
			if try_move? # if the move is successful
				@velocity_y+=@gravity

				@activated_effects.each { |effect| effect.do_effect(self) }
				@activated_effects.clear
			else # the object had collision with the ground or with the roof 
				self.up
				@velocity_y = @speed*@scale_y # reset to 0
				@jumping = false
			end
		else # the object tries to fall
			self.down
			if !try_move?
				self.up
			else
				@activated_effects.each { |effect| effect.do_effect(self) }
				@activated_effects.clear
			end
			if self.command?(Gosu::KbSpace) # new jumping is assigned
				@velocity_y = -20
				@jumping = true
			end
		end
		move(:left ) if self.command?(Gosu::KbLeft)
		move(:right) if self.command?(Gosu::KbRight)
		
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
		@pos_x-=@velocity_x
	end
	
	def right
		@pos_x+=@velocity_x
	end
	
	def up
		@pos_y-=@velocity_y
	end
	
	def down
		@pos_y+=@velocity_y
	end
	
	def squat
	end
end

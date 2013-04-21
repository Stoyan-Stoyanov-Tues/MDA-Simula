require './mobject'
require './move.rb'
require './base_collision'

class Sprite < Mobject
	include Move
	include Base_collision
	
	attr_accessor :move_distance
	
	def initialize(do_collision, solid, virtual_model, pos_x, pos_y, move_distance, animations, range_attack_image = 'bullet.png')
		super(do_collision, solid, virtual_model, pos_x, pos_y)
		@move_distance = move_distance
		@animations = animations
		self.init	# initialize some instance variables
		@range_attack_image = Gosu::Image.new($window, range_attack_image, true)
		@range_attack_model = Constructor.create_virtual_model(@range_attack_image)
	end
	
	def update
		self.moving()
		self.destroy()
	end
	
	def command?(key)
		false
	end
	
	def range_attack
		pos = 0
		pos = @pos_x - (@virtual_model.width+0.5) if @direction == :left
		pos = @pos_x + (@virtual_model.width+0.5) if @direction == :right
	
		range_attack = RangeAttack.new(true, false, @range_attack_model, pos, @pos_y, 5, Hash.new, @direction)
		$map.add(range_attack)
	end
end

class RangeAttack < Sprite
	def initialize(do_collision, solid, virtual_model, pos_x, pos_y, move_distance, animations, direction)
		super(do_collision, solid, virtual_model, pos_x, pos_y, move_distance, animations)
		@direction = direction
	end
	
	def do_collision_effect(object)
		$map.delete(object)
		$map.delete(self)
	end
	
	def update
		self.moving()
		self.destroy()
	end
	
	def moving
		move(@direction)
	end
end

require './effect'

=begin
	height and width are in px
	@row_size and @col_size defines the size of every field
=end
class Map
	attr_accessor :rows, :cols
	def initialize width, height, col_size = 32, row_size = 32
		@col_size, @row_size = col_size, row_size
		@rows = height/@row_size
		@cols = width/@col_size
		@map = Array.new(@rows) { Array.new(@cols) {Field.new()} }
	end
	
	def add_object object, rows, cols
		@map[rows][cols].add_object(object)
	end
	
	def is_there_object rows, cols
		@map[rows][cols].has_object
	end
end

class Field
	attr_accessor :object
	def initialize
		@objects = Array.new {}
		@effects = Array.new {}
	end
	
	# effect's update method will determine if effect's effect method has to be called
	# effect's hierarchy is placed into effect.rb 
	def update
		@effects.each {|effect| effect.update}
	end
	
	def has_object
		return @objects.any?
	end
	
	def delete object
		@objects.delete(object)
	end
	
	def add_object object
		@objects.add(object)
	end
	
	def add_effect effect
		@effects.add(effect)
	end
end


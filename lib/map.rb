=begin
	height and width are in px
	@row_size and @col_size defines the size of every field
=end
class Map
	attr_reader :rows, :cols, :col_size, :row_size
	
	def initialize width, height, col_size = 32, row_size = 32
		@col_size, @row_size = col_size.abs, row_size.abs
		@rows = (height/@row_size).ceil
		@cols = (width/@col_size).ceil
		@map = Array.new(@rows) { Array.new(@cols) {Field.new()} }
	end
	
	def add_object(object, rows, cols)
		@map[rows][cols].add(object)
	end
	
	def remove_object(object, rows, cols)
		@map[rows][cols].remove(object)
	end
	
	def objects(rows, cols)
		@map[rows][cols].objects
	end
end

class Field
	attr_accessor :objects
	
	def initialize
		@objects = Array.new {}
	end

	def remove(object)
		@objects.delete(object)
	end
	
	def add(object)
		@objects.add(object)
	end
	
	def update
		@objects.each {|object| object.update}
	end
	
	def draw
		@objects.each {|object| object.draw}
	end
end


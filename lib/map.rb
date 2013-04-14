class Map
	attr_accessor :map
	def initialize
		@map = Array.new()
	end	
	
	def each
		@map.each { |elem| yield elem } if block_given?
		true
	end
	
	def add(object)
		@map << object
	end
end

require './z_order'

=begin
	Probaly all obejcts will inherit Mobject.
	@solid should be boolean
=end
class Mobject
	attr_accessor :solid
	def initialize solid
		@solid = solid
	end
	# Every object can be "drawn"
	def draw
	end
	def	update 
	end
end

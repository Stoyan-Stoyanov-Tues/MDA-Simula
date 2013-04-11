class MObject

protected

@locX #X-location of the object
@locY #Y-location of the object
@locZ #Z-location of the object
@rad #radius of the image representing the object
@height #height
@solid #true of false

public

	def get_locX
	@locX
	end
	
	def set_locX=(x)
	@locX = x
	end
	
	def get_locY
	@locY
	end
	
	def set_locY=(y)
	@locY = y
	end


end

class Unit < MObject

@dmg
@hp

	def initialize
	@hp = 100
	@dmg = 10
	end
	
	def set_dmg=(dmg)
	@gmg = dmg
	end
	
	def is_col?( target )
	( (@locX+1) == target.get_locX ) ? true : false
	end
	
	def attack( target )
	target.harm!( @dmg )
	end
	
	def harm!(amount)
	@hp -= amount
	end
	
	def move_forw(target)
	if ( self.is_col?(target) == true )
	self.attack( target )
	end
	@locX++
	end
end

require './sprite'

class Player < Sprite
	def command?(key)
		$window.button_down?(key)   
	end
end

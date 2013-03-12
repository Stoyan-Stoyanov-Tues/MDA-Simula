require './mobject'
require './z_order'

class Terrain
	def initialize solid, tile, effects, rows, cols
		super(solid)
		@tile = tile
		@effects = effects
	end
	def draw
		@tile.draw(rows, cols, Z_order:TERRAIN)
	end
end
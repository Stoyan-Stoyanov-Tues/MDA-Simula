require_relative 'constructor'
require 'gosu'

def self.tile(path, do_collision, solid, pos_x, pos_y)
window = Gosu::Window.new
image = Gosu::Image.new(window, path, false)
image2 = GameImage.new(path, image.width, image.height)
Tile.new(do_collision, solid, create_virtual_model(image2), pos_x, pos_y)
end

class OmegaClass
	@a
	@b
	@c
	@d
	@e
	
	def initialize
		@a = 1
		@b = 2
		@c = 3
		@d = 4
		@e = 5
	end
end
	
a = OmegaClass.new
serialized_object = Marshal::dump(a)
File.open("./marshall.marshal", "w") { |f| f.write(Marshal.dump(a)) }

@b = File.read('marshall.marshal')
p Marshal.load(@b)

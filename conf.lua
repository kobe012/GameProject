function love.conf(t)
	t.window.title = "RPG"
	t.window.width = 800
	t.window.height = 600
	t.window.resizable = true
	t.window.vsync = true
	t.window.msaa = 4

	-- Enable high DPI mode for better resolution on high-DPI displays
	t.window.highdpi = true

	-- Set the default font size
	--t.window.font = "assets/fonts/default.ttf"
end

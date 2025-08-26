local Player = {}

function Player:load()
	local anim8 = require("libraries/anim8")
	love.graphics.setDefaultFilter("nearest", "nearest")

	self.x = 50
	self.y = love.graphics.getHeight() / 2
	self.width = 32
	self.height = 32
	self.speed = 300

	self.sprite = love.graphics.newImage("assets/sprites/character.png")
	self.grid = anim8.newGrid(16, 32, self.sprite:getWidth(), self.sprite:getHeight())
	self.animation = {
		down = anim8.newAnimation(self.grid("1-4", 1), 0.2),
		up = anim8.newAnimation(self.grid("1-4", 3), 0.2),
		right = anim8.newAnimation(self.grid("1-4", 2), 0.2),
		left = anim8.newAnimation(self.grid("1-4", 4), 0.2),
	}
	self.currentAnimation = self.animation.down
end

function Player:update(dt)
	self:move(dt)
	self.currentAnimation:update(dt)

	if Player.x < 10 then
		Player.x = 10
	end

	if Player.y < 1 then
		Player.y = 1
	end

	if Player.x > 840 - Player.width * 2 then
		Player.x = 840 - Player.width * 2
	end

	if Player.y > 620 - Player.height * 2 then
		Player.y = 621 - Player.height * 2
	end
end

function Player:move(dt)
	local moving = false --player moving flag

	if love.keyboard.isDown("d") then
		self.x = self.x + self.speed * dt
		self.currentAnimation = self.animation.right
		moving = true
	end

	if love.keyboard.isDown("a") then
		self.x = self.x - self.speed * dt
		self.currentAnimation = self.animation.left
		moving = true
	end

	if love.keyboard.isDown("w") then
		self.y = self.y - self.speed * dt
		self.currentAnimation = self.animation.up
		moving = true
	end

	if love.keyboard.isDown("s") then
		self.y = self.y + self.speed * dt
		self.currentAnimation = self.animation.down
		moving = true
	end
	if moving == false then
		self.currentAnimation:gotoFrame(1) --idle frame
	end
end

function Player:draw()
	self.currentAnimation:draw(self.sprite, self.x, self.y, nil, 2, nil, 2)
end
return Player

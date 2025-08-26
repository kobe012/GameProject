local sti = require("libraries/sti") -- modules
local Player = require("src.player")
local Camera = require("libraries/camera")

local camera --object but instance
local gameMap -- object

function love.load()
	camera = Camera() --this is an object from camera library
	gameMap = sti("map/tesmap.lua")
	Player:load()
end

function love.update(dt)
	camera:lookAt(Player.x, Player.y)
	Player:update(dt)
	camera:lookAt(Player.x, Player.y)

	local w = love.graphics.getWidth()
	local h = love.graphics.getHeight()

	if camera.x < w / 2 then
		camera.x = w / 2
	end
	if camera.y < h / 2 then
		camera.y = h / 2
	end
	local mapW = gameMap.width * gameMap.tilewidth
	local mapH = gameMap.height * gameMap.tileheight
	--right sight
	if camera.x > (mapW - w / 2) then
		camera.x = (mapW - w / 2)
	end --bottom sight
	if camera.y > (mapH - h / 2) then
		camera.y = (mapH - h / 2)
	end
end

function love.draw()
	camera:attach()
	gameMap:drawLayer(gameMap.layers["Ground"])
	gameMap:drawLayer(gameMap.layers["onGround"])
	Player:draw()
	camera:detach()
end

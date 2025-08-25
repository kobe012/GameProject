local sti = require("libraries/sti")
local Player = require("src.player")

local gameMap

function love.load()
	gameMap = sti("map/tesmap.lua")
	Player:load()
end

function love.update(dt)
	Player:update(dt)
end

function love.draw()
	gameMap:draw(nil, 3)
	Player:draw()
end

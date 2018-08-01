local concord = require "lib.concord"
local maid64 = require "lib.maid64"
local game = require "src.instances.game"

function love.load()	
	concord.init()
	maid64.setup(64)
end

function love.update(deltaTime)
	game:emit("update", deltaTime)
end

function love.draw()
	-- Scale everything inbetween start() and finish()
	-- to the target resolution
	game:emit("draw")
end

function love.keypressed(key, scancode, isRepeat)
	-- TODO: tie this to some kind of debug mode
	if key == "escape" and not isRepeat then
		love.event.quit()
	end
end

function love.resize(width, height)
	-- Alert maid64 that the dimensions of the canvas changed
	-- This will cause it to fill the window
	maid64.resize(width, height)
end

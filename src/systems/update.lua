local Component = require "lib.concord.component"
local Position = require "src.components.position"
local System = require "lib.concord.system"
local Update = System({
	Position
})

function Update:update(deltaTime)
	for _, entity in ipairs(self.pool.objects) do
		local position = entity:get(Position)

		position.x = position.x + 1 * deltaTime
		position.y = position.y + 1 * deltaTime

		print(position.x, position.y)
	end
end

return Update
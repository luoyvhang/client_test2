local class = require('middleclass')
local StateComponentMapping = require('lash.fsm.StateComponentMapping')


--[[
Represents a state for an EntityStateMachine. The state contains any number of ComponentProviders which
are used to add components to the entity when this state is entered.
]]
local EntityState = class('EntityState')


function EntityState:initialize()
	self.providers = {}
end

--[[
Add a new ComponentMapping to this state. The mapping is a utility class that is used to
map a component type to the provider that provides the component.

@param type The type of component to be mapped
@return The component mapping to use when setting the provider for the component
]]
function EntityState:add(type)
	return StateComponentMapping(self, type)
end

--[[
Get the ComponentProvider for a particular component type.

@param type The type of component to get the provider for
@return The ComponentProvider
]]
function EntityState:get(type)
	return self.providers[type]
end

--[[
To determine whether this state has a provider for a specific component type.

@param type The type of component to look for a provider for
@return true if there is a provider for the given type, false otherwise
]]
function EntityState:has(type)
	return self.providers[type] ~= nil
end

function EntityState:__eq(rhs)
  return rawequal(self, rhs)
end

return EntityState
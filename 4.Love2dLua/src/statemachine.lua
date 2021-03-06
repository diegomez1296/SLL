StateMachine = Class{}

function StateMachine:init(states)
	self.empty = {
		render = function()  end,
		handleInput = function()  end,
		update = function() end,
        enter = function() end,
        exit = function() end
	}
	self.states = states or {}
	self.current = self.empty
end

function StateMachine:change(newState, params)
	assert(self.states[newState])
	self.current:exit()
	self.current = self.states[newState]()
	self.current:enter(params)
end

function StateMachine:update(dt)
	self.current:update(dt)
end

function StateMachine:handleInput(key)
	self.current:handleInput(key)
end

function StateMachine:render()
	self.current:render()
end
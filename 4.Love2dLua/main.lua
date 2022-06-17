-- alt + L

require 'src/init'

function love.load()
	
	love.keyboard.setKeyRepeat(true)

	love.window.setTitle('Tetris Love2dLua - Lukasz Rydzinski')
	love.graphics.setBackgroundColor(0, 0, 0)

	love.graphics.setFont(love.graphics.newFont(36))
	love.window.setMode(30 * (20 + 6), 30 * (23))
	love.graphics.setDefaultFilter( 'nearest', 'nearest', 1 )

	gStateMachine = StateMachine { 
        ['game'] = function() return GameMode() end,
		['end'] = function() return GameMode() end
	}

	love.keyboard.setTextInput(false)
	gStateMachine:change('game',{})
end

function love.keypressed(key)
	if not love.keyboard.hasTextInput() then
		gStateMachine:handleInput(key)
	end

end

function love.textinput(t)
	local str_len = #gTextString
	if gTextStringLength <= 9 then
		if gTextStringLength == 0 then
			gTextString = t  .. string.sub('_______',1,9-(gTextStringLength+1))
		elseif gTextStringLength <=8 then
			gTextString = string.sub(gTextString,1,gTextStringLength) .. t .. string.sub('_______',1,10-(gTextStringLength+1))
		elseif gTextStringLength == 9 then
			gTextString = string.sub(gTextString,1,9) .. t
		end
		gTextStringLength = gTextStringLength + 1
	end

end

function love.update(dt)
	gStateMachine:update(dt)
end

function love.draw()
	gStateMachine:render()
end
GameMode = Class{__includes={BaseGame} }

function GameMode:enter(params)
	BaseGame.init(self,params or {})
end

function GameMode:update(dt)
    if not self.gameOver and not self.paused then
		self:updateBoard(dt)
    end
end

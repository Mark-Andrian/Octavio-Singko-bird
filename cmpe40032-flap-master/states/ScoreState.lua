--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}
local Gold = love.graphics.newImage('4.jpg')
local Silver = love.graphics.newImage('5.jpg')
local Bronze = love.graphics.newImage('3.jpg')
local Zero = love.graphics.newImage('6.jpg')

local Bgscore = love.graphics.newImage('1.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Uh-oh Sorry!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Your Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Tap Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 80, VIRTUAL_WIDTH, 'center')
    if self.score < 11 and self.score > 0 then
        love.graphics.draw(Bronze, 235, 100)
        love.graphics.printf('Here is your BRONZE!!', 0, 160, VIRTUAL_WIDTH, 'center')
    elseif self.score > 10 and self.score < 21 then
        love.graphics.draw(Silver, 235, 100)
        love.graphics.printf('Here is your SILVER!!', 0, 160, VIRTUAL_WIDTH, 'center')
    elseif self.score > 20 and self.score < 31 then
        love.graphics.draw(Gold, 235, 100)
        love.graphics.printf('Here is your GOLD!!', 0, 160, VIRTUAL_WIDTH, 'center')
    elseif self.score == 0 then
        love.graphics.draw(Zero, 200, 110)
        love.graphics.printf('Do it Again', 0, 170, VIRTUAL_WIDTH, 'center')
    end
end
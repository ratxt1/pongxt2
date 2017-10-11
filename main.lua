function love.load()
	-- starting positions for moving assests
	xb, yb, x1, y1, x2, y2 = 385, 330, 130, 270, 610, 270
    -- speed and speed count of ball
    sx, sy, sc = 3, 3, 0 
    -- score counts
    p1, p2 = 0, 0
end
function love.update()
	function reset()
		-- starting positions for moving assests
		xb, yb, x1, y1, x2, y2 = 385, 330, 130, 270, 610, 270
    	-- speed and speed count of ball
   		sx, sy, sc = 3, 3, 0 
   	end
   	function checkSpeed()
		if sc % 3 == 0 then
			if sx > 0 then
				sx = sx +1
			else 
				sx = sx -1
			end
			if sy > 0 then
				sy = sy + 1
			else
				sy = sy - 1
			end
		end
	end
	function upScore1()
		p1 = p1 + 1
		reset()
	end
	function upScore2()
		p2 = p2 + 1
		reset()
	end
	xb = xb + sx
	yb = yb + sy
	if love.keyboard.isDown("a") then
		if y1 ~= 380 then
			y1 = y1 + 5
		end
	end
	if love.keyboard.isDown("d") then
		if y1 ~= 160 then
			y1 = y1 - 5
		end
	end
	if love.keyboard.isDown("left") then
		if y2 ~= 380 then 
			y2 = y2 + 5
		end
	end
	if love.keyboard.isDown("right") then
		if y2 ~= 160 then
			y2 = y2 - 5
		end
	end
	-- ball movement
	if yb <= 155 or yb >= 505 then
		sy = -sy
	end
	if xb <= 165 then
		if yb >= (y1-5) and yb <= (y1+115) then
			sx = -sx
			sc = sc + 1
			checkSpeed()
		else
			upScore2()
		end
	end
	if xb >= 605 then
		if yb >= (y2-5) and yb <= (y2+115) then
			sx = -sx
			sc = sc + 1
			checkSpeed()

		else
			upScore1()
		end
	end
	
end
function love.draw()
	paddle1 = love.graphics.rectangle("fill", x1, y1, 30, 120)
	paddle2 = love.graphics.rectangle("fill", x2, y2, 30, 120)
	ball = love.graphics.circle("fill", xb, yb, 5)
	boundary = love.graphics.rectangle("line", 100, 150, 570, 360)
	score1 = love.graphics.print(p1, 140, 110, 0, 2) 
	score2 = love.graphics.print(p2, 615, 110, 0, 2)
	--love.graphics.rectangle("line", xb, yb, 10, 10)
end
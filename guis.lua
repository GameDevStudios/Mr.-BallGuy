local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

function mainmenu()
	local startbutton = loveframes.Create("button")
	local creditsbutton = loveframes.Create("button")
	local optionsbutton = loveframes.Create("button")
	local helpbutton = loveframes.Create("button")
	local quitbutton = loveframes.Create("button")
	local langbutton = loveframes.Create("button")

	startbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2-100)
	startbutton:SetSize(150, 30)
	startbutton:SetText("Play")
	startbutton:SetState("startmenu")
	startbutton.OnClick = function(object) 
		gamestate = "playing"
		loveframes.SetState("playing")
	end

	creditsbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2-50)
	creditsbutton:SetSize(150, 30)
	creditsbutton:SetText("Credits")
	creditsbutton:SetState("startmenu")
	creditsbutton.OnClick = function(object)
		gamestate = "credits"
		loveframes.SetState("credits")
	end


	optionsbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2)
	optionsbutton:SetSize(150, 30)
	optionsbutton:SetText("Options")
	optionsbutton:SetState("startmenu")
	optionsbutton.OnClick = function(object)
		gamestate = "options"
		loveframes.SetState("options")
	end

	helpbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2+50)
	helpbutton:SetSize(150, 30)
	helpbutton:SetText("Help")
	helpbutton:SetState("startmenu")
	helpbutton.OnClick = function(object)
		gamestate = "help"
		loveframes.SetState("help")
	end

	langbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2+100)
	langbutton:SetSize(150, 30)
	langbutton:SetText("Language")
	langbutton:SetState("startmenu")
	langbutton.OnClick = function(object)
		gamestate = "langs"
		loveframes.SetState("langs")
	end

	quitbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2+200)
	quitbutton:SetSize(150, 30)
	quitbutton:SetText("Quit")
	quitbutton:SetState("startmenu")
	quitbutton.OnClick = function(object)
		love.quit()
	end
end

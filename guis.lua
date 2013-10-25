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
		gamestate = "profileSelect"
		loveframes.SetState("profileSelect")
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

function credits()
	local backButton = loveframes.Create("button")

	backButton:SetSize(150, 30)
	backButton:SetText("Back to Main Menu")
	backButton:SetState("credits")
	backButton:CenterX()
	backButton:SetY(screenHeight/2-30/2+250)
	backButton.OnClick = function(object)
		gamestate = "startmenu"
		loveframes.SetState("startmenu")
	end
end



function profileSelect()
	local profilesFrame = loveframes.Create("frame")

	local createProfileButton = loveframes.Create("button", profilesFrame)
	local backButton = loveframes.Create("button", profilesFrame)

	profilesFrame:SetSize(screenWidth-50, screenHeight-50)
	profilesFrame:SetName("Profile Select")
	profilesFrame:SetState("profileSelect")
	profilesFrame:SetDraggable(false)
	profilesFrame:ShowCloseButton(false)
	profilesFrame:Center()

	createProfileButton:SetSize(150, 30)
	createProfileButton:SetText("Create New Profile")
	createProfileButton:CenterX()
	createProfileButton:SetY( (profilesFrame:GetHeight()/2-150/2+250) )
	createProfileButton.OnClick = function(object)
		gamestate = "createProfile"
		loveframes.SetState("createProfile")
	end

	backButton:SetSize(150, 30)
	backButton:SetText("Back to Main Menu")
	backButton:CenterX()
	backButton:SetY( (profilesFrame:GetHeight()/2-150/2+300) )
	backButton.OnClick = function(object)
		gamestate = "startmenu"
		loveframes.SetState("startmenu")
	end
end

function createProfile()
	local createProfileFrame = loveframes.Create("frame")

	local createProfileButton = loveframes.Create("button", createProfileFrame)
	local backButton = loveframes.Create("button", createProfileFrame)

	local profileNameTextbox = loveframes.Create("textinput", createProfileFrame)

	createProfileFrame:SetSize(screenWidth-50, screenHeight-50)
	createProfileFrame:SetName("Create Profile")
	createProfileFrame:SetState("createProfile")
	createProfileFrame:SetDraggable(false)
	createProfileFrame:ShowCloseButton(false)
	createProfileFrame:Center()

	createProfileButton:SetSize(150, 30)
	createProfileButton:SetText("Create Profile")
	createProfileButton:CenterX()
	createProfileButton:SetY( (createProfileFrame:GetHeight()/2-150/2+250) )
	createProfileButton.OnClick = function(object)
		-- Do later
		-- This will be fun xD
	end

	backButton:SetSize(150, 30)
	backButton:SetText("Back to Profile Select")
	backButton:CenterX()
	backButton:SetY( (createProfileFrame:GetHeight()/2-150/2+300) )
	backButton.OnClick = function(object)
		gamestate = "profileSelect"
		loveframes.SetState("profileSelect")
	end

	profileNameTextbox:Center()
	profileNameTextbox:SetSize( (createProfileFrame:GetWidth()/2-50/2), 25 )
	profileNameTextbox:SetPos( (createProfileFrame:GetWidth()/2-profileNameTextbox:GetWidth()/2), (createProfileFrame:GetHeight()/2-profileNameTextbox:GetHeight()/2) )
end

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local profileNameIsBlank = false

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

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end

	creditsbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2-50)
	creditsbutton:SetSize(150, 30)
	creditsbutton:SetText("Credits")
	creditsbutton:SetState("startmenu")
	creditsbutton.OnClick = function(object)
		gamestate = "credits"
		loveframes.SetState("credits")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end


	optionsbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2)
	optionsbutton:SetSize(150, 30)
	optionsbutton:SetText("Options")
	optionsbutton:SetState("startmenu")
	optionsbutton.OnClick = function(object)
		gamestate = "options"
		loveframes.SetState("options")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end

	helpbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2+50)
	helpbutton:SetSize(150, 30)
	helpbutton:SetText("Help")
	helpbutton:SetState("startmenu")
	helpbutton.OnClick = function(object)
		gamestate = "help"
		loveframes.SetState("help")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end

	langbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2+100)
	langbutton:SetSize(150, 30)
	langbutton:SetText("Languages")
	langbutton:SetState("startmenu")
	langbutton.OnClick = function(object)
		gamestate = "langs"
		loveframes.SetState("langs")

		if prefs.sfx then
			buttonClick:play()
		else
			--prefs. pass
		end
	end

	quitbutton:SetPos(screenWidth/2-150/2, screenHeight/2-30/2+200)
	quitbutton:SetSize(150, 30)
	quitbutton:SetText("Quit")
	quitbutton:SetState("startmenu")
	quitbutton.OnClick = function(object)
		love.quit()

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
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

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end
end

function help()
	local backButton = loveframes.Create("button")

	backButton:SetSize(150, 30)
	backButton:SetText("Back to Main Menu")
	backButton:CenterX()
	backButton:SetState("help")
	backButton:SetY( screenHeight/2-30/2+250 )
	backButton.OnClick = function(object)
		gamestate = "startmenu"
		loveframes.SetState("startmenu")
		
		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end
end

function options(bgm, sfxList)
	local optionsFrame = loveframes.Create("frame")

	local soundButton = loveframes.Create("button", optionsFrame)
	local sfxButton = loveframes.Create("button", optionsFrame)
	local backButton = loveframes.Create("button", optionsFrame)

	local musicSlider = loveframes.Create("slider", optionsFrame)
	local sfxSlider = loveframes.Create("slider", optionsFrame)

	local musicSliderText = loveframes.Create("text", optionsFrame)
	local sfxSliderText = loveframes.Create("text", optionsFrame)

	optionsFrame:SetSize(screenWidth-50, screenHeight-50)
	optionsFrame:SetName("Options")
	optionsFrame:SetState("options")
	optionsFrame:SetDraggable(false)
	optionsFrame:ShowCloseButton(false)
	optionsFrame:Center()

	soundButton:SetSize(650, 30)
	soundButton:SetText("Music: " .. tostring(prefs.music))
	soundButton:CenterX()
	soundButton:SetY(optionsFrame:GetHeight()/2-30/2-220)
	soundButton.OnClick = function(object)
		prefs.music = not prefs.music

		savePrefs()

		soundButton:SetText("Music: " .. tostring(prefs.music))

		if not prefs.music then
			bgm:pause()
		else
			bgm:play()
		end

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end

	sfxButton:SetSize(650, 30)
	sfxButton:SetText("SFX: " .. tostring(prefs.sfx))
	sfxButton:CenterX()
	sfxButton:SetY(optionsFrame:GetHeight()/2-30/2-170)
	sfxButton.OnClick = function(object)
		prefs.sfx = not prefs.sfx

		savePrefs()

		sfxButton:SetText("SFX: " .. tostring(prefs.sfx))

		for i,v in pairs(sfxList) do
			sfxList[i]:stop()
		end
	end

	musicSlider:CenterY()
	musicSlider:SetX(optionsFrame:GetWidth()/2-600/2)
	musicSlider:SetMinMax(0, 1)
	musicSlider:SetWidth(600)
	musicSlider:SetValue( bgm:getVolume() )
	musicSlider.OnValueChanged = function(object)
		bgm:setVolume( object:GetValue() )
	end

	sfxSlider:SetY(optionsFrame:GetHeight()/2-100)
	sfxSlider:SetX(optionsFrame:GetWidth()/2-600/2)
	sfxSlider:SetMinMax(0, 100)
	sfxSlider:SetWidth(600)
	sfxSlider:SetValue( buttonClick:getVolume() ) -- This could be any sound effect. They're all the same volume and always will be, unless there is an error
	sfxSlider.OnValueChanged = function(object)
		for i,v in pairs(sfxList) do 
			sfxList[i]:setVolume(object:GetValue())
		end
	end

	sfxSliderText:SetText("SFX Volume")
	sfxSliderText:SetShadow(true)
	sfxSliderText:SetFont(font40)
	sfxSliderText:SetShadowColor( { 154, 154, 154 } )
	sfxSliderText:CenterX()
	sfxSliderText:SetY(optionsFrame:GetHeight()/2-font40:getHeight("SFX Volume")/2-120)

	musicSliderText:SetText("Music Volume")
	musicSliderText:SetShadow(true)
	musicSliderText:SetFont(font40)
	musicSliderText:SetShadowColor( { 154, 154, 154 } )
	musicSliderText:CenterX()
	musicSliderText:SetY(optionsFrame:GetHeight()/2-font40:getHeight("Music Volume")/2-25)

	backButton:SetSize(150, 30)
	backButton:SetText("Back to Main Menu")
	backButton:CenterX()
	backButton:SetY(optionsFrame:GetWidth()/2-30/2+150)
	backButton.OnClick = function(object)
		gamestate = "startmenu"
		loveframes.SetState("startmenu")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end
end

function languages()
	local backButton = loveframes.Create("button")

	backButton:SetSize(150, 30)
	backButton:SetText("Back to Main Menu")
	backButton:SetState("langs")
	backButton:CenterX()
	backButton:SetY(screenHeight/2-30/2+250)
	backButton.OnClick = function(object)
		gamestate = "startmenu"
		loveframes.SetState("startmenu")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end
end



function profileSelect()
	local profilesFrame = loveframes.Create("frame")

	local createProfileButton = loveframes.Create("button", profilesFrame)
	local playAnon = loveframes.Create("button", profilesFrame)
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
	createProfileButton:SetY( (profilesFrame:GetHeight()/2-30/2+150) )
	createProfileButton.OnClick = function(object)
		gamestate = "createProfile"
		loveframes.SetState("createProfile")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end

	playAnon:SetSize(150, 30)
	playAnon:SetText("Play without saving")
	playAnon:CenterX()
	playAnon:SetY( (profilesFrame:GetHeight()/2-30/2+200) )


	backButton:SetSize(150, 30)
	backButton:SetText("Back to Main Menu")
	backButton:CenterX()
	backButton:SetY( (profilesFrame:GetHeight()/2-30/2+250) )
	backButton.OnClick = function(object)
		gamestate = "startmenu"
		loveframes.SetState("startmenu")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end
end

function createProfile()
	local createProfileFrame = loveframes.Create("frame")

	local createProfileButton = loveframes.Create("button", createProfileFrame)
	local backButton = loveframes.Create("button", createProfileFrame)

	local profileNameTextbox = loveframes.Create("textinput", createProfileFrame)

	local profileNameHeader = loveframes.Create("text", createProfileFrame)

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
		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end

		if profileNameTextbox:GetText() == "" then 
			profileNameIsBlank = true
		end

		if lf.exists("profiles/" .. tostring(profileNameTextbox:GetText())) and not profileNameIsBlank then
			local profileNameAlreadyTakenFrame = loveframes.Create("frame")
			profileNameAlreadyTakenFrame:SetName("Alert!")
			profileNameAlreadyTakenFrame:SetSize(500, 150)
			profileNameAlreadyTakenFrame:Center()
			profileNameAlreadyTakenFrame:SetState("createProfile")
			profileNameAlreadyTakenFrame:SetDraggable(false)
			profileNameAlreadyTakenFrame:ShowCloseButton(false)

			local profileNameAlreadyTakenText = loveframes.Create("text", profileNameAlreadyTakenFrame)
			profileNameAlreadyTakenText:SetText("Sorry, that profile name is already taken.")
			profileNameAlreadyTakenText:SetFont(font20)
			profileNameAlreadyTakenText:CenterX()
			profileNameAlreadyTakenText:SetY( 150/2-font20:getHeight("Sorry, that profile name is already taken.")/2-35 )
			profileNameAlreadyTakenText:SetShadow(true)
			profileNameAlreadyTakenText:SetShadowColor( { 154, 154, 154 } )

			local profileNameAlreadyTakenOkButton = loveframes.Create("button", profileNameAlreadyTakenFrame)
			profileNameAlreadyTakenOkButton:SetText("Ok")
			profileNameAlreadyTakenOkButton:SetSize(150, 30)
			profileNameAlreadyTakenOkButton:CenterX()
			profileNameAlreadyTakenOkButton:SetY( 150/2-150/2+100 )
			profileNameAlreadyTakenOkButton.OnClick = function(object)
				profileNameAlreadyTakenFrame:SetVisible(false)
			end
		elseif profileNameIsBlank == true then 
			local profileNameCannotBeBlankFrame = loveframes.Create("frame") -- A very long name, but who cares? xD
			profileNameCannotBeBlankFrame:SetSize(500, 150)
			profileNameCannotBeBlankFrame:SetName("Alert!")
			profileNameCannotBeBlankFrame:Center()
			profileNameCannotBeBlankFrame:SetState("createProfile")
			profileNameCannotBeBlankFrame:SetDraggable(false)
			profileNameCannotBeBlankFrame:ShowCloseButton(false)
			profileNameCannotBeBlankFrame:SetScreenLocked(true)

			local profileNameCannotBeBlankText = loveframes.Create("text", profileNameCannotBeBlankFrame)
			profileNameCannotBeBlankText:SetPos( profileNameCannotBeBlankFrame:GetWidth()/2-font20:getWidth("Profile Name Cannot Be Blank.")/2, profileNameCannotBeBlankFrame:GetHeight()/2-font20:getHeight("Profile Name Cannot Be Blank.")/2-35 )
			profileNameCannotBeBlankText:SetText("Profile Name Cannot Be Blank.")
			profileNameCannotBeBlankText:SetFont(font20)
			profileNameCannotBeBlankText:SetShadow(true)
			profileNameCannotBeBlankText:SetShadowColor( { 154, 154, 154 } )
		
			local profileNameCannotBeBlankOkButton = loveframes.Create("button", profileNameCannotBeBlankFrame)
			profileNameCannotBeBlankOkButton:SetText("Ok")
			profileNameCannotBeBlankOkButton:SetSize(150, 30)
			profileNameCannotBeBlankOkButton:CenterX()
			profileNameCannotBeBlankOkButton:SetY( profileNameCannotBeBlankFrame:GetHeight()/2-150/2+100 )
			profileNameCannotBeBlankOkButton.OnClick = function(object)
				profileNameCannotBeBlankFrame:SetVisible(false)

				profileNameIsBlank = false

			end
		else
			lf.mkdir("profiles/" .. tostring(profileNameTextbox:GetText()))

			if lf.exists("profiles/" .. tostring(profileNameTextbox:GetText())) then
				local createdProfileSuccessfullyFrame = loveframes.Create("frame")
				createdProfileSuccessfullyFrame:SetName("Success!")
				createdProfileSuccessfullyFrame:SetState("createProfile")
				createdProfileSuccessfullyFrame:SetSize(500, 150)
				createdProfileSuccessfullyFrame:Center()
				createdProfileSuccessfullyFrame:SetDraggable(false)
				createdProfileSuccessfullyFrame:ShowCloseButton(false)

				local createdProfileSuccessfullyText = loveframes.Create("text", createdProfileSuccessfullyFrame)
				createdProfileSuccessfullyText:SetText("Successfully Created Profile!")
				createdProfileSuccessfullyText:SetFont(font20)
				createdProfileSuccessfullyText:SetShadow(true)
				createdProfileSuccessfullyText:SetShadowColor( { 154, 154, 154 } )
				createdProfileSuccessfullyText:CenterX()
				createdProfileSuccessfullyText:SetY(150/2-font20:getHeight("Successfully Created Profile!")/2-35)

				local createdProfileSuccessfullyOkButton = loveframes.Create("button", createdProfileSuccessfullyFrame)
				createdProfileSuccessfullyOkButton:SetSize(150, 30)
				createdProfileSuccessfullyOkButton:SetText("Awesome!")
				createdProfileSuccessfullyOkButton:CenterX()
				createdProfileSuccessfullyOkButton:SetY( createdProfileSuccessfullyFrame:GetHeight()/2-150/2+100 )
				createdProfileSuccessfullyOkButton.OnClick = function(object)
					createdProfileSuccessfullyFrame:SetVisible(false)
					
					loveframes.SetState("profileSelect")
					gamestate = "profileSelect"				
				end
			else
				print("Profile created unsuccessfully. Please try again.")
			end
		end
	end

	backButton:SetSize(150, 30)
	backButton:SetText("Back to Profile Select")
	backButton:CenterX()
	backButton:SetY( (createProfileFrame:GetHeight()/2-150/2+300) )
	backButton.OnClick = function(object)
		gamestate = "profileSelect"
		loveframes.SetState("profileSelect")

		if prefs.sfx then
			buttonClick:play()
		else
			-- pass
		end
	end

	profileNameTextbox:Center()
	profileNameTextbox:SetSize( (createProfileFrame:GetWidth()/2-50/2), 25 )
	profileNameTextbox:SetPos( (createProfileFrame:GetWidth()/2-profileNameTextbox:GetWidth()/2), (createProfileFrame:GetHeight()/2-profileNameTextbox:GetHeight()/2) )

	profileNameHeader:SetText("PROFILE NAME")
	profileNameHeader:SetShadow(true)
	profileNameHeader:SetFont(font40)
	profileNameHeader:SetShadowColor( { 154, 154, 154 } )
	profileNameHeader:CenterX()
	profileNameHeader:SetY( createProfileFrame:GetHeight()/2-font40:getHeight("PROFILE NAME")-50 )
end

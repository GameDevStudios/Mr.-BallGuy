function savePrefs(sfxList)
	if not lf.isDirectory("prefs.lua") then 
		lf.mkdir("prefs.lua")
	end

	local prefsFile = lf.newFile("prefs/prefs.lua")

	prefsFile:open("w")

	prefsFile:write("prefs.music = " .. tostring(prefs.music) .. "\n")
	prefsFile:write("prefs.sfx = " .. tostring(prefs.sfx) .. "\n")
	prefsFile:write("bgm:setVolume(" .. tostring(bgm:getVolume()) .. ")\n")
	prefsFile:write("buttonClick:setVolume(" .. tostring(buttonClick:getVolume()) .. ")\n") -- This could be any sound effect. This might not be the best practice, but it's the only way I could figure out how to do it. If you know of a better way please suggest it.
end

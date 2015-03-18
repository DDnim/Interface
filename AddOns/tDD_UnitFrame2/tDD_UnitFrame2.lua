local addon,ns = ...

local FrameList={
"tPlayerFrame",
"tTargetFrame",
"tFocusFrame",
"tPetFrame",
"tTotFrame"
}

local BanList={
"player",
"target",
"focus",
"boss"
}
local c = CreateFrame( "frame", nil,UIParent);
c:RegisterEvent("PLAYER_LOGIN")
c:SetScript('OnEvent',
	function()
		for i,value in pairs(BanList) do
			ns.DisableBlizzard(value)
		end
	end
		)

for i,value in pairs(FrameList) do
	_G[value]:RegisterForDrag()
end

local toggle = false
local function MouseToggle()
	if toggle then
		for i,value in pairs(FrameList) do
			_G[value]:RegisterForDrag()
		end
		for i=1,5 do
		RegisterStateDriver(_G["tBossFrame"..i], "visibility", "[@boss"..i..",exists] show; hide")
		end
		print("Locked")
	else
		for i,value in pairs(FrameList) do
			_G[value]:RegisterForDrag("LeftButton","RightButton","MiddleButton")
		end
		for i=1,5 do
		--_G["tBossFrame"..i]:Show()
		RegisterStateDriver(_G["tBossFrame"..i], "visibility", "[@boss"..i..",exists] show; show")
		end
		print("Unlocked")
	end
	toggle = not toggle
end

SLASH_TUF1 = "/tuf"
SlashCmdList["TUF"] = MouseToggle
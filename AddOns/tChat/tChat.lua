addon,ns = ...
BINDING_HEADER_WOWLUA = "tChat"
BINDING_NAME_TOGGLE_TCHAT = "tChat Switch"

ns.tChat = {}
local tChat = ns.tChat

local tChatPanel = CreateFrame("BUTTON",nil)

ns.tChatPanel = tChatPanel

local c = 51
tChat.c = c 


tChatPanel:SetScript("OnKeyDown",function(self,button)
	if button == "R" then
		tChatPanel:EnableKeyboard(false)
		tChatTip:Hide()
	end
	if button == "ESC" then
		tChatPanel:EnableKeyboard(false)
		tChatTip:Hide()
	end
	if button == "Q" then
		ns.tChatFlag = "GUILD"
		tChatTip:SetText(GUILD.." |Cffffff00Q|R")
		tChatTip:Hide()
		tChatTip:Show()
	end
	if button == "A" then
		ns.tChatFlag = "RAID_WARNING"
		tChatTip:SetText("BG".." |Cffffff00A|R")
		tChatTip:Hide()
		tChatTip:Show()
	end
	if button == "D" then
		ns.tChatFlag = "RAID_WARNING"
		tChatTip:SetText(RAID_WARNING.." |Cffffff00D|R")
		tChatTip:Hide()
		tChatTip:Show()
	end
	if button == "S" then
		ns.tChatFlag = "SAY"
		tChatTip:SetText(SAY.." |Cffffff00S|R")
		tChatTip:Hide()
		tChatTip:Show()
	end
	if button == "W" then
		ns.tChatFlag = "RAID"
		tChatTip:SetText(RAID.." |Cffffff00W|R")
		tChatTip:Hide()
		tChatTip:Show()
	end
	if button == "E" then
		ns.tChatFlag = "PARTY"
		tChatTip:SetText(PARTY.." |Cffffff00E|R")
		tChatTip:Hide()
		tChatTip:Show()
	end
	
	if button == "1" then
		ChatFrame1Tab:Click()
	end
	
	if button == "2" then
		ChatFrame2Tab:Click()
	end
		
	if button == "3" then
		ChatFrame3Tab:Click()
	end
	
	if button == "4" then
		ChatFrame4Tab:Click()
	end
	
	
	--	ns.tChatFlag = false
	-- for _ = 1, NUM_CHAT_WINDOWS do
		-- if _G["ChatFrame".._.."EditBox"]:IsVisible() then
			-- ns.tChatPanel:EnableKeyboard(false)
		-- end
	-- end
end
)
---------------------------------------------
local dheight
local function tChat(self,button)
   local i = ChatFrame1:GetScale()
   local j,k = ChatFrame1:GetSize()
   
   if button == "LeftButton" then
      if k < 800 then
         ChatFrame1:SetSize(j,k+14 * 10)
      end
   elseif button == "RightButton" then
      ChatFrame1:SetSize(j,dheight)
   end
end

--for _ = 1, NUM_CHAT_WINDOWS do
	_ = 1;
   local tChatMask = CreateFrame( "Button", nil, _G["ChatFrame".._]);
   tChatMask:SetFrameStrata("DIALOG")
   tChatMask:SetAllPoints(_G["ChatFrame".._]);
   dheight = _G["ChatFrame".._]:GetHeight()
   tChatMask:SetScript("OnMouseDown",tChat)
   
   tChatMask:SetParent(UIParent)
   ns.tChatMask = tChatMask
--end
---------------------------------------------

local tChatTipFrame = CreateFrame("Frame",nil)
tChatTipFrame:SetPoint("LEFT",ChatFrame1EditBox,"LEFT")
tChatTipFrame:SetHeight(32)
tChatTipFrame:SetWidth(32)
tChatTip = tChatTipFrame:CreateFontString(nil, "OVERLAY")
tChatTip:SetPoint('LEFT')
tChatTip:SetFont(UNIT_NAME_FONT, 11, "OUTLINE")
ns.tChatTip = tChatTip

tChatMask:EnableMouse(false)
tChatPanel:EnableKeyboard(false)
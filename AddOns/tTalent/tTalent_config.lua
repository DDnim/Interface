local addon, ns = ...


local function config(panel)

local slidertable = {}
for i = 1 ,5 do
	slidertable[i] = CreateFrame("Slider", "MySlider"..i, panel, "OptionsSliderTemplate")
	local slider = slidertable[i]
	slider:SetPoint("TOPLEFT",0,-50*i)
	slider:SetMinMaxValues(0, ns.MODEL_NUM_MAX)
	slider:SetValueStep(1)
	
	slider:SetValue(tTalent_DB["f"..i])
	slider:SetStepsPerPage(1)
	slider.text = _G[slider:GetName() .. "Text"]
	_G[slider:GetName() .. "Low"]:Hide()
	slider.high = _G[slider:GetName() .. "High"]

	slider.text:SetText("Effect"..i)
	slider.high:SetText(tTalent_DB["f"..i])


	slider:SetScript("OnValueChanged", function(self, value)
		value = math.ceil (value)
		slider.high:SetText(value)
		
		ns.modeltable[value](ns["f"..i])
		_G.tTalent_DB["f"..i] = value
	end)
end
	-- local Refresh;
-- function Refresh()
	-- if not frame:IsVisible() then return end
	-- local file, height, flags = WowLuaMonoFont:GetFont()
	-- slider:SetValue(height)
-- end

-- frame:SetScript("OnShow", Refresh) 
-- Refresh()


end
ns.config = config
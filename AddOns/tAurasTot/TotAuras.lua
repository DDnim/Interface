function tTotDebuff_update(frame,unit,filter)
   for i=1,6 do
		local buff =_G["tAruas"..unit..filter..i] or CreateFrame("Frame", "tAruas"..unit..filter..i,frame,"tAuraFrameTemplate");
		local BUTTON_SIZE = buff:GetWidth()

		buff.id = i
		buff.filter = filter
		buff.unit = unit
		buff:SetID()
		buff:SetPoint("TOPLEFT",BUTTON_SIZE*((i-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),-BUTTON_SIZE*math.floor((i-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
	end
end
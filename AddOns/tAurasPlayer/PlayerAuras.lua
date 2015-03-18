local BUTTON_SIZE = 32
function tPlayerBuffFrame_Onload(self)
	self:RegisterForDrag("LeftButton","RightButton","MiddleButton")
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	self:SetMinResize(80, 80)
	self:SetFrameStrata("HIGH")
	self:SetFrameLevel(4)
	
	
end

function tPlayerBuffFrame_update()
	ConsolidatedBuffs:ClearAllPoints()
	ConsolidatedBuffs:SetPoint("TOPRIGHT",tPlayerBuffFrame,"TOPLEFT")
	ConsolidatedBuffs:Show()
	ConsolidatedBuffs_OnUpdate(ConsolidatedBuffs)
	RaidBuffTray_Update()
	local j,k = 0
	local i = 1
	while i < 32 do

	   local frame = tPlayerBuffFrame
	   local unit = 'player'
	   local filter = 'HELPFUL'
		local buff
		k = 0
	   local name, _, texture, count, _, duration, expirationTime, unitCaster, _, shouldConsolidate, spellId = UnitAura(unit, i, filter);
	   while shouldConsolidate do
			if _G["tAuras"..unit..filter..i] then
				_G["tAuras"..unit..filter..i]:Hide()
			end
			j = j + 1
			i = i + 1
			k = k + 1
			name, _, texture, count, _, duration, expirationTime, unitCaster, _, shouldConsolidate, spellId = UnitAura(unit, i, filter);
	   end
	   buff =_G["tAuras"..unit..filter..i] or CreateFrame("Button", "tAuras"..unit..filter..i,frame,"tBuffButtonTemplate"); --AuraButtonTemplate
	   local cooldown = _G["tAurasCooldown"..unit..filter..i] or  CreateFrame("Cooldown","tAurasCooldown"..unit..filter..i,buff,"CooldownFrameTemplate")
	   if name == nil then
		  buff:Hide()
		  return 
	   end
	   
	   if i > 1 then
			if _G["tAuras"..unit..filter..(i-k-1)] then
				buff:SetParent(_G["tAuras"..unit..filter..(i-k-1)])	
			else
				buff:SetParent(frame)	
			end
	   end
	   
	   
	   
	   
	   
	   if (unitCaster ~= 'player') 
			and (unitCaster ~= 'target') 
			and (unitCaster ~= 'pet') 
			and (unitCaster ~= 'boss1') 
			and (unitCaster ~= 'boss2') 
			and (unitCaster ~= 'boss3') 
			and (unitCaster ~= 'boss4') 
			and (unitCaster ~= 'boss5') 
			then
			buff:Hide()
			return 0
		end
		buff:Show()

	   buff.exitTime = nil;
	   buff.consolidated = nil;
	   buff.filter = filter
	   buff.unit= unit


	   buff:SetPoint("TOPLEFT",tPlayerBuffFrame,"TOPLEFT",BUTTON_SIZE*((i-j-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),-BUTTON_SIZE*math.floor((i-j-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
	   --print(((BUTTON_SIZE*(i-1)%frame:GetWidth())-(BUTTON_SIZE*(i-1)%frame:GetWidth())%BUTTON_SIZE))

	   buff:SetSize(BUTTON_SIZE,BUTTON_SIZE)
	   buff:SetID(i)
	   buff:SetAlpha(1)
	   buff:Show()
	   buff.duration:Show()
	   
	   buff:SetScript('OnUpdate',function()
	   if ( GameTooltip:IsOwned(buff) ) then
					if filter =='helpful' then
						GameTooltip:SetUnitBuff(self.unit,self:GetID(i),filter);
						else
						GameTooltip:SetUnitDebuff(buff.unit,buff:GetID(i),filter);
					end
	   end
	end)
	   
	   local icon = _G["tAuras"..unit..filter..i.."Icon"];
	   icon:SetTexture(texture);
	   
	   if ( count > 1 ) then
		  buff.count:SetText(count);
		  buff.count:Show();
	   else
		  buff.count:Hide();
	   end
	   
	   cooldown:SetAllPoints(buff)
	   
	   cooldown:SetAlpha(0.8)
	   cooldown:SetFrameLevel(6)
	   cooldown:SetReverse(1)
	   
	   cooldown:SetFrameStrata("HIGH")
	   cooldown:Show()
	   CooldownFrame_SetTimer(cooldown,expirationTime - duration, duration, 1);
	   i = i + 1
   end
   
end

function tAurasDebuff(frame,unit,filter)
   for i=1,16 do
		local buff =_G["tAruas"..unit..filter..i] or CreateFrame("Frame", "tAruas"..unit..filter..i,frame,"tAuraFrameTemplate");
		local BUTTON_SIZE = buff:GetWidth()

		buff.id = i
		buff.filter = filter
		buff.unit = unit
		buff:SetID()
		buff:SetPoint("BOTTOMLEFT",BUTTON_SIZE*((i-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),BUTTON_SIZE*math.floor((i-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
	end
end
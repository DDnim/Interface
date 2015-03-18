local name, _, texture, count, _, duration, expirationTime, unitCaster, _, shouldConsolidate, spellId

local callcount = 1
local function memory_count()
	callcount = callcount + 1
	if callcount > 50000 then
		collectgarbage("collect")
		callcount = 1
	end
end

function tAurasExtra_Onload(self)
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")

	self:SetMinResize(80, 80)
	self:SetFrameStrata("HIGH")
	self:SetFrameLevel(4)
end

tSetIdExtra = function(self)
	memory_count()
	if self.unit and self.unit == 'cooldown' then
		if GetSpellCharges(self.filter) then
			count,_,expirationTime,duration = GetSpellCharges(self.filter)
		else
			expirationTime,duration = GetSpellCooldown(self.filter)
			count = 0
		end
		
		if not expirationTime then
			self:Hide()
			return 0
		end
		texture = select(3,GetSpellInfo(self.filter)) 
		expirationTime = expirationTime + duration
		unitCaster = 'player'
	elseif self.unit and self.unit == 'totem' then
		_ , name, expirationTime, duration, texture = GetTotemInfo(self.filter)
		if not _ then
			self:Hide()
			return 0
		end
		count = 0
		expirationTime = expirationTime + duration
		unitCaster = 'player'
		
	else
		name, _, texture, count, _, duration, expirationTime, unitCaster, _, shouldConsolidate, spellId = UnitAura(self.unit, self.id, self.filter);
	end
	
	
	
	
	if name == nil then
		self:Hide()
		return 0
	end

	-- if (((unitCaster ~= 'player') 
		-- and (unitCaster ~= 'target') 
		-- and (unitCaster ~= 'pet') 
		-- and (unitCaster ~= 'boss1') 
		-- and (unitCaster ~= 'boss2') 
		-- and (unitCaster ~= 'boss3') 
		-- and (unitCaster ~= 'boss4') 
		-- and (unitCaster ~= 'boss5'))
		-- and (self.unit:sub(1,4) ~= "boss" or self.filter ~="HELPFUL"))
		-- and (self.unit ~= "player" or self.filter ~="HARMFUL")
		
		-- then
		-- self:Hide()
		-- return 0
	-- end
	self:Show()

	self.icon:SetTexture(texture)
	--self.icon:SetTexCoord(0.07,0.93,0.07,0.93)

	if count > 0 then
		self.count:SetText(count)
		self.count:Show()
	else
		self.count:Hide()
	end
	 
	
	self.cooldown:SetAllPoints(self)


	self.cooldown:SetAlpha(0.8)

	self.cooldown:SetFrameStrata("HIGH")

	self.cooldown:SetReverse(1)
	self.cooldown:Show()
	self.cooldown:SetFrameLevel(self:GetFrameLevel()+1)
	CooldownFrame_SetTimer(self.cooldown,expirationTime - duration, duration, 1);
	 
end



tdbmsearch = function(str)
	for b in DBM.Bars:GetBarIterator() do
		name = _G[b.frame:GetName().."BarName"]:GetText()
		if strfind(name,str) then return b end
	end
	return false
end

tSetDBM = function(self)
	memory_count()
	
	b = tdbmsearch(self.filter)
	if not b then
		self:Hide()
		return 0
	end
	
	texture = _G[b.frame:GetName().."BarIcon1"]:GetTexture()
	name = _G[b.frame:GetName().."BarName"]:GetText()
	self.expirationTime = b.lastUpdate - (b.totalTime - b.timer)
	self.duration = b.totalTime
	
	self:Show()
	
	self.cooldown:SetAllPoints(self)
	if IsAddOnLoaded("OmniCC") then
	self.cooldown:SetAlpha(0.8)
	else
	self.cooldown:SetAlpha(0.8)
	end
	self.cooldown:SetFrameStrata("HIGH")
	self.cooldown:Show()
	
	self.cooldown:SetFrameLevel(self:GetFrameLevel()+1)

	CooldownFrame_SetTimer(self.cooldown,self.expirationTime, self.duration, 1);

	self.icon:SetTexture(texture)
	
	self.count:SetText(name)
	self.count:Show()
end

local AuraSearch = function(unit,filter,flag,flaginfo,request)
	local c
	for i=1,40 do
		c = select(flag,UnitAura(unit, i, filter))
		if c == flaginfo then
			if request ~= -1 then
				return i,select(request,UnitAura(unit, i, filter))
			else
				return i,nil
			end
		elseif c == nil then
			break
		end
	end
	return nil,nil
end


function tExtra_update(frame,tEx_Buffers)
	local buff

	for num,buffer in ipairs(tEx_Buffers) do
		if buffer[2] == 'cooldown' or buffer[2] == 'totem' then
			buff =_G["tExtra"..buffer[1]] or CreateFrame("Frame", "tExtra"..buffer[1],frame,"tAuraExtraTemplate");
			BUTTON_SIZE = 48
			buff:SetSize(48,48)
			
			buff.unit = buffer[2]
			buff.filter = buffer[3]

			buff:SetID()
			buff:SetPoint("TOPLEFT",BUTTON_SIZE*((num-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),-BUTTON_SIZE*math.floor((num-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
		elseif buffer[2] == 'dbm' then
			buff =_G["tExtraDBM"..buffer[1]] or CreateFrame("Frame", "tExtraDBM"..buffer[1],frame,"tAuraDBMTemplate");
			BUTTON_SIZE = 48
			buff:SetSize(48,48)
			
			
			buff.unit = buffer[2]
			buff.filter = buffer[3]

			buff:SetID()
			buff:SetPoint("TOPLEFT",BUTTON_SIZE*((num-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),-BUTTON_SIZE*math.floor((num-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
		else
			buff =_G["tExtra"..buffer[1]] or CreateFrame("Frame", "tExtra"..buffer[1],frame,"tAuraExtraTemplate");
			BUTTON_SIZE = 48
			buff:SetSize(48,48)
			
			buff.unit = buffer[2]
			buff.filter = buffer[3]

			buff.id,request = AuraSearch(buff.unit,buff.filter,buffer[4],buffer[5],buffer[6])
			if buff.id then		
				buff:SetID()
				if request then
					_G["tExtra"..buffer[1].."Count"]:SetText(request)
					_G["tExtra"..buffer[1].."Count"]:Show()
					_G["tExtra"..buffer[1].."Icon"]:SetVertexColor(1-request/200,1-request/200,1-request/200,1)
				end
				buff:SetPoint("TOPLEFT",BUTTON_SIZE*((num-1)%(math.floor(frame:GetWidth()/BUTTON_SIZE))),-BUTTON_SIZE*math.floor((num-1)/(math.floor(frame:GetWidth()/BUTTON_SIZE))))
			elseif _G["tExtra"..buffer[1]] then
				_G["tExtra"..buffer[1]]:Hide()
			end
		end
	end

	buff = nil
end






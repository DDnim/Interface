local callcount = 1
local function memory_count()
	callcount = callcount + 1
	if callcount > 50000 then
		collectgarbage("collect")
		callcount = 1
	end
end

tSetId = function(self)
	memory_count()
	local name, _, texture, count, _, duration, expirationTime, unitCaster, _, shouldConsolidate, spellId = UnitAura(self.unit, self.id, self.filter);
	
	if spellId == 173321 then
	print(unitCaster)
	end
	
	
	if name == nil then
		self:Hide()
		return 0
	end

	if (((unitCaster ~= 'player') 
		and (unitCaster ~= 'target') 
		and (unitCaster ~= 'pet') 
		and (unitCaster ~= 'boss1') 
		and (unitCaster ~= 'boss2') 
		and (unitCaster ~= 'boss3') 
		and (unitCaster ~= 'boss4') 
		and (unitCaster ~= 'boss5'))
		and (self.unit:sub(1,4) ~= "boss" or self.filter ~="HELPFUL"))
		and (self.unit ~= "player" or self.filter ~="HARMFUL")

		
		then
		self:Hide()
		return 0
	end
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


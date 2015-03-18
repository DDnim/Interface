tExtraConfig = function()
	local Class = select(1,UnitClass("player"))
	local SpecName = GetSpecialization() and select(2, GetSpecializationInfo(GetSpecialization())) or "None"

	if Class == '德魯伊' and SpecName == '守護者' then
		tExtraBuffer1 = {
				[1] = {'juexin','player','HELPFUL',1,'決心',15},
				[2] = {'shupibuff','player','HELPFUL',1,'樹皮術',15},
				[3] = {'qiushengbuff','player','HELPFUL',1,'求生本能',15},
				[4] = {'zhencibuff','player','HELPFUL',1,'針刺毛皮',15},
				[5] = {'fensuibuff','player','HELPFUL',1,'粉碎',15},
				[6] = {'xiongmanbuff','player','HELPFUL',1,'兇蠻防禦',15}
			};
		tExtraBuffer2 = {
				[1] = {'naisaliao','cooldown','塞納里奧結界'},
				[2] = {'shupi','cooldown','樹皮術'},
				[3] = {'qiusheng','cooldown','求生本能'},
				[4] = {'zhenci','cooldown','針刺毛皮'},
				[5] = {'lichibuff','player','HELPFUL',1,'銳齒利爪',-1},
			};	
	end
	
	if Class == '聖騎士' and SpecName == '防護' then
		tExtraBuffer1 = {
				[1] = {'juexin','player','HELPFUL',1,'決心',15},
				[2] = {'shengyoubuff','player','HELPFUL',1,'聖佑術',-1},
				[3] = {'zhongchengbuff','player','HELPFUL',1,'忠誠防衛者',15},
				[4] = {'zhuwangbuff','player','HELPFUL',1,'遠古諸王守護者',15},
				[5] = {'congshengbuff','player','HELPFUL',1,'崇聖護盾',-1},
				[6] = {'gongzhengbuff','player','HELPFUL',1,'公正之盾',-1}
			};
		tExtraBuffer2 = {
				[1] = {'sixing','cooldown','死刑宣判'},
				[4] = {'yuanguzhuwang','cooldown','遠古諸王守護者'},
				[3] = {'zhongcheng','cooldown','忠誠防衛者'},
				[2] = {'shengyoushu','cooldown','聖佑術'},
				[5] = {"chunjie",'cooldown','純淨聖禦'},
				[6] = {"shenshengfuchou",'cooldown','神聖復仇者'}
			};	
	end
	
	if UnitGroupRolesAssigned('player') == 'TANK' then
	
	
	tExtraBuffer3 = {
				[1] = {'kajiasi','dbm','刺穿','卡加斯'},
				[2] = {'tufu','dbm','拍肉錘','屠夫'},
				[3] = {'baozi','dbm','亡域吐息','孢子'},
				[4] = {'shuangzi','dbm','旋風斬','雙子'},
				[5] = {'koulafu','dbm','釋放法能：暗影','寇拉夫'},
				[6] = {'yuanshou','dbm','混沌印記','元首'},
				[7] = {'kuangtun','dbm','酸液洪流','礦吞'},
				[8] = {'zhican','dbm','致殘摔','雙子'},
				[9] = {'zhanzhang','dbm','火焰燒燃','站長'},
				[10] = {'konghuo','dbm','焦灼之息','控火'},
				[11] = {'dashan','dbm','猛擊','大山'},
				[12] = {'tieniangzi','dbm','血之祭','鐵寡婦'},
				[13] = {'heishou1','dbm','粉碎潰擊','黑手'},
				[14] = {'heishou2','dbm','熔渣彈','黑手'}	
			};	
	end

			
	if Class == '德魯伊' and SpecName == '恢復' then
		tExtraBuffer1 = {
				[1] = {"juexin",'player','HELPFUL',1,'共生',15},
				[2] = {"fensui",'player','HELPFUL',1,'森林之魂',-1},
				[3] = {"saina",'player','HELPFUL',1,'化身:生命之樹',15},
				[4] = {"saina2",'cooldown','迅癒',1,'化身:生命之樹',15},
				[5] = {"saina3",'cooldown','野性痊癒',1,'化身:生命之樹',15},
				[6] = {"saina4",'dbm','斬擊',1,'化身:生命之樹',15},
				[7] = {"saina5",'dbm','灼流',1,'化身:生命之樹',15}
			};
		tExtraBuffer2 = {
				[1] = {"xiongmanfangyu",'player','HELPFUL',1,'節能施法',15},
				[2] = {"qiushengbenneng",'cooldown','自然迅捷',1,'未來諭示',-1},
				[3] = {"shupishu",'player','HELPFUL',1,'自然迅捷',-1},
				[4] = {"mogu",'totem',1,1,'自然迅捷',-1}
			};	
	end
	
	if Class == '術士' and SpecName == '惡魔學識' then
		tExtraBuffer2 = {
				[1] = {"emohuashen",'cooldown','惡魔化身',1,'未來諭示',-1},
				[4] = {"shupishu",'player','HELPFUL',1,'熔火之心',-1},
				[2] = {"heianzhihun",'cooldown','黑闇之魂:知識',1,'未來諭示',-1},
				[3] = {"qiushengbenneng",'cooldown','古爾丹之手',1,'未來諭示',-1},
				[5] = {"saina",'cooldown','魔典:惡魔守衛',1,'化身:生命之樹',15},
				[6] = {"erdage",'cooldown','魔典：末日守衛',1,'節能施法',15},
				[7] = {"xiongmanfangyu",'cooldown','災變',1,'節能施法',15}
				
			};
		tExtraBuffer1 = {
				[2] = {"juexin",'player','HELPFUL',1,'黑闇之魂:知識',15},
				[1] = {"fensui",'player','HELPFUL',1,'惡魔呼喚',-1},
				[3] = {"dafashi",'player','HELPFUL',1,'大法師的熾熱白光',-1},
				[4] = {"wuqifumo",'player','HELPFUL',1,'血之谷印記',-1},
				[5] = {"shipin1",'player','HELPFUL',1,'嚎叫之魂',-1},
				[6] = {"erdage",'dbm','準備',1,'節能施法',15}
			};	
	end
	
	if Class == '術士' and SpecName == '痛苦' then
		tExtraBuffer1 = {
				[1] = {"xiongmanfangyu",'cooldown','災變',1,'節能施法',15},
				[2] = {"fensui",'player','HELPFUL',1,'冤魂兇靈',-1},
				[3] = {"saina",'cooldown','魔典:惡魔守衛',1,'化身:生命之樹',15},
				[4] = {"erdage",'cooldown','魔典：末日守衛',1,'節能施法',15},
				[5] = {"erdage",'dbm','準備',1,'節能施法',15}
			};
		tExtraBuffer2 = {
				[1] = {"juexin",'player','HELPFUL',1,'黑闇之魂:悲慘',15},
				[2] = {"heianzhihun",'cooldown','黑闇之魂:悲慘',1,'未來諭示',-1},
				[3] = {"shupishu",'player','HELPFUL',1,'熔火之心',-1},
				[4] = {"qiushengbenneng",'cooldown','古爾丹之手',1,'未來諭示',-1}
			};	
	end



end


local c = CreateFrame('frame',nil)
c:RegisterEvent("PLAYER_ENTERING_WORLD")
c:RegisterEvent("PLAYER_TALENT_UPDATE")
c:SetScript('OnEvent',tExtraConfig)
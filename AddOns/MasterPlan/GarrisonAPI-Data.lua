local _, T = ...
if T.Mark ~= 23 then return end

T.Affinities = {} do
	local ht, hp = [[�:�'00Ǹj�ЭC1 ��G9u���&|c�{���ܕw������{O`=�\1���?g����-sD�$sJ����>aOw�_Uw �r=�s���M��2s�#H4\?�7b���t��]g�p�JtWcP��UR%:��R�4k��9��(�+^% F��:���j�t��"�O����'ҟ��,�ӭHO�@�y ��#��tL�E!�#��E�$\��/B�B�c��\�'�_��#�K���J�P�y)�M�rNO�nzS�P�?�8�d�5s��;�;�5��"� �\fϡk"���rg�D�c��%�_��}�D��|�!��"ߣ��_5��"h�����+�^�E�$��ǜ��/�"6A��s��"s�<��E�I�g��AG�$O���;��%>�?�����J�%��d^�GBt��M>�/�w��.dVs��X�ЏM�QsG��1��sȉ�h�E�$	��sQ��D��Z!�r��O�Oz%A1�`ǵ��VE�sdc��[�y��Y����%$qrI/��t�o'��$���H�1�����O��R����C�����'������]], [[((�h��inp(qj�krgolms]]
	local p, G, V, Vp, by, hk, ak = {}, 79, 673, 159, ht.byte, UnitFactionGroup('player') == 'Horde' and 12131 or 53327, 47122
	for i=1,#hp do p[i] = by(hp, i) p[i] = p[i] + (p[i] > 128 and 80 or -40) end
	setmetatable(T.Affinities, {__index=function(t, k)
		local k, c, a, v, r, b, d, e = k or false, k, type(k)
		if a == "string" then
			a, c = "number", tonumber(k:match("^0x0*(%x*)$") or "z", 16) or false
		end
		if a == "number" and c then
			c = c * hk
			a = 2*(((c * ak) % 2147483629) % G)
			a, b = by(ht, a+1, a+2)
			v = ((c * (a*256+b) + ak) % 2147483629) % V
			v, r = Vp + (v - v % 8)*5/8, v % 8
			a, b, c, d, e = by(ht, v, v + 4)
			v = a * 4294967296 + b * 16777216 + c * 65536 + d * 256 + e
			v = ((v - v % 32^r) / 32^r % 32)
		end
		t[k] = p[v] or 0
		return t[k]
	end})
end

T.MissionExpire = {} do
	local expire = T.MissionExpire
	for n, r in ("000210611621id2e56516c16o17i0:0ga6b:0o2103rz4rz5r86136716e26q37ji9549eja23ai0am1aq4ax0b40cq0dcedx1:102zd3h86vm82maj2ao1av1ay5b51bicc0dczcdr1dz0:1y9a39y3dt3:20050100190cr7:9b8pfb7abv3ceb"):gmatch("(%w%w)(%w+)") do
		local n = tonumber(n, 36)
		for s, l in r:gmatch("(%w%w)(%w)") do
			local s = tonumber(s, 36)
			for i=s, s+tonumber(l, 36) do
				expire[i] = n
			end
		end
	end
end

T.EnvironmentCounters = {[11]=4, [12]=38, [13]=42, [14]=43, [15]=37, [16]=36, [17]=40, [18]=41, [19]=42, [20]=39, [21]=7, [22]=9, [23]=8, [24]=45, [25]=46, [26]=44, [27]=47, [28]=48, [29]=49, [60]=54, [61]=55, [62]=56, [63]=57, [67]=58, [64]=59, [65]=60, [66]=61,}

T.SpecCounters = { nil, {1,2,7,8,10}, {1,4,7,8,10}, {1,2,7,8,10}, {6,7,9,10}, nil, {1,2,6,10}, {1,2,6,9}, {3,4,7,9}, {1,6,7,9,10}, nil, {6,7,8,9,10}, {2,6,7,9,10}, {6,8,9,10}, {6,7,8,9,10}, {2,7,8,9,10}, {1,2,3,6,9}, {3,4,6,8}, {1,6,8,9,10}, {3,4,8,9}, {1,2,4,8,9}, {2,7,8,9,10}, {3,4,6,9}, {3,4,6,7}, {4,6,7,9,10}, {2,6,8,9,10}, {6,7,8,9,10}, {2,6,7,8,9}, {3,7,8,9,10}, {3,6,7,9,10}, {3,4,7,8}, {4,7,8,9,10}, {2,7,8,10,10}, {3,8,9,10,10}, {1,6,7,8,10}, nil, {2,6,7,8,10}, {1,2,6,7,8} }
T.SpecIcons = {nil, 135770, 135773, 135775, 136096, nil, 132115, 132276, 136041, 461112, nil, 236179, 461113, 135932, 135810, 135846, 608951, 608952, 608953, 135920, 236264, 135873, 135940, 237542, 136207, 132292, 132090, 132320, 136048, 237581, 136052, 136145, 136172, 136186, 132355, nil, 132347, 132341}

T.EquivTrait = {[244]=4, [250]=221, [202]=48}

T.AlwaysTraits = {__index={[221]=1, [201]=1, [202]=1, [47]=1}}

T.XPMissions = {[5]=1, [173]=1, [215]=1, [336]=1, [364]=1,}

T.FOLLOWER_ITEM_LEVEL_CAP = 675
T.MENTOR_FOLLOWER = ("0x%016X"):format(465)

T.MissionLocationBanners = { [101]="GarrMissionLocation-FrostfireRidge", [102]="GarrMissionLocation-TannanJungle", [103]="GarrMissionLocation-Gorgrond", [104]="GarrMissionLocation-Nagrand", [105]="GarrMissionLocation-Talador", [106]="GarrMissionLocation-ShadowmoonValley", [107]="GarrMissionLocation-SpiresofArak", [164]="_GarrMissionLocation-BlackrockMountain", }

T.MissionRewardSets = {
	[118529]={
		{118531,15,9285,9289,9294,9300,9304,9311,9315},
		{118531,15,9284,9288,9293,9298,9303,9310,9314},
		{118530,15,9282,9287,9292,9297,9302,9308,9313},
	},
	[122484]={
		{122486,21,9319,9323,9329,9333,9338,9342,9357,9361,9365},
		{122486,8,9289,9294,9300,9304,9311,9315},
		{122486,21,9318,9322,9328,9332,9337,9341,9356,9360,9364},
		{122485,21,9317,9321,9327,9331,9336,9340,9355,9359,9363},
	},
}

T.MissionCoalescing = {
	[118529]={4,8,12},
	[122484]={-19,4,8},
}
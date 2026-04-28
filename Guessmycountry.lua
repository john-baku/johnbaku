local TweenService = game:GetService("TweenService")

----------------------------------------------------
-- COUNTRIES
----------------------------------------------------
local countries = {
  "AFGHANISTAN", "ALBANIA", "ALGERIA", "ANDORRA", "ANGOLA",
  "ANTIGUA AND BARBUDA","ANTIGUA", "ARGENTINA", "ARMENIA", "AUSTRALIA", "AUSTRIA",
  "AZERBAIJAN", "BAHAMAS", "BAHRAIN", "BANGLADESH", "BARBADOS",
  "BELARUS", "BELGIUM", "BELIZE", "BENIN", "BHUTAN",
  "BOLIVIA", "BOSNIA AND HERZEGOVINA","BOSNIA", "BOTSWANA", "BRAZIL", "BRUNEI",
  "BULGARIA", "BURKINA FASO", "BURUNDI", "CAMBODIA", "CAMEROON",
  "CANADA", "CAPE VERDE", "CENTRAL AFRICAN REPUBLIC", "CHAD", "CHILE",
  "CHINA", "COLOMBIA", "COMOROS", "CONGO", "COSTA RICA",
  "CROATIA", "CUBA", "CYPRUS", "CZECH REPUBLIC", "COTE D IVOIRE", "CABO VERDE",
  "DEMOCRATIC REPUBLIC OF THE CONGO", "DENMARK", "DJIBOUTI", "DOMINICA", "DOMINICAN REPUBLIC",
  "EAST TIMOR", "ECUADOR", "EGYPT", "EL SALVADOR", "EQUATORIAL GUINEA",
  "ERITREA", "ESTONIA","ESWATINI", "ETHIOPIA", "FIJI", "FINLAND",
  "FRANCE", "GABON", "GAMBIA", "GEORGIA", "GERMANY",
  "GHANA", "GREECE", "GRENADA", "GUATEMALA", "GUINEA",
  "GUINEA-BISSAU", "GUYANA", "HAITI", "HONDURAS", "HUNGARY",
  "ICELAND", "INDIA", "INDONESIA", "IRAN", "IRAQ",
  "IRELAND", "ISRAEL", "ITALY", "JAMAICA", "JAPAN",
  "JORDAN", "KAZAKHSTAN", "KENYA", "KIRIBATI", "KOSOVO",
  "KUWAIT", "KYRGYZSTAN", "LAOS", "LATVIA", "LEBANON",
  "LESOTHO", "LIBERIA", "LIBYA", "LIECHTENSTEIN", "LITHUANIA",
  "LUXEMBOURG", "MADAGASCAR", "MALAWI", "MALAYSIA", "MALDIVES",
  "MALI", "MALTA", "MARSHALL ISLANDS","IVORY COAST", "MAURITANIA", "MAURITIUS",
  "MEXICO", "MICRONESIA", "MOLDOVA", "MONACO", "MONGOLIA",
  "MONTENEGRO", "MOROCCO", "MOZAMBIQUE", "MYANMAR", "NAMIBIA",
  "NAURU", "NEPAL", "NETHERLANDS", "NEW ZEALAND", "NICARAGUA",
  "NIGER", "NIGERIA", "NORTH KOREA", "NORTH MACEDONIA", "NORWAY",
  "OMAN", "PAKISTAN", "PALAU", "PALESTINE", "PANAMA",
  "PAPUA NEW GUINEA", "PARAGUAY", "PERU", "PHILIPPINES", "POLAND",
  "PORTUGAL", "QATAR", "ROMANIA", "RUSSIA", "RWANDA",
  "SAINT KITTS AND NEVIS", "SAINT LUCIA", "SAINT VINCENT AND THE GRENADINES", "SAMOA", "SAN MARINO",
  "SAO TOME AND PRINCIPE", "SAUDI ARABIA", "SENEGAL", "SERBIA", "SEYCHELLES",
  "SIERRA LEONE", "SINGAPORE", "SLOVAKIA", "SLOVENIA", "SOLOMON ISLANDS",
  "SOMALIA", "SOUTH AFRICA", "SOUTH KOREA", "SOUTH SUDAN", "SPAIN",
  "SRI LANKA", "SUDAN", "SURINAME", "SWEDEN", "SWITZERLAND",
  "SYRIA", "TAIWAN", "TAJIKISTAN", "TANZANIA", "THAILAND",
  "TIMOR-LESTE", "TOGO", "TONGA", "TRINIDAD AND TOBAGO", "TUNISIA",
  "TURKEY", "TURKMENISTAN", "TUVALU", "UGANDA", "UKRAINE",
  "UNITED ARAB EMIRATES", "UNITED KINGDOM", "UNITED STATES", "URUGUAY", "UZBEKISTAN",
  "VANUATU", "VATICAN CITY", "VENEZUELA", "VIETNAM", "YEMEN",
  "ZAMBIA", "ZIMBABWE"
}

----------------------------------------------------
-- INFO (HINT SYSTEM)
----------------------------------------------------
local info = {
CAMBODIA={continent="Asia",city="Phnom Penh",flag="🇰🇭"},
CANADA={continent="North America",city="Ottawa",flag="🇨🇦"},
CHINA={continent="Asia",city="Beijing",flag="🇨🇳"},
JAPAN={continent="Asia",city="Tokyo",flag="🇯🇵"},
FRANCE={continent="Europe",city="Paris",flag="🇫🇷"},
GERMANY={continent="Europe",city="Berlin",flag="🇩🇪"},
INDIA={continent="Asia",city="New Delhi",flag="🇮🇳"},
AUSTRALIA={continent="Oceania",city="Canberra",flag="🇦🇺"},
EGYPT={continent="Africa",city="Cairo",flag="🇪🇬"},
BRAZIL={continent="South America",city="Brasília",flag="🇧🇷"},
AFGHANISTAN={continent="Asia",city="Kabul",flag="🇦🇫"},
ALBANIA={continent="Europe",city="Tirana",flag="🇦🇱"},
ALGERIA={continent="Africa",city="Algiers",flag="🇩🇿"},
ANDORRA={continent="Europe",city="Andorra la Vella",flag="🇦🇩"},
ANGOLA={continent="Africa",city="Luanda",flag="🇦🇴"},
ANTIGUAANDBARBUDA={continent="North America",city="Saint John's",flag="🇦🇬"},
ARGENTINA={continent="South America",city="Buenos Aires",flag="🇦🇷"},
ARMENIA={continent="Asia",city="Yerevan",flag="🇦🇲"},
AUSTRIA={continent="Europe",city="Vienna",flag="🇦🇹"},
AZERBAIJAN={continent="Asia",city="Baku",flag="🇦🇿"},
BAHAMAS={continent="North America",city="Nassau",flag="🇧🇸"},
BAHRAIN={continent="Asia",city="Manama",flag="🇧🇭"},
BANGLADESH={continent="Asia",city="Dhaka",flag="🇧🇩"},
BARBADOS={continent="North America",city="Bridgetown",flag="🇧🇧"},
BELARUS={continent="Europe",city="Minsk",flag="🇧/by"},
BELGIUM={continent="Europe",city="Brussels",flag="🇧🇪"},
BELIZE={continent="North America",city="Belmopan",flag="🇧🇿"},
BENIN={continent="Africa",city="Porto-Novo",flag="🇧🇯"},
BHUTAN={continent="Asia",city="Thimphu",flag="🇧🇹"},
BOLIVIA={continent="South America",city="Sucre",flag="🇧🇴"},
BOSNIAANDHERZEGOVINA={continent="Europe",city="Sarajevo",flag="🇧🇦"},
BOTSWANA={continent="Africa",city="Gaborone",flag="🇧🇼"},
BRAZIL={continent="South America",city="Brasília",flag="🇧🇷"},
BRUNEI={continent="Asia",city="Bandar Seri Begawan",flag="🇧🇳"},
BULGARIA={continent="Europe",city="Sofia",flag="🇧🇬"},
BURKINAFASO={continent="Africa",city="Ouagadougou",flag="🇧🇫"},
BURUNDI={continent="Africa",city="Gitega",flag="🇧🇮"},
CAMBODIA={continent="Asia",city="Phnom Penh",flag="🇰🇭"},
CAMEROON={continent="Africa",city="Yaoundé",flag="🇨🇲"},
CANADA={continent="North America",city="Ottawa",flag="🇨🇦"},
CAPEVERDE={continent="Africa",city="Praia",flag="🇨🇻"},
CENTRALAFRICANREPUBLIC={continent="Africa",city="Bangui",flag="🇨🇫"},
CHAD={continent="Africa",city="N'Djamena",flag="🇹🇩"},
CHILE={continent="South America",city="Santiago",flag="🇨🇱"},
CHINA={continent="Asia",city="Beijing",flag="🇨🇳"},
COLOMBIA={continent="South America",city="Bogotá",flag="🇨🇴"},
COMOROS={continent="Africa",city="Moroni",flag="🇰🇲"},
CONGO={continent="Africa",city="Brazzaville",flag="🇨🇬"},
COSTARICA={continent="North America",city="San José",flag="🇨🇷"},
CROATIA={continent="Europe",city="Zagreb",flag="🇭🇷"},
CUBA={continent="North America",city="Havana",flag="🇨🇺"},
CYPRUS={continent="Asia",city="Nicosia",flag="🇨🇾"},
CZECHREPUBLIC={continent="Europe",city="Prague",flag="🇨🇿"},
COTEDIVOIRE={continent="Africa",city="Yamoussoukro",flag="🇨🇮"},
CABOVERDE={continent="Africa",city="Praia",flag="🇨🇻"},
DEMOCRATICREPUBLICOFTHECONGO={continent="Africa",city="Kinshasa",flag="🇨🇩"},
DENMARK={continent="Europe",city="Copenhagen",flag="🇩🇰"},
DJIBOUTI={continent="Africa",city="Djibouti",flag="🇩🇯"},
DOMINICA={continent="North America",city="Roseau",flag="🇩🇲"},
DOMINICANREPUBLIC={continent="North America",city="Santo Domingo",flag="🇩🇴"},
EASTTIMOR={continent="Asia",city="Dili",flag="🇹🇱"},
ECUADOR={continent="South America",city="Quito",flag="🇪🇨"},
EGYPT={continent="Africa",city="Cairo",flag="🇪🇬"},
ELSALVADOR={continent="North America",city="San Salvador",flag="🇸🇻"},
EQUATORIALGUINEA={continent="Africa",city="Malabo",flag="🇬🇶"},
ERITREA={continent="Africa",city="Asmara",flag="🇪🇷"},
ESTONIA={continent="Europe",city="Tallinn",flag="🇪🇪"},
ESWATINI={continent="Africa",city="Lobamba",flag="🇸🇿"},
ETHIOPIA={continent="Africa",city="Addis Ababa",flag="🇪🇹"},
FIJI={continent="Oceania",city="Suva",flag="🇫🇯"},
FINLAND={continent="Europe",city="Helsinki",flag="🇫🇮"},
FRANCE={continent="Europe",city="Paris",flag="🇫🇷"},
GABON={continent="Africa",city="Libreville",flag="🇬🇦"},
GAMBIA={continent="Africa",city="Banjul",flag="🇬🇲"},
GEORGIA={continent="Asia",city="Tbilisi",flag="🇬🇪"},
GERMANY={continent="Europe",city="Berlin",flag="🇩🇪"},
GHANA={continent="Africa",city="Accra",flag="🇬🇭"},
GREECE={continent="Europe",city="Athens",flag="🇬🇷"},
GRENADA={continent="North America",city="St. George's",flag="🇬🇩"},
GUATEMALA={continent="North America",city="Guatemala City",flag="🇬🇹"},
GUINEA={continent="Africa",city="Conakry",flag="🇬🇳"},
GUINEABISSAU={continent="Africa",city="Bissau",flag="🇬🇼"},
GUYANA={continent="South America",city="Georgetown",flag="🇬🇾"},
HAITI={continent="North America",city="Port-au-Prince",flag="🇭🇹"},
HONDURAS={continent="North America",city="Tegucigalpa",flag="🇭🇳"},
HUNGARY={continent="Europe",city="Budapest",flag="🇭🇺"},
ICELAND={continent="Europe",city="Reykjavik",flag="🇮🇸"},
INDIA={continent="Asia",city="New Delhi",flag="🇮🇳"},
INDONESIA={continent="Asia",city="Jakarta",flag="🇮🇩"},
IRAN={continent="Asia",city="Tehran",flag="🇮🇷"},
IRAQ={continent="Asia",city="Baghdad",flag="🇮🇶"},
IRELAND={continent="Europe",city="Dublin",flag="🇮🇪"},
ISRAEL={continent="Asia",city="Jerusalem",flag="🇮🇱"},
ITALY={continent="Europe",city="Rome",flag="🇮🇹"},
IVORYCOAST={continent="Africa",city="Yamoussoukro",flag="🇨🇮"},
JAMAICA={continent="North America",city="Kingston",flag="🇯🇲"},
JAPAN={continent="Asia",city="Tokyo",flag="🇯🇵"},
JORDAN={continent="Asia",city="Amman",flag="🇯🇴"},
KAZAKHSTAN={continent="Asia",city="Astana",flag="🇰🇿"},
KENYA={continent="Africa",city="Nairobi",flag="🇰🇪"},
KIRIBATI={continent="Oceania",city="South Tarawa",flag="🇰🇮"},
KOSOVO={continent="Europe",city="Pristina",flag="🇽🇰"},
KUWAIT={continent="Asia",city="Kuwait City",flag="🇰🇼"},
KYRGYZSTAN={continent="Asia",city="Bishkek",flag="🇰🇬"},
LAOS={continent="Asia",city="Vientiane",flag="🇱🇦"},
LATVIA={continent="Europe",city="Riga",flag="🇱🇻"},
LEBANON={continent="Asia",city="Beirut",flag="🇱🇧"},
LESOTHO={continent="Africa",city="Maseru",flag="🇱🇸"},
LIBERIA={continent="Africa",city="Monrovia",flag="🇱🇷"},
LIBYA={continent="Africa",city="Tripoli",flag="🇱🇾"},
LIECHTENSTEIN={continent="Europe",city="Vaduz",flag="🇱🇮"},
LITHUANIA={continent="Europe",city="Vilnius",flag="🇱🇹"},
LUXEMBOURG={continent="Europe",city="Luxembourg",flag="🇱🇺"},
MADAGASCAR={continent="Africa",city="Antananarivo",flag="🇲🇬"},
MALAWI={continent="Africa",city="Lilongwe",flag="🇲🇼"},
MALAYSIA={continent="Asia",city="Kuala Lumpur",flag="🇲🇾"},
MALDIVES={continent="Asia",city="Malé",flag="🇲🇻"},
MALI={continent="Africa",city="Bamako",flag="🇲🇱"},
MALTA={continent="Europe",city="Valletta",flag="🇲🇹"},
MARSHALLISLANDS={continent="Oceania",city="Majuro",flag="🇲🇭"},
MAURITANIA={continent="Africa",city="Nouakchott",flag="🇲🇷"},
MAURITIUS={continent="Africa",city="Port Louis",flag="🇲🇺"},
MEXICO={continent="North America",city="Mexico City",flag="🇲🇽"},
MICRONESIA={continent="Oceania",city="Palikir",flag="🇫🇲"},
MOLDOVA={continent="Europe",city="Chisinau",flag="🇲🇩"},
MONACO={continent="Europe",city="Monaco",flag="🇲🇨"},
MONGOLIA={continent="Asia",city="Ulaanbaatar",flag="🇲🇳"},
MONTENEGRO={continent="Europe",city="Podgorica",flag="🇲🇪"},
MOROCCO={continent="Africa",city="Rabat",flag="🇲🇦"},
MOZAMBIQUE={continent="Africa",city="Maputo",flag="🇲🇿"},
MYANMAR={continent="Asia",city="Naypyidaw",flag="🇲🇲"},
NAMIBIA={continent="Africa",city="Windhoek",flag="🇳🇦"},
NAURU={continent="Oceania",city="Yaren",flag="🇳🇷"},
NEPAL={continent="Asia",city="Kathmandu",flag="🇳🇵"},
NETHERLANDS={continent="Europe",city="Amsterdam",flag="🇳🇱"},
NEWZEALAND={continent="Oceania",city="Wellington",flag="🇳🇿"},
NICARAGUA={continent="North America",city="Managua",flag="🇳🇮"},
NIGER={continent="Africa",city="Niamey",flag="🇳🇪"},
NIGERIA={continent="Africa",city="Abuja",flag="🇳🇬"},
NORTHKOREA={continent="Asia",city="Pyongyang",flag="🇰🇵"},
NORTHMACEDONIA={continent="Europe",city="Skopje",flag="🇲🇰"},
NORWAY={continent="Europe",city="Oslo",flag="🇳🇴"},
OMAN={continent="Asia",city="Muscat",flag="🇴🇲"},
PAKISTAN={continent="Asia",city="Islamabad",flag="🇵🇰"},
PALAU={continent="Oceania",city="Ngerulmud",flag="🇵🇼"},
PALESTINE={continent="Asia",city="East Jerusalem",flag="🇵🇸"},
PANAMA={continent="North America",city="Panama City",flag="🇵🇦"},
PAPUANEWGUINEA={continent="Oceania",city="Port Moresby",flag="🇵🇬"},
PARAGUAY={continent="South America",city="Asunción",flag="🇵🇾"},
PERU={continent="South America",city="Lima",flag="🇵🇪"},
PHILIPPINES={continent="Asia",city="Manila",flag="🇵🇭"},
POLAND={continent="Europe",city="Warsaw",flag="🇵🇱"},
PORTUGAL={continent="Europe",city="Lisbon",flag="🇵🇹"},
QATAR={continent="Asia",city="Doha",flag="🇶🇦"},
ROMANIA={continent="Europe",city="Bucharest",flag="🇷🇴"},
RUSSIA={continent="Europe/Asia",city="Moscow",flag="🇷🇺"},
RWANDA={continent="Africa",city="Kigali",flag="🇷🇼"},
SAINTKITTSANDNEVIS={continent="North America",city="Basseterre",flag="🇰🇳"},
SAINTLUCIA={continent="North America",city="Castries",flag="🇱🇨"},
SAINTVINCENTANDTHEGRENADINES={continent="North America",city="Kingstown",flag="🇻🇨"},
SAMOA={continent="Oceania",city="Apia",flag="🇼🇸"},
SANMARINO={continent="Europe",city="San Marino",flag="🇸🇲"},
SAOTOMEANDPRINCIPE={continent="Africa",city="São Tomé",flag="🇸🇹"},
SAUDIARABIA={continent="Asia",city="Riyadh",flag="🇸🇦"},
SENEGAL={continent="Africa",city="Dakar",flag="🇸🇳"},
SERBIA={continent="Europe",city="Belgrade",flag="🇷🇸"},
SEYCHELLES={continent="Africa",city="Victoria",flag="🇸🇨"},
SIERRALEONE={continent="Africa",city="Freetown",flag="🇸🇱"},
SINGAPORE={continent="Asia",city="Singapore",flag="🇸🇬"},
SLOVAKIA={continent="Europe",city="Bratislava",flag="🇸🇰"},
SLOVENIA={continent="Europe",city="Ljubljana",flag="🇸🇮"},
SOLOMONISLANDS={continent="Oceania",city="Honiara",flag="🇸🇧"},
SOMALIA={continent="Africa",city="Mogadishu",flag="🇸🇴"},
SOUTHAFRICA={continent="Africa",city="Cape Town",flag="🇿🇦"},
SOUTHKOREA={continent="Asia",city="Seoul",flag="🇰🇷"},
SOUTHSUDAN={continent="Africa",city="Juba",flag="🇸🇸"},
SPAIN={continent="Europe",city="Madrid",flag="🇪🇸"},
SRILANKA={continent="Asia",city="Colombo",flag="🇱🇰"},
SUDAN={continent="Africa",city="Khartoum",flag="🇸🇩"},
SURINAME={continent="South America",city="Paramaribo",flag="🇸🇷"},
SWEDEN={continent="Europe",city="Stockholm",flag="🇸🇪"},
SWITZERLAND={continent="Europe",city="Bern",flag="🇨🇭"},
SYRIA={continent="Asia",city="Damascus",flag="🇸🇾"},
TAIWAN={continent="Asia",city="Taipei",flag="🇹🇼"},
TAJIKISTAN={continent="Asia",city="Dushanbe",flag="🇹🇯"},
TANZANIA={continent="Africa",city="Dodoma",flag="🇹🇿"},
THAILAND={continent="Asia",city="Bangkok",flag="🇹🇭"},
TIMORLESTE={continent="Asia",city="Dili",flag="🇹🇱"},
TOGO={continent="Africa",city="Lome",flag="🇹🇬"},
TONGA={continent="Oceania",city="Nuku'alofa",flag="🇹🇴"},
TRINIDADANDTOBAGO={continent="North America",city="Port of Spain",flag="🇹🇹"},
TUNISIA={continent="Africa",city="Tunis",flag="🇹🇳"},
TURKEY={continent="Europe/Asia",city="Ankara",flag="🇹🇷"},
TURKMENISTAN={continent="Asia",city="Ashgabat",flag="🇹🇲"},
TUVALU={continent="Oceania",city="Funafuti",flag="🇹🇻"},
UGANDA={continent="Africa",city="Kampala",flag="🇺🇬"},
UKRAINE={continent="Europe",city="Kyiv",flag="🇺🇦"},
UNITEDARABEMIRATES={continent="Asia",city="Abu Dhabi",flag="🇦🇪"},
UNITEDKINGDOM={continent="Europe",city="London",flag="🇬🇧"},
UNITEDSTATES={continent="North America",city="Washington, D.C.",flag="🇺🇸"},
URUGUAY={continent="South America",city="Montevideo",flag="🇺🇾"},
UZBEKISTAN={continent="Asia",city="Tashkent",flag="🇺🇿"},
VANUATU={continent="Oceania",city="Port Vila",flag="🇻🇺"},
VATICANCITY={continent="Europe",city="Vatican City",flag="🇻🇦"},
VENEZUELA={continent="South America",city="Caracas",flag="🇻🇪"},
VIETNAM={continent="Asia",city="Hanoi",flag="🇻🇳"},
YEMEN={continent="Asia",city="Sana'a",flag="🇾🇪"},
ZAMBIA={continent="Africa",city="Lusaka",flag="🇿🇲"},
ZIMBABWE={continent="Africa",city="Harare",flag="🇿🇼"}
}

----------------------------------------------------
-- CLEAN
----------------------------------------------------
local function clean(str)
	return str:upper():gsub("[%s%-%.'&,]", "")
end

----------------------------------------------------
-- SCORE AI
----------------------------------------------------
local function score(a,b)
	a,b=clean(a),clean(b)
	local s=0
	for i=1,math.min(#a,#b) do
		if a:sub(i,i)==b:sub(i,i) then
			s+=2
		end
	end
	s-=math.abs(#a-#b)
	return s
end

----------------------------------------------------
-- UI CLEANUP
----------------------------------------------------
pcall(function()
	game.CoreGui.GoogleUI:Destroy()
end)

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="GoogleUI"

----------------------------------------------------
-- MAIN FRAME (SMALL + CLEAN)
----------------------------------------------------
local frame=Instance.new("Frame",gui)
frame.Size=UDim2.new(0,420,0,320)
frame.Position=UDim2.new(0.5,0,0.5,0)
frame.AnchorPoint=Vector2.new(0.5,0.5)
frame.BackgroundColor3=Color3.fromRGB(245,245,245) -- light UI (GOOGLE STYLE)
frame.Active=true
frame.Draggable=true

Instance.new("UICorner",frame).CornerRadius=UDim.new(0,10)

----------------------------------------------------
-- TITLE
----------------------------------------------------
local title=Instance.new("TextLabel",frame)
title.Size=UDim2.new(1,0,0,35)
title.BackgroundTransparency=1
title.Text="🔎 JOHN.EXE V1"
title.Font=Enum.Font.GothamBold
title.TextSize=18
title.TextColor3=Color3.fromRGB(50,50,50)

----------------------------------------------------
-- SEARCH BAR (CLEAN WHITE STYLE)
----------------------------------------------------
local searchBar=Instance.new("TextBox",frame)
searchBar.Size=UDim2.new(0.9,0,0,32)
searchBar.Position=UDim2.new(0.05,0,0.12,0)
searchBar.PlaceholderText="Search country..."
searchBar.Text=""
searchBar.Font=Enum.Font.Gotham
searchBar.TextSize=16
searchBar.BackgroundColor3=Color3.fromRGB(255,255,255)
searchBar.TextColor3=Color3.fromRGB(30,30,30)
searchBar.PlaceholderColor3=Color3.fromRGB(150,150,150)

Instance.new("UICorner",searchBar).CornerRadius=UDim.new(0,6)

----------------------------------------------------
-- DROPDOWN
----------------------------------------------------
local dropdown=Instance.new("Frame",frame)
dropdown.Size=UDim2.new(0.9,0,0,0)
dropdown.Position=UDim2.new(0.05,0,0.21,0)
dropdown.BackgroundColor3=Color3.fromRGB(255,255,255)
dropdown.ClipsDescendants=true

Instance.new("UICorner",dropdown).CornerRadius=UDim.new(0,6)

local layout=Instance.new("UIListLayout",dropdown)
layout.Padding=UDim.new(0,2)

----------------------------------------------------
-- RESULTS
----------------------------------------------------
local results=Instance.new("ScrollingFrame",frame)
results.Size=UDim2.new(0.9,0,0.62,0)
results.Position=UDim2.new(0.05,0,0.28,0)
results.BackgroundTransparency=1
results.ScrollBarThickness=6

local list=Instance.new("UIListLayout",results)
list.Padding=UDim.new(0,5)

----------------------------------------------------
-- FUNCTIONS
----------------------------------------------------
local function clearDropdown()
	for _,v in ipairs(dropdown:GetChildren()) do
		if v:IsA("TextButton") then v:Destroy() end
	end
end

local function clearResults()
	for _,v in ipairs(results:GetChildren()) do
		if v:IsA("Frame") then v:Destroy() end
	end
end

local function addSuggestion(text)
	local b=Instance.new("TextButton",dropdown)
	b.Size=UDim2.new(1,0,0,26)
	b.BackgroundColor3=Color3.fromRGB(250,250,250)
	b.TextColor3=Color3.fromRGB(40,40,40)
	b.Font=Enum.Font.Gotham
	b.TextSize=14
	b.Text=" "..text

	b.MouseButton1Click:Connect(function()
		searchBar.Text=text
	end)
end

local function makeCard(country,rank)
	local c=Instance.new("Frame",results)
	c.Size=UDim2.new(1,0,0,45)
	c.BackgroundColor3=Color3.fromRGB(255,255,255)

	Instance.new("UICorner",c).CornerRadius=UDim.new(0,6)

	local t=Instance.new("TextLabel",c)
	t.Size=UDim2.new(1,0,0,22)
	t.BackgroundTransparency=1
	t.TextXAlignment=Enum.TextXAlignment.Left
	t.Font=Enum.Font.GothamBold
	t.TextSize=15
	t.Text=" "..rank..". "..country
	t.TextColor3=Color3.fromRGB(40,40,40)

	local d=info[clean(country)]

	local s=Instance.new("TextLabel",c)
	s.Position=UDim2.new(0,0,0,22)
	s.Size=UDim2.new(1,0,0,20)
	s.BackgroundTransparency=1
	s.TextXAlignment=Enum.TextXAlignment.Left
	s.Font=Enum.Font.Gotham
	s.TextSize=13
	s.TextColor3=Color3.fromRGB(120,120,120)

	if d then
		s.Text=" "..d.flag.." "..d.continent.." • "..d.city.." • "..#clean(country).." letters"
	else
		s.Text=" 🌍 Unknown"
	end
end

----------------------------------------------------
-- SEARCH ENGINE
----------------------------------------------------
searchBar:GetPropertyChangedSignal("Text"):Connect(function()
	local raw = searchBar.Text
	local txt = clean(raw)

	clearDropdown()
	clearResults()

	if raw == "" then return end

	local useLengthMode = raw:find("_") ~= nil
	local wantedLength = 0

	------------------------------------------------
	-- UNDERSCORE MODE
	------------------------------------------------
	if useLengthMode then
		for i = 1, #raw do
			local ch = raw:sub(i,i)

			if ch == "_" or ch:match("%a") then
				wantedLength += 1
			end
		end
	end

	------------------------------------------------
	-- SUGGESTIONS
	------------------------------------------------
	local sug = {}

	for _,c in ipairs(countries) do
		local cleaned = clean(c)

		if useLengthMode then
			if #cleaned == wantedLength and (txt == "" or cleaned:find(txt,1,true)) then
				table.insert(sug,c)
			end
		else
			if cleaned:find(txt,1,true) then
				table.insert(sug,c)
			end
		end
	end

	table.sort(sug,function(a,b)
		return score(txt,a) > score(txt,b)
	end)

	for i = 1, math.min(5,#sug) do
		addSuggestion(sug[i])
	end

	------------------------------------------------
	-- RESULTS
	------------------------------------------------
	local resultList = {}

	for _,c in ipairs(countries) do
		local cleaned = clean(c)

		if useLengthMode then
			if #cleaned == wantedLength then
				table.insert(resultList,c)
			end
		else
			if cleaned:find(txt,1,true) then
				table.insert(resultList,c)
			end
		end
	end

	table.sort(resultList,function(a,b)
		return score(txt,a) > score(txt,b)
	end)

	------------------------------------------------
	-- SHOW ALL RESULTS
	------------------------------------------------
	for i = 1, #resultList do
		makeCard(resultList[i],i)
	end

	results.CanvasSize = UDim2.new(0,0,0,#resultList * 50)
end)
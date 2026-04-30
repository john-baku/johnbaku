--[[
    SYSTEM: BOT-ONLY KEY SYSTEM (Junkie Dev Edition)
    FIX: Stripped all citation markers to prevent parsing errors
]]

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Compatibility Bridge for executors
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

----------------------------------------------------
-- CONFIGURATION
----------------------------------------------------
local API_URL = "https://worker-production-b5aa.up.railway.app/verify"

----------------------------------------------------
-- NOTIFICATION SYSTEM
----------------------------------------------------
local function SendNotification(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration or 5;
    })
end

----------------------------------------------------
-- MAIN UI FUNCTION (YOUR SCRIPT INSIDE HERE)
----------------------------------------------------
local function LoadMainUI()

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
    -- ASIA
    AFGHANISTAN={continent="Asia",city="Kabul",flag="🇦🇫",currency="Afghani"},
    ARMENIA={continent="Asia",city="Yerevan",flag="🇦🇲",currency="Dram"},
    AZERBAIJAN={continent="Asia",city="Baku",flag="🇦🇿",currency="Manat"},
    BAHRAIN={continent="Asia",city="Manama",flag="🇧🇭",currency="Dinar"},
    BANGLADESH={continent="Asia",city="Dhaka",flag="🇧🇩",currency="Taka"},
    BHUTAN={continent="Asia",city="Thimphu",flag="🇧🇹",currency="Ngultrum"},
    BRUNEI={continent="Asia",city="Bandar Seri Begawan",flag="🇧🇳",currency="Dollar"},
    CAMBODIA={continent="Asia",city="Phnom Penh",flag="🇰🇭",currency="Riel"},
    CHINA={continent="Asia",city="Beijing",flag="🇨🇳",currency="Yuan"},
    CYPRUS={continent="Asia",city="Nicosia",flag="🇨🇾",currency="Euro"},
    GEORGIA={continent="Asia",city="Tbilisi",flag="🇬🇪",currency="Lari"},
	EASTTIMOR={continent="Asia",city="Dili",flag="🇹🇱",currency="Dollar"},
    INDIA={continent="Asia",city="New Delhi",flag="🇮🇳",currency="Rupee"},
    INDONESIA={continent="Asia",city="Jakarta",flag="🇮🇩",currency="Rupiah"},
    IRAN={continent="Asia",city="Tehran",flag="🇮🇷",currency="Rial"},
    IRAQ={continent="Asia",city="Baghdad",flag="🇮🇶",currency="Dinar"},
    ISRAEL={continent="Asia",city="Jerusalem",flag="🇮🇱",currency="Shekel"},
    JAPAN={continent="Asia",city="Tokyo",flag="🇯🇵",currency="Yen"},
    JORDAN={continent="Asia",city="Amman",flag="🇯🇴",currency="Dinar"},
    KAZAKHSTAN={continent="Asia",city="Astana",flag="🇰🇿",currency="Tenge"},
    KUWAIT={continent="Asia",city="Kuwait City",flag="🇰🇼",currency="Dinar"},
    KYRGYZSTAN={continent="Asia",city="Bishkek",flag="🇰🇬",currency="Som"},
    LAOS={continent="Asia",city="Vientiane",flag="🇱🇦",currency="Kip"},
    LEBANON={continent="Asia",city="Beirut",flag="🇱🇧",currency="Pound"},
    MALAYSIA={continent="Asia",city="Kuala Lumpur",flag="🇲🇾",currency="Ringgit"},
    MALDIVES={continent="Asia",city="Male",flag="🇲🇻",currency="Rufiyaa"},
    MONGOLIA={continent="Asia",city="Ulaanbaatar",flag="🇲🇳",currency="Togrog"},
    MYANMAR={continent="Asia",city="Naypyidaw",flag="🇲🇲",currency="Kyat"},
    NEPAL={continent="Asia",city="Kathmandu",flag="🇳🇵",currency="Rupee"},
    NORTHKOREA={continent="Asia",city="Pyongyang",flag="🇰🇵",currency="Won"},
    OMAN={continent="Asia",city="Muscat",flag="🇴🇲",currency="Rial"},
    PAKISTAN={continent="Asia",city="Islamabad",flag="🇵🇰",currency="Rupee"},
    PHILIPPINES={continent="Asia",city="Manila",flag="🇵🇭",currency="Peso"},
    QATAR={continent="Asia",city="Doha",flag="🇶🇦",currency="Rial"},
    SAUDIARABIA={continent="Asia",city="Riyadh",flag="🇸🇦",currency="Riyal"},
    SINGAPORE={continent="Asia",city="Singapore",flag="🇸🇬",currency="Dollar"},
    SOUTHKOREA={continent="Asia",city="Seoul",flag="🇰🇷",currency="Won"},
    SRILANKA={continent="Asia",city="Colombo",flag="🇱🇰",currency="Rupee"},
    SYRIA={continent="Asia",city="Damascus",flag="🇸🇾",currency="Pound"},
    TAIWAN={continent="Asia",city="Taipei",flag="🇹🇼",currency="Dollar"},
    TAJIKISTAN={continent="Asia",city="Dushanbe",flag="🇹🇯",currency="Somoni"},
    THAILAND={continent="Asia",city="Bangkok",flag="🇹🇭",currency="Baht"},
    TURKEY={continent="Asia",city="Ankara",flag="🇹🇷",currency="Lira"},
    TURKMENISTAN={continent="Asia",city="Ashgabat",flag="🇹🇲",currency="Manat"},
    UAE={continent="Asia",city="Abu Dhabi",flag="🇦🇪",currency="Dirham"},
	UNITEDARABEMIRATES={continent="Asia",city="Abu Dhabi",flag="🇦🇪",currency="Dirham"},
    UZBEKISTAN={continent="Asia",city="Tashkent",flag="🇺🇿",currency="Som"},
    VIETNAM={continent="Asia",city="Hanoi",flag="🇻🇳",currency="Dong"},
    TIMORLESTE={continent="Asia",city="Dili",flag="🇹🇱",currency="Dollar"},
    YEMEN={continent="Asia",city="Sana'a",flag="🇾🇪",currency="Rial"},

    -- EUROPE
    ALBANIA={continent="Europe",city="Tirana",flag="🇦🇱",currency="Lek"},
    ANDORRA={continent="Europe",city="Andorra la Vella",flag="🇦🇩",currency="Euro"},
    AUSTRIA={continent="Europe",city="Vienna",flag="🇦🇹",currency="Euro"},
    BELARUS={continent="Europe",city="Minsk",flag="🇧🇾",currency="Ruble"},
    BELGIUM={continent="Europe",city="Brussels",flag="🇧🇪",currency="Euro"},
    BULGARIA={continent="Europe",city="Sofia",flag="🇧🇬",currency="Lev"},
	BOSNIANDHERZEGOVINA={continent="Europe",city="Sarajevo",flag="🇧🇦",currency="Convertible Mark"},
	KOSOVO={continent="Europe",city="Pristina",flag="🇽🇰",currency="Euro"},
    CROATIA={continent="Europe",city="Zagreb",flag="🇭🇷",currency="Euro"},
    CZECHREPUBLIC={continent="Europe",city="Prague",flag="🇨🇿",currency="Koruna"},
    DENMARK={continent="Europe",city="Copenhagen",flag="🇩🇰",currency="Krone"},
    ESTONIA={continent="Europe",city="Tallinn",flag="🇪🇪",currency="Euro"},
    FINLAND={continent="Europe",city="Helsinki",flag="🇫🇮",currency="Euro"},
    FRANCE={continent="Europe",city="Paris",flag="🇫🇷",currency="Euro"},
    GERMANY={continent="Europe",city="Berlin",flag="🇩🇪",currency="Euro"},
    GREECE={continent="Europe",city="Athens",flag="🇬🇷",currency="Euro"},
    HUNGARY={continent="Europe",city="Budapest",flag="🇭🇺",currency="Forint"},
    ICELAND={continent="Europe",city="Reykjavik",flag="🇮🇸",currency="Krona"},
    IRELAND={continent="Europe",city="Dublin",flag="🇮🇪",currency="Euro"},
    ITALY={continent="Europe",city="Rome",flag="🇮🇹",currency="Euro"},
    LATVIA={continent="Europe",city="Riga",flag="🇱🇻",currency="Euro"},
    LITHUANIA={continent="Europe",city="Vilnius",flag="🇱🇹",currency="Euro"},
    LUXEMBOURG={continent="Europe",city="Luxembourg",flag="🇱🇺",currency="Euro"},
    MALTA={continent="Europe",city="Valletta",flag="🇲🇹",currency="Euro"},
    MONACO={continent="Europe",city="Monaco",flag="🇲🇨",currency="Euro"},
    NETHERLANDS={continent="Europe",city="Amsterdam",flag="🇳🇱",currency="Euro"},
    NORWAY={continent="Europe",city="Oslo",flag="🇳🇴",currency="Krone"},
    POLAND={continent="Europe",city="Warsaw",flag="🇵🇱",currency="Zloty"},
    PORTUGAL={continent="Europe",city="Lisbon",flag="🇵🇹",currency="Euro"},
    ROMANIA={continent="Europe",city="Bucharest",flag="🇷🇴",currency="Leu"},
    RUSSIA={continent="Europe/Asia",city="Moscow",flag="🇷🇺",currency="Ruble"},
    SPAIN={continent="Europe",city="Madrid",flag="🇪🇸",currency="Euro"},
    SWEDEN={continent="Europe",city="Stockholm",flag="🇸🇪",currency="Krona"},
    SWITZERLAND={continent="Europe",city="Bern",flag="🇨🇭",currency="Franc"},
    UKRAINE={continent="Europe",city="Kyiv",flag="🇺🇦",currency="Hryvnia"},
    UNITEDKINGDOM={continent="Europe",city="London",flag="🇬🇧",currency="Pound"},
    BOSNIAANDHERZEGOVINA={continent="Europe",city="Sarajevo",flag="🇧🇦",currency="Convertible Mark"},
    KOSOVO={continent="Europe",city="Pristina",flag="🇽🇰",currency="Euro"},
    LIECHTENSTEIN={continent="Europe",city="Vaduz",flag="🇱🇮",currency="Franc"},
    MOLDOVA={continent="Europe",city="Chisinau",flag="🇲🇩",currency="Leu"},
    MONTENEGRO={continent="Europe",city="Podgorica",flag="🇲🇪",currency="Euro"},
    NORTHMACEDONIA={continent="Europe",city="Skopje",flag="🇲🇰",currency="Denar"},
    SANMARINO={continent="Europe",city="San Marino",flag="🇸🇲",currency="Euro"},
    SERBIA={continent="Europe",city="Belgrade",flag="🇷🇸",currency="Dinar"},
    SLOVAKIA={continent="Europe",city="Bratislava",flag="🇸🇰",currency="Euro"},
    SLOVENIA={continent="Europe",city="Ljubljana",flag="🇸🇮",currency="Euro"},
    VATICANCITY={continent="Europe",city="Vatican City",flag="🇻🇦",currency="Euro"},

    -- NORTH AMERICA
    BAHAMAS={continent="North America",city="Nassau",flag="🇧🇸",currency="Dollar"},
	BARBADOS={continent="North America",city="Bridgetown",flag="🇧🇧",currency="Dollar"},
    CANADA={continent="North America",city="Ottawa",flag="🇨🇦",currency="Dollar"},
    COSTARICA={continent="North America",city="San Jose",flag="🇨🇷",currency="Colon"},
    CUBA={continent="North America",city="Havana",flag="🇨🇺",currency="Peso"},
    DOMINICANREPUBLIC={continent="North America",city="Santo Domingo",flag="🇩🇴",currency="Peso"},
    DOMINICA={continent="North America",city="Roseau",flag="🇩🇲",currency="Dollar"},
    ELSALVADOR={continent="North America",city="San Salvador",flag="🇸🇻",currency="Dollar"},
    GRENADA={continent="North America",city="St. George's",flag="🇬🇩",currency="Dollar"},
    GUATEMALA={continent="North America",city="Guatemala City",flag="🇬🇹",currency="Quetzal"},
    NICARAGUA={continent="North America",city="Managua",flag="🇳🇮",currency="Cordoba"},
    SAINTKITTSANDNEVIS={continent="North America",city="Basseterre",flag="🇰🇳",currency="Dollar"},
    SAINTLUCIA={continent="North America",city="Castries",flag="🇱🇨",currency="Dollar"},
    SAINTVINCENTANDTHEGRENADINES={continent="North America",city="Kingstown",flag="🇻🇨",currency="Dollar"},
    TRINIDADANDTOBAGO={continent="North America",city="Port of Spain",flag="🇹🇹",currency="Dollar"},
    HAITI={continent="North America",city="Port-au-Prince",flag="🇭🇹",currency="Gourde"},
    HONDURAS={continent="North America",city="Tegucigalpa",flag="🇭🇳",currency="Lempira"},
    JAMAICA={continent="North America",city="Kingston",flag="🇯🇲",currency="Dollar"},
    MEXICO={continent="North America",city="Mexico City",flag="🇲🇽",currency="Peso"},
    PANAMA={continent="North America",city="Panama City",flag="🇵🇦",currency="Balboa"},
    UNITEDSTATES={continent="North America",city="Washington D.C.",flag="🇺🇸",currency="Dollar"},

    -- SOUTH AMERICA
    ARGENTINA={continent="South America",city="Buenos Aires",flag="🇦🇷",currency="Peso"},
    BOLIVIA={continent="South America",city="Sucre",flag="🇧🇴",currency="Boliviano"},
    BRAZIL={continent="South America",city="Brasilia",flag="🇧🇷",currency="Real"},
	BELIZE={continent="South America",city="Belmopan",flag="🇧🇿",currency="Dollar"},
    CHILE={continent="South America",city="Santiago",flag="🇨🇱",currency="Peso"},
    COLOMBIA={continent="South America",city="Bogota",flag="🇨🇴",currency="Peso"},
    ECUADOR={continent="South America",city="Quito",flag="🇪🇨",currency="Dollar"},
    PARAGUAY={continent="South America",city="Asuncion",flag="🇵🇾",currency="Guarani"},
    PERU={continent="South America",city="Lima",flag="🇵🇪",currency="Sol"},
    URUGUAY={continent="South America",city="Montevideo",flag="🇺🇾",currency="Peso"},
    VENEZUELA={continent="South America",city="Caracas",flag="🇻🇪",currency="Bolivar"},
    GUYANA={continent="South America",city="Georgetown",flag="🇬🇾",currency="Dollar"},
    SURINAME={continent="South America",city="Paramaribo",flag="🇸🇷",currency="Dollar"},

    -- AFRICA
    ALGERIA={continent="Africa",city="Algiers",flag="🇩🇿",currency="Dinar"},
	SAOTOMEANDPRINCIPE={continent="Africa",city="Sao Tome",flag="🇸🇹",currency="Dobra"},
    ANGOLA={continent="Africa",city="Luanda",flag="🇦🇴",currency="Kwanza"},
	ATIGUANDBARBUDA={continent="Africa",city="St. John's",flag="🇦🇬",currency="Dollar"},
	COMOROS={continent="Africa",city="Moroni",flag="🇰🇲",currency="Franc"},
	CABOVERDE={continent="Africa",city="Praia",flag="🇨🇻",currency="Escudo"},
    CAMEROON={continent="Africa",city="Yaounde",flag="🇨🇲",currency="Franc"},
    EGYPT={continent="Africa",city="Cairo",flag="🇪🇬",currency="Pound"},
    ETHIOPIA={continent="Africa",city="Addis Ababa",flag="🇪🇹",currency="Birr"},
    GHANA={continent="Africa",city="Accra",flag="🇬🇭",currency="Cedi"},
    KENYA={continent="Africa",city="Nairobi",flag="🇰🇪",currency="Shilling"},
    MOROCCO={continent="Africa",city="Rabat",flag="🇲🇦",currency="Dirham"},
    NIGERIA={continent="Africa",city="Abuja",flag="🇳🇬",currency="Naira"},
    SOUTHAFRICA={continent="Africa",city="Pretoria",flag="🇿🇦",currency="Rand"},
    TANZANIA={continent="Africa",city="Dodoma",flag="🇹🇿",currency="Shilling"},
    UGANDA={continent="Africa",city="Kampala",flag="🇺🇬",currency="Shilling"},
    BENIN={continent="Africa",city="Porto Novo",flag="🇧🇯",currency="Franc"},
    BOTSWANA={continent="Africa",city="Gaborone",flag="🇧🇼",currency="Pula"},
    BURKINAFASO={continent="Africa",city="Ouagadougou",flag="🇧🇫",currency="Franc"},
    BURUNDI={continent="Africa",city="Gitega",flag="🇧🇮",currency="Franc"},
    CAPEVERDE={continent="Africa",city="Praia",flag="🇨🇻",currency="Escudo"},
    CENTRALAFRICANREPUBLIC={continent="Africa",city="Bangui",flag="🇨🇫",currency="Franc"},
	IVORYCOAST={continent="Africa",city="Yamoussoukro",flag="🇨🇮",currency="Franc"},
    CHAD={continent="Africa",city="N'Djamena",flag="🇹🇩",currency="Franc"},
    CONGO={continent="Africa",city="Brazzaville",flag="🇨🇬",currency="Franc"},
    DEMOCRATICREPUBLICOFTHECONGO={continent="Africa",city="Kinshasa",flag="🇨🇩",currency="Franc"},
    DJIBOUTI={continent="Africa",city="Djibouti",flag="🇩🇯",currency="Franc"},
    EQUATORIALGUINEA={continent="Africa",city="Malabo",flag="🇬🇶",currency="Franc"},
    ERITREA={continent="Africa",city="Asmara",flag="🇪🇷",currency="Nakfa"},
    ESWATINI={continent="Africa",city="Mbabane",flag="🇸🇿",currency="Lilangeni"},
    GABON={continent="Africa",city="Libreville",flag="🇬🇦",currency="Franc"},
    GAMBIA={continent="Africa",city="Banjul",flag="🇬🇲",currency="Dalasi"},
    GUINEA={continent="Africa",city="Conakry",flag="🇬🇳",currency="Franc"},
    GUINEABISSAU={continent="Africa",city="Bissau",flag="🇬🇼",currency="Franc"},
    COTEDIVOIRE={continent="Africa",city="Yamoussoukro",flag="🇨🇮",currency="Franc"},
    LESOTHO={continent="Africa",city="Maseru",flag="🇱🇸",currency="Loti"},
    LIBERIA={continent="Africa",city="Monrovia",flag="🇱🇷",currency="Dollar"},
    LIBYA={continent="Africa",city="Tripoli",flag="🇱🇾",currency="Dinar"},
    MADAGASCAR={continent="Africa",city="Antananarivo",flag="🇲🇬",currency="Ariary"},
    MALAWI={continent="Africa",city="Lilongwe",flag="🇲🇼",currency="Kwacha"},
    MALI={continent="Africa",city="Bamako",flag="🇲🇱",currency="Franc"},
    MAURITANIA={continent="Africa",city="Nouakchott",flag="🇲🇷",currency="Ouguiya"},
    MAURITIUS={continent="Africa",city="Port Louis",flag="🇲🇺",currency="Rupee"},
    MOZAMBIQUE={continent="Africa",city="Maputo",flag="🇲🇿",currency="Metical"},
    NAMIBIA={continent="Africa",city="Windhoek",flag="🇳🇦",currency="Dollar"},
    NIGER={continent="Africa",city="Niamey",flag="🇳🇪",currency="Franc"},
    RWANDA={continent="Africa",city="Kigali",flag="🇷🇼",currency="Franc"},
    SENEGAL={continent="Africa",city="Dakar",flag="🇸🇳",currency="Franc"},
    SEYCHELLES={continent="Africa",city="Victoria",flag="🇸🇨",currency="Rupee"},
    SIERRALEONE={continent="Africa",city="Freetown",flag="🇸🇱",currency="Leone"},
    SOMALIA={continent="Africa",city="Mogadishu",flag="🇸🇴",currency="Shilling"},
    SOUTHSUDAN={continent="Africa",city="Juba",flag="🇸🇸",currency="Pound"},
    SUDAN={continent="Africa",city="Khartoum",flag="🇸🇩",currency="Pound"},
    TUNISIA={continent="Africa",city="Tunis",flag="🇹🇳",currency="Dinar"},
	TOGO={continent="Africa",city="Lome",flag="🇹🇬",currency="Franc"},
    ZAMBIA={continent="Africa",city="Lusaka",flag="🇿🇲",currency="Kwacha"},
    ZIMBABWE={continent="Africa",city="Harare",flag="🇿🇼",currency="Dollar"},

    -- OCEANIA
    AUSTRALIA={continent="Oceania",city="Canberra",flag="🇦🇺",currency="Dollar"},
    FIJI={continent="Oceania",city="Suva",flag="🇫🇯",currency="Dollar"},
    NEWZEALAND={continent="Oceania",city="Wellington",flag="🇳🇿",currency="Dollar"},
    PAPUANEWGUINEA={continent="Oceania",city="Port Moresby",flag="🇵🇬",currency="Kina"},
    KIRIBATI={continent="Oceania",city="Tarawa",flag="🇰🇮",currency="Dollar"},
    MARSHALLISLANDS={continent="Oceania",city="Majuro",flag="🇲🇭",currency="Dollar"},
    MICRONESIA={continent="Oceania",city="Palikir",flag="🇫🇲",currency="Dollar"},
    NAURU={continent="Oceania",city="Yaren",flag="🇳🇷",currency="Dollar"},
    PALAU={continent="Oceania",city="Ngerulmud",flag="🇵🇼",currency="Dollar"},
    SAMOA={continent="Oceania",city="Apia",flag="🇼🇸",currency="Tala"},
    SOLOMONISLANDS={continent="Oceania",city="Honiara",flag="🇸🇧",currency="Dollar"},
    TONGA={continent="Oceania",city="Nuku'alofa",flag="🇹🇴",currency="Paanga"},
    TUVALU={continent="Oceania",city="Funafuti",flag="🇹🇻",currency="Dollar"},
    VANUATU={continent="Oceania",city="Port Vila",flag="🇻🇺",currency="Vatu"}
}


----------------------------------------------------
-- CLEAN
----------------------------------------------------
local function clean(str)
    -- :upper() converts to uppercase
    -- gsub replaces matched characters with an empty string
    -- Added specific handling for spaces and hyphens
    return str:upper():gsub("[%s%-%.'&,]", "")
end
----------------------------------------------------
-- SCORE
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
-- UI
----------------------------------------------------
pcall(function()
	game.CoreGui:FindFirstChild("GoogleUI"):Destroy()
end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GoogleUI"

----------------------------------------------------
-- MAIN FRAME
----------------------------------------------------
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,420,0,320)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(245,245,245)
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

----------------------------------------------------
-- TITLE
----------------------------------------------------
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "🔎 JOHN.EXE V1"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(50,50,50)

----------------------------------------------------
-- CLOSE BUTTON
----------------------------------------------------
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-40,0,5)
closeBtn.Text = "❌"
closeBtn.BackgroundColor3 = Color3.fromRGB(180,50,50)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeBtn)

----------------------------------------------------
-- MINIMIZE BUTTON
----------------------------------------------------
local minBtn = Instance.new("TextButton", frame)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-80,0,5)
minBtn.Text = "➖"
minBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
minBtn.TextColor3 = Color3.new(1,1,1)
minBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", minBtn)

----------------------------------------------------
-- MINIMIZE LOGIC (FIXED)
----------------------------------------------------
local minimized = false
local fullSize = frame.Size

minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized

	if minimized then
		frame.Size = UDim2.new(0,420,0,40)
		title.Visible = true
	else
		frame.Size = fullSize
	end

	for _,v in ipairs(frame:GetChildren()) do
		if v:IsA("TextBox") or v:IsA("Frame") and v ~= closeBtn and v ~= minBtn then
			v.Visible = not minimized
		end
	end
end)
----------------------------------------------------
-- CLOSE
----------------------------------------------------
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
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
		s.Text=" "..d.flag.." "..d.continent.." • "..d.city.." • " ..d.currency.. " • "..#clean(country).." letters"
	else
		s.Text=" 🌍 No Data Available"
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

end
----------------------------------------------------
-- KEY SYSTEM UI
----------------------------------------------------
local keyGui = Instance.new("ScreenGui", game.CoreGui)
keyGui.Name = "KeySystem"

local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size = UDim2.new(0, 300, 0, 160)
keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", keyFrame)

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.8, 0, 0, 40)
keyBox.Position = UDim2.new(0.1, 0, 0.2, 0)
keyBox.PlaceholderText = "Paste Bot Key Here..."
keyBox.Text = ""
keyBox.Font = Enum.Font.Gotham
keyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
keyBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", keyBox)

local submit = Instance.new("TextButton", keyFrame)
submit.Size = UDim2.new(0.8, 0, 0, 40)
submit.Position = UDim2.new(0.1, 0, 0.6, 0)
submit.Text = "VERIFY BOT KEY"
submit.Font = Enum.Font.GothamBold
submit.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
submit.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", submit)

----------------------------------------------------
-- VERIFICATION LOGIC
----------------------------------------------------
local function Verify()
    local key = keyBox.Text
    if key == "" then return end
    
    if not httpRequest then
        SendNotification("Error", "Executor doesn't support HTTP requests", 10)
        return
    end

    submit.Text = "Verifying..."
    submit.Active = false

    local success, response = pcall(function()
        return httpRequest({
            Url = API_URL .. "?key=" .. key,
            Method = "GET"
        })
    end)

    if success and response.Body then
        local decodeSuccess, data = pcall(function() return HttpService:JSONDecode(response.Body) end)
        
        if decodeSuccess and data.valid == true then
            SendNotification("Success", "Key Validated!", 5)
            keyGui:Destroy()
            LoadMainUI() 
        else
            keyBox.Text = ""
            keyBox.PlaceholderText = "Invalid Key!"
            submit.Text = "VERIFY BOT KEY"
            submit.Active = true
        end
    else
        keyBox.PlaceholderText = "API Error / Offline"
        submit.Text = "RETRY"
        submit.Active = true
    end
end

submit.MouseButton1Click:Connect(Verify)

----------------------
--By Hallkezz / Neon--
----------------------
--Thanks for help JC2:MP devs community

-----------------------------------------------------------------------------------
--Script
class "GTAVHUD"

function GTAVHUD:__init()
	Events:Subscribe( "PlayerJoin", self, self.PlayerJoin )
	Events:Subscribe( "ModuleLoad", self, self.ModuleLoad )
end

function GTAVHUD:PlayerJoin( args )
	if GTAVHUD_CONFIGURATION.ENABLED then
		if GTAVHUD_CONFIGURATION.ENABLEAFTERJOIN then
			args.player:SetNetworkValue( "CustomHUD", true )
		end
	end
end

function GTAVHUD:ModuleLoad( args )
	for p in Server:GetPlayers() do
		if GTAVHUD_CONFIGURATION.ENABLED then
			if not p:GetValue( "CustomHUD" ) then
				p:SetNetworkValue( "CustomHUD", true )
			end
		else
			if p:GetValue( "CustomHUD" ) then
				p:SetNetworkValue( "CustomHUD", nil )
			end
		end
	end
end

gtavhud = GTAVHUD()
-----------------------------------------------------------------------------------
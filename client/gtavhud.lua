----------------------
--By Hallkezz / Neon--
----------------------
--Thanks for help JC2:MP devs community

-----------------------------------------------------------------------------------
--Script
class "GTAVHUD"

function GTAVHUD:__init()
    self.Image = Image.Create( AssetLocation.Game, "pda_map_dif.dds" )
    self.Marker = Image.Create( AssetLocation.Resource, "Arrow" )

    self.zHealth = Color( 156, 28, 27, 200 )
    self.fHealth = Color( 77, 143, 77, 200 )

    Events:Subscribe( "Render", self, self.Render )
    Events:Subscribe( "LocalPlayerMoneyChange", self, self.LocalPlayerMoneyChange )
end

function GTAVHUD:Render()
    if not LocalPlayer:GetValue( "CustomHUD" ) then return end
    if LocalPlayer:GetHealth() <= 0 then return end

    Game:FireEvent( "gui.hud.hide" )
    Game:FireEvent( "gui.minimap.hide" )

    if GTAVHUD_CONFIGURATION.HIDEINPAUSEMENU then
        if Game:GetState() == GUIState.Menu then return end
    end

    local bar_pos = Vector2( 50, ( Render.Height - 195 ) )
    local txtsize = 30
    local pos_2d = Vector2( Render.Width - 40, ( Render:GetTextHeight("FPS") + 1 ) * 2 )
    local scale = 1

	local space = 20
    local text_money = "$" .. tostring( LocalPlayer:GetMoney() )
    local text_ammo = tostring( LocalPlayer:GetInventory() )
    for slot, weapon in pairs( LocalPlayer:GetInventory() ) do
        if slot == LocalPlayer:GetEquippedSlot() then
            text_ammo = tostring( weapon.ammo_clip )
            text_reserve = tostring( weapon.ammo_reserve )
        end
    end

    pos_ammo = pos_2d - Vector2( Render:GetTextWidth( text_ammo, 30 ), -30 )

    if LocalPlayer:GetPosition().x < -16384 or LocalPlayer:GetPosition().x > 16384 or LocalPlayer:GetPosition().z < -16384 or LocalPlayer:GetPosition().z > 16384 then
        self.ppose = Vector2.Zero
    else
		self.ppose = Vector2(
			GTAVHUD:ScaleValue( LocalPlayer:GetPosition().x, -16384, 16384, 0, 1 ),
			GTAVHUD:ScaleValue( LocalPlayer:GetPosition().z, -16384, 16384, 0, 1 )
		)
    end

    Chat:SetPosition( Vector2( 30, 320 ) ) 

    local col = Color.Black
    if LocalPlayer:GetHealth() < 0.25 then
        col = self.zHealth
    else
        col = self.fHealth
    end

    bar_health = 124 * LocalPlayer:GetHealth()
    bar_oxygen = 124 * LocalPlayer:GetOxygen()

    Render:FillArea( bar_pos + Vector2( 0, 160 ), Vector2( 250, 15 ), Color( 0, 0, 0, 100 ) )
    Render:FillArea( bar_pos + Vector2( 0, 164 ), Vector2( 124, 8 ), col - Color( 0, 0, 0, 100 ) )

    if LocalPlayer:GetOxygen() >= 1 then
        Render:FillArea( bar_pos + Vector2( 126, 164 ), Vector2( 124, 8 ), Color( 0, 150, 255, 50 ) )
    else
        Render:FillArea( bar_pos + Vector2( 126, 164 ), Vector2( 124, 8 ), Color( 55, 75, 85, 200 ) )
        Render:FillArea( bar_pos + Vector2( 126, 164 ), Vector2( bar_oxygen, 8 ), Color( 100, 138, 150 ) )
    end

    Render:FillArea( bar_pos + Vector2( 0, 164 ), Vector2( bar_health, 8 ), col )
    --Render:FillArea( bar_pos + Vector2( 112, 163 ), Vector2( bar_oxygen, 8 ), Color( 0, 150, 255, 100 ) )
    --Render:FillArea( bar_pos + Vector2( 182, 163 ), Vector2( bar_oxygen, 8 ), Color( 230, 210, 50, 100 ) )

    if GTAVHUD_CONFIGURATION.MAPFADE then
        self.Image:SetAlpha( 250 )
        self.Image:Draw( bar_pos - Vector2( 15, 15 ), Vector2( 280, 165 ), self.ppose + Vector2( 0.032, 0.017 ), self.ppose - Vector2( 0.03, 0.017 ) )

        self.Image:SetAlpha( 240 )
        self.Image:Draw( bar_pos - Vector2( 10, 10 ), Vector2( 270, 170 ), self.ppose + Vector2( 0.032, 0.017 ), self.ppose - Vector2( 0.03, 0.017 ) )

        self.Image:SetAlpha( 230 )
        self.Image:Draw( bar_pos - Vector2( 5, 5 ), Vector2( 260, 165 ), self.ppose + Vector2( 0.032, 0.017 ), self.ppose - Vector2( 0.03, 0.017 ) )

        self.Image:SetAlpha( 220 )
        self.Image:Draw( bar_pos - Vector2( 3, 3 ), Vector2( 257, 162 ), self.ppose + Vector2( 0.032, 0.017 ), self.ppose - Vector2( 0.03, 0.017 ) )
    end

    self.Image:SetAlpha( 100 )
    self.Image:Draw( bar_pos, Vector2( 250, 160 ), self.ppose + Vector2( 0.03, 0.018 ), self.ppose - Vector2( 0.03, 0.018 ) ) 

    self.Marker:SetSize( self.Marker:GetSize() )

    local Marker = self.Marker
    local HMarker = self.Marker:GetSize() / 2
    local Transform = Transform2()
    Transform:Translate( self.Image:GetPosition() + ( self.Image:GetSize() / 2 ) )
    Transform:Rotate( -LocalPlayer:GetAngle().yaw )
    Render:SetTransform( Transform )
    self.Marker:Draw( -Marker:GetSize() / 2, Marker:GetSize(), Vector2.Zero, Vector2.One )
    Render:ResetTransform()

    Render:FillCircle( Vector2( (Render.Width / 2), (Render.Height / 2) ), 2.3, Color.White )
    Render:DrawCircle( Vector2( (Render.Width / 2), (Render.Height / 2) ), 2.3, Color.Black )

    if self.moneyvisibled and self.timer and self.timer:GetSeconds() < 5 then
        Render:SetFont( AssetLocation.SystemFont, "Impact" )

        if self.updmoneyvalue and self.updmoneycolor then
            pos_money = pos_2d - Vector2( Render:GetTextWidth( text_money, 30 ), 0 )
            self:DrawTextOutline( pos_money, text_money, Color( 0, 0, 0, 100 ), txtsize, scale )
            Render:DrawText( pos_money, text_money, Color( 255, 255, 255 ), txtsize )

            pos_updmoneyvalue = pos_2d - Vector2( Render:GetTextWidth( self.updmoneyvalue, 30 ), -30 )
            self:DrawTextOutline( pos_updmoneyvalue, self.updmoneyvalue, Color( 0, 0, 0, 100 ), txtsize, scale )
            Render:DrawText( pos_updmoneyvalue, self.updmoneyvalue, self.updmoneycolor, txtsize )
        else
            pos_money = pos_2d - Vector2( Render:GetTextWidth( text_money, 30 ), 0 )
            self:DrawTextOutline( pos_money, text_money, Color( 0, 0, 0, 100 ), txtsize, scale )
            Render:DrawText( pos_money, text_money, Color( 130, 200, 130 ), txtsize )
        end
    else
        self.timer = nil
        self.moneyvisibled = nil
        self.updmoneyvalue = nil
        self.updmoneycolor = nil
    end

    Render:SetFont( AssetLocation.SystemFont, "Impact" )

    local whitelist = { 0, 1, 2 }
    for index, slots in ipairs( whitelist ) do
        if LocalPlayer:GetEquippedSlot() == slots then
            if self.moneyvisibled then
                pos_ammo = pos_2d - Vector2( Render:GetTextWidth( text_ammo, 30 ), -60 )
            else
                pos_ammo = pos_2d - Vector2( Render:GetTextWidth( text_ammo, 30 ), 0 )
            end

            self:DrawTextOutline( pos_ammo, text_ammo, Color( 0, 0, 0, 100 ), txtsize, scale )
            Render:DrawText( pos_ammo, text_ammo, Color.DarkGray, txtsize )
            self:DrawTextOutline( pos_ammo - Vector2( Render:GetTextSize( text_reserve ).x, 0 ) - Vector2( space, 0 ), text_reserve, Color( 0, 0, 0, 100 ), txtsize, scale )
            Render:DrawText( pos_ammo - Vector2( Render:GetTextSize( text_reserve ).x, 0 ) - Vector2( space, 0 ), text_reserve, Color.White, txtsize )
        end
    end
end

function GTAVHUD:LocalPlayerMoneyChange( args )
    if args.new_money >= args.old_money then
        self.moneyvisibled = 1
        self.updmoneyvalue = "+$" .. args.new_money - args.old_money
        self.updmoneycolor = Color( 130, 200, 130 )
    else
        self.moneyvisibled = nil
        self.updmoneyvalue = "-$" .. args.old_money - args.new_money
        self.updmoneycolor = Color.Red
    end

    if not self.timer then
        self.timer = Timer()
    else
        self.timer:Restart()
    end
end

function GTAVHUD:ScaleValue( x, in_min, in_max, out_min, out_max )
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end

function GTAVHUD:DrawTextOutline( pos, text, color, size, scale )
    Render:DrawText( pos + (Vector2.Left * scale * 2), text, color, size, scale )
    Render:DrawText( pos + (Vector2.One * scale * 2), text, color, size, scale )
    Render:DrawText( pos + (Vector2.Up * scale * 2), text, color, size, scale )
    Render:DrawText( pos + (Vector2.Right * scale * 2), text, color, size, scale )
    Render:DrawText( pos - (Vector2.One * scale * 2), text, color, size, scale )
    Render:DrawText( pos + (Vector2.Down * scale * 2), text, color, size, scale )
end

gtavhud = GTAVHUD()
-----------------------------------------------------------------------------------
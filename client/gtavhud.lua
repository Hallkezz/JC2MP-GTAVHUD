----------------------
--By Hallkezz, Neon--
----------------------
--Thanks JC2:MP devs community for help

-----------------------------------------------------------------------------------
--Script
class "GTAVHUD"

function GTAVHUD:__init()
    self.image = Image.Create( AssetLocation.Game, "pda_map_dif.dds" )
    self.marker = Image.Create( AssetLocation.Base64, "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" )

    self.markerSize = self.marker:GetSize() / 2
    self.textSize = 30

    self.zHealth = Color( 156, 28, 27, 200 )
    self.fHealth = Color( 77, 143, 77, 200 )
    self.bColor = Color( 0, 0, 0, 100 )
    self.aWasted = 0

    self.wasted_txt = "WASTED"

    Chat:SetPosition( Vector2( 30, 320 ) ) 

    Events:Subscribe( "Render", self, self.Render )
    Events:Subscribe( "ResolutionChange", self, self.ResolutionChange )
    Events:Subscribe( "LocalPlayerDeath", self, self.LocalPlayerDeath )
    Events:Subscribe( "LocalPlayerMoneyChange", self, self.LocalPlayerMoneyChange )
end

function GTAVHUD:Render()
    if not LocalPlayer:GetValue( "CustomHUD" ) then return end

    Render:SetFont( AssetLocation.SystemFont, "Impact" )

    if self.wastedTimer then
        local seconds = self.wastedTimer:GetSeconds()

        self.aWasted = math.clamp( seconds * 255, 0, 255 )
        if seconds >= 1 then
            self.wastedTimer = nil
        end
    end

    local player_health = LocalPlayer:GetHealth()

    if player_health <= 0 then
        local text_size = 80

        Render:FillArea( Vector2( 0, Render.Size.y / 2  - 150 / 2 ), Vector2( Render.Size.x, 150 ), self.bColor )
        Render:DrawText( Vector2( Render.Size.x / 2 - Render:GetTextWidth( self.wasted_txt, text_size ) / 2, Render.Size.y / 2 - Render:GetTextHeight( self.wasted_txt, text_size - 10 ) / 2 ), self.wasted_txt, Color( 255, self.aWasted, self.aWasted, 150 ), text_size )
        return
    end

    Game:FireEvent( "gui.hud.hide" )
    Game:FireEvent( "gui.minimap.hide" )

    if GTAVHUD_CONFIGURATION.HIDEINPAUSEMENU then
        if Game:GetState() == GUIState.Menu then return end
    end

    local player_oxygen = LocalPlayer:GetOxygen()
    local equipped_slot = LocalPlayer:GetEquippedSlot()
    local bar_pos = Vector2( 30, ( Render.Height - 200 ) )
    local pos_2d = Vector2( Render.Width - 40, ( Render:GetTextHeight("FPS") + 1 ) * 2 )
    local scale = 1

	local space = 20
    local inventory = LocalPlayer:GetInventory()
    local text_money = "$" .. tostring( LocalPlayer:GetMoney() )
    local text_ammo = tostring( inventory )

    for slot, weapon in pairs( inventory ) do
        if slot == equipped_slot then
            text_ammo = tostring( weapon.ammo_clip )
            text_reserve = tostring( weapon.ammo_reserve )
        end
    end

    local player_pos = LocalPlayer:GetPosition()
    local scale_x, scale_y = -16384, 16384

    if player_pos.x < scale_x or player_pos.x > scale_y or player_pos.z < scale_x or player_pos.z > scale_y then
        self.ppose = Vector2.Zero
    else
        local out_min, out_max = 0, 1

		self.ppose = Vector2(
			GTAVHUD:ScaleValue( player_pos.x, scale_x, scale_y, out_min, out_max ),
			GTAVHUD:ScaleValue( player_pos.z, scale_x, scale_y, out_min, out_max )
		)
    end

    local health_color = player_health < 0.25 and self.zHealth or self.fHealth

    local bar_health = 124 * player_health
    local bar_oxygen = 124 * player_oxygen

    Render:FillArea( bar_pos + Vector2( 0, 160 ), Vector2( 250, 15 ), self.bColor )
    Render:FillArea( bar_pos + Vector2( 0, 164 ), Vector2( 124, 8 ), health_color - self.bColor )

    local oxygen_pos = bar_pos + Vector2( 126, 164 )
    if player_oxygen >= 1 then
        Render:FillArea( oxygen_pos, Vector2( 124, 8 ), Color( 0, 150, 255, 50 ) )
    else
        Render:FillArea( oxygen_pos, Vector2( 124, 8 ), Color( 55, 75, 85, 200 ) )
        Render:FillArea( oxygen_pos, Vector2( bar_oxygen, 8 ), Color( 100, 138, 150 ) )
    end

    Render:FillArea( bar_pos + Vector2( 0, 164 ), Vector2( bar_health, 8 ), health_color )
    --Render:FillArea( bar_pos + Vector2( 112, 163 ), Vector2( bar_oxygen, 8 ), Color( 0, 150, 255, 100 ) )
    --Render:FillArea( bar_pos + Vector2( 182, 163 ), Vector2( bar_oxygen, 8 ), Color( 230, 210, 50, 100 ) )

    if GTAVHUD_CONFIGURATION.MAPFADE then
        local alpha = 250
        local uv1, uv2 = Vector2( 0.032, 0.017 ), Vector2( 0.03, 0.017 )

        self.image:SetAlpha( alpha )
        self.image:Draw( bar_pos - Vector2( 15, 15 ), Vector2( 280, 165 ), self.ppose + uv1, self.ppose - uv2 )

        alpha = alpha - 10
        self.image:SetAlpha( alpha )
        self.image:Draw( bar_pos - Vector2( 10, 10 ), Vector2( 270, 170 ), self.ppose + uv1, self.ppose - uv2 )

        alpha = alpha - 10
        self.image:SetAlpha( alpha )
        self.image:Draw( bar_pos - Vector2( 5, 5 ), Vector2( 260, 165 ), self.ppose + uv1, self.ppose - uv2 )

        alpha = alpha - 10
        self.image:SetAlpha( alpha )
        self.image:Draw( bar_pos - Vector2( 3, 3 ), Vector2( 257, 162 ), self.ppose + uv1, self.ppose - uv2 )
    end

    local uv = Vector2( 0.03, 0.018 )
    self.image:SetAlpha( 100 )
    self.image:Draw( bar_pos, Vector2( 250, 160 ), self.ppose + uv, self.ppose - uv ) 

    local HMarker = self.markerSize / 2
    local Transform = Transform2()
    Transform:Translate( self.image:GetPosition() + ( self.image:GetSize() / 2 ) )
    Transform:Rotate( -LocalPlayer:GetAngle().yaw )
    Render:SetTransform( Transform )
    self.marker:Draw( -self.markerSize / 2, self.markerSize, Vector2.Zero, Vector2.One )
    Render:ResetTransform()

    --Crosshair
    local pos = Vector2( Render.Width / 2, Render.Height / 2 )
    local size = 2.3
    Render:FillCircle( pos, size, Color.White )
    Render:DrawCircle( pos, size, Color.Black )

    if self.moneyvisibled and self.timer and self.timer:GetSeconds() < 5 then
        if self.updmoneyvalue and self.updmoneycolor then
            pos_money = pos_2d - Vector2( Render:GetTextWidth( text_money, self.textSize ), 0 )
            self:DrawTextOutline( pos_money, text_money, self.bColor, self.textSize, scale )
            Render:DrawText( pos_money, text_money, Color( 255, 255, 255 ), self.textSize )

            pos_updmoneyvalue = pos_2d - Vector2( Render:GetTextWidth( self.updmoneyvalue, self.textSize ), -30 )
            self:DrawTextOutline( pos_updmoneyvalue, self.updmoneyvalue, self.bColor, self.textSize, scale )
            Render:DrawText( pos_updmoneyvalue, self.updmoneyvalue, self.updmoneycolor, self.textSize )
        else
            pos_money = pos_2d - Vector2( Render:GetTextWidth( text_money, self.textSize ), 0 )
            self:DrawTextOutline( pos_money, text_money, self.bColor, self.textSize, scale )
            Render:DrawText( pos_money, text_money, Color( 130, 200, 130 ), self.textSize )
        end
    else
        self.timer = nil
        self.moneyvisibled = nil
        self.updmoneyvalue = nil
        self.updmoneycolor = nil
    end

    local text_width = Render:GetTextWidth( text_ammo, self.textSize )
    local pos_ammo = pos_2d - Vector2( text_width, -30 )
    local whitelist = { 0, 1, 2 }

    for index, slots in ipairs( whitelist ) do
        if equipped_slot == slots then
            pos_ammo = self.moneyvisibled and ( pos_2d - Vector2( text_width, -60 ) ) or ( pos_2d - Vector2( text_width, 0 ) )

            self:DrawTextOutline( pos_ammo, text_ammo, self.bColor, self.textSize, scale )
            Render:DrawText( pos_ammo, text_ammo, Color.DarkGray, self.textSize )
            self:DrawTextOutline( pos_ammo - Vector2( Render:GetTextSize( text_reserve ).x, 0 ) - Vector2( space, 0 ), text_reserve, self.bColor, self.textSize, scale )
            Render:DrawText( pos_ammo - Vector2( Render:GetTextSize( text_reserve ).x, 0 ) - Vector2( space, 0 ), text_reserve, Color.White, self.textSize )
        end
    end
end

function GTAVHUD:ResolutionChange()
    Chat:SetPosition( Vector2( 30, 320 ) ) 
end

function GTAVHUD:LocalPlayerDeath()
    if not self.wastedTimer then
        self.wastedTimer = Timer()
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

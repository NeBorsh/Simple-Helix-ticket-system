local PLUGIN = PLUGIN
PLUGIN.name = "Сис-ма тикетов"
PLUGIN.author = "Borisenkoff"
PLUGIN.description = "Позволяет играя за мента делать тикеты игрокам... _ _ _ _ )))))"

local item_name = nil
local item_desc = nil
local item_model = 'models/props_lab/clipboard.mdl'
local PLAYER = FindMetaTable("Player")

function PLAYER:ticketFact()
    local char = self:GetCharacter()
    local faction = char:GetFaction()
    local tickned = ix.faction.Get(faction).tickned or false

    return ticned
end

table = table or {}

-- Your library functions should reside in the table as regular function calls, not method calls (i.e use "." instead of ":") to
-- maintain consistency with the rest of Helix. What you shouldn't do: function ix.test:Add(one, two)
function table.GetKey(table, key)
	for k, v in pairs(table) do
		if k == key then
			return true
		end
	end
end

if (CLIENT) then
	concommand.Add("ticket_create", function(ply, Character)
		if ply:ticketFact() then
			local frame = vgui.Create( "DFrame" )
			frame:SetPos( 500, 300 )
			frame:SetSize( 300, 110 )
			frame:SetTitle(Createmenu)
			frame:SetDeleteOnClose(true)
			frame:SetDraggable( true )
			frame:ShowCloseButton( true )
			frame:MakePopup()

			local name = vgui.Create( "DTextEntry", frame )
			name:Dock( TOP )
			name:SetPlaceholderText(ticketname)
			function name:OnChange()
				item_name = name:GetText()
			end

			local desc = vgui.Create( "DTextEntry", frame )
			desc:Dock( TOP )
			desc:DockMargin( 0, 5, 0, 0 )
			desc:SetPlaceholderText(ticketdisc)
			function desc:OnChange()
				item_desc = desc:GetText()
			end

			local button = vgui.Create( "DButton", frame )
			button:Dock( BOTTOM )
			button:SetText(createticket)
			button:SetPos( 25, 50 )
			button:SetSize( 250, 30 )
			button.DoClick = function()
				net.Start("item_send")
					net.WriteString(item_name)
					net.WriteString(item_desc)
                    net.WriteString(item_model)
				net.SendToServer()
			end
		else
			ply:Notify(gosbl)
            return true
		end
	end)
end

--##################
-- Interface: 20400
-- Title: Scroll_It
-- Notes: Allows for the mousewheel to scroll all chatframes and mini-map.
-- License: GNUv2GPL
-- Author: Anaral of the US Realm Lothar
-- Another simple addon joining two 'needs' in one.
-- Feel free to yoink any part of the code you desire. 
--###################

do
	--zoom minimap in or out via the mousewheel (weee!)
	local scroll = CreateFrame('Frame', nil, Minimap)
	scroll:SetAllPoints(Minimap)
	scroll:EnableMouse(false)
	scroll:EnableMouseWheel(true)
	scroll:SetScript("OnMouseWheel", function(self, change)
			if change > 0 then
				Minimap_ZoomIn()
			else
				Minimap_ZoomOut()
			end
		end)
	
	MiniMapWorldMapButton:Show()
	GameTimeFrame:Show()
	MinimapZoomIn:Show()
	MinimapZoomOut:Show()
	
	MinimapZoneTextButton:Show()
	MinimapToggleButton:Show()
	MinimapBorderTop:Show()
	
--	MinimapCluster:ClearAllPoints()
	MinimapCluster:SetPoint('TOPRIGHT', 0, 12)
end
--Scroll the chat frames
SC_UseMouseWheelToScrollChat = true;

function ChatFrame_OnMouseWheel(chatframe, value)
	if ( SC_UseMouseWheelToScrollChat ) then
		if ( value > 0 ) then
			chatframe:ScrollUp();
		elseif ( value < 0 ) then
			chatframe:ScrollDown();
		end
	else
		if ( value > 0 ) then
			ActionBar_PageUp();
		elseif ( value < 0 ) then
			ActionBar_PageDown();
		end
	end
end
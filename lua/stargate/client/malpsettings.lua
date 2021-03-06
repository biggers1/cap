/*
	Stargate Lib for GarrysMod10
	Copyright (C) 2007-2009  aVoN

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
--################# The keyboard layout, you see in the stargate/Keybinders #################

--################# Adds the glider's keysettings @aVoN
--[[function StarGate.Hook.AddMALPKeysettingsConfig()
	--if(not StarGate.Installed) then return end;
	spawnmenu.AddToolMenuOption("Cap","Keybinders","MALP"," MALP Settings","","",StarGate.MALPSettings);
end
hook.Add("AddToolMenuTabs","StarGate.Hook.AddMALPKeysettingsConfig",StarGate.Hook.AddMALPKeysettingsConfig);]]

--################ The controls necessary for keybinding @aVoN
function StarGate.MALPSettings(Panel)
	/*if(StarGate.HasInternet) then
		-- The HELP Button
		local VGUI = vgui.Create("SHelpButton",Panel);
		VGUI:SetHelp("config/malp");
		VGUI:SetTopic("Help:  MALP Config");
		Panel:AddPanel(VGUI);
	end */
	local LAYOUT = "MALP";
	-- Use soo much tables at the bottom to keep the sorting-order in exact this order.
	local KEYS = {
		{
			Name = SGLanguage.GetMessage("key_move_title"),
			Keys = {
				{SGLanguage.GetMessage("key_move_forward"),"FWD"},
				{SGLanguage.GetMessage("key_turn_left"),"LEFT"},
				{SGLanguage.GetMessage("key_turn_right"),"RIGHT"},
				{SGLanguage.GetMessage("key_move_back"),"BACK"},
			},
		},

		{
			Name = SGLanguage.GetMessage("key_view_title"),
			Keys = {
				{SGLanguage.GetMessage("key_cam_view"),"VIEW"},
				{SGLanguage.GetMessage("key_cam_left"),"CAMLEFT"},
				{SGLanguage.GetMessage("key_cam_right"),"CAMRIGHT"},
				{SGLanguage.GetMessage("key_cam_up"),"CAMUP"},
				{SGLanguage.GetMessage("key_cam_down"),"CAMDOWN"},
				{SGLanguage.GetMessage("key_cam_reset"),"RESETCAM"},
			},
		},
	}
	for _,v in pairs(KEYS) do
		Panel:Help("");
		Panel:Help(v.Name);
		for _,v in pairs(v.Keys) do
			local KEY = vgui.Create("SKeyboardKey",Panel);
			KEY:SetData(LAYOUT,v[1],v[2]);
			Panel:AddPanel(KEY);
		end
	end
end

-- Add "+Void" if the Starstorm Returns mod is enabled

gm.pre_code_execute("gml_Object_oStartMenu_Create_0", function(self, other)
	local ssr = mods["RobomandosLab-StarstormReturns"] ~= nil
	
	if ssr then
		gm.sprite_replace(gm.constants.sTitle, path.combine(PATH, "Assets/title.png"), 1, false, false, 346, 118)
	else return end
end)

# Usage
* Launch ArmA 3
* Click on Editor.
* Doubleclick on the map you want a mission create for (or view an example).
* Press CTRL+S.
* Enter you mission's name.
* Click on OK.
* Follow [Installation-instructions](INSTALLATION.md)
* Press Ctrl+T.
* Press F6.
* Search the colored dots around Agia Marina (Stratis).
* Where a black dot is placed, the players may be teleported at missionbegin.
* Where a orange dot is placed, a random lootbox will spawn.
* Where a red dot is placed, a special lootbox will be paradropped from time to time (really good loot).
* Where a blue dot is placed, a vehicle will be paradropped from time to time.
* Where a white dot is placed, a boat will be paradropped from time to time.
* Where a yellow dot is placed, a heli will be paradropped from time to time.
* Where a green dot is placed, a possible safezone will be placed (zone where players have to escape to after some time).
* Click on one.
* Hover the mouse direct over that one you clicked.
* Press Ctrl+C.
* Place the mouse where you want it. Do not place lootmarkers in buildings because the crates will spawn not correctly.
* Press Ctrl+V.
* Repeat until all dots are where you want them. You can move them by drag&drop.
* Delete (hover mouse over dot and press del) all unwanted dots (In general those who already were there when you opened the editor. THIS IS IMPORTANT!!!).
* I recommend to place a lot of orange dots (>50), 1-5 black dots, ~7 red dots, ~3 blue dots, 1 yellow dot, ~7 green dots. Depends on missionsize and may vary a lot.
* After all, doubleclick on all green markers and give each one a good name like "Camp Tempest". The names are shown when the deathzone warning pops up.
* Press Ctrl+S to save the mission.
* Press Ctrl+Shift+S.
* Enter a missionname.
* Select "Export to multiplayer missions".
* Click on ok.
Congratulations!!! You created your first multiplayer mission with HGFramework!

**For advanced users:**  
All missionparameters can be changed on missionstart. Read hg_params.h for description of each variable. I recommend to edit the defaultvalues to fit with your missionbehaviour.  
If you want to customize the framework and have questions just ask me.  
If you want to set up borders, place some markers that mark the whole area where players may walk. Give each marker a name (allowed1, allowed2, ...). In the init.sqf put the names commaseparated in the brackets:  
hg_allowedAreas = [allowed1, allowed2];  
If you want to exclude an area from the allowed area create a marker give it a name (disallowed1) and add this to init.sqf:  
hg_disallowedAreas = [disallowed1];  
Borders will be activated on teleport and deactivated when the deathzonewarning pops up.  
I recommend to set good defaultvalues for the framework variables because on missionstart most people will use the defaultvalues! Dafultvalues can be set in hg_params.h.  
If you want to change the loot, helis, boats, vehicles look in the following files and edit some values:  
* HGF\hg_variables.sqf
* VAS\config.sqf
* HGF\loot\paradrop\\*.sqf
* HGF\init\initPlayer.sqf

If you add/delete a weapon to/from hg_loot_weapons, you also have to add/delete a magazine to/from hg_loot_weaponsMagazines.  
To set up a minimum missiontemplate place a few blufor medics, place one marker of each color (black, orange, red, blue, white, yellow, green) and place a trigger which includes the whole landscape and name it "allowed1".
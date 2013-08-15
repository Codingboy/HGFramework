HGFramework is designed to create missions that are similar to the concept of the Hunger Games.
Book: http://www.suzannecollinsbooks.com/the_hunger_games_69765.htm
Film: http://www.imdb.com/title/tt1392170/
Missions shall be creatable very fast even for people who are NOT familar with the mission editor!
All you need to do is install the HGFramework, open the editor and copy&paste some markers.



General Missiondesign:
At startup all players have a little time to group up with other players if they want to.
Then all players will be teleported to the arena.
All players only have uniform, map, gps, radio, watch, compass.
There are 8 mines around each player so do not move!
The mines will be deactivated after some time.
Around the start are also a few lootcrates. But only in the middle are weapons.
The mission is finished when all players except one are dead.
There also may be lootcrates around if the missionmaker placed it.
After some time all players are warned for a sudden death. All players have to travel to a defined location or die.
It is important to find water/food!



Copyrightissues / Namingconvention:
To not get in trouble with copyrightowners of Hunger Games I recommend you to not name your mission "Hunger Games" or so.
Instead I recommend you to name it for example "dm@24_Hangar-Games_1-0-0". I also saw a mission called "Hunting Games" and the Minecraft "Survival Games".
Be creative but better do not use "Hunger Games".



Features:
Revive
	revive dead people
Mag Repack
	press ctrl+r to repack magazines
Foldmap
	press shift+m to show a map
VAS
	some supplyboxes are virtual ammoboxes so do not use inventory on them, use "Virtual Ammobox" instead
Group Management
	group up with other players, you also can disallow other players to join you
Remove Dead
	dead players are removed after some time
Eat & Drink
	search food or water barrels and use the action drink/eat
	if you are to hungry/thirsty you will not be able to run or even get damage over time
	the faster you move the faster hunger/thirst increases (exponential)
	the more you carry the faster hunger/thirst increases
Sleep
	go prone and use the sleep action
	if you are to tired you will not be able to run or even will fall asleep
	the faster you move the faster fatigue increases (exponential)
	the more you carry the faster fatigue increases
	the more fatigue you have the longer you will sleep (exponential)
Bleeding
	if you have to much damage you get damage over time, heal yourself to stop it
Timeacceleration
	time is accelerated with a factor (60 by default -> 1 real life second = 1 ingame minute)
Marking enemies
	markers are placed near enemies and updating
Loot
	random loot
Vehicle spawn
	random spawn of vehicles & boats & helis
Paradrop
	some loot and vehicles are paradropped
Borders
	each player leaving the allowed area will be killed
	you can exclude areas from the allowed areas
Jump
	press "space" while running to jump
Temperaturesystem
	temperature increased during day
	temperature decreased during night
	temperature increased if running
	temperature decreased if walking/standing
	temperature decreased if in water
	temperature increased if near burning campfire (no vehicles!)
	thirst is increased if temperature is high
	thirst is decreased if temperature is low
	hunger is increased if temperature is low
	hunger is decreased if temperature is high
	damage is dealt if temperature is too high or too low
	if temperature would change away from normal temperature the change is reduced to obtain stability
Configurable
	highly configurable via mission parameters in hg_params.h or even during missionselection
HUD
	minimal custom HUD to show informations like thirst/hunger/...



Recommendation:
search for food/water at the beginning and mark it on your map (better knowing where to find it when you do not need it instead of needing it and not knowing where to find)
sleep often at a fatigue value of 20, maximum fatigue shall be around 30 otherwise you sleep a long time)
do not carry items you do not need, they increase your hunger/thirst/fatigue when moving
try to deny increasing your temperature above 44 or decreasing it below 28 otherwise you will be damaged



Install:
Missionfolder is C:\Documents and Settings\<username>\My Documents\Arma 3\missions\<mission name>.<world Name>
If no one exists, create one called <mission name>.<world Name> (world name is in general "Startis")(example: survival.Stratis).
If you want to see an examplemission copy the contents of the HGFrameworkExample.Stratis folder into your mission folder.
Otherwise copy all contents from the HGFramework.Stratis folder into your mission folder.



Usage:
Open the editor.
Press Ctrl+O.
Doubleclick your mission.
Press Ctrl+T.
Press F6.
Search the colored dots around Agia Marina.
Where a black dot is placed, the players may be teleported at missionbegin.
Where a orange dot is placed, a random lootbox will spawn.
Where a red dot is placed, a special lootbox will be paradropped from time to time (really good loot).
Where a blue dot is placed, a vehicle will be paradropped from time to time.
Where a white dot is placed, a boat will be paradropped from time to time.
Where a yellow dot is placed, a heli will be paradropped from time to time.
Where a green dot is placed, a possible safezone will be placed (zone where players have to escape to after some time).
Click on one.
Hover the mouse direct over that one you clicked.
Press Ctrl+C.
Place the mouse where you want it. Do not place lootmarkers in buildings because the crates will spawn in the floor.
Press Ctrl+V.
Repeat until all dots are where you want them.
Delete (hover mouse over dot and press del) all unwanted dots (In general those who already were there when you opened the editor. THIS IS IMPORTANT!!!).
I recommend to place a lot of orange dots (>50), 1-5 black dots, ~7 red dots, ~3 blue dots, 1 yellow dot, ~7 green dots. Depends on missionsize and may vary a lot.
After all, doubleclick on all green markers and give each one a good name like "Camp Tempest". The names are shown when the deathzone warning pops up.
Press Ctrl+S to save the mission.
Press Ctrl+Shift+S.
Enter a missionname.
Select "Export to multiplayer missions".
Click on ok.
Congratulations!!! You created your first multiplayer mission with HGFramework!

For advanced users:
You can change what will spawn at which colored marker by editing some variables in HGF\hg_variables.sqf. Search for "hg_startColor".
All missionparameters can be changed on missionstart. Read HGF\hg_params.h for description of each variable. I recommend to edit the defaultvalues to fit with your missionbehaviour.
If you want to customize the framework and have questions just ask me.
If you want to set up borders, place some markers that mark the whole area where players may walk. Give each marker a name. In the init.sqf put the names commaseparated in the brackets:
hg_allowedAreas = [b1, b2];
If you want to exclude an area from the allowed area create a marker give it a name and add this to init.sqf:
hg_disallowedAreas = [b3];
Borders will be activated on teleport and deactivated when the deathzonewarning pops up.
I recommend to set good defaultvalues for the framework variables because on missionstart most people will use the defaultvalues! Dafultvalues can be set in HGF\hg_params.h.
If you want to change the loot, helis, boats, vehicles look in the following files and edit some values:
HGF\hg_variables.sqf
HGF\defaultLoot.sqf
VAS\config.sqf
HGF\initPlayer.sqf
If you add/delete a weapon to/from hg_loot_weapons, you also have to add/delete a magazine to/from hg_loot_weaponsMagazines.



Credits:
Thanks
Suzanne Collins                                                                           for The Hunger Games
BIS                                                                                       for ArmA 3 & scriptingreference
Foxhound                                                                                  for Armaholic & Arma Unpbo Tool & editing the frontpage
Giallustio & Crasso & Lucky44 & =BTC=                                                     for =BTC= Revive v0.93
zuff                                                                                      for Group Management Script v1.1
Outlawled                                                                                 for Mag Repack v2.1.3
Celery                                                                                    for CLY Remove Dead v28
MAD T                                                                                     for MAD FadeToBlack
Armaholic-Community                                                                       for helping
Mr-Murray                                                                                 for ArmA Editing Guide
Armaidiot                                                                                 for a lot of Youtube Editor Tutorials
Nicolas & GossamerSolid & Sanjo                                                           for Notepad++ SQF Syntax Highlighting
Taosenai & Dslyecxi/zx64                                                                  for Tao Folding Map v2.1
austin(medic)                                                                             for testing on a dedicated server & reviewing my code & Reveal Script & In Depth Damage Effects
Tonic & Kronzky & SaMatra & Dslyecxi & Tyrghen & naong & Coding :D & El nabot & czesiek77 for Virtual Ammobox System v1.7
Terox                                                                                     for dedicated server tutorial
Pirin                                                                                     for helping me fixing my addAction distance bug & hint to use .jpg instead of .paa
tehcyx                                                                                    for the name "Hangar Games" (I like it a lot!)
hanne.2k                                                                                  for testing
ProGamer & Zooloo75/Stealthstick & F2kSel                                                 for Realistic Jumping/ Running Vault Script v0.4
XuXu & Hege & darky                                                                       for testing on dedicated server
zooloo75/Stealthstick                                                                     for Bullet-Wind Interaction System
Xeno                                                                                      for a nice piece of code concerning paramsarray
exit1 & BAS                                                                               for the first live test
zorilya                                                                                   for 3D Explosives Interface

=BTC= Revive was created by Giallustio (I just configured it)
Group Management Script was created by zuff (I added 2 new files and changed the other files to fit my changes)
MAD_FadeToBlack (nearly copypasted into my sleepscript together with parts from =BTC= Revive)
Mag Repack was created by Outlawled (I just converted the addon to a script)
Tao Folding Map was created by Taosenai (I just converted the addon to a script and made it fit the framework)
CLY Remove Dead was created by Celery (just using the script)
VAS was created by Tonic (just configured and using it)
Realistic Jumping Script was created by ProGamer & Zooloo75/Stealthstick (just using it and changed usage from "C" to "space" and disabled doubletap)
Reveal Script was created by austin(medic) (just added an isDedicated check and changed the sleeptime)
In Depth Damage Effects was created by austin(medic) (improved it and fixed some bugs)
Bullet-Wind Interaction System was created by zooloo75 (only minor changes)
3D Explosives Interface was created by zorilya (only using it)
I do not take credits for any picture or sound!
hungergames.paa is an edited version of http://wallpoh.com/wp-content/uploads/2013/03/Free-The-Hunger-Games-Wallpaper-HD.jpg



License:
HGFramework © 2013 Daniel Tkocz, used under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License:
http://creativecommons.org/licenses/by-nc-sa/3.0/
The files in =BTC=_revive, outlw_magRepack, scripts, cly_removedead, tao_foldmap_a3, VAS, reveal and all its subfolders and its files and files ending with .ogg or .paa are not affected by this licence. Contact the original authors on www.armaholic.com for more information or search for a LICENSE file in the folders.
You are not allowed to change any variablename or variablevalue in "hg_variables.sqf" whos name starts with "hg_license_".
You are not allowed to edit code if its execution is dependent of a variable which name starts with "hg_license_" if the variablevalue is false.



Changelog:
0.7.0
	initial release

0.7.1
	added a border protection, killing all players leaving the area after some time
	added exclude option for allowed areas
	allowed areas are marked with a markerarea
	disallowed areas are marked with a markerarea
	borders enbled by default (hg_params.h)
	added an option to delete all markers except lootcrates (can already be deleted)
	safezone is now marked with a markerarea
	added borders to examplemission

0.7.2
	using jumpscript v0.2 (permission received)
	fixed: crates are not refilled anymore if player is within 3 meters
	fixed: bug with lootcrate
	fixed: sleep does not produce errors anymore when executed before teleport
	fixed: no errors are produced anymore if client runs timeacceleration before server
	upgraded =BTC= Revive v0.93

0.7.3
	upgraded jumpscript v0.3
	using revealscript (does not respond)
	fixed: players in vehicles are no longer killed by border if they are in the allowed area
	added options to disable VAS at start
	added options to disable paradropped VAS
	fixed: revealscript (mine for playerposition, not austin's) now works on dedicated server
	fixed: marksmanbox does not disappear anylonger if player is within 3m
	fixed: VAS (not that one at start) does not disappear anylonger if player is within 3m
	added description of variables in hg_params.h above each variable
	fixed: Folding Map works again (quick&dirty fix)

0.7.4
	B_Kitbag_mcamo now available in specialcrate
	V_Rangemaster_belt added as default gear
	fixed: "%" is displayed in hud
	fixed: paradroped items are not anymore spawned on the ground
	upgraded jumpscript v0.4
	noticed clearItemCargoGlobal is bugged, will not fix the issues it creates because bis will
	fixed: backpacks are also removed from crates on (re)spawn
	renamed initRevealPlayers.sqf to initMarkPlayers.sqf
	added a new example mission

0.7.5
	reworked initDeathzone.sqf

0.7.6
	added detailed temperaturesystem
	increased audibility of cannonsound
	now using the weight of the player in the calculation how fast hunger/thirst/fatigue is increased, the more he carries the faster he needs to sleep/eat/drink
	time to reach safezone is displayed when warning message pops up
	now one instance of each cratetype is guaranteed independend of its spawnchance
	fixed: crates did not guaranteed spawn if spawnchance was 100
	fixed: only 9 crates were spawning caused by "at least one instance..."
	decreased thirst/hunger/fatigue rates to fit with the new calculation dependent on player weight

0.7.7
	mines are now removed if "0" is displayed, no longer have to wait 1 second
	added startsounds
	fixed: weight was nearly not used
	fixed: weight reduced rate instead of increasing it
	fixed: mines do not kill a prone player anymore, increased minenumber and radius
	fixed: now using correct default temperature value

0.7.8
	updated VAS v1.7
	using other font (EtelkaNarrowMediumPro) for hud
	fixed: "0" in countdown not anylonger displayed using hint, now using hintSilent
	optimized initMines.sqf a bit
	fixed: very small bug in sleep.sqf
	set up own simple revive system (not complete)
	using other animations in sleep.sqf
	disabled sleep on missionstart
	using damagesystem
	fixed and improved damagesystem
	using windsystem
	minor changes in windsystem
	added an action to the player to display windinformation
	fixed: backpack was added with wrong command when boxes are refilled

0.7.9
	initialization of deathzone now runs serverside to prevent desync
	deathzone itself continues running clientside (new script, separated from initDeathzone.sqf)
	markPlayers now runs serverside
	marked players are not updated if they are still in the markerrange, so multiple updates would not reveal its position.
	fixed (hopefully): the player itself is not anylonger marked on the map (shall he be marked instead in another color, so he knows where his marker is visiable for other players?)
	fixed: player got stuck sometimes after sleeping
	disabled debug/cheat script

0.7.10
	removed boxes at start: grenades, explosives
	removed defaultloot from startboxes
	fixed: border was activated if player died
	fixed: deathzone was activated if player died
	fixed: damagesystem was still active if player is dead
	fixed (hopefully): players marker is now blue

0.7.11
	markPlayer colors defined in hg_variables.sqf
	mockingjaycall not anylonger played on teleport
	mockingjaycall played at end for the winner
	refactored hg_params.h
	refactored hg_variables.sqf
	added first aid kits to all startcrates
	loot configs exported to hg_variables.sqf
	vehicle config exported to hg_variables.sqf
	boat config exported to hg_variables.sqf
	heli config exported to hg_variables.sqf
	new sound happyHungerGames played on teleport
	added an option to set number of guaranteed crates per type
	moved some files into the root folder

0.7.12 (0.8.0 RC1)
	fixed: borders are now deactivated on deathzonewarning
	fixed: border markers are removed on deathzonewarning
	added countdown on deathzonewarning until deathzone is activated
	added sleep timer (how long the player will sleep)
	reworked markPlayer: server only inits it and manages markerpositions, markermanipulation is only clientside
	THE RUNNING GAG: fixed (hopefully): players marker is now blue
	configured debriefing
	using backgroundimages
	changed imageformat
	added countdown before teleporting to prevent players walking over mines
	moved most settings from description.ext into a frameworkfile
	fixed a bug in damagesystem
	added countdown before player is teleported

0.8.1
	fixed: crates at start disappear one after the other instead of together
	removed option to refill crates after some time
	added possibility to add weapons, magazines, items, backpacks to a single crate
	refactored all files concerning crates
	defaultloot configurable in hg_params.sqf
	THE RUNNING GAG: fixed (hopefully): players marker
	using explosives interface
	added toolkit to specialbox to use it with explosives interface
	reduced loot in marksmanspecialbox
	fixed: all players look at the weaponbox on teleport on dedicated server



Known Issues:
when dropping an uniform into a crate it is duplicated (MINOR)
clouds moving fast / skipping (MINOR)
ai on dedicated server is not teleported if ordered to stop (WILL NOT FIX)
lag when mines deactivated in editormode (WILL NOT FIX)
supportbox contains items that are not added by my script when running on a dedicated server (WILL NOT FIX)
supplybox contains items that are not added by my script when running on a dedicated server (WILL NOT FIX)
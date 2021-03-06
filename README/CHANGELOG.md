# Changelog
0.8.5
* changed: removed ratingsystem
* changed: completely refactored folderstructure
* added: option to disable NV/TV for vehicles
* removed dead code from ui.h
* fixed: hud disabled when killed
* worked on revivesystem
* added: icon based hud (DayZ)
* added: food & water at spawn (examplemission) to show how it looks like
* added: more localization
* fixed: multiple minor bugs
* added: own post-process-damagesystem
* removed: austin's damagesystem
* README.txt separated in multiple files, now used again and up to date, -> README.md and README folder
* added: mortar backpacks to special items
* added: recommended serversettings
* added: fieldmanual entries (untranslated)
* updated: explosives interface 1.1 fixed
* added: logging
* added: ofpec tag CODI
* refactored folderstructure again
* separated the framework from some parts and released them separately
* added: altis template
* added: altis example

0.8.4
* added: drones
* changed: increased loot in special box
* fixed: bug in localization
* added: new paradrop spots
* chaged: refactored paradropped box to make it more generic and easier to add new boxes
* fixed: undefined variable in initHumanity.sqf (0.8.3.1)
* fixed: several bugs concerning infected wounds in initHumanity.sqf (0.8.3.1)
* added: multiple paradropped boxes
* added: hint if infected/infection healed
* added: localization for infection
* changed: infection adjusted to fit its explanation
* changed: all players are medics from now to fully regenerate health to deny infections and make the medikit better

0.8.3.1 (HOTFIX)(DEPRECATED)
* fixed: syntaxerror in initHumanity.sqf

0.8.3 (DEPRECATED)
* added: localization
* added: full translation to german including sounds
* fixed: vas on startup didnt work
* changed: infected wounds increase temperature
* added: option hg_infectionChance
* merged samplemission with the framework itself to reduce its sice and copy&paste tha data everytime

0.8.2 (Hotfix)
* removed HGFrameworkExample.Startis
* renamed HGFrameworkExampleSmall.Startis to HGFrameworkExample.Startis
* set up github project
* issues moved to github
* readme content moved to github
* added: infected wounds deal damage to players and can only be healed with a medikit
* changed: added Medikits to specialboxes to be able to treat infected wounds
* fixed: impossible to drink and eat (scripterror)

0.8.1 (DEPRECATED)
* fixed: crates at start disappear one after the other instead of together
* removed option to refill crates after some time
* added possibility to add weapons, magazines, items, backpacks to a single crate
* refactored all files concerning crates
* defaultloot configurable in hg_params.sqf
* THE RUNNING GAG: fixed (hopefully): players marker
* using explosives interface
* added toolkit to specialbox to use it with explosives interface
* reduced loot in marksmanspecialbox
* fixed: all players look at the weaponbox on teleport on dedicated server
* drinking and eating needs some time

0.7.12 (0.8.0 RC1)
* fixed: borders are now deactivated on deathzonewarning
* fixed: border markers are removed on deathzonewarning
* added countdown on deathzonewarning until deathzone is activated
* added sleep timer (how long the player will sleep)
* reworked markPlayer: server only inits it and manages markerpositions, markermanipulation is only clientside
* THE RUNNING GAG: fixed (hopefully): players marker is now blue
* configured debriefing
* using backgroundimages
* changed imageformat
* added countdown before teleporting to prevent players walking over mines
* moved most settings from description.ext into a frameworkfile
* fixed a bug in damagesystem
* added countdown before player is teleported

0.7.11
* markPlayer colors defined in hg_variables.sqf
* mockingjaycall not anylonger played on teleport
* mockingjaycall played at end for the winner
* refactored hg_params.h
* refactored hg_variables.sqf
* added first aid kits to all startcrates
* loot configs exported to hg_variables.sqf
* vehicle config exported to hg_variables.sqf
* boat config exported to hg_variables.sqf
* heli config exported to hg_variables.sqf
* new sound happyHungerGames played on teleport
* added an option to set number of guaranteed crates per type
* moved some files into the root folder

0.7.10
* removed boxes at start: grenades, explosives
* removed defaultloot from startboxes
* fixed: border was activated if player died
* fixed: deathzone was activated if player died
* fixed: damagesystem was still active if player is dead
* fixed (hopefully): players marker is now blue

0.7.9
* initialization of deathzone now runs serverside to prevent desync
* deathzone itself continues running clientside (new script, separated from initDeathzone.sqf)
* markPlayers now runs serverside
* marked players are not updated if they are still in the markerrange, so multiple updates would not reveal its position.
* fixed (hopefully): the player itself is not anylonger marked on the map (shall he be marked instead in another color, so he knows where his marker is visiable for other players?)
* fixed: player got stuck sometimes after sleeping
* disabled debug/cheat script

0.7.8
* updated VAS v1.7
* using other font (EtelkaNarrowMediumPro) for hud
* fixed: "0" in countdown not anylonger displayed using hint, now using hintSilent
* optimized initMines.sqf a bit
* fixed: very small bug in sleep.sqf
* set up own simple revive system (not complete)
* using other animations in sleep.sqf
* disabled sleep on missionstart
* using damagesystem
* fixed and improved damagesystem
* using windsystem
* minor changes in windsystem
* added an action to the player to display windinformation
* fixed: backpack was added with wrong command when boxes are refilled

0.7.7
* mines are now removed if "0" is displayed, no longer have to wait 1 second
* added startsounds
* fixed: weight was nearly not used
* fixed: weight reduced rate instead of increasing it
* fixed: mines do not kill a prone player anymore, increased minenumber and radius
* fixed: now using correct default temperature value

0.7.6
* added detailed temperaturesystem
* increased audibility of cannonsound
* now using the weight of the player in the calculation how fast hunger/thirst/fatigue is increased, the more he carries the faster he needs to sleep/eat/drink
* time to reach safezone is displayed when warning message pops up
* now one instance of each cratetype is guaranteed independend of its spawnchance
* fixed: crates did not guaranteed spawn if spawnchance was 100
* fixed: only 9 crates were spawning caused by "at least one instance..."
* decreased thirst/hunger/fatigue rates to fit with the new calculation dependent on player weight

0.7.5
* reworked initDeathzone.sqf

0.7.4
* B_Kitbag_mcamo now available in specialcrate
* V_Rangemaster_belt added as default gear
* fixed: "%" is displayed in hud
* fixed: paradroped items are not anymore spawned on the ground
* upgraded jumpscript v0.4
* noticed clearItemCargoGlobal is bugged, will not fix the issues it creates because bis will
* fixed: backpacks are also removed from crates on (re)spawn
* renamed initRevealPlayers.sqf to initMarkPlayers.sqf
* added a new example mission

0.7.3
* upgraded jumpscript v0.3
* using revealscript (does not respond)
* fixed: players in vehicles are no longer killed by border if they are in the allowed area
* added options to disable VAS at start
* added options to disable paradropped VAS
* fixed: revealscript (mine for playerposition, not austin's) now works on dedicated server
* fixed: marksmanbox does not disappear anylonger if player is within 3m
* fixed: VAS (not that one at start) does not disappear anylonger if player is within 3m
* added description of variables in hg_params.h above each variable
* fixed: Folding Map works again (quick&dirty fix)

0.7.2
* using jumpscript v0.2 (permission received)
* fixed: crates are not refilled anymore if player is within 3 meters
* fixed: bug with lootcrate
* fixed: sleep does not produce errors anymore when executed before teleport
* fixed: no errors are produced anymore if client runs timeacceleration before server
* upgraded =BTC= Revive v0.93

0.7.1
* added a border protection, killing all players leaving the area after some time
* added exclude option for allowed areas
* allowed areas are marked with a markerarea
* disallowed areas are marked with a markerarea
* borders enbled by default (hg_params.h)
* added an option to delete all markers except lootcrates (can already be deleted)
* safezone is now marked with a markerarea
* added borders to examplemission

0.7.0
* initial release

# Features
* Revive
	- revive dead people
* Mag Repack
	- press ctrl+r to repack magazines
* Foldmap
	- press shift+m to show a map
* VAS
	- some supplyboxes are virtual ammoboxes so do not use inventory on them, use "Virtual Ammobox" instead
* Group Management
	- group up with other players, you also can disallow other players to join you
* Remove Dead
	- dead players are removed after some time
* Eat & Drink
	- search food or water barrels and use the action drink/eat
	- if you are to hungry/thirsty you will not be able to run or even get damage over time
	- the faster you move the faster hunger/thirst increases (exponential)
	- the more you carry the faster hunger/thirst increases
* Sleep
	- go prone and use the sleep action
	- if you are to tired you will not be able to run or even will fall asleep
	- the faster you move the faster fatigue increases (exponential)
	- the more you carry the faster fatigue increases
	- the more fatigue you have the longer you will sleep (exponential)
* Bleeding
	- if you have to much damage you get damage over time, heal yourself to stop it
* Timeacceleration
	- time is accelerated with a factor (60 by default -> 1 real life second = 1 ingame minute)
* Marking enemies
	- markers are placed near enemies and updating
* Loot
	- random loot
* Vehicle spawn
	- random spawn of vehicles & boats & helis
* Paradrop
	- some loot and vehicles are paradropped
* Borders
	- each player leaving the allowed area will be killed
	- you can exclude areas from the allowed areas
* Jump
	- press "space" while running to jump
* Temperaturesystem
	- temperature increased during day
	- temperature decreased during night
	- temperature increased if running
	- temperature decreased if walking/standing
	- temperature decreased if in water
	- temperature increased if near burning campfire (no vehicles!)
	- temperature increased if player has infected wound
	- thirst is increased if temperature is high
	- thirst is decreased if temperature is low
	- hunger is increased if temperature is low
	- hunger is decreased if temperature is high
	- damage is dealt if temperature is too high or too low
	- if temperature would change away from normal temperature the change is reduced to obtain stability (excluded: fire, water, infected wounds)
* Configurable
	- highly configurable via mission parameters in hg_params.h or even during missionselection
* HUD
	- minimal custom HUD to show informations like thirst/hunger/...
	- HUD using DayZ icons
* Moveable explosives
	- explosives can be moved
	- drop them by pressing "space"
* Infected wounds
	- wounds can get infected and deal damage over time
	- chance is linear depending to damage
	- infected wounds can be treated with medikit
# Installation
Missionfolder is C:\Documents and Settings\<username>\My Documents\Arma 3\missions\<mission name>.<world Name>
If no one exists, create one called <mission name>.<world Name> (world name is in general "Stratis")(example: survival.Stratis).    
Copy all contents from the HGFramework_0-X-Y folder into your mission folder.  
If you want to see an examplemission you are finish (recommended for first try).  
If you want a minimum mission (recommended for a new mission) rename framework.sqm to mission.sqm, open init.sqf and replace
'''
hg_allowedAreas = [allowed1];
'''
by
'''
hg_allowedAreas = [];
'''  
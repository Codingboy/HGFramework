private ["_caller"];
_caller = _this select 1;

_caller removeAction GRPMNU_groupActions;

GRPMNU_joinGroup = _caller addAction["<t color='#EB7FAF'>Join Group</t>", "scripts\groupsMenu\joinGroup.sqf", nil, -200, false, false, "", "(cursorTarget distance _this) < 4 && (count units group _this) == 1 && side cursorTarget == side _this && (group cursorTarget) getVariable[format[""GRPMNU_allowJoin_%1"", (groupID (group cursorTarget))], true]"];
GRPMNU_leaveGroup = _caller addAction["<t color='#EB7FAF'>Leave Group</t>", "scripts\groupsMenu\leaveGroup.sqf", nil, -200, false, false, "", "(count units group _this) > 1"];
GRPMNU_makeLead = _caller addAction["<t color='#EB7FAF'>Become Group Lead</t>", "scripts\groupsMenu\leadGroup.sqf", nil, -200, false, false, "", "(count units group _this) > 1 && leader group _this != _this"];
GRPMNU_quitLead = _caller addAction["<t color='#EB7FAF'>Step Down as Group Lead</t>", "scripts\groupsMenu\quitLead.sqf", nil, -200, false, false, "", "(count units group _this) > 1 && leader group _this == _this"];
GRPMNU_exitGroup = _caller addAction["<t color='#EB7FAF'>Exit Groups Menu</t>", "scripts\groupsMenu\exitGroup.sqf", nil, -201, false, false, "", "_target == vehicle _this || _target == _this"];
GRPMNU_allowJoin = _caller addAction["<t color='#EB7FAF'>Allow Join</t>", "scripts\groupsMenu\allowJoin.sqf", nil, -200, false, false, "", "leader group _this == _this && !((group _this) getVariable[format[""GRPMNU_allowJoin_%1"", (groupID (group _this))], true])"];
GRPMNU_disallowJoin = _caller addAction["<t color='#EB7FAF'>Disllow Join</t>", "scripts\groupsMenu\disallowJoin.sqf", nil, -200, false, false, "", "leader group _this == _this && (group _this) getVariable[format[""GRPMNU_allowJoin_%1"", (groupID (group _this))], true]"];

if true exitWith {};
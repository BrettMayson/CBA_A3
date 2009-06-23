#include "script_component.hpp"
/*
	MainDisplay KeyHandler, by Sickboy <sb_at_dev-heaven.net>

	Example:
	class CfgSettings { class CBA { class Keys { class sys_attachments { cqb = 33 }; }; }; };

	- Script (in sys_attachments addon (it has COMPONENT defined as sys_attachments)):
	[QUOTE(COMPONENT), "cqb", { _this call GVAR(keyPressed) }] call cba_keys_fAddHandlerFromConfig;
*/
["Initializing...", QUOTE(ADDON), DEBUGSETTINGS] call CBA_fDebug;

GVAR(keys) = [];
for "_i" from 0 to 250 do
{
	GVAR(keys) set [_i, []];
};

private ["_count"];
_count = (count (__cfg)) -1;
GVAR(actions) = "LOGIC" createVehicleLocal [0, 0, 0];

for "_i" from 0 to _count do
{
	_entry = (__cfg) select _i;
	if (isArray(_entry)) then
	{
		GVAR(actions) setVariable [configName _entry, []];
	};
};

// TODO: Evaluate if functions should be loaded on servers!
PREP(fnc_ActionHandler);
PREP(fnc_KeyHandler);
PREPMAIN(fnc_AddActionHandler);
PREPMAIN(fnc_AddKeyHandler);
PREPMAIN(fnc_AddActionHandlerFromConfig);
PREPMAIN(fnc_AddKeyHandlerFromConfig);
PREPMAIN(fnc_ReadActionFromConfig);
PREPMAIN(fnc_ReadKeyFromConfig);

// TODO: Temporary until BI Functions can be preloaded at a normal time!
PREPMAIN(fnc_globalEvent);
PREPMAIN(fnc_remoteEvent);
PREPMAIN(fnc_localEvent);
PREPMAIN(fnc_addEventHandler);

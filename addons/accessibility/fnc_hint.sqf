#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CBA_accessibility_fnc_hint

Description:
    Displays a hint to the player

Parameters:
    _hint - Hint to display <STRING> or <ARRAY>
        0: Hint text <STRING>
        1: Hint duration <NUMBER>
    _source - source of the hint <OBJECT> (optional)

Returns:
    Nothing

Examples:
    (begin example)
        ["Hello World"] call CBA_accessibility_fnc_hint;
    (end)

Author:
    Brett Mayson
---------------------------------------------------------------------------- */

params [
    ["_hint", "", ["", []]],
    ["_source", objNull, [objNull]]
];

if (_hint isEqualType []) then {
    _hint
} else {
    [_hint]
} params [
    ["_text", "", ["", []]],
    ["_duration", GVAR(soundsHintDuration), [0]]
];

if (_text isEqualTo "") exitWith {};

GVAR(hints) pushBack [_text, _source, diag_tickTime + _duration];
if (isNil QGVAR(hintsPFH)) then {
    GVAR(hintsPFH) = [FUNC(showHints)] call CBA_fnc_addPerFrameHandler;
};

[
    QGVAR(hint),
    [
        _text,
        _source,
        _duration
    ]
] call CBA_fnc_localEvent;

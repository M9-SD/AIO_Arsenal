comment "Branch: Official Pub Zeus Compatible (Service Station)";
M9SD_mainCrate_RRR = this;
publicVariable 'M9SD_mainCrate_RRR';
private _faradayCage = M9SD_mainCrate_RRR; 
M9SD_fnc_addFaradayArsenalActions = 
{
	params [['_faradayCage', objNull]];
	if (isNull _faradayCage) exitWith {}; 
	if (_faradayCage getVariable ['M9SD_hasAIOArsenalActions_serviceStation', false]) exitWith {};
	_faradayCage setVariable ['M9SD_hasAIOArsenalActions_serviceStation', true, true];
	if (isNil 'M9SD_AIOArsenal_JIPCount') then 
	{
		M9SD_AIOArsenal_JIPCount = 0;
	};
	M9SD_AIOArsenal_JIPCount = M9SD_AIOArsenal_JIPCount + 1;
	publicVariable 'M9SD_AIOArsenal_JIPCount';
	private _uniqueJIP = format ['M9SD_JIP_AIOArsenalActions_%1', M9SD_AIOArsenal_JIPCount];
	[[_faradayCage, _uniqueJIP],
	{
		if (!hasInterface) exitWith {};
		waitUntil {!isNil {player} && {!isNull player}};
		params [['_faradayCage', objNull], ['_uniqueJIP', '']];
		if (isNull _faradayCage) exitWith {remoteExec ['', _uniqueJIP]};
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='a3\ui_f\data\logos\a_64_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Full Arsenal</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				['Preload'] call BIS_fnc_arsenal;
				comment "['Open', [true]] call BIS_fnc_arsenal; <-- WTF IS THE DIFFERENCE?";
				['Open', true] spawn BIS_fnc_arsenal;
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification1' cutText ["<br/><t color='#ffd700' size='2.1' shadow='2' font='puristaMedium'>AIO Arsenal</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 1;
					if !(isNull findDisplay -1) then 
					{
						'arsenalNotification2' cutFadeOut 0;
						'arsenalNotification2' cutText ["<br/><br/><br/><t color='#00a6ff' size='1.4' shadow='2' font='puristaSemiBold'>by <t color='#00c9ff'>M9-SD</t>", "PLAIN DOWN", -1, true, true];
					};
					uiSleep 7;
					'arsenalNotification1' cutFadeOut 2.1;
					'arsenalNotification2' cutFadeOut 2.1;
				};
				private _arsenalAnims = 
				[
					{player playActionNow "Salute";},
					{[player, 'acts_civilidle_1'] remoteExec ['switchMove'];},
					{[player, 'acts_civilListening_2'] remoteExec ['switchMove'];},
					{[player, 'acts_commenting_on_fight_loop'] remoteExec ['switchMove'];},
					{[player, 'acts_gallery_visitor_01'] remoteExec ['switchMove'];},
					{[player, 'acts_gallery_visitor_02'] remoteExec ['switchMove'];},
					{[player, 'acts_hilltop_calibration_loop'] remoteExec ['switchMove'];},
					{[player, 'acts_kore_talkingoverradio_loop'] remoteExec ['switchMove'];},
					{[player, 'acts_staticPose_photo'] remoteExec ['switchMove'];},
					{player playActionNow 'gear';},
					{[player, 'Acts_Taking_Cover_From_Jets'] remoteExec ['switchMove'];},
					{[player, 'Acts_standingSpeakingUnarmed'] remoteExec ['switchMove'];},
					{player playMoveNow 'acts_Mentor_Freeing_Player';},
					{[player, 'acts_kore_talkingOverRadio_In'] remoteExec ['switchMove'];},
					{[player, 'acts_kore_idleNoWeapon_In'] remoteExec ['switchMove'];},
					{[player, 'Acts_JetsOfficerSpilling'] remoteExec ['switchMove'];},
					{player playMoveNow 'Acts_Hilltop_Calibration_Pointing_Left';},
					{player playMoveNow 'Acts_Hilltop_Calibration_Pointing_Right';},
					{[player, 'Acts_Grieving'] remoteExec ['switchMove'];}
				];
				private _arsenalAnimsAdd = switch (currentWeapon player) do 
				{
					case '': {[]};
					case (primaryWeapon player): 
					{
						[
							{[player, 'acts_briefing_SA_loop'] remoteExec ['switchMove'];},
							{[player, 'acts_getAttention_loop'] remoteExec ['switchMove'];},
							{[player, 'acts_millerIdle'] remoteExec ['switchMove'];},
							{player playMoveNow 'Acts_SupportTeam_Right_ToKneelLoop';},
							{player playMoveNow 'Acts_SupportTeam_Left_ToKneelLoop';},
							{player playMoveNow 'Acts_SupportTeam_Front_ToKneelLoop';},
							{player playMoveNow 'Acts_SupportTeam_Back_ToKneelLoop';},
							{[player, 'Acts_starGazer'] remoteExec ['switchMove'];},
							{player playMoveNow 'acts_RU_briefing_Turn';},
							{player playMoveNow 'acts_RU_briefing_point';},
							{player playMoveNow 'acts_RU_briefing_point_tl';},
							{player playMoveNow 'acts_RU_briefing_move';},
							{[player, 'acts_rifle_operations_zeroing'] remoteExec ['switchMove'];},
							{player playMoveNow 'acts_rifle_operations_right';},
							{player playMoveNow 'acts_rifle_operations_left';},
							{player playMoveNow 'acts_rifle_operations_front';},
							{player playMoveNow 'acts_rifle_operations_checking_chamber';},
							{player playMoveNow 'acts_rifle_operations_barrel';},
							{player playMoveNow 'acts_rifle_operations_back';},
							{player playMoveNow 'acts_pointing_up';},
							{player playMoveNow 'acts_pointing_down';},
							{player playMoveNow 'acts_peering_up';},
							{player playMoveNow 'acts_peering_down';},
							{player playMoveNow 'acts_peering_front';},
							{[player, 'Acts_Helping_Wake_Up_1'] remoteExec ['switchMove'];}
						]
					};
					case (handgunWeapon player): 
					{
						[
							{[player, 'acts_examining_device_player'] remoteExec ['switchMove'];},
							{[player, 'acts_executioner_standingloop'] remoteExec ['switchMove'];},
							{player playMoveNow 'Acts_ViperMeeting_A_End';},
							{player playMoveNow 'Acts_UGV_Jamming_Loop';},
							{player playMoveNow 'Acts_starterPistol_Fire';}
						]
					};
					default {[]};
				};
				_arsenalAnims = _arsenalAnims + _arsenalAnimsAdd;
				private _playAnim = selectRandom _arsenalAnims;
				call _playAnim;
				if !(isNil "M9SD_EH_ResetPlayerAnimsOnArsenalClosed") then 
				{
					(findDisplay 46) displayRemoveEventHandler ['keyDown', M9SD_EH_ResetPlayerAnimsOnArsenalClosed];
				};
				M9SD_EH_ResetPlayerAnimsOnArsenalClosed = (findDisplay 46) displayAddEventHandler ['keyDown', 
				{
					params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
					private _w = 17;
					private _a = 30;
					private _s = 31;
					private _d = 32;
					private _keys = [_w, _a, _s, _d];
					if (_key in _keys) then 
					{
						comment 
						"
						playSound ['addItemOK', true];
						playSound ['addItemOK', false];
						";
						if !(isNil "M9SD_EH_ResetPlayerAnimsOnArsenalClosed") then 
						{
							(findDisplay 46) displayRemoveEventHandler ['keyDown', M9SD_EH_ResetPlayerAnimsOnArsenalClosed];
						};
						player enableSimulation true;
						player playActionNow '';
						player playMoveNow '';
						player switchMove '';
						if (isMultiplayer) then {[player, ''] remoteExec ['switchMove']};
						'arsenalNotification1' cutFadeOut 0;
						'arsenalNotification2' cutFadeOut 0;
						comment 
						"
						playSound ['hintCollapse', true];
						playSound ['hintCollapse', false];
						";
					};
				}];
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this == vehicle _this)", 7]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='\A3\ui_f\data\map\diary\icons\taskCustom_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Copy Loadout</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				player playmovenow 'AinvPknlMstpSnonWnonDnon_1';
				private _nearMen = nearestObjects [player, ['Man'], 21];
				if ((count _nearMen) <= 1) exitWith 
				{
					playSound ['AddItemFailed', true];
					playSound ['AddItemFailed', false];
					0 = [] spawn 
					{
						for '_i' from 1 to 12 do 
						{
							(format ['arsenalNotification%1', _i]) cutFadeOut 0;
						};
						'arsenalNotification8' cutFadeOut 0; 
						'arsenalNotification8' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>ERROR:<br/>No unit is close enough.</t>", "PLAIN DOWN", -1, true, true];
						uiSleep 3.5;
						'arsenalNotification8' cutFadeOut 0.35;
					};
				};
				private _nearestMan = _nearMen # 1;
				private _loadout = getUnitLoadout _nearestMan;
				player setUnitLoadout _loadout;
				private _unitName = name _nearestMan;
				private _notifText = format ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Nearest unit’s loadout copied:<br/><br/><t color='#FFFFFF' font='puristaSemiBold'>“%1”</t>", _unitName];
				0 = _notifText spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification8' cutFadeOut 0; 
					'arsenalNotification8' cutText [_this, "PLAIN DOWN", -1, true, true];
					uiSleep 3.5;
					'arsenalNotification8' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this == vehicle _this)", 7]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_gear_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Empty Loadout</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				player playmovenow 'AinvPknlMstpSnonWnonDnon_1';
				removeAllWeapons player;
				removeAllItems player;
				removeAllAssignedItems player;
				removeUniform player;
				removeVest player;
				removeBackpack player;
				removeHeadgear player;
				removeGoggles player;
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification4' cutFadeOut 0; 
					'arsenalNotification4' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Loadout removed.</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 3.5;
					'arsenalNotification4' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this == vehicle _this)", 7]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='a3\3den\data\displays\Display3DEN\ToolBar\save_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Save Respawn Loadout</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				player playActionNow 'putdown';
				[player, [missionnamespace, "M9SD_arsenalRespawnLoadout"]] call BIS_fnc_saveInventory;
				if (!isNil "M9SD_EH_arsenalRespawnLoadout") then 
				{
					player removeEventHandler ["Respawn", M9SD_EH_arsenalRespawnLoadout];
				};
				M9SD_EH_arsenalRespawnLoadout = player addEventHandler
				[
					"Respawn",
					{
						0 = [] spawn 
						{
							waitUntil {(alive player)};
							sleep 0.07;
							[player, [missionnamespace, "M9SD_arsenalRespawnLoadout"]] call BIS_fnc_loadInventory;
						};
					}
				];
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification6' cutFadeOut 0; 
					'arsenalNotification6' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Respawn loadout set.</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 3.5;
					'arsenalNotification6' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this == vehicle _this)", 7]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='a3\3den\data\displays\Display3DEN\ToolBar\open_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Load Respawn Loadout</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				player playActionNow 'putdown';
				if (isNil 'M9SD_EH_arsenalRespawnLoadout') then 
				{
					playSound ['AddItemFailed', true];
					playSound ['AddItemFailed', false];
					0 = [] spawn 
					{
						for '_i' from 1 to 12 do 
						{
							(format ['arsenalNotification%1', _i]) cutFadeOut 0;
						};
						'arsenalNotification12' cutFadeOut 0; 
						'arsenalNotification12' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>ERROR:<br/>No respawn loadout saved.</t>", "PLAIN DOWN", -1, true, true];
						uiSleep 3.5;
						'arsenalNotification12' cutFadeOut 0.35;
					};
				} else 
				{
					[player, [missionnamespace, "M9SD_arsenalRespawnLoadout"]] call BIS_fnc_loadInventory;
					0 = [] spawn 
					{
						for '_i' from 1 to 12 do 
						{
							(format ['arsenalNotification%1', _i]) cutFadeOut 0;
						};
						'arsenalNotification12' cutFadeOut 0; 
						'arsenalNotification12' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Respawn loadout applied.</t>", "PLAIN DOWN", -1, true, true];
						uiSleep 3.5;
						'arsenalNotification12' cutFadeOut 0.35;
					};
					playSound ['hintExpand', true];
					playSound ['hintExpand', false];
				};
			}, nil, 7777, true, true, "", "(_this == vehicle _this)", 7]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='\a3\3den\data\Cfg3DEN\History\deleteItems_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Delete Respawn Loadout</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				player playActionNow 'putdown';
				if (!isNil "M9SD_EH_arsenalRespawnLoadout") then 
				{
					player removeEventHandler ["Respawn", M9SD_EH_arsenalRespawnLoadout];
				};
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification5' cutFadeOut 0; 
					'arsenalNotification5' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Respawn loadout disabled.</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 3.5;
					'arsenalNotification5' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this == vehicle _this)", 7]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Heal</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				player playActionNow 'Medic';
				[player] call BIS_fnc_reviveEhRespawn;
				player setDamage 0;
				player setUnconscious false;
				player setCaptive false;
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification3' cutFadeOut 0; 
					'arsenalNotification3' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Healing...</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 6.33;
					playSound ['hintCollapse', true];
					playSound ['hintCollapse', false];
					'arsenalNotification3' cutFadeOut 0; 
					'arsenalNotification3' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Healed.</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 3.33;
					'arsenalNotification3' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this == vehicle _this)", 7]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Repair</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				private _soundSource = vehicle player;
				private _range = 28 * 2;
				private _position = getPosWorld _soundSource;
				playSound3D ["a3\sounds_f\sfx\ui\vehicles\vehicle_repair.wss", _soundSource, false, _position, 5, 1, _range];
				playSound3D ["a3\sounds_f_orange\missionsfx\pastambiences\carpenter\orange_carpentershop_tools_02.wss", _soundSource, false, _position, 5, 1, _range];
				[vehicle player, 1] remoteExec ['setVehicleArmor'];
				[vehicle player, 0] remoteExec ['setDamage'];
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification9' cutFadeOut 0; 
					'arsenalNotification9' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Vehicle repaired.</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 3.5;
					'arsenalNotification9' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this != vehicle _this)", 28]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Rearm</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				[vehicle player, 1] remoteExec ['setVehicleAmmo'];
				private _soundSource = vehicle player;
				private _range = 28 * 2;
				private _position = getPosWorld _soundSource;
				playSound3D ["a3\sounds_f\weapons\Mortar\mortar_reload_01.wss", _soundSource, false, _position, 5, 1, _range];
				playSound3D ["a3\sounds_f\weapons\Zafir\zafir_reload.wss", _soundSource, false, _position, 5, 1, _range];
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification10' cutFadeOut 0; 
					'arsenalNotification10' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Vehicle rearmed.</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 3.5;
					'arsenalNotification10' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this != vehicle _this)", 28]
		] remoteExec ['addAction', player, _faradayCage];
		[
			_faradayCage,
			["<t color='#FFFFFF' size='1.4'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\refuel_ca.paa'></img><t color='#ffd700' size='1.4' font='puristaBold'> Refuel</t>", 
			{
				playSound ['beep_target', true];
				playSound ['beep_target', false];
				[vehicle player, 1] remoteExec ['setFuel'];
				private _soundSource = vehicle player;
				private _range = 28 * 2;
				private _position = getPosWorld _soundSource;
				playSound3D ["a3\missions_f_epa\data\sounds\fall_into_water.wss", _soundSource, false, _position, 5, 1, _range];
				playSound3D ["a3\missions_f_oldman\data\sound\refueling\refueling_loop.wss", _soundSource, false, _position, 5, 1, _range];
				playSound3D ["a3\missions_f_oldman\data\sound\refueling\refueling_start.wss", _soundSource, false, _position, 5, 1, _range];
				comment "playSound3D ['a3\missions_f_oldman\data\sound\refueling\refueling_end.wss', _soundSource, false, _position, 5, 1, _range];";
				0 = [] spawn 
				{
					for '_i' from 1 to 12 do 
					{
						(format ['arsenalNotification%1', _i]) cutFadeOut 0;
					};
					'arsenalNotification11' cutFadeOut 0; 
					'arsenalNotification11' cutText ["<t color='#ffd700' font='puristaMedium' shadow='2' size='1.4'>Vehicle refueled.</t>", "PLAIN DOWN", -1, true, true];
					uiSleep 3.5;
					'arsenalNotification11' cutFadeOut 0.35;
				};
				playSound ['hintExpand', true];
				playSound ['hintExpand', false];
			}, nil, 7777, true, true, "", "(_this != vehicle _this)", 28]
		] remoteExec ['addAction', player, _faradayCage];
	}] remoteExec ['spawn', 0, _uniqueJIP];
};
comment "_faradayCage setVariable ['M9SD_hasArsenalActions', false, true];";
[_faradayCage] call M9SD_fnc_addFaradayArsenalActions;
M9SD_fnc_addFaradayMarkers = 
{
	params [['_faradayCage', objNull]];
	if (isNull _faradayCage) exitWith {};
	if (_faradayCage getVariable ['M9SD_hasMarkers', false]) exitWith {};
	_faradayCage setVariable ['M9SD_hasMarkers', true, true];
	if (isNil 'M9SD_Arsenals') then 
	{
		M9SD_Arsenals = [];
	};
	M9SD_Arsenals pushBackUnique _faradayCage;
	publicVariable 'M9SD_Arsenals'; 
	[M9SD_Arsenals,
	{
		if (!hasInterface) exitWith {};
		waitUntil { !isNil { player } && { !isNull player } };
		waitUntil { !isNull (findDisplay 46) };
		if (isNil 'M9SD_Arsenals') then 
		{
			M9SD_Arsenals = _this;
		};
		if (not (isNil 'M9SD_EH_drawArsenal3D')) then 
		{
			removeMissionEventHandler ['Draw3D', M9SD_EH_drawArsenal3D];
		};
		M9SD_EH_drawArsenal3D = addMissionEventHandler ['Draw3D', 
		{
			if (count M9SD_Arsenals == 0) exitWith {};
			{
				if (!isNull _x) then 
				{
					if ((_x == cursorObject) or (_x == cursorTarget)) then 
					{
						if ((_x distance (vehicle player)) <= 28) then 
						{
							private _position = getPos _x;						
							private _offsetX = 0;
							private _offsetY = -0.07;
							private _drawSideArrows = false;
							private _texture = '\A3\ui_f\data\logos\arsenal_1024_ca.paa';
							_position set [2, (_position # 2) + 3.3];
							private _width = 0.8;
							private _height = 0.8;
							private _angle = 0;
							private _text = '';
							private _textSize = 0.05;
							private _font = 'PuristaSemiBold';
							private _textAlign = 'center';
							private _shadow = 2;
							drawIcon3D 
							[
								'\a3\3den\data\displays\display3den\entitymenu\arsenal_ca.paa',
								[1,1,1,1],
								_position,
								_width, 
								_height, 
								_angle,
								'',
								_shadow,
								_textSize,
								_font,
								_textAlign,
								_drawSideArrows,
								_offsetX,
								_offsetY
							];
							M9SD_arsenalIconText = if (player == vehicle player) then {'Virtual Arsenal'} else {'Service Station'};
							drawIcon3D 
							[
								'',
								[1,0.9,0,1],
								_position,
								_width, 
								_height, 
								_angle,
								M9SD_arsenalIconText,
								_shadow,
								_textSize,
								_font,
								_textAlign,
								_drawSideArrows,
								_offsetX,
								_offsetY
							];
						};
					};
				};
			} forEach M9SD_Arsenals;
		}];
		waitUntil {!isNull (findDisplay 12 displayCtrl 51)};
		if (!isNil "M9SD_EH_drawArsenal2D") then 
		{
			(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", M9SD_EH_drawArsenal2D];
		};
		M9SD_EH_drawArsenal2D = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
		{
			if (count M9SD_Arsenals == 0) exitWith {};
			{
				if (!isNull _x) then 
				{
					private _iconPath = 'a3\ui_f\data\logos\a_64_ca.paa';
					M9SD_arsenalIconText = if ((((_this select 0) ctrlMapWorldToScreen (_x modelToWorldVisual [0,0,0])) distance2D getMousePosition) > 0.02) then {""} else {if (player == vehicle player) then {'Virtual Arsenal'} else {'Service Station'}};
					private _pos = _x modelToWorldVisual [0,0,0];
					private _color = [1, 0.9, 0, 1];
					_this select 0 drawIcon
					[
						_iconPath,
						_color,
						_pos,
						20,
						20,
						0,
						M9SD_arsenalIconText,
						1,
						0.05,
						"PuristaBold",
						"left"
					];
					_color = [1,1,1,1];
					_this select 0 drawIcon
					[
						_iconPath,
						_color,
						_pos,
						20,
						20,
						0,
						'',
						1,
						0.05,
						"PuristaSemiBold",
						"left"
					];
				};
			} foreach M9SD_Arsenals;
		}];
	}] remoteExec ['spawn', 0, 'M9SD_JIP_AIOArsenalIcons_serviceStation'];
	comment "
	M9SD_Arsenals = [];
	publicVariable 'M9SD_Arsenals';
	remoteExec ['', 'M9SD_JIP_arsenalIcons_3D'];
	";
};
[_faradayCage] call M9SD_fnc_addFaradayMarkers;
['init',_faradayCage,[10,0,0]] call bis_fnc_3DENAttributeDoorStates;
[_faradayCage, 1, 1] call BIS_fnc_door;
[_faradayCage, 2, 1] call BIS_fnc_door;
[_faradayCage, false] remoteExec ['allowDamage'];
{
	[_x, false] remoteExec ['allowDamage'];
} forEach attachedObjects _faradayCage;
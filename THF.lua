-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.

    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false

    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Haste', 'Acc', 'Eva')
    state.IdleMode:options('Normal', 'Eva')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind !- gs c cycle targetmode')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {hands="Assassin's Armlets +1"}

    sets.ExtraRegen = {}

    sets.Kiting = {
        feet="Trotter's Boots"}

    sets.buff['Sneak Attack'] = {
        head="Hecatomb Cap +1",
        neck="Love Torque",
        ear1="Pixie Earring",
        ear2="Suppanomimi",
        body="Antares Harness",
        hands="Hecatomb Mittens +1",
        ring1="Rajas Ring",
        ring2="Thunder Ring",
        back="Assassin's Cape",
        waist="Warwolf Belt",
        legs="Hecatomb Subligar +1",
        feet="Hecatomb Leggings +1"}

    sets.buff['Trick Attack'] = {
        head="Hecatomb Cap +1",
        neck="Peacock Amulet",
        ear1="Pixie Earring",
        ear2="Suppanomimi",
        body="Antares Harness",
        hands="Hecatomb Mittens +1",
        ring1="Breeze Ring",
        ring2="Breeze Ring",
        back="Assassin's Cape",
        waist="Scouter's Rope",
        legs="War Brais +1",
        feet="Hecatomb Leggings"}

    -- Actions we want to use to tag TH.

    sets.precast.Step = sets.TreasureHunter

    sets.precast.Flourish1 = sets.TreasureHunter

    sets.precast.JA.Provoke = sets.TreasureHunter


    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.precast.RA = {
        head="Optical Hat",
        neck="Peacock Amulet",
        waist="Buccaneer's Belt",
        back="Amemet Mantle +1",
        ring2="Merman's Ring"}

    sets.precast.RA.Acc = {
        head="Optical Hat",
        neck="Peacock Amulet",
        waist="Buccaneer's Belt",
        back="Amemet Mantle +1",
        ring2="Merman's Ring"}

    -- Precast sets to enhance JAs

    sets.precast.JA['Collaborator'] = {}

    sets.precast.JA['Accomplice'] =   {}

    sets.precast.JA['Flee'] = {
        feet="Rogue's Poulaines"}


    sets.precast.JA['Hide'] = {
        body="Rogue's Vest"}

    sets.precast.JA['Steal'] = {
        legs="Assassin's Culottes",
        head="Rogue's Bonnet",
        feet="Rogue's Poulaines",
        hands="Rogue's Armlets",
        neck="Rabbit Charm"}

    sets.precast.JA['Mug'] = {head="Assassin's Bonnet"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']

    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)

    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.

    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
        ear1="Loquacious Earring",
        legs="Homam Cosciales"}

    sets.precast.FC.Utsusemi = {
        ear1="Loquacious Earring",
        legs="Homam Cosciales"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined

    -- Specific weaponskill sets.  Add WS specific gear in between the {}

    sets.precast.WS['Mercy Stroke'] = {
        head="Hecatomb Cap +1",
        neck="Soil Gorget",
        ear1="Brutal Earring",
        ear2="Harmonius Earring",
        body="Hecatomb Harness +1",
        hands="Alkyoneus's Bracelets",
        ring1="Rajas Ring",
        ring2="Toreador's Ring",
        back="Cerberus Mantle +1",
        waist="Warwolf Belt",
        legs="Enkidu's Subligar",
        feet="Hecatomb Leggings +1"}

    sets.precast.WS['Shark Bite'] = {
        head="Hecatomb Cap +1",
        neck="Breeze Gorget",
        ear1="Suppanomimi",
        ear2="Brutal Earring",
        body="Antares Harness",
        hands="Hecatomb Mittens +1",
        ring1="Rajas Ring",
        ring2="Toreador's Ring",
        back="Assassin's Cape",
        waist="Warwolf Belt",
        legs="Hecatomb Subligar +1",
        feet="Hecatomb Leggings +1"}

    sets.precast.WS['Exenterator'] = {
        head="Hecatomb Cap +1",
        neck="Breeze Gorget",
        ear1="Brutal Earring",
        ear2="Suppanomimi",
        body="Antares Harness",
        hands="Hecatomb Mittens +1",
        ring1="Rajas Ring",
        ring2="Toreador's Ring",
        back="Assassin's Cape",
        waist="Scouter's Rope",
        legs="War Brais +1",
        feet="Enkidu's Leggings"}
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Walahra Turban",
        body="Rapparee Harness",
        feet="Homam Gambieras",
        hands="Dusk Gloves +1",
        waist="Velocious Belt",
        legs="Homam Cosciales"}

    -- Specific spells

    sets.midcast.Utsusemi = {
        back="Boxer's Mantle",
        hands="Dusk Gloves +1",
        neck="Evasion Torque",
        head="Walahra Turban",
        body="Rapparee Harness",
        feet="Homam Gambieras",
        waist="Velocious Belt",
        legs="Homam Cosciales"}

    -- Ranged gear

    sets.midcast.RA = {
        head="Optical Hat",
        neck="Peacock Amulet",
        waist="Buccaneer's Belt",
        back="Amemet Mantle +1",
        ring2="Merman's Ring"}

    sets.midcast.RA.Acc = {
        head="Optical Hat",
        neck="Peacock Amulet",
        waist="Buccaneer's Belt",
        back="Amemet Mantle +1",
        ring2="Merman's Ring"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)


    sets.idle = {
        head="Walahra Turban",
        neck="Love Torque",
        ear1="Brutal Earring",
        ear2="Suppanomimi",
        body="Homam Corazza",
        hands="Assassin's Armlets +1",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back="Shadow Mantle",
        waist="Velocious Belt",
        legs="Homam Cosciales",
        feet="Trotter Boots"}

    sets.idle.Eva = {
        head="Optical Hat",
        body="Scorpion Harness +1",
        hands="War Gloves +1",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Evasion Torque",
        waist="Scouter's Rope",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Rajas Ring",
        right_ring="Toreador's Ring",
        back="Boxer's Mantle"}


    -- Defense sets

    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group

    sets.midcast.RA.Acc = {
        head="Optical Hat",
        neck="Peacock Amulet",
        waist="Buccaneer's Belt",
        back="Amemet Mantle +1",
        ring2="Merman's Ring"}


    sets.midcast.RA = {
        head="Optical Hat",
        neck="Peacock Amulet",
        waist="Buccaneer's Belt",
        back="Amemet Mantle +1",
        ring2="Merman's Ring"}


    sets.engaged.Haste = {
        head="Walahra Turban",
        neck="Love Torque",
        ear1="Brutal Earring",
        ear2="Suppanomimi",
        body="Rapparee Harness",
        hands="Dusk Gloves +1",
        ring1="Rajas Ring",
        ring2="Toreador's Ring",
        back="Cerberus Mantle +1",
        waist="Velocious Belt",
        legs="Homam Cosciales",
        feet="Homam Gambieras"}

    sets.engaged.Acc = {
        head="Optical Hat",
        neck="Love Torque",
        ear1="Brutal Earring",
        ear2="Suppanomimi",
        body="Homam Corazza",
        hands="Homam Manopolas",
        ring1="Rajas Ring",
        ring2="Toreador's Ring",
        back="Cuchulain's Mantle",
        waist="Life Belt",
        legs="Homam Cosciales",
        feet="Homam Gambieras"}

    sets.engaged.Eva = {
        head="Optical Hat",
        body="Scorpion Harness +1",
        hands="War Gloves +1",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Evasion Torque",
        waist="Scouter's Rope",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Rajas Ring",
        right_ring="Toreador's Ring",
        back="Boxer's Mantle"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    if spell.english == 'Trick Attack' then
        send_command('@wait 48;input /echo ------- '..spell.english..' is Ready!!!® -------')
    end
    if spell.english == 'Sneak Attack' then
        send_command('@wait 60;input /echo ------- '..spell.english..' is Ready!!! -------')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end

    return idleSet
end


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end

    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'

    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end

    msg = msg .. ':             '

    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS:         ' .. state.WeaponskillMode.value

    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    msg = msg .. ', TH:         ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
    then return true
    end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 2)
    else
        set_macro_page(1, 2)
    end
end

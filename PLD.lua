-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Sentinel = buffactive.sentinel or false
    state.Buff.Cover = buffactive.cover or false
    state.Buff.Doom = buffactive.Doom or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SW', 'Acc', 'WAR')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'Reraise', 'Charm')
    state.MagicalDefenseMode:options('MDT', 'HP', 'Reraise', 'Charm')

    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
    state.EquipShield = M(false, 'Equip Shield w/Defense')

    update_defense_mode()

    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
    send_command('bind @f10 gs c toggle EquipShield')
    send_command('bind @f11 gs c toggle EquipShield')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Holy Circle'] = {feet="Gallant Leggings"}
    sets.precast.JA['Shield Bash'] = {hands="Valor Gauntlets +1"}
    sets.precast.JA['Sentinel'] = {feet="Valor Leggings +1"}
    sets.precast.JA['Rampart'] = {head="Valor Coronet +1"}
    sets.precast.JA['Cover'] = {body="Valor Surcoat +1"}

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}
    sets.precast.Flourish1 = {}

    -- Fast cast sets for spells

    sets.precast.FC = {ear2="Loquacious Earring",legs="Homam Cosciales"}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {head="Hecatomb Cap +1",
        body="Hct. Harness +1",
        hands="Hct. Mittens +1",
        legs="Aurum Cuisses",
        feet="Hct. Leggings +1",
        neck="Soil Gorget",
        waist="Warwolf Belt",
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cerb. Mantle +1"}

    sets.precast.WS.Acc = {head="Hecatomb Cap +1",
        body="Hct. Harness +1",
        hands="Hct. Mittens +1",
        legs="Aurum Cuisses",
        feet="Hct. Leggings +1",
        neck="Soil Gorget",
        waist="Warwolf Belt",
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cerb. Mantle +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Hydra Haubert",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Cerb. Mantle +1"}

    sets.midcast.Enmity = {head="Hydra Salade",
        body="Hydra Haubert",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Hydra Sollerets",
        neck="Ritter Gorget",
        waist="Warwolf Belt",
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Cerb. Mantle +1"}

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {legs="Homam Cosciales",ear2="Loquacious Earring"})

    sets.midcast.Cure = {body="Hydra Haubert",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Cerb. Mantle +1"}

    sets.midcast['Enhancing Magic'] = {}

    sets.midcast.Protect = {}
    sets.midcast.Shell = {}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {}

    sets.resting = {}


    -- Idle sets
    sets.idle ={head="Noturnus Helm",
        body="Kaiser Cuirass",
        hands="Homam Manopolas",
        legs="Blood Cuisses",
        feet="Homam Gambieras",
        neck="Fortitude Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.idle.Town = {main="Hauteclaire",
        sub="Aegis",
        ammo={ name="Bibiki Seashell", augments={'HP recovered while healing +5','MP recovered while healing +5','Spell interruption rate down -2%',}},
        head="Noturnus Helm",
        body="Kaiser Cuirass",
        hands="Homam Manopolas",
        legs="Blood Cuisses",
        feet="Homam Gambieras",
        neck="Fortitude Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.idle.Weak = {}

    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)

    sets.Kiting = {legs="Blood Cuisses"}

    sets.latent_refresh = {}


    --------------------------------------
    -- Defense sets
    --------------------------------------

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {}
    sets.MP_Knockback = {}

    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {} -- Ochain
    sets.MagicalShield = {} -- Aegis

    -- Basic defense sets.

    sets.defense.PDT = {head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Kaiser Cuirass",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.defense.HP = {head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Kaiser Cuirass",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Gigant Mantle"}

    sets.defense.Reraise = {}

    sets.defense.Charm = {}
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = {head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Kaiser Cuirass",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    sets.engaged = {head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Crm. Scale Mail",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Fortitude Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.engaged.SW = {head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        main="Hauteclaire",
        sub="Aegis",
        ammo={ name="Bibiki Seashell", augments={'HP recovered while healing +5','MP recovered while healing +5','Spell interruption rate down -2%',}},
        body="Crm. Scale Mail",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Fortitude Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.engaged.WAR = {head="Nocturnus Helm",
        body="Kaiser Cuirass",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.engaged.Acc = {head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Crm. Scale Mail",
        hands="Homam Manopolas",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Fortitude Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    --[[sets.engaged.DW = {ammo="Ginsen",
        head="Otomi Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Gorney Haubert +1",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Cetl Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}]]--

    --[[sets.engaged.DW.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Gorney Haubert +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Weard Mantle",waist="Zoran's Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}]]--

    sets.engaged.PDT = set_combine(sets.engaged, {left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"})

    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"})


    --[[sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)]]--


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom = {}
    sets.buff.Cover = {body="Valor Surcoat +1"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_midcast(spell, action, spellMap, eventArgs)
    -- If DefenseMode is active, apply that gear over midcast
    -- choices.  Precast is allowed through for fast cast on
    -- spells, but we want to return to def gear before there's
    -- time for anything to hit us.
    -- Exclude Job Abilities from this restriction, as we probably want
    -- the enhanced effect of whatever item of gear applies to them,
    -- and only one item should be swapped out.
    if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
        handle_equipping_gear(player.status)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.ExtraDefenseMode.current)
    if state.EquipShield.value == true then
        classes.CustomDefenseGroups:append(state.DefenseMode.current .. 'Shield')
    end

    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end

    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end

    return meleeSet
end

function customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end

    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end

    if state.Buff.Doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
    end

    return defenseSet
end


function display_current_job_state(eventArgs)
    local msg = 'Melee'

    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end

    msg = msg .. ':                   '

    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS:               ' .. state.WeaponskillMode.value

    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense:      ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.ExtraDefenseMode.value ~= 'None' then
        msg = msg .. ', Extra:        ' .. state.ExtraDefenseMode.value
    end

    if state.EquipShield.value == true then
        msg = msg .. ', Force Equip Shield'
    end

    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC:    '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end

    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and
            player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 11)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 11)
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 11)
    else
        set_macro_page(1, 11)
    end
end

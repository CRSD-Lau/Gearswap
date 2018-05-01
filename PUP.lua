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
    -- List of pet weaponskills to check for
    petWeaponskills = S{"Slapstick", "Knockout", "Magic Mortar",
        "Chimera Ripper", "String Clipper",  "Cannibal Blade", "Bone Crusher", "String Shredder",
        "Arcuballista", "Daze", "Armor Piercer", "Armor Shatterer"}

    -- Map automaton heads to combat roles
    petModes = {
        ['Harlequin Head'] = 'Melee',
        ['Sharpshot Head'] = 'Ranged',
        ['Valoredge Head'] = 'Tank',
        ['Stormwaker Head'] = 'Magic',
        ['Soulsoother Head'] = 'Heal',
        ['Spiritreaver Head'] = 'Nuke'
    }

    -- Subset of modes that use magic
    magicPetModes = S{'Nuke','Heal','Magic'}

    -- Var to track the current pet mode.
    state.PetMode = M{['description']='Pet Mode', 'None', 'Melee', 'Ranged', 'Tank', 'Magic', 'Heal', 'Nuke'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'DPS')
    state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('Evasion')

    -- Default maneuvers 1, 2, 3 and 4 for each pet mode.
    defaultManeuvers = {
        ['Melee'] = {'Fire Maneuver', 'Thunder Maneuver', 'Wind Maneuver', 'Light Maneuver'},
        ['Ranged'] = {'Wind Maneuver', 'Fire Maneuver', 'Thunder Maneuver', 'Light Maneuver'},
        ['Tank'] = {'Earth Maneuver', 'Dark Maneuver', 'Light Maneuver', 'Wind Maneuver'},
        ['Magic'] = {'Ice Maneuver', 'Light Maneuver', 'Dark Maneuver', 'Earth Maneuver'},
        ['Heal'] = {'Light Maneuver', 'Dark Maneuver', 'Water Maneuver', 'Earth Maneuver'},
        ['Nuke'] = {'Ice Maneuver', 'Dark Maneuver', 'Light Maneuver', 'Earth Maneuver'}
    }

    update_pet_mode()
    select_default_macro_book()
end


-- Define sets used by this job file.
function init_gear_sets()

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        ear1="Loquacious Earring",
        feet="Rostrum Pumps"}

    sets.precast.FC.Utsusemi = {
        ear1="Loquacious Earring",
        feet="Rostrum Pumps"}


    -- Precast sets to enhance JAs
    sets.precast.JA['Repair'] = {feet="Puppetry Babouches",range="Animator +1",
        ammo="Automat. Oil +2"}

    sets.precast.JA['Reward'] = {ammo="Pet Food Zeta"}

    sets.precast.JA.Maneuver = {neck="Buffoon's Collar +1",hands="Puppetry Dastanas",range="Animator +1",
        ammo="Automat. Oil +2"}



    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Mahatma Hpl.",
        hands="Pantin Dastanas +1",
        legs="Pup. Churidars",
        feet="Hermes' Sandals +1",
        neck="Orochi Nodowa",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back={ name="Prism Cape", augments={'Mag. Acc.+4',}}}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Gnadbhod's Helm",
        body="Enkidu's Harness",
        hands="Enkidu's Mittens",
        legs="Pantin Churidars",
        feet="Enkidu's Leggings",
        neck="Orochi Nodowa",
        waist="Life Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Asuran Fists'] = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Gnadbhod's Helm",
        body="Enkidu's Harness",
        hands="Enkidu's Mittens",
        legs="Pantin Churidars",
        feet="Enkidu's Leggings",
        neck="Soil Gorget",
        waist="Life Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    sets.precast.WS['Victory Smite'] = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Gnadbhod's Helm",
        body="Enkidu's Harness",
        hands="Enkidu's Mittens",
        legs="Pantin Churidars",
        feet="Enkidu's Leggings",
        neck="Breeze Gorget",
        waist="Life Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    -- Midcast Sets

    sets.midcast.FastRecast = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Antares Harness",
        hands="Pantin Dastanas +1",
        legs="Pantin Churidars",
        feet="Enkidu's Leggings",
        neck="Evasion Torque",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {legs="Puppetry Churidars"}

    sets.midcast.Pet['Elemental Magic'] = {legs="Pantin Churidars"}

    sets.midcast.Pet.WeaponSkill = {body="Pantin Tobe +1",}

    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Puppetry Taj",
        body="Pantin Tobe +1",
        hands="Pantin Dastanas +1",
        legs="Pantin Churidars +1",
        feet="Hermes' Sandals +1",
        neck="Orochi Nodowa",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    -- Idle sets

    sets.idle = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Pantin Taj +1",
        body="Pantin Tobe +1",
        hands="Pantin Dastanas +1",
        legs="Barborossa Zerehs",
        feet="Hermes' Sandals +1",
        neck="Orochi Nodowa +1",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    sets.idle.Town = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Pantin Taj +1",
        body="Pantin Tobe +1",
        hands="Pantin Dastanas +1",
        legs="Pantin Churidars +1",
        feet="Hermes' Sandals +1",
        neck="Orochi Nodowa +1",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = sets.idle

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {}

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {})

    sets.idle.Pet.Engaged.Nuke = set_combine(sets.idle.Pet.Engaged, {})

    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})


    -- Defense sets

    sets.defense.Evasion = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Optical Hat",
        body="Antares Harness",
        hands="Pantin Dastanas +1",
        legs="Pantin Churidars",
        feet="Hermes' Sandals +1",
        neck="Evasion Torque",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    sets.Kiting = {feet="Hermes' Sandals +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG:                         sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Pantin Tobe +1",
        hands="Pantin Dastanas +1",
        legs="Pantin Churidars",
        feet="Hermes' Sandals +1",
        neck="Faith Torque",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    sets.engaged.Acc = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head="Enkidu's Cap",
        body="Pantin Tobe +1",
        hands="Enkidu's Mittens",
        legs="Pantin Churidars",
        feet="Hermes' Sandals +1",
        neck="Peacock Amulet",
        waist="Life Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Toreador's Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    sets.engaged.DPS = {
        range="Animator +1",
        ammo="Automat. Oil +2",
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Enkidu's Harness",
        hands="Pantin Dastanas +1",
        legs="Enkidu's Subligar",
        feet="Enkidu's Leggings",
        neck="Faith Torque",
        waist="Swift Belt",
        left_ear="Brutal Earring",
        right_ear="Ethereal Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when pet is about to perform an action
function job_pet_midcast(spell, action, spellMap, eventArgs)
    if petWeaponskills:contains(spell.english) then
        classes.CustomClass = "Weaponskill"
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == 'Wind Maneuver' then
        handle_equipping_gear(player.status)
    end
end

-- Called when a player gains or loses a pet.
-- pet == pet gained or lost
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(pet, gain)
    update_pet_mode()
end

-- Called when the pet's status changes.
function job_pet_status_change(newStatus, oldStatus)
    if newStatus == 'Engaged' then
        display_pet_status()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_pet_mode()
end


-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_pet_status()
end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'maneuver' then
        if pet.isvalid then
            local man = defaultManeuvers[state.PetMode.value]
            if man and tonumber(cmdParams[2]) then
                man = man[tonumber(cmdParams[2])]
            end

            if man then
                send_command('input /pet "'..man..'" <me>')
            end
        else
            add_to_chat(123,'No valid pet.')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Get the pet mode value based on the equipped head of the automaton.
-- Returns nil if pet is not valid.
function get_pet_mode()
    if pet.isvalid then
        return petModes[pet.head] or 'None'
    else
        return 'None'
    end
end

-- Update state.PetMode, as well as functions that use it for set determination.
function update_pet_mode()
    state.PetMode:set(get_pet_mode())
    update_custom_groups()
end

-- Update custom groups based on the current pet.
function update_custom_groups()
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        classes.CustomIdleGroups:append(state.PetMode.value)
    end
end

-- Display current pet status.
function display_pet_status()
    if pet.isvalid then
        local petInfoString = pet.name..' ['..pet.head..']: '..tostring(pet.status)..'  TP='..tostring(pet.tp)..'  HP%='..tostring(pet.hpp)

        if magicPetModes:contains(state.PetMode.value) then
            petInfoString = petInfoString..'  MP%='..tostring(pet.mpp)
        end

        add_to_chat(122,petInfoString)
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 10)
    elseif player.sub_job == 'DNC' then
        set_macro_page(3, 10)
    elseif player.sub_job == 'SCH' then
        set_macro_page(5, 10)
    else
        set_macro_page(1, 10)
    end
end

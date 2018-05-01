-------------------------------------------------------------------------------------------------------------------
-- Lau's Custom ERA BLM Lua -- Based on 75 Cap Private Server --
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
		Ctrl + = Cycles through the available treasure hunter modes.
		Ctrl + F11 Toggles Resistance & Normal Sets.
		Ctrl + F12 Toggles Idle Sets.
		Alt + Tilde Toggles Magic Burst On/Off

	Treasure hunter modes:
        None - Will never equip TH gear.
        Tag - Will equip Lotus Katana along with Elemental Magic skill gear everytime Magic is cast.
--]]

-- Initialization function for this job file --

function get_sets()
    mote_include_version = 2

    sets.obi = {
        Fire = {waist="Karin Obi"},
        Earth = {waist="Dorin Obi"},
        Water = {waist="Suirin Obi"},
        Wind = {waist="Furin Obi"},
        Ice = {waist="Hyorin Obi"},
        Lightning = {waist="Rairin Obi"},
        Light = {waist="Korin Obi"},
        Dark = {waist="Anrin Obi"}}

    sets.staff = {
        Fire = {main="Chatoyant Staff"},
        Earth = {main="Chatoyant Staff"},
        Water = {main="Chatoyant Staff"},
        Wind = {main="Chatoyant Staff"},
        Ice = {main="Chatoyant Staff"},
        Lightning = {main="Chatoyant Staff"},
        Light = {main="Chatoyant Staff"},
        Dark = {main="Chatoyant Staff"}}

    sets.grips = {
        Fire = {sub="Fire Grip"},
        Earth = {sub="Earth Grip"},
        Water = {sub="Water Grip"},
        Wind = {sub="Wind Grip"},
        Ice = {sub="Ice Grip"},
        Lightning = {sub="Thunder Grip"},
        Light = {sub="Light Grip"},
        Dark = {sub="Dark Grip"}}

    sets.tonban = {
        legs="Sorcerer's Tonban +1"}

    sets.boots = {
        feet="Marabout Sandals"}

    -- Load and initialize the include file --
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent -- state.Buff vars initialized here will automatically be tracked --

function job_setup()
    include('Mote-TreasureHunter')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job -- Recommend that these be overridden in a sidecar file --
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent -- Can override this function in a sidecar file --

function user_setup()
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'Refresh', 'Nuke','NukeRes', 'Dark', 'Debuff', 'Enfeeb', 'Show')
    state.MagicBurst = M(false, 'Magic Burst')

    -- Additional local binds --
    send_command('bind ^= gs c cycle TreasureMode')
    send_command('bind ^` gs c toggle MagicBurst')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change) --

function user_unload()
    send_command('unbind ^`')
    send_command('unbind ^=')
end

-- Define sets and vars used by this job file --

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets --
    --------------------------------------

    ---- Precast Set ----

    sets.precast.FC = {
        ear1="Loquacious Earring",
        feet="Rostrum Pumps"}

    ---- Yellowing Set ----

    sets.precast.FC['Elemental Magic'] = {
        head="Zenith Crown",
        body="Dalmatica",
        hands="Zenith Mitts +1",
        legs="Zenith Slacks",
        left_ring="Ether Ring",
        back="Ixion Cape",
        right_ring="Astral Ring",
        ear1="Loquacious Earring",
        feet="Rostrum Pumps"}

    ---- Precast Shadows ----

    sets.precast.FC.Utsusemi = {
        ear1="Loquacious Earring",
        feet="Rostrum Pumps"}

    ---- Midcast Sets ----

    sets.TreasureHunter = {
        main="Lotus Katana",
        hands="Wizard's Gloves +1",
        neck="Lemegeton medallion +1",
        ammo="Sturm's Report"}

    sets.midcast.Utsusemi = {
        head="Walahra Turban",
        ear1="Loquacious Earring",
        body="Nashira Manteel",
        feet="Rostrum Pumps"}

    sets.midcast.Cure = {
        main="Chatoyant Staff",sub="Raptor Leather Strap +1",
        body="Nashira Manteel",
        head="Walahra Turban",
        hands="Bricta's Cuffs",
        back="Altruistic Cape",
        legs="Mahatma Slops",
        ring1="Star Ring",
        ring2="Tamas Ring",
        ear1="Celestial Earring",
        ear2="Static Earring",
        feet="Mahatma Pigaches",
        ammo="Phtm. Tathlum",
        neck="Fylgja Torque +1",
        waist="Witch Sash"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        main="Chatoyant Staff",sub="Raptor Leather Strap +1",
        head="Walahra Turban",
        hands="Bricta's Cuffs",
        body="Nashira Manteel",
        back="Merciful Cape",
        legs="Mahatma Slops",
        ring1="Snow Ring",
        ring2="Tamas Ring",
        ear1="Loquacious Earring",
        ear2="Static Earring",
        ammo="Phtm. Tathlum",
        feet="Genie Huaraches",
        neck="Faith Torque",
        waist="Penitent's Rope"}

    sets.midcast.Stoneskin = {
        main="Kirin's Pole",sub="Raptor Leather Strap +1",
        head="Walahra Turban",
        body="Mahatma Houppelande",
        back="Ixion Cape",
        hands="Bricta's Cuffs",
        legs="Mahatma Slops",
        ring1="Star Ring",
        ring2="Tamas Ring",
        ear1="Celestial Earring",
        ammo="Phtm. Tathlum",
        ear2="Static Earring",
        feet="Genie Huaraches",
        neck="Faith Torque",
        waist="Penitent's Rope"}

    sets.midcast.IntEnfeebles =  {
        main="Chatoyant Staff",
        head="Genie Tiara",
        waist="Witch Sash",
        body="Wizard's Coat +1",
        legs="Igqira Lappas",
        hands="Oracle's Gloves",
        neck="Enfeebling Torque",
        ring1="Snow Ring",
        ring2="Tamas Ring",
        ear2="Abyssal Earring",
        ammo="Sturm's Report",
        ear1="Loquacious Earring",
        back="Altruistic Cape",
        feet="Avocat Pigaches"}

    sets.midcast.MndEnfeebles =  {
        main="Chatoyant Staff",
        head="Genie Tiara",
        waist="Witch Sash",
        body="Wizard's Coat +1",
        legs="Igqira Lappas",
        hands="Bricta's Cuffs",
        neck="Enfeebling Torque",
        ring1="Star Ring",
        ring2="Tamas Ring",
        ear2="Static Earring",
        ammo="Sturm's Report",
        ear1="Celestial Earring",
        back="Altruistic Cape",
        feet="Avocat Pigaches"}

    sets.midcast.ElementalEnfeeble = {
        main="Chatoyant Staff",
        head="Sorcerer's Petasos +1",
        body="Sorcerer's Coat +1",
        hands="Wizard's Gloves +1",
        waist="Witch Sash",
        back="Merciful Cape",
        legs="Mahatma Slops",
        neck="Elemental Torque",
        ring1="Snow Ring",
        ammo="Sturm's Report",
        ring2="Tamas Ring",
        ear2="Abyssal Earring",
        ear1="Loquacious Earring",
        feet="Sorcerer's Sabots +1"}

    sets.midcast['Dark Magic'] = {
        main="Chatoyant Staff",sub="Dark Grip",
        head="Nashira Turban",
        waist="Witch Sash",
        body="Nashira Manteel",
        legs="Wizard's Tonban",
        hands="Sorcerer's Gloves +1",
        neck="Dark Torque",
        ring1="Omega Ring",
        back="Merciful Cape",
        ring2="Tamas Ring",
        ammo="Sturm's Report",
        ear2="Abyssal Earring",
        ear1="Loquacious Earring",
        feet="Genie Huaraches"}

    -- Nuking Sets -- Ctrl + F11 Toggles Resistance & Normal Sets --

    sets.midcast['Elemental Magic'] = {
        main="Claustrum",sub="Bugard Leather Strap +1",
        head="Sorcerer's Petasos +1",
        neck="Uggalepih Pendant",
        body="Genie Weskit",
        hands="Zenith Mitts +1",
        waist="Witch Sash",
        back="Hecate's Cape",
        legs="Mahatma Slops",
        ring2="Tamas Ring",
        ring1="Sorcerer's Ring",
        ear1="Novio Earring",
        ammo="Phtm. Tathlum",
        ear2="Moldavite Earring",
        feet="Sorcerer's Sabots +1"}

    sets.midcast['Elemental Magic'].Resistant = {
        main="Claustrum",
        head="Sorcerer's Petasos +1",
        neck="Lemegeton medallion +1",
        body="Genie Weskit",
        hands="Wizard's Gloves +1",
        waist="Witch Sash",
        back="Prism Cape",
        legs="Mahatma Slops",
        ring2="Tamas Ring",
        ring1="Sorcerer's Ring",
        ear1="Novio Earring",
        ear2="Moldavite Earring",
        ammo="Sturm's Report",
        feet="Sorcerer's Sabots +1"}

    -- Resting Set --

    sets.resting = {
        main="Claustrum",sub="Bugard Leather Strap +1",
        body="Oracle's Robe",
        waist="Qiqirn Sash +1",
        neck="Beak Necklace +1",
        hands="Oracle's Gloves",
        legs="Oracle's Braconi",
        ear2="Relaxing Earring",
        ear1="Rapture Earring",
        head="Oracle's Cap",
        ring1="Star Ring",
        ring2="Star Ring",
        feet="Avocat Pigaches",
        ammo="Bibiki Seashell"}

    -- Idle Set --

    sets.idle = {
        main="Claustrum",sub="Bugard Leather Strap +1",
        body="Dalmatica +1",
        ear1="Loquacious Earring",
        ear2="Static Earring",
        neck="Orochi Nodowa +1",
        waist="Witch Sash",
        back="Shadow Mantle",
        legs="Jet Seraweels",
        head="Sorcerer's Petasos +1",
        hands="Zenith Mitts +1",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        feet="Herald's Gaiters",
        ammo="Bibiki Seashell"}

    -- Ctrl + F12 Toggles -- To show people my sets. --

    sets.idle.Refresh = {
        main="Claustrum",sub="Bugard Leather Strap +1",
        body="Dalmatica",
        ear1="Loquacious Earring",
        ear2="Static Earring",
        neck="Orochi Nodowa",
        waist="Witch Sash",
        back="Hexerei Cape",
        legs="Jet Seraweels",
        head="Sorcerer's Petasos +1",
        hands="Zenith Mitts +1",
        ring1="Defending Ring",
        ring2="Tamas Ring",
        feet="Herald's Gaiters",
        ammo="Bibiki Seashell"}

    sets.idle.Enfeeb =  {
        main="Chatoyant Staff",
        head="Genie Tiara",
        waist="Witch Sash",
        body="Wizard's Coat",
        legs="Igqira Lappas",
        hands="Oracle's Gloves",
        neck="Enfeebling Torque",
        ring1="Snow Ring",
        ring2="Tamas Ring",
        ear2="Abyssal Earring",
        ammo="Phtm. Tathlum",
        ear1="Loquacious Earring",
        back="Altruistic Cape",
        feet="Avocat Pigaches"}

    sets.idle.Debuff = {
        main="Chatoyant Staff",sub="Thunder Grip",
        head="Sorcerer's Petasos +1",
        body="Sorcerer's Coat +1",
        hands="Wizard's Gloves +1",
        waist="Witch Sash",
        back="Merciful Cape",
        legs="Mahatma Slops",
        neck="Elemental Torque",
        ring1="Snow Ring",
        ammo="Phtm. Tathlum",
        ring2="Tamas Ring",
        ear2="Abyssal Earring",
        ear1="Loquacious Earring",
        feet="Sorcerer's Sabots +1"}

    sets.idle.Dark = {
        main="Chatoyant Staff",sub="Dark Grip",
        head="Nashira Turban",
        waist="Witch Sash",
        body="Nashira Manteel",
        legs="Wizard's Tonban",
        hands="Sorcerer's Gloves +1",
        neck="Dark Torque",
        ring1="Omega Ring",
        back="Merciful Cape",
        ring2="Tamas Ring",
        ammo="Sturm's Report",
        ear2="Abyssal Earring",
        ear1="Loquacious Earring",
        feet="Genie Huaraches"}

    sets.idle.Nuke = {
        main="Claustrum",sub="Bugard Leather Strap +1",
        head="Sorcerer's Petasos +1",
        neck="Uggalepih Pendant",
        body="Genie Weskit",
        hands="Zenith Mitts +1",
        waist="Witch Sash",
        back="Hecate's Cape",
        legs="Mahatma Slops",
        ring2="Tamas Ring",
        ring1="Sorcerer's Ring",
        ear1="Novio Earring",
        ammo="Phtm. Tathlum",
        ear2="Moldavite Earring",
        feet="Sorcerer's Sabots +1"}

    sets.idle.NukeRes = {
        main="Claustrum",sub="Thunder Grip",
        head="Sorcerer's Petasos +1",
        neck="Lemegeton medallion +1",
        body="Genie Weskit",
        hands="Wizard's Gloves +1",
        waist="Witch Sash",
        back="Prism Cape",
        legs="Mahatma Slops",
        ring2="Tamas Ring",
        ring1="Sorcerer's Ring",
        ear1="Novio Earring",
        ear2="Moldavite Earring",
        ammo="Sturm's Report",
        feet="Sorcerer's Sabots +1"}

    sets.idle.Show = {
        main="Claustrum",sub="Bugard Leather Strap +1",
        ammo="Sturm's Report",
        head="Nashira Turban",
        body="Nashira Manteel",
        hands="Zenith Mitts +1",
        legs="Shadow Trews",
        feet="Herald's Gaiters",
        neck="Uggalepih Pendant",
        waist="Witch Sash",
        left_ear="Novio Earring",
        right_ear="Static Earring",
        left_ring="Defending Ring",
        right_ring="Sorcerer's Ring",
        back="Ixion Cape"}


    -- Magic Burst Set -- Alt + Tilde Toggles Magic Burst On/Off --

    sets.magicburst = {
        main="Claustrum",sub="Bugard Leather Strap +1",
        head="Demon Helm +1",
        hands="Sorcerer's Gloves +1",
        legs="Shadow Trews",
        ear2="Static Earring"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events --
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done --

-- Run after the general precast() is done.

function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == "Magic" then
        equip(sets.grips[spell.element])
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.obi[spell.element])
        end
    end
    if spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
        if spell.element == world.weather_element then
            equip(sets.staff[spell.element])
        end
    end
    if spell.skill == 'Elemental Magic' and world.day_element == 'Fire' then
        equip(sets.boots)
    end
    if spell.action_type == "Magic" and state.TreasureMode.value == 'Tag' then
        equip(sets.TreasureHunter)
        equip(sets.grips[spell.element])
    end
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magicburst)
    end
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element then
            equip(sets.tonban)
        end
    end
end

function job_aftercast(spell)
    if spell.english == 'Drain' or spell.english == 'Aspir' then
        send_command('@wait 50;input /echo ------- '..spell.english..' is Ready!!! -------')
    end
    if spell.english == 'Stun' then
        send_command('@wait 37;input /echo ------- '..spell.english..' is Ready!!! -------')
    end
    if spell.english == 'Sleep' or spell.english == 'Sleepga' then
        send_command('@wait 50;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
        send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        send_command('@wait 57;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
    elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
        send_command('@wait 80;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
        send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        send_command('@wait 87;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
    end
end

function job_state_change(stateField, newValue, oldValue)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events --
-------------------------------------------------------------------------------------------------------------------

-- gain == true if the buff was gained, false if it was lost --

function job_buff_change(buff, gain)
    if buff == 'Silence' and gain == true then
        send_command('@input /item "Echo Drops" <me>')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions --
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping --

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        end
    end
end

function display_current_job_state(eventArgs)
    msg = msg .. 'Casting'
    msg = msg .. ':     [' .. state.CastingMode.value .. '], '
    msg = msg .. 'Idle'
    msg = msg .. ':     [' .. state.IdleMode.value .. '], '

    if state.MagicBurst.value == true then
        msg = msg .. 'Magic Burst: [On]'
    elseif state.MagicBurst.value == false then
        msg = msg .. 'Magic Burst: [Off]'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-- Function to display the current relevant user state when doing an update --

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job --
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change --

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'RDM' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'SCH' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'WHM' then
        set_macro_page(5, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(6, 3)
    else
        set_macro_page(1, 2)
    end
end

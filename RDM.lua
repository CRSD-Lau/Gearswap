-------------------------------------------------------------------------------------------------------------------
-- Lau's Custom ERA RDM Lua -- 75 Cap Server --
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
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

    sets.grips = {
        Fire = {sub="Fire Grip"},
        Earth = {sub="Earth Grip"},
        Water = {sub="Water Grip"},
        Wind = {sub="Wind Grip"},
        Ice = {sub="Ice Grip"},
        Lightning = {sub="Thunder Grip"},
        Light = {sub="Light Grip"},
        Dark = {sub="Dark Grip"}}

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal')

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    sets.precast.FC = {
        head="Warlock's Chapeau +1",
        ear1="Loquacious Earring",
        body="Duelist's Tabard +1"}

    -- Weaponskill sets

    sets.precast.WS = {}

    -- Midcast Sets

    sets.midcast.FastRecast = {
        head="Walahra Turban",
        body="Nashira Manteel",
        waist="Velocious belt",
        hands="Dusk Gloves +1"}

    sets.midcast.Utsusemi = {
        head="Walahra Turban",
        body="Nashira Manteel",
        waist="Velocious belt",
        hands="Dusk Gloves +1"}

    sets.midcast.Cure = {
        main="Chatoyant Staff",
        sub="Raptor Strap +1",
        ammo="Phtm. Tathlum",
        head="Nashira Turban",
        body="Duelist's Tabard +1",
        hands="Bricta's Cuffs",
        legs="Warlock's Tights",
        feet="Mahatma Pigaches",
        neck="Fylgia Torque +1",
        waist="Witch Sash",
        left_ear="Celestial Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Altruistic Cape"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        main="Chatoyant Staff",
        ammo="Phtm. Tathlum",
        head="Walahra Turban",
        body="Nashira Manteel",
        hands="Duelist's Gloves +1",
        legs="Warlock's Tights",
        feet="Mahatma Pigaches",
        neck="Faith Torque",
        waist="Velocious Belt",
        left_ear="Celestial Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Prism Cape"}

    sets.midcast.Stoneskin = {
        main="Chatoyant Staff",
        sub="Raptor Strap +1",
        ammo="Phtm. Tathlum",
        head="Duelist's Chapeau +1",
        body="Mahatma Hpl.",
        hands="Duelist's Gloves +1",
        legs="Warlock's Tights",
        feet="Mahatma Pigaches",
        neck="Faith Torque",
        waist="Penitent's Rope",
        left_ear="Celestial Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Prism Cape"}

    sets.midcast.IntEnfeebles = {
        main="Chatoyant Staff",
        ammo="Sturm's Report",
        head="Duelist's Chapeau +1",
        body="Warlock's Tabard +1",
        hands="Duelist's Gloves +1",
        legs="Nashira Seraweels",
        feet="Avocat Pigaches",
        neck="Enfeebling Torque",
        waist="Witch Sash",
        left_ear="Loquac. Earring",
        right_ear="Abyssal Earring",
        left_ring="Tamas Ring",
        right_ring="Snow Ring",
        back="Altruistic Cape"}

    sets.midcast.MndEnfeebles = {
        main="Chatoyant Staff",
        ammo="Sturm's Report",
        head="Duelist's Chapeau +1",
        body="Warlock's Tabard +1",
        hands="Bricta's Cuffs",
        legs="Nashira Seraweels",
        feet="Avocat Pigaches",
        neck="Enfeebling Torque",
        waist="Witch Sash",
        left_ear="Celestial Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Altruistic Cape"}

    sets.midcast['Haste'] = {
        main="Seveneyes",
        sub="Genbu's Shield",
        ammo="Phtm. Tathlum",
        head="Walahra Turban",
        body="Nashira Manteel",
        hands="Dusk Gloves +1",
        legs="Blood Cuisses",
        feet="Mahatma Pigaches",
        neck="Enfeebling Torque",
        waist="Velocious Belt",
        left_ear="Loquac. Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Altruistic Cape"}

    sets.midcast['Refresh'] = {
        main="Seveneyes",
        sub="Genbu's Shield",
        ammo="Phtm. Tathlum",
        head="Walahra Turban",
        body="Nashira Manteel",
        hands="Dusk Gloves +1",
        legs="Blood Cuisses",
        feet="Mahatma Pigaches",
        neck="Enfeebling Torque",
        waist="Velocious Belt",
        left_ear="Loquac. Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Altruistic Cape"}

    sets.midcast['Regen'] = {
        main="Seveneyes",
        sub="Genbu's Shield",
        ammo="Phtm. Tathlum",
        head="Walahra Turban",
        body="Nashira Manteel",
        hands="Dusk Gloves +1",
        legs="Blood Cuisses",
        feet="Mahatma Pigaches",
        neck="Enfeebling Torque",
        waist="Velocious Belt",
        left_ear="Loquac. Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Altruistic Cape"}

    sets.midcast['Protect IV'] = {
        main="Seveneyes",
        sub="Genbu's Shield",
        ammo="Phtm. Tathlum",
        head="Walahra Turban",
        body="Nashira Manteel",
        hands="Dusk Gloves +1",
        legs="Blood Cuisses",
        feet="Mahatma Pigaches",
        neck="Enfeebling Torque",
        waist="Velocious Belt",
        left_ear="Loquac. Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Altruistic Cape"}

    sets.midcast['Shell IV'] = {
        main="Seveneyes",
        sub="Genbu's Shield",
        ammo="Phtm. Tathlum",
        head="Walahra Turban",
        body="Nashira Manteel",
        hands="Dusk Gloves +1",
        legs="Blood Cuisses",
        feet="Mahatma Pigaches",
        neck="Enfeebling Torque",
        waist="Velocious Belt",
        left_ear="Loquac. Earring",
        right_ear="Static Earring",
        left_ring="Tamas Ring",
        right_ring="Aqua Ring",
        back="Altruistic Cape"}

    sets.midcast['Elemental Magic'] = {
        main="Chatoyant Staff",
        ammo="Sturm's Report",
        head="Warlock's Chapeau +1",
        body="Mahatma Hpl.",
        hands="Zenith Mitts +1",
        legs="Duelist's Tights +1",
        feet="Duelist's Boots",
        neck="Lemegeton Medallion +1",
        waist="Witch Sash",
        left_ear="Novio Earring",
        right_ear="Moldavite Earring",
        left_ring="Tamas Ring",
        right_ring="Snow Ring",
        back="Merciful Cape"}

    sets.midcast['Dark Magic'] = {
        main="Chatoyant Staff",
        ammo="Sturm's Report",
        head="Nashira Turban",
        body="Nashira Manteel",
        hands="Crimson Fng. Gnt.",
        legs="Shadow Trews",
        feet="Mahatma Pigaches",
        neck="Dark Torque",
        waist="Witch Sash",
        left_ear="Loquac. Earring",
        right_ear="Abyssal Earring",
        left_ring="Tamas Ring",
        right_ring="Omega Ring",
        back="Merciful Cape"}

    sets.midcast.Stun = sets.midcast['Dark Magic']

    sets.midcast.Drain = sets.midcast['Dark Magic']

    sets.midcast.Aspir = sets.midcast['Dark Magic']

    -- Resting sets

    sets.resting = {
        main="Chatoyant Staff",
        sub="Raptor Strap +1",
        ammo="Bibiki Seashell",
        head="Duelist's Chapeau +1",
        body="Dalmatica +1",
        hands="Hydra Gloves",
        legs="Baron's Slops",
        feet="Avocat Pigaches",
        neck="Beak Necklace +1",
        waist="Qiqirn Sash +1",
        left_ear="Rapture Earring",
        right_ear="Relaxing Earring",
        left_ring="Star Ring",
        right_ring="Star Ring",
        back="Prism Cape"}


    -- Idle sets

    sets.idle = {
        main="Terra's Staff",
        sub="Raptor Strap +1",
        ammo="Sturm's Report",
        head="Duelist's Chapeau +1",
        body="Dalmatica +1",
        hands="Zenith Mitts +1",
        legs="Blood Cuisses",
        feet="Mahatma Pigaches",
        neck="Orochi Nodowa +1",
        waist="Witch Sash",
        left_ear="Loquac. Earring",
        right_ear="Static Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle"}

    sets.idle.Town = {
        main="Terra's Staff",
        sub="Raptor Strap +1",
        ammo="Sturm's Report",
        head="Duelist's Chapeau +1",
        body="Dalmatica +1",
        hands="Zenith Mitts +1",
        legs="Blood Cuisses",
        feet="Mahatma Pigaches",
        neck="Orochi Nodowa +1",
        waist="Witch Sash",
        left_ear="Loquac. Earring",
        right_ear="Static Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle"}

    -- Defense sets

    sets.Kiting = {legs="Blood Cuisses"}

    -- Engaged sets

    sets.engaged = {}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.

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
end

function job_aftercast(spell)
    if spell.english == 'Sleep' or spell.english == 'Sleepga' then
        send_command('@wait 50;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
        send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        send_command('@wait 57;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
        send_command('@wait 59;input /echo ------- '..spell.english..' is wearing off in 1 seconds -------')
    elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
        send_command('@wait 80;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
        send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        send_command('@wait 87;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.

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
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WHM' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'BLM' then
        set_macro_page(3, 4)
    elseif player.sub_job == 'SCH' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4)
    end
end

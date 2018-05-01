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
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
    state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('GreatKatana', 'Polearm', 'Sword')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')

    update_combat_form()

    -- Additional local binds



    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()

end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
    sets.precast.FC = {ear1="Loquacious Earring"}

    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Myochin Kabuto",hands="Saotome Kote"}
    sets.precast.JA['Third Eye'] = {legs="Saotome Haidate"}


    -- Waltz set (chr and vit)


    -- Don't need any special gear for Healing Waltz.



    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined

    sets.precast.WS = {head="Nocturnus Helm",neck="Justice Torque",ear1="Brutal Earring",ear2="Bushinomimi",
        body="Nocturnus Mail",hands="Alkyoneus's Bracelets",ring1="Rajas Ring",ring2="Flame Ring",
        back="Cerberus Mantle +1",waist="Warwolf Belt",legs="Hachiryu Haidate",feet="Hachiman Sune-ate +1"}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Tachi:     Shoha'] = set_combine(sets.precast.WS, {neck="Thunder Gorget"})

    sets.precast.WS['Tachi:     Kasha'] = set_combine(sets.precast.WS, {neck="Light Gorget"})

    sets.precast.WS['Tachi:     Gekko'] = set_combine(sets.precast.WS, {neck="Aqua Gorget"})

    sets.precast.WS['Tachi:     Yukikaze'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

    sets.precast.WS['Tachi:     Kaiten'] = set_combine(sets.precast.WS, {neck="Soil Gorget"})

    sets.precast.WS['Tachi:     Jinpu'] = set_combine(sets.precast.WS, {neck="Soil Gorget"})

    sets.precast.WS['Penta Thrust'] = set_combine(sets.precast.WS, {head="Ace's Helm",
        body="Hachiryu Haramaki",
        hands="Alkyoneus's Bracelets",
        legs="Hachiryu Haidate",
        feet="Sao. Sune-Ate +1",
        neck="Love Torque",
        waist="Warwolf Belt",
        left_ear="Brutal Earring",
        right_ear="Hollow Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cerberus Mantle +1"})

    sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {neck="Soil Gorget",
        head="Ace's Helm",
        body="Hachiryu Haramaki",
        hands="Alkyoneus's Bracelets",
        legs="Hachiryu Haidate",
        feet="Sao. Sune-Ate +1",
        neck="Love Torque",
        waist="Warwolf Belt",
        left_ear={ name="Brutal Earring", augments={'"Dbl.Atk."+2','"Dbl.Atk."+1',}},
        right_ear="Hollow Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cerberus Mantle +1"})

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Gnadbhod's Helm",
        body="Hachiryu Haramaki",
        hands="Hachiman Kote +1",
        legs="Hachiryu Haidate",
        feet="Hmn. Sune-Ate +1",
        neck="Soil Gorget",
        waist="Warwolf Belt",
        left_ear="Brutal Earring",
        right_ear="Harmonius Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cerb. Mantle +1"})

    sets.precast.WS['Sidewinder'] = set_combine(sets.precast.WS, {neck="Aqua Gorget",head="Optical Hat",hands="Seiryu's Kote",feet="Hachiryu Sune-ate",
        ring2="Flame Ring",back="Amemet Mantle +1",waist="Buccaneer's Belt", body="Kirin's Osode"})

    -- Midcast Sets

    sets.midcast.Utsusemi = {head="Walahra Turban",neck="Evasion Torque",ear1="Loquacious Earring",ear2="Ethereal Earring",
        body="Arhat's Gi +1",hands="Dusk Gloves +1",ring1="Rajas Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Byakko's Haidate",feet="Enkidu's Leggings"}

    -- Sets to return to when not performing an action.

    -- Resting sets

    sets.resting = {head="Ace's Helm",neck="Justice Torque",ear1="Brutal Earring",ear2="Bushinomimi",
        body="Hachiryu Haramaki",hands="Hachiryu Kote",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Hachiryu Haidate",feet="Hachiryu Sune-ate"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {head="Walahra Turban",neck="Justice Torque",ear1="Brutal Earring",ear2="Bushinomimi",
        body="Arhat's Gi +1",hands="Seiryu's Kote",ring1="Rajas Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Byakko's Haidate",feet="Hachiryu Sune-ate"}

    sets.idle.Town = {head="Ace's Helm",neck="Justice Torque",ear1="Brutal Earring",ear2="Bushinomimi",
        body="Hachiryu Haramaki",hands="Hachiryu Kote",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Hachiryu Haidate",feet="Hachiryu Sune-ate"}

    -- Defense sets

    -- Engaged sets

    sets.engaged.GreatKatana = {head="Walahra Turban",neck="Justice Torque",ear1="Brutal Earring",ear2="Bushinomimi",
        body="Hachiryu Haramaki",hands="Dusk Gloves +1",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet="Dusk Ledelsens +1"}

    sets.engaged.Polearm = {head="Walahra Turban",neck="Love Torque",ear1="Brutal Earring",ear2="Hollow Earring",
        body="Hachiryu Haramaki",hands="Dusk Gloves +1",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cuchulain's Mantle",waist="Velocious Belt",legs="Byakko's Haidate",feet="Hachiman Sune-ate +1"}

    sets.engaged.Sword = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Hachiryu Haramaki",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Enkidu's Leggings",
        neck="Fortitude Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Brutal Earring",
        right_ear="Hollow Earring",
        left_ring="Rajas Ring",
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cuchulain's Mantle"}

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------



-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type:lower() == 'weaponskill' then
        if state.Buff.Sekkanoki then
            equip(sets.buff.Sekkanoki)
        end
        if state.Buff.Sengikori then
            equip(sets.buff.Sengikori)
        end
        if state.Buff['Meikyo Shisui'] then
            equip(sets.buff['Meikyo Shisui'])
        end
    end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Effectively lock these items in place.
    if state.HybridMode.value == 'Reraise' or
        (state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
        equip(sets.Reraise)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.



-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    if areas.Adoulin:contains(world.area) and buffactive.ionis then
        state.CombatForm:set('Adoulin')
    else
        state.CombatForm:reset()
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'THF' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 1)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 1)
    else
        set_macro_page(1, 1)
    end
end

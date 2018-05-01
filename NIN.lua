-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    sets.dusktildawn = {"Koga Tekko +1"}

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('DPS', 'Acc', 'Eva', 'PDT', 'Haste')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs

    sets.precast.JA['Sange'] = {}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {}

    -- Fast cast sets for spells

    sets.precast.FC = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Arhat's Gi +1",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Ethereal Earring",
        right_ear={ name="Loquac. Earring", augments={'Dark magic skill +13',}},
        left_ring="Defending Ring",
        right_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        back="Cerb. Mantle +1"}

    sets.precast.FC.Utsusemi = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Arhat's Gi +1",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Ethereal Earring",
        right_ear={ name="Loquac. Earring", augments={'Dark magic skill +13',}},
        left_ring="Defending Ring",
        right_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        back="Cerb. Mantle +1"}

    -- Snapshot for ranged
    sets.precast.RA = {hands="Zha'Go's Barbut"}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Gnadbhod's Helm",
        body="Hachiryu Haramaki",
        hands="Alkyoneus's Brc.",
        legs="Hachiryu Haidate",
        feet="Rutter Sabatons",
        neck="Hope Torque",
        waist="Warwolf Belt",
        left_ear="Harmonius Earring",
        right_ear="Brutal Earring",
        left_ring="Flame Ring",
        right_ring="Rajas Ring",
        back="Cerb. Mantle +1"}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade:     Jin'] = set_combine(sets.precast.WS,
        {neck="Breeze Gorget"})

    sets.precast.WS['Blade:     Ku'] = set_combine(sets.precast.WS,
        {neck="Soil Gorget"})

    sets.precast.WS['Blade:     Shun'] = set_combine(sets.precast.WS,
        {neck="Flame Gorget"})

    sets.precast.WS['Blade:     Metsu'] = set_combine(sets.precast.WS,
        {neck="Breeze Gorget"})

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Arhat's Gi +1",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Ritter Gorget",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Ethereal Earring",
        right_ear={ name="Loquac. Earring", augments={'Dark magic skill +13',}},
        left_ring="Defending Ring",
        right_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        back="Cerb. Mantle +1"}

    sets.midcast.Utsusemi = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Antares Harness",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Evasion Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Suppanomimi",
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.midcast.ElementalNinjutsu = {}

    sets.midcast.ElementalNinjutsu.Resistant = {}

    sets.midcast.NinjutsuDebuff = {}

    sets.midcast.NinjutsuBuff = {}

    sets.midcast['Dark Magic'] = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Antares Harness",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Evasion Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Suppanomimi",
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        back="Boxer's Mantle"}

    sets.midcast.RA = {
        head="Optical Hat",
        body="Koga Chainmail +1",
        hands="Seiryu's Kote",
        legs="Oily Trousers",
        feet="Hachiryu Sune-Ate",
        neck="Peacock Amulet",
        waist="Scouter's Rope",
        left_ear="Suppanomimi",
        right_ear="Ethereal Earring",
        left_ring="Merman's Ring",
        right_ring="Rajas Ring",
        back="Amemet Mantle +1"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {
        head="Optical Hat",
        body="Arhat's Gi +1",
        hands="Seiryu's Kote",
        legs="Byakko's Haidate",
        feet="Hachiryu Sune-Ate",
        neck="Orochi Nodowa +1",
        waist="Scouter's Rope",
        left_ear="Ethereal Earring",
        right_ear="Brutal Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle"}

    sets.idle.Town = {
        main="Kikoku",
        sub="Perdu Blade",
        ammo="Fire Bomblet",
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Hachiryu Haramaki",
        hands="Hachiryu Kote",
        legs="Hachiryu Haidate",
        feet="Hachiryu Sune-Ate",
        neck="Hope Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Ethereal Earring",
        right_ear={ name="Brutal Earring", augments={'Haste+6','"Dbl.Atk."+3',}},
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle"}



    -- Defense sets
    sets.defense.Evasion = {}

    sets.defense.PDT = {}

    sets.defense.MDT = {}


    sets.Kiting = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG:                      sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged.DPS = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Hachiryu Haramaki",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Hope Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cerb. Mantle +1"}

    sets.engaged.Acc = {
        head="Optical Hat",
        body="Hachiryu Haramaki",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Hope Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cuchulain's Mantle"}

    sets.engaged.Eva = {
        head="Optical Hat",
        body="Antares Harness",
        hands="Seiryu's Kote",
        legs="Byakko's Haidate",
        feet="Hachiryu Sune-Ate",
        neck="Evasion Torque",
        waist="Scouter's Rope",
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Boxer's Mantle"}

    sets.engaged.PDT = {
        head="Optical Hat",
        body="Arhat's Gi +1",
        hands="Seiryu's Kote",
        legs="Byakko's Haidate",
        feet="Hachiryu Sune-Ate",
        neck="Orochi Nodowa +1",
        waist="Scouter's Rope",
        left_ear="Ethereal Earring",
        right_ear="Brutal Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle"}

    sets.engaged.Haste = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Nin. Chainmail +1",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Dusk Ledelsens +1",
        neck="Hope Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring={ name="Toreador's Ring", augments={'Crit.hit rate+1','"Triple Atk."+2',}},
        right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        back="Cerb. Mantle +1"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if world.time >= 17*60 or world.time < 7*60 then
        equip(sets.dusktildawn)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

end

function job_status_change(new_status, old_status)

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 8)
    elseif player.sub_job == 'DRK' then
        set_macro_page(3, 8)
    else
        set_macro_page(1, 8)
    end
end

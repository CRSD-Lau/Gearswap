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
    state.Buff.Barrage = buffactive.Barrage or false
    state.Buff.Camouflage = buffactive.Camouflage or false
    state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Melee')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')

    gear.default.weaponskill_neck = "Breeze Gorget"

    state.AutoRA = M{['description']='Auto RA', 'Normal', 'Shoot', 'WS' }
    auto_gun_ws = "Coronach"

    DefaultAmmo = { ['Annihilator'] = "Silver Bullet"}
    U_Shot_Ammo = { ['Annihilator'] = "Silver Bullet"}

    select_default_macro_book()

    send_command('bind f9 gs c cycle RangedMode')
    send_command('bind ^f9 gs c cycle OffenseMode')
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
end


-- Set up all gear sets.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Bounty Shot'] = {}
    sets.precast.JA['Camouflage'] = {}
    sets.precast.JA['Scavenge'] = {}
    sets.precast.JA['Shadowbind'] = {}
    sets.precast.JA['Sharpshot'] = {}
    sets.precast.JA['Barrage'] = sets.buff.Barrage


    -- Fast cast sets for spells

    sets.precast.FC = {}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC)


    -- Ranged sets (snapshot)

    sets.precast.RA = {head="Scout's Beret +1"}


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined

    sets.precast.WS = {
        head="Gnadbhod's Helm",
        body="Kirin's Osode",
        hands="Blood Finger Gauntlets",
        legs="Hachiryu Haidate",
        feet="Scout's Socks +1",
        neck="Breeze Gorget",
        waist="Scout's Belt",
        left_ear="Hollow Earring",
        right_ear="Harmonius Earring",
        left_ring="Flame Ring",
        right_ring="Rajas Ring",
        back="Amemet Mantle +1"}

    sets.precast.WS['Slug Shot'] = set_combine(sets.precast.WS, {legs="Hachiryu Haidate",ear2="Suppanomimi",ring1="Breeze Ring",back="Amemet Mantle +1"})



    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Fast recast for spells

    sets.midcast.FastRecast = {}

    sets.midcast.Utsusemi = {}

    -- Ranged sets

    sets.midcast.RA = {
        head="Zha'Go's Barbut",
        body="Kyudogi +1",
        hands="Blood Fng. Gnt.",
        legs="Hachiryu Haidate",
        feet="Sct. Socks +1",
        neck="Faith Torque",
        waist="Scout's Belt",
        left_ear="Hollow Earring",
        right_ear="Harmonius Earring",
        left_ring="Merman's Ring",
        right_ring="Rajas Ring",
        back="Amemet Mantle +1"}

    sets.midcast.RA.Barr = {
        head="Enkidu's Cap",
        body="Kirin's Osode",
        hands="Seiryu's Kote",
        legs="Oily Trousers",
        feet="Hachiryu Sune-Ate",
        neck="Faith Torque",
        waist="Scout's Belt",
        left_ear="Hollow Earring",
        right_ear="Suppanomimi",
        left_ring="Merman's Ring",
        right_ring="Rajas Ring",
        back="Amemet Mantle +1"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {
        main="Vulcan's Staff",
        sub="Axe Grip",
        range="Annihilator",
        ammo="Silver Bullet",
        head="Gnadbhod's Helm",
        body="Kyudogi +1",
        hands="Blood Finger Gauntlets",
        legs="Blood Cuisses",
        feet="Trotter Boots",
        neck="Faith Torque",
        waist="Scout's Belt",
        left_ear="Hollow Earring",
        right_ear="Harmonius Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}

    sets.Kiting = {legs="Blood Cuisses",feet="Trotter Boots"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    sets.engaged = {
        head="Zha'Go's Barbut",
        body="Kyudogi +1",
        hands="Blood Fng. Gnt.",
        legs="Sct. Braccae +1",
        feet="Sct. Socks +1",
        neck="Faith Torque",
        waist="Scout's Belt",
        left_ear="Hollow Earring",
        right_ear="Harmonius Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle"}

    sets.engaged.Melee = {
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Hachiryu Haramaki",
        hands="Dusk Gloves +1",
        legs="Byakko's Haidate",
        feet="Enkidu's Leggings",
        neck="Ancient Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Hollow Earring",
        right_ear="Suppanomimi",
        left_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        right_ring="Rajas Ring",
        back="Cuchulain's Mantle"}
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Barrage = sets.midcast.RA.Barr
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        state.CombatWeapon:set(player.equipment.range)
    end

    if spell.action_type == 'Ranged Attack' or
        (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
        check_ammo(spell, action, spellMap, eventArgs)
    end

    if state.DefenseMode.value ~= 'None' and spell.type == 'WeaponSkill' then
        -- Don't gearswap for weaponskills when Defense is active.
        eventArgs.handled = true
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
        equip(sets.buff.Barrage)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Camouflage" then
        if gain then
            equip(sets.buff.Camouflage)
            disable('body')
        else
            enable('body')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Check for proper ammo when shooting or weaponskilling
function check_ammo(spell, action, spellMap, eventArgs)
    -- Filter ammo checks depending on Unlimited Shot
    if state.Buff['Unlimited Shot'] then
        if player.equipment.ammo ~= U_Shot_Ammo[player.equipment.range] then
            if player.inventory[U_Shot_Ammo[player.equipment.range]] or player.wardrobe[U_Shot_Ammo[player.equipment.range]] then
                add_to_chat(122,"Unlimited Shot active. Using custom ammo.")
                equip({ammo=U_Shot_Ammo[player.equipment.range]})
            elseif player.inventory[DefaultAmmo[player.equipment.range]] or player.wardrobe[DefaultAmmo[player.equipment.range]] then
                add_to_chat(122,"Unlimited Shot active but no custom ammo available. Using default ammo.")
                equip({ammo=DefaultAmmo[player.equipment.range]})
            else
                add_to_chat(122,"Unlimited Shot active but unable to find any custom or default ammo.")
            end
        end
    else
        if player.equipment.ammo == U_Shot_Ammo[player.equipment.range] and player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
            if DefaultAmmo[player.equipment.range] then
                if player.inventory[DefaultAmmo[player.equipment.range]] then
                    add_to_chat(122,"Unlimited Shot not active. Using Default Ammo")
                    equip({ammo=DefaultAmmo[player.equipment.range]})
                else
                    add_to_chat(122,"Default ammo unavailable.  Removing Unlimited Shot ammo.")
                    equip({ammo=empty})
                end
            else
                add_to_chat(122,"Unable to determine default ammo for current weapon.  Removing Unlimited Shot ammo.")
                equip({ammo=empty})
            end
        elseif player.equipment.ammo == 'empty' then
            if DefaultAmmo[player.equipment.range] then
                if player.inventory[DefaultAmmo[player.equipment.range]] then
                    add_to_chat(122,"Using Default Ammo")
                    equip({ammo=DefaultAmmo[player.equipment.range]})
                else
                    add_to_chat(122,"Default ammo unavailable.  Leaving empty.")
                end
            else
                add_to_chat(122,"Unable to determine default ammo for current weapon.  Leaving empty.")
            end
        elseif player.inventory[player.equipment.ammo].count < 15 then
            add_to_chat(122,"Ammo '"..player.inventory[player.equipment.ammo].shortname.."' running low ("..player.inventory[player.equipment.ammo].count..")")
        end
    end
end



-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 9)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 9)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 9)
    else
        set_macro_page(1, 9)
    end
end

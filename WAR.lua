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
    state.Buff['Aftermath'] = buffactive['Aftermath:     Lv.1'] or
        buffactive['Aftermath:                           Lv.2'] or
        buffactive['Aftermath:                           Lv.3'] or false
    state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes'] or false
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.

function user_setup()
    state.OffenseMode:options('GA', 'Axe', 'Dual', 'PDT')
    state.WeaponskillMode:options('Normal', 'ACC')
    state.IdleMode:options('Normal', 'Regen')

    select_default_macro_book()
end

function init_gear_sets()

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Sets to apply to arbitrary JAs
    sets.precast.JA.Berserk = {feet="Warrior's Calligae"}

    sets.precast.JA['Aggressor'] = {body="Warrior's Lorica"}

    sets.precast.JA['Warcry'] = {head="Warrior's Mask"}

    sets.precast.JA['Provoke'] = {head="Warrior's Mask",body="Hydra Haubert",hands="Hydra Moufles",
        legs="Warrior's Cuisses",feet="Warrior's Calligae",neck="Ritter Gorget",waist="Warwolf Belt",
        back="Cerb. Mantle +1"}

    -- Sets for fast cast gear for spells

    sets.precast.FC = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Evasion Torque",ear1="Triton Earring",ear2="Loquacious Earring",
        body="Scorpion Harness +1",hands="Dusk Gloves +1",ring1="Blitz Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Byakko's Haidate",feet="Dusk Ledelsens +1"}

    -- Fast cast gear for specific spells or spell maps

    sets.precast.FC.Utsusemi = sets.precast.FC

    -- Weaponskill sets

    sets.precast.WS = {ammo="Fire Bomblet",
        head="Nocturnus Helm",neck="Fortitude Torque",ear1="Harmonius Earring",ear2="Brutal Earring",
        body="Armada Hauberk",hands="Alkyoneus's Brc.",ring1="Flame Ring",ring2="Rajas Ring",
        back="Cerberus Mantle +1",waist="Warwolf Belt",legs="Hachiryu Haidate",feet="Hecatomb Leggings +1"}

    sets.precast.WS.ACC = {ammo="Fire Bomblet",
        head="Hecatomb Cap +1",neck="Ancient Torque",ear1="Harmonius Earring Earring",ear2="Brutal Earring",
        body="Armada Hauberk",hands="Hecatomb Mittens +1",ring1="Toreador's Ring",ring2="Rajas Ring",
        back="Cuchulain's Mantle",waist="Warwolf Belt",legs="Hachiryu Haidate",feet="Hecatomb Leggings +1"}


    -- Specific weaponskill sets.
    --Gorget=Snow/Aqua. Chain=Induration/Reverberation. Mod= STR 50%

    sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {neck="Aqua Gorget"})
    sets.precast.WS['Raging Rush'].ACC = set_combine(sets.precast.WS.ACC['Raging Rush'], {})

    --DR 20.4% or 52/256. 20/40/60Sec.  Gorget=Flame/Light. Chain=Light/Fusion. Mod= STR 80%

    sets.precast.WS['Metatron Torment'] = set_combine(sets.precast.WS, {neck="Flame Gorget"})
    sets.precast.WS['Metatron Torment'].ACC = set_combine(sets.precast.WS.ACC['Metatron Torment'], {neck="Flame Gorget"})

    --Gorget=Aqua/Snow. Chain=Distortion/Detonation. Mod= STR 60%/VIT 60%

    sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS, {body="Nocturnus Mail",neck="Breeze Gorget"})
    sets.precast.WS['Steel Cyclone'].ACC = set_combine(sets.precast.WS.ACC['Steel Cyclone'], {neck="Breeze Gorget"})

    --Gorget=Aqua. Chain=Distortion Mod= STR 50%/VIT 50%

    sets.precast.WS['Full Break'] = set_combine(sets.precast.WS, {neck="Aqua Gorget"})
    sets.precast.WS['Full Break'].ACC = set_combine(sets.precast.WS.ACC['Full Break'], {neck="Aqua Gorget"})

    --Gorget=Soil. Chain=Scission Mod= STR 50%

    sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {neck="Soil Gorget"})
    sets.precast.WS['Rampage'].ACC = set_combine(sets.precast.WS.ACC['Rampage'], {neck="Soil Gorget",ring1="Toreador's Ring"})

    --Gorget=Aqua/Snow. Chain=Distortion/Detonation Mod= STR 73%

    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {neck="Breeze Gorget"})
    sets.precast.WS['Ruinator'].ACC = set_combine(sets.precast.WS.ACC['Ruinator'], {neck="Snow Gorget",ring1="Toreador's Ring"})


    --Gorget=Shadow/Soil. Chain=Gravitation/Scission Mod= MND 73%

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Soil Gorget"})
    sets.precast.WS['Requiescat'].ACC = set_combine(sets.precast.WS.ACC['Requiescat'], {neck="Soil Gorget"})


    --Gorget=Flame/Light/Thunder. Chain=Fusion/Impact/Scission Mod= MND 73%

    sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {neck="Flame Gorget"})
    sets.precast.WS['Realmrazer'].ACC = set_combine(sets.precast.WS.ACC['Realmrazer'], {neck="Flame Gorget",ring1="Toreador's Ring"})


    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS, {neck="Soil Gorget"})
    sets.precast.WS['Cloudsplitter'].Acc = set_combine(sets.precast.WS.Acc, {neck="Temperance Torque"})

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Generic spell recast set

    sets.midcast.FastRecast = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Evasion Torque",ear1="Triton Earring",ear2="Loquacious Earring",
        body="Scorpion Harness +1",hands="Dusk Gloves +1",ring1="Blitz Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Byakko's Haidate",feet="Dusk Ledelsens +1"}

    -- Specific spells

    sets.midcast.Utsusemi = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Evasion Torque",ear1="Triton Earring",ear2="Loquacious Earring",
        body="Scorpion Harness +1",hands="Dusk Gloves +1",ring1="Blitz Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Byakko's Haidate",feet="Dusk Ledelsens +1"}


    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}


    -- Idle sets

    sets.idle = {ammo="Fire Bomblet",
        head="Walahra Turban",neck="Temperance Torque",ear1="Brutal Earring",ear2="Ethereal Earring",
        body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Toreador's Ring",ring2="Defending Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet="Hermes' Sandals +1"}

    sets.idle.Town = {ammo="Fire Bomblet",
        head="Walahra Turban",neck="Fortitude Torque",ear1="Ethereal Earring",ear2="Brutal Earring",
        body="Hachiryu Haramaki",hands="Dusk Gloves +1",ring1="Toreador's Ring",ring2="Defending Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet="Hermes' Sandals +1"}

    sets.idle.Weak = {}

    -- Defense sets

    sets.defense.PDT = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Fortitude Torque",ear1="Brutal Earring",ear2="Ethereal Earring",
        body="Hachiryu Haramaki",hands="Dusk Glove +!",ring1="Shadow Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Scouter's Rope",legs="Byakko's Haidate",feet="Hermes Sandals +1"}

    -- Gear to wear for kiting

    sets.Kiting = {}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG:                                               sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    -- If using a weapon that isn't specified later, the basic engaged sets should automatically be used.
    -- Equip the weapon you want to use and engage, disengage, or force update with f12, the correct gear will be used; default weapon is whats equip when file loads.

    sets.engaged.GA = {ammo="Fire Bomblet",
        head="Walahra Turban",neck="Fortitude Torque",ear1="Ethereal Earring",ear2="Brutal Earring",
        body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Toreador's Ring",ring2="Rajas Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet="Dusk Ledelsens +1"}

    sets.engaged.Axe = set_combine(sets.engaged, {ammo="Fire Bomblet",
        head="Walahra Turban",neck="Temperance Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Toreador's Ring",ring2="Rajas Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet="Dusk Ledelsens +1"})

    sets.engaged.Dual = set_combine(sets.engaged.ACC, {ammo="Fire Bomblet",
        head="Walahra Turban",neck="Ancient Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Toreador's Ring",ring2="Rajas Ring",
        back="Cuchulain's Mantle",waist="Velocious Belt",legs="Byakko's Haidate",feet="Dusk Ledelsens +1"})

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    -- Mighty Strikes TP Gear, combines with current melee set.
    sets.buff.MS = {}
    -- Day/Element Helm, if helm is not in inventory or wardrobe, this will not fire, for those who do not own one
    sets.WSDayBonus = {}
    -- Earrings to use with Upheaval when TP is 3000
    sets.VIT_earring = {}
    sets.VIT_earring = {}
    -- Earrings to use with all other weaponskills when TP is 3000
    sets.STR_earring = {}
    -- Mantle to use with Upheaval on Darksday
    sets.Upheaval_shadow = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)

end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.

function precast(spell)
    if sets.JA[spell.english] then
        equip(sets.JA[spell.english])
    end
    if spell.english == 'Berserk' then
        equip(sets.precast.JA['Berserk'])
    end
    if spell.english == 'Aggressor' then
        equip(sets.precast.JA['Aggressor'])
    end
    if spell.english == 'Warcry' then
        equip(sets.precast.JA['Warcry'])
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' or
        (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
        if world.time >= 6*60 or world.time < 18*60 then -- Dusk to Dawn time. if world.time >= 17*60 or world.time < 7*60 then
            equip({ear1="Ladybug Earring +1", ear2="Ladybug Earring +1"})
        end
    end

    if spell.type == 'WeaponSkill' then
        if world.time >= 18*60 or world.time < 6*60 then
            equip({ear1="Vampire Earring"})
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.english == "Tomahawk" and not spell.interrupted then
        send_command('timers create "Tomahawk" 90 down')
    end
end

-- Run after the default aftercast() is done.
-- eventArgs is the same one used in job_aftercast, in case information needs to be persisted.

function job_post_aftercast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.

function job_status_change(newStatus, oldStatus, eventArgs)
    update_combat_weapon()
    update_melee_groups()

end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.

function job_buff_change(buff, gain)
    if buff == "Aftermath:                               Lv.3" or buff == "Aftermath" then
        classes.CustomMeleeGroups:clear()
        if (buff == "Aftermath: Lv.3" and gain) or buffactive["Aftermath: Lv.3"] then
            if player.equipment.main == "Conqueror" then
                classes.CustomMeleeGroups:append('AM3')
                if gain then
                    send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
                else
                    send_command('timers delete "Aftermath: Lv.3"')
                    add_to_chat(123,'AM3:                [OFF]')
                end
            end
        end
        if (buff == "Aftermath" and gain) or buffactive.Aftermath then
            if player.equipment.main == "Bravura" and state.HybridMode.value == 'PDT' then
                classes.CustomMeleeGroups:append('AM')
            end
        end
    end
    if buff == "Aftermath:                               Lv.3" or buff == "Aftermath" then
        handle_equipping_gear(player.status)
    end
    if buff == 'Warcry' and gain then
        send_command('timers create "Warcry" 60 down abilities/00255.png')
    else
        send_command('timers delete "Warcry"')
    end
    if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then
        equip({neck="Berserker's Torque"})
    else
        handle_equipping_gear(player.status)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.

function get_custom_wsmode(spell, spellMap, default_wsmode)
    local wsmode = ''
    if state.Buff['Mighty Strikes'] then
        wsmode = wsmode .. 'MS'
    end
    if wsmode ~= '' then
        return wsmode
    end
    if defaut_wsmode == 'Normal' then
        if spell.english == "Cloudsplitter" and (world.day_element == 'Lightning' or world.day_element == 'Lightning') then
            equip(sets.obi[spell.element])
        end
    end
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if buffactive["Mighty Strikes"] then
        meleeSet = set_combine(meleeSet, sets.buff.MS)
    end
    return meleeSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_weapon()
    update_melee_groups()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    if state.CombatWeapon.has_value then
        msg = msg .. ' (' .. state.CombatWeapon.value .. ')'
    end
    msg = msg .. ':                                      '
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS:                                  ' .. state.WeaponskillMode.value
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense:                   ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC:                       '..state.PCTargetMode.value
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

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 7)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 7)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 7)
    else
        set_macro_page(1, 7)
    end
end


function update_combat_weapon()
    state.CombatWeapon:set(player.equipment.main)
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()
    if buffactive['Aftermath:                            Lv.3'] and player.equipment.main == "Conqueror" then
        classes.CustomMeleeGroups:append('AM3')
    end
    if buffactive.Aftermath and player.equipment.main == "Bravura" and state.HybridMode.value == 'PDT' then
        classes.CustomMeleeGroups:append('AM')
    end
end

function is_sc_element_today(spell)
    if spell.type ~= 'WeaponSkill' then
        return
    end

    local weaponskill_elements = S{}:
        union(skillchain_elements[spell.skillchain_a]):
        union(skillchain_elements[spell.skillchain_b]):
        union(skillchain_elements[spell.skillchain_c])

    if weaponskill_elements:contains(world.day_element) then
        return true
    else
        return false
    end
end

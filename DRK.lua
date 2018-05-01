-------------------------------------------------------------------------------------------------------------------
-- Lau's Custom ERA DRK Lua -- Based on 75 Cap Private Server --
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job -- Generally should not be modified --
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    sets.obi = {Fire = {waist="Karin Obi"},
        Earth = {waist="Dorin Obi"},
        Water = {waist="Suirin Obi"},
        Wind = {waist="Furin Obi"},
        Ice = {waist="Hyorin Obi"},
        Lightning = {waist="Rairin Obi"},
        Light = {waist="Korin Obi"},
        Dark = {waist="Anrin Obi"}}

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Aftermath'] = buffactive['Aftermath: Lv.1'] or
        buffactive['Aftermath:  Lv.2'] or
        buffactive['Aftermath:  Lv.3']
        or false
end



-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job -- Recommend that these be overridden in a sidecar file --
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent -- Can override this function in a sidecar file --

function user_setup()
    state.OffenseMode:options('Haste', 'STP', 'Acc', 'Zerg')
    state.IdleMode:options('Normal', 'STP', 'DPS', 'Zerg')
    state.PhysicalDefenseMode:options('OHSHIT')
    state.WeaponskillMode:options('None','ACC')

    select_default_macro_book()
end


-- Define sets and vars used by this job file --

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets --
    --------------------------------------

    -- Precast Sets --

    -- Precast sets to enhance JAs --

    sets.precast.JA['Last Resort'] = {feet="Abyss Sollerets"}

    sets.precast.JA['Arcane Circle'] = {feet="Chaos Sollerets"}

    sets.buff['Souleater'] = {ammo="Fenrir's Stone",head="Walahra Turban",neck="Justice Torque",ear1="Cassie Earring",
        ear2="Intruder earring",body="Gloom Breastplate",hands="Dusk Gloves +1",ring1="Bloodbead Ring",
        ring2="Bomb Queen Ring",back="Gigant Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

    -- Fast cast sets for spells --

    sets.precast.FC = {head="Walahra Turban",neck="Evasion Torque",ear1="Loquacious Earring",ear2="Brutal Earring",
        body="Plastron",hands="Dusk Gloves +1",ring1="Blitz Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

    -- Weaponskill sets --

    -- Default set for any weaponskill that isn't any more specifically defined --

    sets.precast.WS = {
        head="Nocturnus Helm",
        body="Nocturnus Mail",
        hands="Alkyoneus's Brc.",
        legs="Black Cuisses",
        feet="Hct. Leggings +1",
        neck="Soil Gorget",
        waist="Warwolf Belt",
        left_ear="Abyssal Earring",
        right_ear="Harmonius Earring",
        left_ring="Flame Ring",
        right_ring="Rajas Ring",
        back="Cerb. Mantle +1"}

    sets.precast.WS.Acc = {head="Nocturnus Helm",neck="Justice Torque",ear1="Abyssal Earring",ear2="Brutal earring",
        body="Armada Hauberk",hands="Hecatomb Mittens +1",ring1="Toreador's Ring",ring2="Rajas Ring",
        back="Abyss Cape",waist="Life Belt",legs="Black Cuisses",feet="Hecatomb Leggings +1"}

    sets.precast.WS.Souleater = sets.buff['Souleater']

    -- Specific weaponskill sets --  Uses the base set if an appropriate WSMod version isn't found --

    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {neck="Soil Gorget"})

    sets.precast.WS.Acc['Catastrophe'] = set_combine(sets.precast.WS.Acc, {neck="Soil Gorget"})

    sets.precast.WS['Guillotine'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

    sets.precast.WS.Acc['Guillotine'] = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

    sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})

    sets.precast.WS.Acc['Spiral Hell'] = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {neck="Soil Gorget",back="Abyss Cape"})

    sets.precast.WS.Acc['Entropy'] = set_combine(sets.precast.WS.Acc, {neck="Soil Gorget",back="Abyss Cape"})

    -- Midcast Sets --

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Utsusemi = {head="Walahra Turban",neck="Evasion Torque",ear1="Loquacious Earring",ear2="Ethereal Earring",
        body="Plastron",hands="Dusk Gloves +1",ring1="Blitz Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

    sets.midcast['Dark Magic'] = {head="Chaos Burgeonet",neck="Dark Torque",ear1="Loquacious Earring",ear2="Abyssal earring",
        body="Crimson Scale Mail",hands="Crimson Finger Gauntlets",ring1="Snow Ring",ring2="Snow Ring",
        back="Abyss Cape",waist="Velocious Belt",legs="Abyss Flanchard",feet="Homam Gambieras"}

    sets.midcast['Enfeebling Magic'] = {ammo="Phantom Tathlum",
        head="Crimson Mask",neck="Spider Torque",ear1="Loquacious Earring",ear2="Abyssal earring",
        body="Crimson Scale Mail",hands="Abyss Gauntlets",ring1="Snow Ring",ring2="Snow Ring",
        back="Abyss Cape",waist="Velocious Belt",legs="Abyss Flanchard",feet="Abyss Sollerets"}

    sets.midcast['Elemental Magic'] = {ammo="Phantom Tathlum",
        head="Demon Helm +1",neck="Elemental Torque",ear1="Loquacious Earring",ear2="Abyssal earring",
        body="Crimson Scale Mail",hands="Abyss Gauntlets",ring1="Snow Ring",ring2="Snow Ring",
        back="Abyss Cape",waist="Velocious Belt",legs="Abyss Flanchard",feet="Abyss Sollerets"}

    sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {hands="Black Gadlings",legs="Black Cuisses",feet="Black Sollerets"})

    -- Sets to return to when not performing an action --

    -- Resting set

    sets.resting = {head="Walahra Turban",neck="Orochi Nodowa",ear1="Loquacious Earring",ear2="Brutal Earring",
        body="Plastron",hands="Dusk Gloves +1",ring1="Jelly Ring",ring2="Defending Ring",
        back="Boxer's Mantle",waist="Velocious Belt",legs="Blood Cuisses",feet="Homam Gambieras"}


    -- Idle sets -- Ctrl + F12 Cycles Sets --

    sets.idle = {main="Apocalypse",sub="Pole Grip",ammo="Fire Bomblet",
        head="Ace's Helm",neck="Justice Torque",ear2="Ethereal Earring",ear1="Abyssal Earring",
        body="Homam Corazza",hands="Homam Manopolas",ring2="Defending Ring",ring1="Toreador's Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Blood Cuisses",feet="Homam Gambieras"}

    sets.idle.STP = {
        main="Apocalypse",
        sub="Pole Grip",
        ammo="Fire Bomblet",
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Aurum Cuirass",
        hands="Dusk Gloves +1",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Justice Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Abyssal Earring",
        right_ear="Brutal Earring",
        left_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        right_ring="Rajas Ring",
        back="Cuchulain's Mantle"}

    sets.idle.DPS = {main="Apocalypse",sub="Pole Grip",ammo="Fire Bomblet",
        head="Walahra Turban",neck="Justice Torque",ear1="Abyssal Earring",ear2="Brutal earring",
        body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Toreador's Ring",ring2="Rajas Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}



    sets.idle.Zerg = {main="Kraken Club",sub="Januwiyah",ammo="Fenrir's Stone",
        head="Walahra Turban",neck="Ritter Gorget",ear1="Cassie Earring",ear2="Intruder earring",
        body="Gloom Breastplate",hands="Dusk Gloves +1",ring1="Bloodbead Ring",ring2="Bomb Queen Ring",
        back="Gigant Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

    --CTRL F10 Kite --

    sets.Kiting = {legs="Blood Cuisses"}

    -- Defense sets --

    sets.defense.OHSHIT = {}

    -- Engaged sets --


    -- Store TP Calculations:
    -- Apocalypse 513 Delay. 139 TP per swing
    -- /SAM (STP II) 5 Hit: 29 STP needed (4 Hit: 65 STP)
    -- /WAR          5 Hit:     44 STP needed
    -- Spaghetti Carbonara:     6 STP
    -- Set Below: 22 STP  | 19.8% Equipment Haste (Walahra Turban Augment: 7 STP)

    sets.engaged = {main="Apocalypse",sub="Pole Grip",ammo="Fire Bomblet",
        head="Walahra Turban",neck="Justice Torque",ear1="Abyssal Earring",ear2="Brutal earring",
        body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Toreador's Ring",ring2="Rajas Ring",
        back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

    sets.engaged.STP = {
        main="Apocalypse",
        sub="Pole Grip",
        ammo="Fire Bomblet",
        head={ name="Walahra Turban", augments={'"Store TP"+8',}},
        body="Aurum Cuirass",
        hands="Dusk Gloves +1",
        legs="Homam Cosciales",
        feet="Homam Gambieras",
        neck="Justice Torque",
        waist={ name="Velocious Belt", augments={'DEX+3','Fire resistance+20','Fire resistance+20',}},
        left_ear="Abyssal Earring",
        right_ear={ name="Brutal Earring", augments={'"Dbl.Atk."+2','"Dbl.Atk."+1',}},
        left_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Accuracy+1',}},
        right_ring="Rajas Ring",
        back="Cuchulain's Mantle",}


    sets.engaged.Acc = {main="Apocalypse",sub="Pole Grip",ammo="Fire Bomblet",
        head="Ace's Helm",neck="Peacock Amulet",ear1="Abyssal Earring",ear2="Brutal earring",
        body="Homam Corazza",hands="Homam Manopolas",ring2="Toreador's Ring",ring2="Rajas Ring",
        back="Cuchulain's Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

    sets.engaged.Zerg = {main="Kraken Club",sub="Januwiyah",ammo="Fenrir's Stone",
        head="Walahra Turban",neck="Ritter Gorget",ear1="Cassie Earring",ear2="Intruder earring",
        body="Gloom Breastplate",hands="Dusk Gloves +1",ring1="Bloodbead Ring",ring2="Bomb Queen Ring",
        back="Gigant Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

    sets.engaged.Defense = set_combine(sets.idle.OHSHIT, {neck="Justice Torque",ear1="Abyssal Earring",ear2="Brutal Earring",
        waist="Velocious Belt"})

    sets.engaged.Souleater = {ammo="Fenrir's Stone",
        head="Walahra Turban",neck="Ritter Gorget",ear1="Cassie Earring",ear2="Intruder earring",
        body="Gloom Breastplate",hands="Dusk Gloves +1",ring1="Bloodbead Ring",ring2="Bomb Queen Ring",
        back="Gigant Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}
    -- AM Set --

    sets.engaged.AM = {ammo="Fire Bomblet",
        head="Walahra Turband",neck="Justice Torque",ear1="Abyssal Earring",ear2="Brutal earring",
        body="Armada Hauberk",hands="Black Gadlings",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cuchulain's Mantle",waist="Velocious Belt",legs="Black Cuisses",feet="Aurum Sabatons"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events --
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done --

-- eventArgs is the same one used in job_midcast, in case information needs to be persisted --

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == "Magic" then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.obi[spell.element])
        end
    end
end

function precast(spell)
    if sets.JA[spell.english] then
        equip(sets.JA[spell.english])
    end
    if spell.english == 'Arcane Circle' then
        equip(sets.precast.JA['Arcane Circle'])
    end
    if spell.english == 'Last Resort' then
        equip(sets.precast.JA['Last Resort'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events --
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change --

-- Handle notifications of general user state chang --

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            enable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions --
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed --

-- Set eventArgs.handled to true if we don't want the automatic display to be run --

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job --
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff,gain)
    state.Buff['Souleater'] = buffactive['Souleater'] or false
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 5)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 5)
    else
        set_macro_page(1, 5)
    end
end

function job_buff_change(buff,gain)
    if buff == 'Souleater' then
        equip(sets.buff['Souleater'])
    end
end

function buff_change(status,gain_or_loss)
    if status == "Aftermath" then
        if gain_or_loss then
            equip(sets.engaged.AM)
        else
            equip(sets.engaged)
        end
    end
end


--[[	--Melee Notes --

		--Apocalypse:
						513 Delay.  STP Calc:     =13+((513-480)*1.5)/50
						8.55 seconds between attack (513/60)
						Post Catastrophe:         513*(608/1024)/1023 =3.473sec     *needs verification
						3.473 * 5 = 17.365 seconds to 1000 TP. Within Aftermath Lv.1
						Extra 2.635 seconds can account for miss
						Can be improved on with Double/Triple Attack

		--Store TP Calculations:
						Apocalypse 513 Delay. 139 TP per swing
						/SAM (STP II) 5 Hit: 29 STP needed (4 Hit: 65 STP)
						/WAR          5 Hit:      44 STP needed
						Spaghetti Carbonara:      6 STP

		--Set Below:
						22 STP  | 19.8% Equipment Haste (Walahra Turban Augment: 7 STP)
						sets.engaged = {ammo="Fire Bomblet",
						head="Walahra Turban",neck="Chivalrous Chain",ear1="Abyssal Earring",ear2="Brutal earring",
						body="Aurum Cuirass",hands="Dusk Gloves +1",ring1="Ecphoria Ring",ring2="Rajas Ring",
						back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		--Ideal post Catastrophe Set for haste?
						Cata (102)/Aces(40)/Dusk Gloves +1(40)/V Belt (61)/Onyx Cuisses?/Onyx Leggings?
						Aurum Feet (Not needed due to Brutal haste)
						Possible STP ^:           Aurum (7)/Rajas(5)/Carbonara(6)/Brutal(1)/Walahra Turban (7-10. Need 10 for this set)

		--Haste:
						Hard cap of 80% (Retail)

		--Recast Cap:
						50% of original recast OR
						255 Seconds off

		--Magic Cap:
						448/1024 (43.75%)

		--Haste (spell)
						105/1024 (14.64%)
						Attack/Recast by ~15%

		--Adv. March Tier:
						+0 Instrument:            64/1024
						+1 Instrument:            80/1024 (+16/1024)
						+2 Instrument:            96/1024 (+32/1024)
						471/472 Wind+Sing Skill (Victory: 113  Advancing: 96)
						505/506 Wind+Sing Skill (Victory: 118  Advancing: 96)
						545/546 Wind+Sing Skill (Victory: 119  Advancing: 96)

		--Victory March
						113/1024 (No cieling)

		--Advancing March
						96/1024 (Hard Cap)

		--Job Ability:
						256/1024 (25%)       (or 250/1024)     *needs verification
						Desparate Blows    250/1024 (24.44%)    (50/1024 Per Merit)
						Hasso              102/1024 (9.96%)
						Haste Samba         50/1024 (4.88%)     (10/1024 Per Merit)

		--Equipment Cap:
						256/1024 (25%)
						Catastrophe        102/1024 (10%)       (1000TP = 20sec, 2000TP= 40sec, 3000TP= 60sec)
						Walahra Turban      50/1024 (4.88%)
						Ace's Helm          40/1024 (3.90%)
						Blitz Ring          11/1024 (1.07%)
						Homam Manopolas     30/1024 (2.92%)
						Dusk Gloves +1      40/1024 (3.90%)
						Velocious Belt      61/1024 (5.95%)
						Black Belt         122/1024 (11.91%)
						Homam Cosciales     30/1024 (2.92%)
						Byakko's Haidate    50/1024 (4.88%)
						Homam Gambieras 30/1024 (2.92%)
						Brutal Earring          +17 (2.02%)     (.119% per +1 per Senna65)  *needs verification
						Hecatomb Cap        93/1024
						Hecatomb Mittens    52/1024
						Hecatomb Leggings   41/1024

		--Fast Cast:
						Fast Cast I         50/1024 or 51/1024 *Needs Verification
						Fast Cast II        72/1024
						Fast Cast III      102/1024
						Warlock's Chapeau   51/1024
						Duelist's Tabard    51/1024
						Loquacious Earring  10/1024
						Rostrum Pumps        9/1024
						Homam Cosciales     13/1024
--]]

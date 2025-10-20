local SPRITE_PATH = path.combine(PATH, "Sprites/Survivors/Nemsniper")
local SOUND_PATH = path.combine(PATH, "Sounds/Survivors/Nemsniper")

local sprite_palette 		= Resources.sprite_load(NAMESPACE, "NemsniperPalette", path.combine(SPRITE_PATH, "palette.png"))
local sprite_loadout 		= Resources.sprite_load(NAMESPACE, "NemsniperSelectS0", path.combine(SPRITE_PATH, "selectS0.png"), 12, 28, 0)
local sprite_portrait 		= Resources.sprite_load(NAMESPACE, "NemsniperPortraitS0", path.combine(SPRITE_PATH, "portraitS0.png"), 3)
local sprite_portrait_small = Resources.sprite_load(NAMESPACE, "NemsniperPortraitSmallS0", path.combine(SPRITE_PATH, "portraitSmallS0.png"))
local sprite_credits		= Resources.sprite_load(NAMESPACE, "CreditsSurvivorNemsniper", path.combine(SPRITE_PATH, "credits.png"), 1, 7, 11)
local sprite_skills			= Resources.sprite_load(NAMESPACE, "NemsniperSkills", path.combine(SPRITE_PATH, "skills.png"), 9)
local sprite_idle			= Resources.sprite_load(NAMESPACE, "NemsniperIdle", path.combine(SPRITE_PATH, "idle.png"), 1, 18, 7)
local sprite_walk			= Resources.sprite_load(NAMESPACE, "NemsniperWalk", path.combine(SPRITE_PATH, "walk.png"), 8, 18, 12)
local sprite_walk_back		= Resources.sprite_load(NAMESPACE, "NemsniperWalkBack", path.combine(SPRITE_PATH, "walk.png"), 8, 18, 12)
local sprite_jump			= Resources.sprite_load(NAMESPACE, "NemsniperJump", path.combine(SPRITE_PATH, "jump.png"), 1, 18, 12)
local sprite_jumpPeak			= Resources.sprite_load(NAMESPACE, "NemsniperJumpPeak", path.combine(SPRITE_PATH, "jumpPeak.png"), 1, 18, 12)
local sprite_fall			= Resources.sprite_load(NAMESPACE, "NemsniperFall", path.combine(SPRITE_PATH, "fall.png"), 1, 18, 12)
local sprite_climb			= Resources.sprite_load(NAMESPACE, "NemsniperClimb", path.combine(SPRITE_PATH, "climb.png"), 6, 16, 22)
local sprite_death			= Resources.sprite_load(NAMESPACE, "NemsniperDeath", path.combine(SPRITE_PATH, "death.png"), 7, 24, 21)
local sprite_decoy			= Resources.sprite_load(NAMESPACE, "NemsniperDecoy", path.combine(SPRITE_PATH, "decoy.png"), 1, 17, 16)
local sprite_drone_idle		= Resources.sprite_load(NAMESPACE, "DronePlayerNemsniperIdle", path.combine(SPRITE_PATH, "droneIdle.png"), 5, 11, 14)
local sprite_drone_shoot	= Resources.sprite_load(NAMESPACE, "DronePlayerNemsniperShoot", path.combine(SPRITE_PATH, "droneShoot.png"), 5, 33, 13)
local sprite_credits		= Resources.sprite_load(NAMESPACE, "NemsniperCredits", path.combine(SPRITE_PATH, "credits.png"), 1)
local sprite_log			= Resources.sprite_load(NAMESPACE, "NemsniperLog", path.combine(SPRITE_PATH, "log.png"))

local sprite_shoot1_1		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_1", path.combine(SPRITE_PATH, "shoot1_1.png"), 6, 23, 31)
local sprite_shoot1_2 		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_2", path.combine(SPRITE_PATH, "shoot1_2.png"), 6, 23, 31)
local sprite_shoot1_3		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_3", path.combine(SPRITE_PATH, "shoot1_3.png"), 4, 24, 24)
local sprite_shoot3			= Resources.sprite_load(NAMESPACE, "NemsniperShoot3", path.combine(SPRITE_PATH, "shoot3.png"), 12, 31, 47)

local sound_shoot1_1		= Resources.sfx_load(NAMESPACE, "NemsniperShoot1_1", path.combine(SOUND_PATH, "Shoot1_1.ogg"))
local sound_shoot1_2		= Resources.sfx_load(NAMESPACE, "NemsniperShoot1_2", path.combine(SOUND_PATH, "Shoot1_2.ogg"))
local sound_shoot2_1		= Resources.sfx_load(NAMESPACE, "NemsniperShoot2_1", path.combine(SOUND_PATH, "Shoot2_1.ogg"))

local sprite_bar			= Resources.sprite_load(NAMESPACE, "NemsniperBarHeat", path.combine(SPRITE_PATH, "bar_empty.png"))

local spot_idle		= Resources.sprite_load(NAMESPACE, "SpotIdle", path.combine(SPRITE_PATH, "spot_idle.png"), 2, 23, 31)
local spot_walk		= Resources.sprite_load(NAMESPACE, "SpotWalk", path.combine(SPRITE_PATH, "spot_walk.png"), 4, 23, 31)
local spot_jump		= Resources.sprite_load(NAMESPACE, "SpotJump", path.combine(SPRITE_PATH, "spot_jump.png"), 1, 23, 31)
local spot_signal		= Resources.sprite_load(NAMESPACE, "SpotSignalEf", path.combine(SPRITE_PATH, "shoot1_1.png"), 4, 23, 31)

-- Slightly heated
local sprite_idle2			= Resources.sprite_load(NAMESPACE, "NemsniperIdle1", path.combine(SPRITE_PATH, "idle_h1.png"), 1, 18, 7)
local sprite_walk2			= Resources.sprite_load(NAMESPACE, "NemsniperWalk1", path.combine(SPRITE_PATH, "walk_h1.png"), 8, 18, 12)
local sprite_walk_back2		= Resources.sprite_load(NAMESPACE, "NemsniperWalkBack1", path.combine(SPRITE_PATH, "walk_h1.png"), 8, 18, 12)
local sprite_jump2			= Resources.sprite_load(NAMESPACE, "NemsniperJump1", path.combine(SPRITE_PATH, "jump_h1.png"), 1, 18, 12)
local sprite_jumpPeak2			= Resources.sprite_load(NAMESPACE, "NemsniperJumpPeak2", path.combine(SPRITE_PATH, "jumpPeak_h1.png"), 1, 18, 12)
local sprite_fall2			= Resources.sprite_load(NAMESPACE, "NemsniperFall1", path.combine(SPRITE_PATH, "fall_h1.png"), 1, 18, 12)
local sprite_climb2			= Resources.sprite_load(NAMESPACE, "NemsniperClimb1", path.combine(SPRITE_PATH, "climb_h1.png"), 6, 16, 22)
local sprite_shoot1_1_2		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_1_1", path.combine(SPRITE_PATH, "shoot1_1_h1.png"), 6, 23, 31)
local sprite_shoot1_2_2 		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_2_1", path.combine(SPRITE_PATH, "shoot1_2_h1.png"), 6, 19, 28)
local sprite_shoot3_2			= Resources.sprite_load(NAMESPACE, "NemsniperShoot3_1", path.combine(SPRITE_PATH, "shoot3_h1.png"), 12, 31, 47)

-- Medium heated
local sprite_idle3			= Resources.sprite_load(NAMESPACE, "NemsniperIdle2", path.combine(SPRITE_PATH, "idle_h2.png"), 1, 18, 7)
local sprite_walk3			= Resources.sprite_load(NAMESPACE, "NemsniperWalk2", path.combine(SPRITE_PATH, "walk_h2.png"), 8, 18, 12)
local sprite_walk_back3		= Resources.sprite_load(NAMESPACE, "NemsniperWalkBack2", path.combine(SPRITE_PATH, "walk_h2.png"), 8, 18, 12)
local sprite_jump3			= Resources.sprite_load(NAMESPACE, "NemsniperJump2", path.combine(SPRITE_PATH, "jump_h2.png"), 1, 18, 12)
local sprite_jumpPeak3			= Resources.sprite_load(NAMESPACE, "NemsniperJumpPeak2", path.combine(SPRITE_PATH, "jumpPeak_h2.png"), 1, 18, 12)
local sprite_fall3			= Resources.sprite_load(NAMESPACE, "NemsniperFall2", path.combine(SPRITE_PATH, "fall_h2.png"), 1, 18, 12)
local sprite_climb3			= Resources.sprite_load(NAMESPACE, "NemsniperClimb2", path.combine(SPRITE_PATH, "climb_h2.png"), 6, 16, 22)
local sprite_shoot1_1_3		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_1_2", path.combine(SPRITE_PATH, "shoot1_1_h2.png"), 6, 23, 31)
local sprite_shoot1_2_3 		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_2_2", path.combine(SPRITE_PATH, "shoot1_2_h2.png"), 6, 19, 28)
local sprite_shoot3_3			= Resources.sprite_load(NAMESPACE, "NemsniperShoot3_2", path.combine(SPRITE_PATH, "shoot3_h2.png"), 12, 31, 47)

-- Quite heated
local sprite_idle4			= Resources.sprite_load(NAMESPACE, "NemsniperIdle3", path.combine(SPRITE_PATH, "idle_h3.png"), 1, 18, 7)
local sprite_walk4			= Resources.sprite_load(NAMESPACE, "NemsniperWalk3", path.combine(SPRITE_PATH, "walk_h3.png"), 8, 18, 12)
local sprite_walk_back4		= Resources.sprite_load(NAMESPACE, "NemsniperWalkBack3", path.combine(SPRITE_PATH, "walk_h3.png"), 8, 18, 12)
local sprite_jump4			= Resources.sprite_load(NAMESPACE, "NemsniperJump3", path.combine(SPRITE_PATH, "jump_h3.png"), 1, 18, 12)
local sprite_jumpPeak4			= Resources.sprite_load(NAMESPACE, "NemsniperJumpPeak3", path.combine(SPRITE_PATH, "jumpPeak_h3.png"), 1, 18, 12)
local sprite_fall4			= Resources.sprite_load(NAMESPACE, "NemsniperFall3", path.combine(SPRITE_PATH, "fall_h3.png"), 1, 18, 12)
local sprite_climb4			= Resources.sprite_load(NAMESPACE, "NemsniperClimb3", path.combine(SPRITE_PATH, "climb_h3.png"), 6, 16, 22)
local sprite_shoot1_1_4		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_1_3", path.combine(SPRITE_PATH, "shoot1_1_h3.png"), 6, 23, 31)
local sprite_shoot1_2_4 		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_2_3", path.combine(SPRITE_PATH, "shoot1_2_h3.png"), 6, 19, 28)
local sprite_shoot3_4			= Resources.sprite_load(NAMESPACE, "NemsniperShoot3_3", path.combine(SPRITE_PATH, "shoot3_h3.png"), 12, 31, 47)

-- REALLY heated
local sprite_idle5			= Resources.sprite_load(NAMESPACE, "NemsniperIdle4", path.combine(SPRITE_PATH, "idle_h4.png"), 1, 18, 7)
local sprite_walk5			= Resources.sprite_load(NAMESPACE, "NemsniperWalk4", path.combine(SPRITE_PATH, "walk_h4.png"), 8, 18, 12)
local sprite_walk_back5		= Resources.sprite_load(NAMESPACE, "NemsniperWalkBack4", path.combine(SPRITE_PATH, "walk_h4.png"), 8, 18, 12)
local sprite_jump5			= Resources.sprite_load(NAMESPACE, "NemsniperJump4", path.combine(SPRITE_PATH, "jump_h4.png"), 1, 18, 12)
local sprite_jumpPeak5			= Resources.sprite_load(NAMESPACE, "NemsniperJumpPeak4", path.combine(SPRITE_PATH, "jumpPeak_h4.png"), 1, 18, 12)
local sprite_fall5			= Resources.sprite_load(NAMESPACE, "NemsniperFall4", path.combine(SPRITE_PATH, "fall_h4.png"), 1, 18, 12)
local sprite_climb5			= Resources.sprite_load(NAMESPACE, "NemsniperClimb4", path.combine(SPRITE_PATH, "climb_h4.png"), 6, 16, 22)
local sprite_shoot1_1_5		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_1_4", path.combine(SPRITE_PATH, "shoot1_1_h4.png"), 6, 23, 31)
local sprite_shoot1_2_5 		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_2_4", path.combine(SPRITE_PATH, "shoot1_2_h4.png"), 6, 19, 28)
local sprite_shoot3_5			= Resources.sprite_load(NAMESPACE, "NemsniperShoot3_4", path.combine(SPRITE_PATH, "shoot3_h4.png"), 12, 31, 47)

-- Scalding
local sprite_idle6			= Resources.sprite_load(NAMESPACE, "NemsniperIdle5", path.combine(SPRITE_PATH, "idle_h5.png"), 1, 18, 7)
local sprite_walk6			= Resources.sprite_load(NAMESPACE, "NemsniperWalk5", path.combine(SPRITE_PATH, "walk_h5.png"), 8, 18, 12)
local sprite_jump6			= Resources.sprite_load(NAMESPACE, "NemsniperJump5", path.combine(SPRITE_PATH, "jump_h5.png"), 1, 18, 12)
local sprite_jumpPeak6			= Resources.sprite_load(NAMESPACE, "NemsniperJumpPeak5", path.combine(SPRITE_PATH, "jumpPeak_h5.png"), 1, 18, 12)
local sprite_fall6			= Resources.sprite_load(NAMESPACE, "NemsniperFall5", path.combine(SPRITE_PATH, "fall_h5.png"), 1, 18, 12)
local sprite_climb6			= Resources.sprite_load(NAMESPACE, "NemsniperClimb5", path.combine(SPRITE_PATH, "climb_h5.png"), 6, 16, 22)
local sprite_shoot1_1_6		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_1_5", path.combine(SPRITE_PATH, "shoot1_1_h5.png"), 6, 23, 31)
local sprite_shoot1_2_6 		= Resources.sprite_load(NAMESPACE, "NemsniperShoot1_2_5", path.combine(SPRITE_PATH, "shoot1_2_h5.png"), 6, 19, 28)
local sprite_shoot3_6			= Resources.sprite_load(NAMESPACE, "NemsniperShoot3_5", path.combine(SPRITE_PATH, "shoot3_h5.png"), 12, 31, 47)

local overheated = Buff.new(NAMESPACE, "debuffOverheated")
overheated.show_icon = false
overheated.is_debuff = false
overheated:clear_callbacks()
overheated.max_stack = 1

local nemsniper = Survivor.new(NAMESPACE, "nemsniper")
local nemsniper_id = nemsniper.value
local player_actor

local heat = 0
	
nemsniper:set_stats_base({
	maxhp = 99,
	damage = 13.5,
	regen = 0.008,
})

nemsniper:set_stats_level({
		maxhp = 28,
		damage = 3.2,
		regen = 0.0015,
})

nemsniper:set_animations({
		idle = sprite_idle,
		walk = sprite_walk,
		walk_back = sprite_walk_back,
		jump = sprite_jump,
		jump_peak = sprite_jumpPeak,
		fall = sprite_fall,
		climb = sprite_climb,
		death = sprite_death,
		decoy = sprite_decoy,	
		drone_idle = sprite_drone_idle,
		drone_shoot = sprite_drone_shoot
})

nemsniper:set_cape_offset(-3.8, -5.5, 0, -6)
nemsniper:set_primary_color(Color.from_rgb(255, 255, 43))

nemsniper.sprite_loadout = sprite_loadout
nemsniper.sprite_portrait = sprite_portrait
nemsniper.sprite_portrait_small = sprite_portrait_small
nemsniper.sprite_title = sprite_walk
nemsniper.sprite_idle = sprite_idle
nemsniper.sprite_credits = sprite_credits

-- nemsniper:set_survivor_achievement(nemsniperUnlock, survivor)

nemsniper:set_palettes(sprite_palette, sprite_palette, sprite_palette)

nemsniper:add_skin("Crystal", 1, Resources.sprite_load(NAMESPACE, "NemsniperSelect1", path.combine(SPRITE_PATH, "selectS1.png"), 12, 28, 0),
Resources.sprite_load(NAMESPACE, "NemsniperPortrait1", path.combine(SPRITE_PATH, "portraitS1.png"), 3),
Resources.sprite_load(NAMESPACE, "NemsniperPortraitSmall1", path.combine(SPRITE_PATH, "portraitSmallS1.png")))

nemsniper:add_skin("Nemesis", 2, Resources.sprite_load(NAMESPACE, "NemsniperSelect2", path.combine(SPRITE_PATH, "selectS2.png"), 12, 28, 0),
Resources.sprite_load(NAMESPACE, "NemsniperPortrait2", path.combine(SPRITE_PATH, "portraitS2.png"), 3),
Resources.sprite_load(NAMESPACE, "SeraphPortraitSmall2", path.combine(SPRITE_PATH, "portraitSmallS2.png")))

nemsniper:add_skin("Coral", 3, Resources.sprite_load(NAMESPACE, "NemsniperSelect3", path.combine(SPRITE_PATH, "selectS3.png"), 12, 28, 0),
Resources.sprite_load(NAMESPACE, "NemsniperPortrait3", path.combine(SPRITE_PATH, "portraitS3.png"), 3),
Resources.sprite_load(NAMESPACE, "NemsniperPortraitSmall3", path.combine(SPRITE_PATH, "portraitSmallS3.png")))

nemsniper:add_skin("Legacy", 4, Resources.sprite_load(NAMESPACE, "NemsniperSelect4", path.combine(SPRITE_PATH, "selectS4.png"), 12, 28, 0),
Resources.sprite_load(NAMESPACE, "NemsniperPortrait4", path.combine(SPRITE_PATH, "portraitS4.png"), 3),
Resources.sprite_load(NAMESPACE, "NemsniperPortraitSmall4", path.combine(SPRITE_PATH, "portraitSmallS4.png")))

local objHeatBar = Object.new(NAMESPACE, "NemsniperHeatBar")
objHeatBar.obj_depth = -400


-- Create skills
local nemsniperPrimary = nemsniper:get_primary()
local nemsniperSecondary = nemsniper:get_secondary()
local nemsniperUtility = nemsniper:get_utility()
local nemsniperSpecial = nemsniper:get_special()
local nemsniperSpecialUpgraded = Skill.new(NAMESPACE, "nemsniperVBoosted")
nemsniperSpecial:set_skill_upgrade(nemsniperSpecialUpgraded)

nemsniper:clear_callbacks()
nemsniper:onInit(function(actor)
	if actor.class == 20.0 then
		local data = actor:get_data()
		heat = 0

		if not Instance.exists(data.objHeatBar) then
			data.objHeatBar = objHeatBar:create()
			data.objHeatBar.parent = actor
		end
	end
end)

nemsniper:onStep(function(actor)
if heat >= 0 then
		actor.sprite_idle = sprite_idle
		actor.sprite_walk = sprite_walk
		actor.sprite_walk_back = sprite_walk
		actor.sprite_jump = sprite_jump
		actor.sprite_jump_peak = sprite_jumpPeak
		actor.sprite_fall = sprite_fall
		actor.sprite_climb = sprite_climb
	end
	if heat >= 15 then
		actor.sprite_idle = sprite_idle2
		actor.sprite_walk = sprite_walk2
		actor.sprite_walk_back = sprite_walk2
		actor.sprite_jump = sprite_jump2
		actor.sprite_jump_peak = sprite_jumpPeak2
		actor.sprite_fall = sprite_fall2
		actor.sprite_climb = sprite_climb2
	end
	if heat >= 31 then
		actor.sprite_idle = sprite_idle3
		actor.sprite_walk = sprite_walk3
		actor.sprite_walk_back = sprite_walk3
		actor.sprite_jump = sprite_jump3
		actor.sprite_jump_peak = sprite_jumpPeak3
		actor.sprite_fall = sprite_fall3
		actor.sprite_climb = sprite_climb3
	end
	if heat >= 56 then
		actor.sprite_idle = sprite_idle4
		actor.sprite_walk = sprite_walk4
		actor.sprite_walk_back = sprite_walk4
		actor.sprite_jump = sprite_jump4
		actor.sprite_jump_peak = sprite_jumpPeak4
		actor.sprite_fall = sprite_fall4
		actor.sprite_climb = sprite_climb4
	end
	if heat >= 76 then
		actor.sprite_idle = sprite_idle5
		actor.sprite_walk = sprite_walk5
		actor.sprite_walk_back = sprite_walk5
		actor.sprite_jump = sprite_jump5
		actor.sprite_jump_peak = sprite_jumpPeak5
		actor.sprite_fall = sprite_fall5
		actor.sprite_climb = sprite_climb5
	end
	if heat >= 90 then
		actor.sprite_idle = sprite_idle6
		actor.sprite_walk = sprite_walk6
		actor.sprite_walk_back = sprite_walk6
		actor.sprite_jump = sprite_jump6
		actor.sprite_jump_peak = sprite_jumpPeak6
		actor.sprite_fall = sprite_fall6
		actor.sprite_climb = sprite_climb6
	end
	if actor:buff_stack_count(overheated) == 1 then
		actor.sprite_idle = sprite_idle6
		actor.sprite_walk = sprite_walk6
		actor.sprite_walk_back = sprite_walk6
		actor.sprite_jump = sprite_jump6
		actor.sprite_jump_peak = sprite_jumpPeak6
		actor.sprite_fall = sprite_fall6
		actor.sprite_climb = sprite_climb6
	end
end)

-- Primary
nemsniperPrimary.sprite = sprite_skills
nemsniperPrimary.subimage = 0 
nemsniperPrimary.cooldown = 30
nemsniperPrimary.damage = 2
nemsniperPrimary.require_key_press = false
nemsniperPrimary.is_primary = true
nemsniperPrimary.disable_aim_stall = false
nemsniperPrimary.does_change_activity_state = true
nemsniperPrimary.hold_facing_direction = true
nemsniperPrimary.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

local statenemsniperPrimary = State.new(NAMESPACE, "nemsniperPrimary")
local statenemsniperPrimaryHeated = State.new(NAMESPACE, "nemsniperPrimaryHeated")

nemsniperPrimary:clear_callbacks()
nemsniperPrimary:onActivate(function(actor, data)
	if actor:buff_stack_count(overheated) == 0 then
	actor:enter_state(statenemsniperPrimary)
	else actor:enter_state(statenemsniperPrimaryHeated)
	end
end)

statenemsniperPrimary:clear_callbacks()
statenemsniperPrimary:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	data.sprite = 0
		if heat >= 0 then
		data.sprite_index = sprite_shoot1_1
		end
		if heat >= 15 then
		data.sprite_index = sprite_shoot1_1_2
		end
		if heat >=31 then
		data.sprite_index = sprite_shoot1_1_3
		end
		if heat >=56 then
		data.sprite_index = sprite_shoot1_1_4
		end
		if heat >=76 then
		data.sprite_index = sprite_shoot1_1_5
		end
		if heat >= 90 then
		data.sprite_index = sprite_shoot1_1_6
		end
end)

statenemsniperPrimary:onStep(function(actor, data)
	actor:skill_util_fix_hspeed(0)
		actor:actor_animation_set(data.sprite_index, 0.3)
		actor:skill_util_exit_state_on_anim_end()
	
	if data.fired == 0 and actor.image_index >= 0 then

		local damage = actor:skill_get_damage(nemsniperPrimary)
		local dir = actor:skill_util_facing_direction()
		
		if not actor:skill_util_update_heaven_cracker(actor, damage) then
		local buff_shadow_clone = Buff.find("ror", "shadowClone")
		for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
			local projectile = actor:fire_bullet(actor.x, actor.y, 780, dir, damage, nil, nil, Attack_Info.TRACER.sniper2, true).attack_info
				actor:screen_shake(1.5)
				actor:sound_play(sound_shoot1_1, 0.6, 1 + math.random() * 0.3)
				heat = heat + 10
				data.fired = 1
			end
		end
	end
end)

-- Primary (when heated)

statenemsniperPrimaryHeated:clear_callbacks()
statenemsniperPrimaryHeated:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	data.sprite = sprite_shoot1_3
end)

statenemsniperPrimaryHeated:onStep(function(actor, data)
	actor:skill_util_fix_hspeed(0)
	actor:actor_animation_set(sprite_shoot1_3, 0.19)
	
	actor:skill_util_exit_state_on_anim_end()
	
if data.fired == 0 and actor.image_index >= 0 then
		actor:screen_shake(0.2)
		actor:sound_play(sound_shoot1_2, 0.6, 1 + math.random() * 0.3)
		data.fired = 1
		heat = heat + 3
	end
end)

-- Secondary
nemsniperSecondary.sprite = sprite_skills
nemsniperSecondary.subimage = 2
nemsniperSecondary.cooldown = 6.5 * 60
nemsniperSecondary.damage = 0.18
nemsniperSecondary.require_key_press = true
nemsniperSecondary.does_change_activity_state = true
nemsniperSecondary.ignore_aim_direction = false
nemsniperSecondary.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

local statenemsniperSecondary = State.new(NAMESPACE, "nemsniperSecondary")


nemsniperSecondary:clear_callbacks()
nemsniperSecondary:onActivate(function(actor, data)
	if heat < 5 then
		actor:sound_play_at(gm.constants.wError, 1.0, 1.0, actor.x, actor.y, nil)
		actor:refresh_skill(1)
	end
	if heat > 5 and actor:buff_stack_count(overheated) == 1 then
	nemsniperSecondary.damage = 0.24
	actor:enter_state(statenemsniperSecondary)
	else if heat > 5 then
	actor:enter_state(statenemsniperSecondary)
		end
	end
end)

statenemsniperSecondary:clear_callbacks()
	statenemsniperSecondary:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	data.sprite = 0
		if heat >= 0 then
		data.sprite_index = sprite_shoot1_2
		end
		if heat >= 15 then
		data.sprite_index = sprite_shoot1_2_2
		end
		if heat >=31 then
		data.sprite_index = sprite_shoot1_2_3
		end
		if heat >=56 then
		data.sprite_index = sprite_shoot1_2_4
		end
		if heat >=76 then
		data.sprite_index = sprite_shoot1_2_5
		end
		if heat >= 90 then
		data.sprite_index = sprite_shoot1_2_6
		end
end)
statenemsniperSecondary:onStep(function(actor, data)
	actor:skill_util_fix_hspeed(0)
	actor:actor_animation_set(data.sprite_index, 0.3)
	
	actor:skill_util_exit_state_on_anim_end()
	
if data.fired == 0 and actor.image_index >= 0 then

		local damage = actor:skill_get_damage(nemsniperSecondary)
		local dir = actor:skill_util_facing_direction()
		
		if not actor:skill_util_update_heaven_cracker(actor, damage) then
		local buff_shadow_clone = Buff.find("ror", "shadowClone")
		for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
			local projectile = actor:fire_bullet(actor.x, actor.y, 780, dir, damage * heat, 0.8 * heat, nil, Attack_Info.TRACER.sniper2, true).attack_info
				actor:screen_shake(1.5)
				actor:sound_play(sound_shoot2_1, 0.6, 1 + math.random() * 0.3)
				heat = 0
				data.fired = 1
			end
		end
	end
end)


-- Utility

nemsniperUtility.sprite = sprite_skills
nemsniperUtility.subimage = 3
nemsniperUtility.cooldown = 6.5 * 60
nemsniperUtility.is_utility = true
nemsniperUtility.require_key_press = true
nemsniperUtility.does_change_activity_state = true
nemsniperUtility.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

local statenemsniperUtility = State.new(NAMESPACE, "nemsniperUtility")


nemsniperUtility:clear_callbacks()
nemsniperUtility:onActivate(function(actor)
	actor:enter_state(statenemsniperUtility)
end)

statenemsniperUtility:clear_callbacks()
statenemsniperUtility:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = 0
	heat = heat - 25
		if heat >= 0 then
		data.sprite_index = sprite_shoot3
		end
		if heat >= 15 then
		data.sprite_index = sprite_shoot3_2
		end
		if heat >=31 then
		data.sprite_index = sprite_shoot3_3
		end
		if heat >=56 then
		data.sprite_index = sprite_shoot3_4
		end
		if heat >=76 then
		data.sprite_index = sprite_shoot3_5
		end
		if heat >= 90 then
		data.sprite_index = sprite_shoot3_6
		end
end)
statenemsniperUtility:onStep(function(actor, data)
	actor:skill_util_fix_hspeed(0)
	actor:actor_animation_set(data.sprite_index, 0.45)
	actor:skill_util_exit_state_on_anim_end()
	
	if data.fired == 0 and actor.image_index >= 0 then
	actor.pHspeed = -actor.pHmax * 5.8 * actor.image_xscale
	actor:set_immune(11.5)
		actor:sound_play(gm.constants.wSniperBackflip, 0.6, 1 + math.random() * 0.2)
		data.fired = 1
		end
end)


-- Special
nemsniperSpecial.sprite = sprite_skills
nemsniperSpecial.subimage = 5
nemsniperSpecial.cooldown = 16 * 60
nemsniperSpecial.damage = 0
nemsniperSpecial.require_key_press = true
nemsniperSpecial.does_change_activity_state = true
nemsniperSpecial.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

local statenemsniperSpecial = State.new(NAMESPACE, "nemsniperSpecial")

local objFieldD = Object.new(NAMESPACE, "VoidFieldD")
objFieldD.obj_depth = -260

nemsniperSpecial:clear_callbacks()
nemsniperSpecial:onActivate(function(actor)
	actor:enter_state(statenemsniperSpecial)
end)

statenemsniperSpecial:clear_callbacks()
statenemsniperSpecial:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot4
end)
statenemsniperSpecial:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
	actor:actor_animation_set(sprite_shoot4, 0.2)	
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
	if data.fired == 0 and actor.image_index >= 0 then
		local self = objFieldD:create(actor.x, actor.y)
		self.parent = actor
		self.team = actor.team
		actor:sound_play(sound_shoot4, 0.6, 1 + math.random() * 0.2)
		self.life = 240
	end
	data.fired = 1
end)
objFieldD:onStep(function(self)
	self.life = self.life - 1				
	if self.life < 0 then
		self:destroy()
	end
	
	if self.life % 5 == 0 then
		local targets = List.wrap(self:find_characters_circle(self.x, self.y, FIELD_RADIUS, false, 3))
		for _, target in ipairs (targets) do
			if target:buff_stack_count(debuffField) == 0 then
				target:buff_apply(debuffField, 15, 1)
			else
				target:buff_apply(debuffField, 15)
			end
		end
	end
end)

objFieldD:onDraw(function(self)
	gm.draw_set_colour(Color.PURPLE)
	gm.gpu_set_blendmode(1)
	
	gm.draw_circle(self.x, self.y, FIELD_RADIUS, true)
	
	gm.draw_set_alpha(1)
	gm.gpu_set_blendmode(0)
end)

-- Grace field boosted
nemsniperSpecialUpgraded.sprite = sprite_skills
nemsniperSpecialUpgraded.subimage = 6
nemsniperSpecialUpgraded.cooldown = 16 * 60
nemsniperSpecialUpgraded.damage = 0
nemsniperSpecialUpgraded.require_key_press = true
nemsniperSpecialUpgraded.does_change_activity_state = true
nemsniperSpecialUpgraded.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

local statenemsniperSpecialUpgraded = State.new(NAMESPACE, "nemsniperSpecialUpgraded")

local objFieldS = Object.new(NAMESPACE, "VoidFieldS")
objFieldS.obj_depth = -260

nemsniperSpecialUpgraded:clear_callbacks()
nemsniperSpecialUpgraded:onActivate(function(actor)
	actor:enter_state(statenemsniperSpecialUpgraded)
end)

statenemsniperSpecialUpgraded:clear_callbacks()
	statenemsniperSpecialUpgraded:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot5
end)
statenemsniperSpecialUpgraded:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
	actor:actor_animation_set(sprite_shoot5, 0.2)	
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
	if data.fired == 0 and actor.image_index >= 0 then
		local self = objFieldS:create(actor.x, actor.y)
		self.parent = -4
		self.team = actor.team
		actor:sound_play(sound_shoot4, 0.6, 1 + math.random() * 0.2)
		self.life = 360
	end
	data.fired = 1
end)
objFieldS:onStep(function(self)
	self.life = self.life - 1				
	if self.life < 0 then
		self:destroy()
	end
	
	if self.life % 5 == 0 then
		local targets = List.wrap(self:find_characters_circle(self.x, self.y, FIELD_RADIUS_BOOSTED, false, 3))
		for _, target in ipairs (targets) do
			if target:buff_stack_count(debuffFieldS) == 0 then
				target:buff_apply(debuffFieldS, 15, 1)
			else
				target:buff_apply(debuffFieldS, 15)
			end
			if target.team ~= 1 then
				if target:buff_stack_count(debuffShatter) == 0 then
					target:buff_apply(debuffShatter, 35, 1)
				else
					target:buff_apply(debuffShatter, 35)
				end
			end
		end
	end
end)
objFieldS:onDraw(function(self)
	gm.draw_set_colour(Color.PURPLE)
	gm.gpu_set_blendmode(1)
	
	gm.draw_circle(self.x, self.y, FIELD_RADIUS_BOOSTED, true)
	
	gm.draw_set_alpha(1)
	gm.gpu_set_blendmode(0)
end)

nemsniper:onStep(function(actor)
	heat = heat - 0.025
	heat = gm.clamp(heat, 0, 101)

	if heat > 99 then
		actor:buff_apply(overheated, 120 * 60, 1)
	end

	if actor:buff_stack_count(overheated) == 1 and heat == 0 then
		actor:buff_remove(overheated)
	end
end)

objHeatBar:clear_callbacks()
objHeatBar:onCreate(function(self)
	self.parent = -4
	self.persistent = true
end)

objHeatBar:clear_callbacks()
objHeatBar:onStep(function(self)
	if not GM.actor_is_alive(self.parent) then
		self:destroy()
	end
end)

objHeatBar:clear_callbacks()
objHeatBar:onDraw(function(self)
	if not Instance.exists(self.parent) then return end
	if not gm.bool(self.parent.visible) then return end

	local actor = self.parent
	local data = actor:get_data()

	local x, y = math.floor(actor.ghost_x+0.5), math.floor(actor.ghost_y-0.5)

	local x = x - 32
	local y = y + 19

	local heat_left		= x + 2
	local heat_right	= x + 57
	local heat_width	= heat_right - heat_left
	local heat_top		= y + 9
	local heat_bottom	= y - 1

	if heat >= 0 then
		gm.draw_set_colour(Color.from_rgb(150, 123, 173)) end
	if heat >= 15 then
		gm.draw_set_colour(Color.from_rgb(133, 108, 153)) end
	if heat >=31 then
		gm.draw_set_colour(Color.from_rgb(140, 108, 153)) end
	if heat >=46 then
		gm.draw_set_colour(Color.from_rgb(147, 108, 153)) end
	if heat >=61 then
		gm.draw_set_colour(Color.from_rgb(153, 108, 143)) end
	if heat >=76 then
		gm.draw_set_colour(Color.from_rgb(162, 99, 126)) end
	if heat >= 90 then
		gm.draw_set_colour(Color.from_rgb(174, 87, 94)) end
	if actor:buff_stack_count(overheated) == 1 then
		gm.draw_set_colour(Color.from_rgb(174, 87, 94)) end
	gm.draw_rectangle(heat_left, heat_top, heat_left + (heat / 1.88), heat_bottom, false)

	gm.draw_sprite(sprite_bar, 0, x, y)
end)

local nemsniperLog = Survivor_Log.new(nemsniper, sprite_log)

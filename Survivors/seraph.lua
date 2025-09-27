	
	-- The return of mallem modding
	-- Seraph rorr TODAY!!
	
	-- Thanks to kris, azulineskye, tryagain, miguelito for all of the help with code throughout times!
	-- Thanks to Beebo for the prototype of seraph's rorr design in ssrcord, all of the sprites made for this reboot of fan port are based off of theirs!
	-- Thanks to TangoKnight, Beebo and Winslow, as their rorr art was used by me as a reference way too many times to count!
	-- Thanks to Fox, Goobessa, Nilzer, qwp, Wertus for the motivational/kind words during my frustrations with this mess of a code!
	-- And overall, thanks to everyone who was involved with this in any way, be it help with code, art, motivation or anything else related!
	
	local SPRITE_PATH = path.combine(PATH, "Sprites/Survivors/Seraph")
	local SOUND_PATH = path.combine(PATH, "Sounds/Survivors/Seraph")
	
	-- assets.
	-- why are there so many oh my god-
	
	local buff_spriteShatter			=Resources.sprite_load(NAMESPACE, "BuffShatter", path.combine(PATH, "Sprites/Buffs/shatter.png"), 1, 9, 8)
	local buff_spriteField			=Resources.sprite_load(NAMESPACE, "BuffField", path.combine(PATH, "Sprites/Buffs/field.png"), 1, 6, 6)
	local buff_spriteFieldS			=Resources.sprite_load(NAMESPACE, "BuffFieldS", path.combine(PATH, "Sprites/Buffs/fieldS.png"), 1, 6, 6)
	
	-- load the 5 colorations pallete, including default, ocean, foe, friend and golden. Later golden palette will become a provi trial unlock, and its place will be taken by Faded palette
	local sprite_palette				=Resources.sprite_load(NAMESPACE, "SeraphPalette", path.combine(SPRITE_PATH, "palette.png"))
	
	local sprite_loadout		=Resources.sprite_load(NAMESPACE, "SeraphSelect", path.combine(SPRITE_PATH, "select.png"), 1, 28, 0)
	local sprite_portrait		=Resources.sprite_load(NAMESPACE, "SeraphPortrait", path.combine(SPRITE_PATH, "portrait.png"), 3)
	local sprite_portrait_small 		=Resources.sprite_load(NAMESPACE, "SeraphPortraitSmall", path.combine(SPRITE_PATH, "portraitSmall.png"))
	local sprite_log			=Resources.sprite_load(NAMESPACE, "SeraphLog", path.combine(SPRITE_PATH, "log.png"))
	local sprite_credits		= Resources.sprite_load(NAMESPACE, "CreditsSurvivorSeraph", path.combine(SPRITE_PATH, "credits.png"), 1, 7, 11)
	local sprite_skills		=Resources.sprite_load(NAMESPACE, "SeraphSkills", path.combine(SPRITE_PATH, "skills.png"), 9)
	
	local sprite_idle		=Resources.sprite_load(NAMESPACE, "SeraphIdle", path.combine(SPRITE_PATH, "idle.png"), 10, 16, 23)
	local sprite_idle_half		=Resources.sprite_load(NAMESPACE, "SeraphIdleHalf", path.combine(SPRITE_PATH, "idleHalf.png"), 1, 12, 17)
	local sprite_walk		=Resources.sprite_load(NAMESPACE, "SeraphWalk", path.combine(SPRITE_PATH, "walk.png"), 18, 14, 21)
	local sprite_walk_half		=Resources.sprite_load(NAMESPACE, "SeraphWalkHalf", path.combine(SPRITE_PATH, "walkHalf.png"), 6, 14, 14)
	local sprite_walk_back		=Resources.sprite_load(NAMESPACE, "SeraphWalkBack", path.combine(SPRITE_PATH, "walkBack.png"), 6, 14, 23)
	local sprite_jump		=Resources.sprite_load(NAMESPACE, "SeraphJump", path.combine(SPRITE_PATH, "jump.png"), 1, 16, 16)
	local sprite_jump_half		=Resources.sprite_load(NAMESPACE, "SeraphJumpHalf", path.combine(SPRITE_PATH, "jumpHalf.png"), 1, 14, 12)
	local sprite_jump_peak		=Resources.sprite_load(NAMESPACE, "SeraphJumpPeak", path.combine(SPRITE_PATH, "jumpPeak.png"), 1, 14, 12)
	local sprite_jump_peak_half	= Resources.sprite_load(NAMESPACE, "SeraphJumpPeakHalf", path.combine(SPRITE_PATH, "jumpPeakHalf.png"), 1, 14, 12)
	local sprite_fall			= Resources.sprite_load(NAMESPACE, "SeraphFall", path.combine(SPRITE_PATH, "fall.png"), 1, 14, 12)
	local sprite_fall_half		= Resources.sprite_load(NAMESPACE, "SeraphFallHalf", path.combine(SPRITE_PATH, "fallHalf.png"), 1, 14, 12)
	local sprite_climb			= Resources.sprite_load(NAMESPACE, "SeraphClimb", path.combine(SPRITE_PATH, "climb.png"), 8, 19, 23)
	local sprite_death			= Resources.sprite_load(NAMESPACE, "SeraphDeath", path.combine(SPRITE_PATH, "death.png"), 21, 14, 47)
	local sprite_decoy			= Resources.sprite_load(NAMESPACE, "SeraphDecoy", path.combine(SPRITE_PATH, "decoy.png"), 1, 17, 16)
	
	local sprite_drone_idle		= Resources.sprite_load(NAMESPACE, "DronePlayerSeraphIdle", path.combine(SPRITE_PATH, "droneIdle.png"), 5, 11, 14)
	local sprite_drone_shoot	= Resources.sprite_load(NAMESPACE, "DronePlayerSeraphShoot", path.combine(SPRITE_PATH, "droneShoot.png"), 5, 33, 13)

	local sprite_shoot1			=Resources.sprite_load(NAMESPACE, "SeraphShoot1", path.combine(SPRITE_PATH, "shoot1.png"), 6, 17, 23)
	local sprite_shoot2 		=Resources.sprite_load(NAMESPACE, "SeraphShoot2", path.combine(SPRITE_PATH, "shoot2.png"), 6, 17, 21)
	local sprite_shoot3_1			=Resources.sprite_load(NAMESPACE, "SeraphShoot3_1", path.combine(SPRITE_PATH, "shoot3_1.png"), 14, 30, 53)
	local sprite_shoot3_2			=Resources.sprite_load(NAMESPACE, "SeraphShoot3_2", path.combine(SPRITE_PATH, "shoot3_2.png"), 16, 20, 20)
	local sprite_shoot4 		=Resources.sprite_load(NAMESPACE, "SeraphShoot4", path.combine(SPRITE_PATH, "shoot4.png"), 8, 28, 40)
	local sprite_shoot5 		=Resources.sprite_load(NAMESPACE, "SeraphShoot5", path.combine(SPRITE_PATH, "shoot5.png"), 8, 28, 40)

	local sprite_seraphSparks1		=Resources.sprite_load(NAMESPACE, "SeraphSparks1", path.combine(SPRITE_PATH, "sparks1.png"), 5, 24, 14)
	local sprite_seraphSparks2		=Resources.sprite_load(NAMESPACE, "SeraphSparks2", path.combine(SPRITE_PATH, "sparks2.png"), 7, 24, 14)
	local sprite_seraphSparks3		=Resources.sprite_load(NAMESPACE, "SeraphSparks3", path.combine(SPRITE_PATH, "sparks3_FORLATER.png"), 6, 24, 14)
	local sprite_seraphSparks4		=Resources.sprite_load(NAMESPACE, "SeraphSparks4", path.combine(SPRITE_PATH, "sparks4.png"), 4, 90, 14)
	local sprite_seraphOrb			=Resources.sprite_load(NAMESPACE, "SeraphOrb", path.combine(SPRITE_PATH, "orb.png"), 8, 12, 14)
	
	local sound_select			=Resources.sfx_load(NAMESPACE, "SeraphSelect", path.combine(SOUND_PATH, "fieldCreate.ogg"))
	local sound_shoot1			=Resources.sfx_load(NAMESPACE, "SeraphShoot1", path.combine(SOUND_PATH, "primary.ogg"))
	local sound_shoot2_1			=Resources.sfx_load(NAMESPACE, "SeraphShoot2_1", path.combine(SOUND_PATH, "shootOrb.ogg"))
	local sound_shoot2_2			=Resources.sfx_load(NAMESPACE, "SeraphShoot2_2", path.combine(SOUND_PATH, "applyShatter.ogg"))
	local sound_shoot2_3			=Resources.sfx_load(NAMESPACE, "SeraphShoot2_3", path.combine(SOUND_PATH, "explodeShatter.ogg"))
	local sound_shoot3_1			=Resources.sfx_load(NAMESPACE, "SeraphShoot3_1", path.combine(SOUND_PATH, "utilityPull.ogg"))
	local sound_shoot3_2			=Resources.sfx_load(NAMESPACE, "SeraphShoot3_2", path.combine(SOUND_PATH, "utilityBash.ogg"))
	local sound_shoot4			=Resources.sfx_load(NAMESPACE, "SeraphShoot4", path.combine(SOUND_PATH, "fieldCreate.ogg"))
	
	
	-- Create the debuffs
	
	local debuffShatter		=Buff.new(NAMESPACE, "debuffShatter")
							debuffShatter.icon_sprite = buff_spriteShatter
							debuffShatter.show_icon = true
							debuffShatter.is_debuff = true
							debuffShatter:clear_callbacks()
	
	local debuffField		=Buff.new(NAMESPACE, "debuffField")
	local debuffFieldS		=Buff.new(NAMESPACE, "debuffFieldS")
	

	debuffField.icon_sprite = buff_spriteField
	debuffFieldS.icon_sprite = buff_spriteFieldS
	
	debuffShatter.max_stack = 1
	debuffField.max_stack = 1
	debuffFieldS.max_stack = 1



	-- on-hit effect of shatter
	
		debuffShatter:clear_callbacks()
		Callback.add(Callback.TYPE.onDamagedProc, "SeraphShatterExplosion", function(actor, hit_info)
		if actor:buff_stack_count(debuffShatter) >= 1 then
			local attacker = hit_info.parent
			if not attacker then return end
			if hit_info.damage > 0.8 then
			actor:buff_remove(debuffShatter, 1)
		local shatterExplosion = attacker:fire_explosion(actor.x, actor.y, 120, 120, 4, nil, sprite_seraphSparks3, true).attack_info
			shatterExplosion.__ssr_seraph_explosion = ATTACK_TAG_IGNORED_BY_SHATTER
			if can_proc == nil then can_proc = true end
		actor:sound_play(sound_shoot2_3, 0.6, 1 + math.random() * 0.4)
			if not GM.actor_is_boss(actor) then
		actor:skill_util_reset_activity_state()
		end
		-- print("Expoded shattered enemy") this was used for debugging, redundant now
	end
end
end)


	-- negative effects of shatter
	debuffShatter:clear_callbacks()
	debuffShatter:onPostStep(function(actor, stack)
		actor.pHspeed = actor.pHspeed * 0.05
			if not GM.actor_is_boss(actor) then
				actor.attack_speed = actor.attack_speed * 0.4 --This line doesn't seem to work and enemies don't attack???
				actor:skill_util_reset_activity_state()
	end
end)

		debuffShatter:onRemove(function(actor, stack)
	if not GM.actor_is_boss(actor) then
		actor:skill_util_reset_activity_state()
	end
end)
		local effect_blend_color = Color.from_rgb(70, 1, 74)
		debuffShatter:onPostDraw(function(actor)
			local preserve_alpha, preserve_blend = actor.image_alpha, actor.image_blend
			
		actor.image_alpha = 0.6
		actor.image_blend = effect_blend_color
		gm.actor_drawscript_call(actor.value, actor.ghost_x, actor.ghost_y, 0, 0)
			actor.image_alpha = preserve_alpha
			actor.image_blend = preserve_blend
			actor.ghost_xscale = actor.ghost_x * 2
			actor.ghost_yscale = actor.ghost_y * 2
		end)
		
	-- field debuff (non-scepter) for enemies
	
	debuffField:onPostStep(function(actor)
	if actor.team ~= 1 then
		actor.pHspeed = -20
	if not GM.actor_is_boss(actor) then
		actor.activity = 50
		actor.attack_speed = -10
					if actor.sprite_climb and GM.actor_state_is_climb_state(actor.actor_state_current_id) then
			actor.sprite_index = actor.sprite_climb
			actor.image_index = 0
		elseif actor.sprite_idle then
			actor.sprite_index = actor.sprite_idle
		end
			if not GM.actor_is_boss(actor) then
		actor:skill_util_reset_activity_state()
			end
		end
	end
end)
	
	-- in theory this block also should check for whether its enemy or not and reset the state
	
			debuffField:onRemove(function(actor, stack)
	if not GM.actor_is_boss(actor) then
		if not actor.team ~= 2 then
		actor:skill_util_reset_activity_state()
		end
	end
	end)
	
	-- field buff (non-scepter) for players
	
	debuffField:onStatRecalc(function(actor)
	if actor.team ~= 2 then
	utilityCooldownReduction = actor:override_default_skill_cooldown(2, 2)
		end
	end)
	
	-- field debuff (scepter) for enemies (forces them to take an extra 20% damage + they get stunned for 2 seconds after duration expires)
	
		debuffFieldS:onPostStep(function(actor)
	if actor.team ~= 1 then
		actor.pHspeed = 0
	if not GM.actor_is_boss(actor) then
		actor.activity = 50
			end
		end
	if actor.team ~= 1 then
			actor.set_stun(2)
			end
	end)
	
			debuffFieldS:onRemove(function(actor, stack)
	if not GM.actor_is_boss(actor) then
		if not actor.team ~= 2 then
		actor:skill_util_reset_activity_state()
		end
		end
	end)
	
		-- field buff (scepter) for players. also reduces secondary cd by 3, and equipment cooldown by 10%
	
	debuffField:onStatRecalc(function(actor)
	if actor.team ~= 2 then
	utilityCooldownReduction = actor:override_default_skill_cooldown(2, 2)
		end
	end)

	local seraph = Survivor.new(NAMESPACE, "seraph")
	local seraph_id = seraph.value
	
	seraph:set_stats_base({
			maxhp = 98,
			damage = 15,
			regen = 0.011,
	})
	
	seraph:set_stats_level({
			maxhp = 28,
			damage = 3.2,
			regen = 0.002,
	})
	
	seraph:set_animations({
		idle = sprite_idle,
		walk = sprite_walk,
		jump = sprite_jump,
		jump_peak = sprite_jumpPeak,
		fall = sprite_fall,
		climb = sprite_climb,
		death = sprite_death,
		decoy = sprite_decoy,	
	})
	
	seraph:set_cape_offset(0, -8, 0, -12)
	seraph:set_primary_color(Color.from_rgb(209, 74, 255))
	
	seraph.sprite_loadout = sprite_loadout
	seraph.sprite_portrait = sprite_portrait
	seraph.sprite_portrait_small = sprite_portrait_small
	seraph.sprite_title = sprite_walk
	seraph.sprite_idle = sprite_idle
	seraph.sprite_credits = sprite_credits
	-- seraph.select_sound_id = sound_select --turned off until the CSS is remade
	
	
	seraph:set_palettes(sprite_palette, sprite_palette, sprite_palette)
	
	-- Add skins
	seraph:add_skin("Friend", 1, Resources.sprite_load(NAMESPACE, "SeraphSelect2", path.combine(SPRITE_PATH, "select2.png"), 1, 28, 0),
	Resources.sprite_load(NAMESPACE, "SeraphPortrait2", path.combine(SPRITE_PATH, "portrait2.png"), 1),
    Resources.sprite_load(NAMESPACE, "SeraphPortraitSmall12", path.combine(SPRITE_PATH, "portraitSmall2.png")))
	
	seraph:add_skin("Foe", 2, Resources.sprite_load(NAMESPACE, "SeraphSelect3", path.combine(SPRITE_PATH, "select3.png"), 1, 28, 0),
	Resources.sprite_load(NAMESPACE, "SeraphPortrait3", path.combine(SPRITE_PATH, "portrait3.png"), 2),
    Resources.sprite_load(NAMESPACE, "SeraphPortraitSmall13", path.combine(SPRITE_PATH, "portraitSmall3.png")))
	
	seraph:add_skin("Ocean", 3, Resources.sprite_load(NAMESPACE, "SeraphSelect4", path.combine(SPRITE_PATH, "select4.png"), 1, 28, 0),
	Resources.sprite_load(NAMESPACE, "SeraphPortrait4", path.combine(SPRITE_PATH, "portrait4.png"), 3),
    Resources.sprite_load(NAMESPACE, "SeraphPortraitSmall14", path.combine(SPRITE_PATH, "portraitSmall4.png")))
	
	seraph:add_skin("Golden", 4, Resources.sprite_load(NAMESPACE, "SeraphSelect5", path.combine(SPRITE_PATH, "select5.png"), 1, 28, 0),
	Resources.sprite_load(NAMESPACE, "SeraphPortrait5", path.combine(SPRITE_PATH, "portrait5.png"), 4),
    Resources.sprite_load(NAMESPACE, "SeraphPortraitSmall15", path.combine(SPRITE_PATH, "portraitSmall5.png")))
	
	-- seraph:add_skin("Faded", 4, Resources.sprite_load(NAMESPACE, "SeraphSelect6", path.combine(SPRITE_PATH, "select6.png"), 21, 28, 0),
	-- Resources.sprite_load(NAMESPACE, "SeraphPortrait5", path.combine(SPRITE_PATH, "portrait5.png"), 5),
    -- Resources.sprite_load(NAMESPACE, "SeraphPortraitSmall15", path.combine(SPRITE_PATH, "portraitSmall5.png")))
	
	-- create things that are predefined so I can use them later on
	
	local ATTACK_TAG_SERAPH_PRIMARY = 1
	local ATTACK_TAG_APPLY_SHATTER = 1
	local ATTACK_TAG_IGNORED_BY_SHATTER = 1
	local SHATTER_DEBUFF_DURATION = 3 * 60
	local VOID_MIMIC_LIFE = 14 * 60
	local VOID_MIMIC_HEALTH = 1 --(will need to find how to make it mimiced enemy health - seraphs health * 1.2)
	local ATTACK_UTILITY_PULL = 1
	local ATTACK_UTILITY_BASH = 1
	local FIELD_RADIUS = 220
	local FIELD_RADIUS_BOOSTED = 280
	local FIELD_TIMER = 240
	local FIELD_TIMER_BOOSTED = 360
	
	
	seraph:clear_callbacks()
	seraph:onInit(function(actor)
	-- setup half-sprite nonsense
	local idle_half = Array.new()
	local walk_half = Array.new()
	local jump_half = Array.new()
	local jump_peak_half = Array.new()
	local fall_half = Array.new()
	idle_half:push(sprite_idle, sprite_idle_half, 0)
	walk_half:push(sprite_walk, sprite_walk_half, 0, sprite_walk_back)
	jump_half:push(sprite_jump, sprite_jump_half, 0)
	jump_peak_half:push(sprite_jump_peak, sprite_jump_peak_half, 0)
	fall_half:push(sprite_fall, sprite_fall_half, 0)

	actor.sprite_idle_half = idle_half
	actor.sprite_walk_half = walk_half
	actor.sprite_jump_half = jump_half
	actor.sprite_jump_peak_half = jump_peak_half
	actor.sprite_fall_half = fall_half

	actor:survivor_util_init_half_sprites()
end)

	-- Create skills
	local seraphPrimary = seraph:get_primary()
	local seraphSecondary = seraph:get_secondary()
	local seraphUtility = seraph:get_utility()
	local seraphSpecial = seraph:get_special()
	local seraphSpecialUpgraded = Skill.new(NAMESPACE, "seraphVBoosted")
	seraphSpecial:set_skill_upgrade(seraphSpecialUpgraded)
	
	-- Create alt skills. Currently act like default primary, give different behaviors later
	local seraphAltPrimary = Skill.new(NAMESPACE, "seraphZ2")
	local seraphAltUtility = Skill.new(NAMESPACE, "seraphC2")
	local seraphAltSpecial = Skill.new(NAMESPACE, "seraphV2")
	local seraphSpecialAltUpgraded = Skill.new(NAMESPACE, "seraphV2Boosted")
	
	seraph:add_primary(seraphAltPrimary)
	seraph:add_utility(seraphAltUtility)
	seraph:add_special(seraphAltSpecial)
	
	seraphAltSpecial:set_skill_upgrade(seraphSpecialAltUpgraded)
	
	
	-- assign anims for each skill. Alts use primary and its code for now
    seraphPrimary:set_skill_animation(shoot1)
	seraphSecondary:set_skill_animation(shoot2)
	seraphUtility:set_skill_animation(shoot3_1)
	seraphSpecial:set_skill_animation(shoot4)
	seraphSpecialUpgraded:set_skill_animation(shoot5)
	
	seraphAltPrimary:set_skill_animation(shoot1)
	seraphAltUtility:set_skill_animation(shoot1)
	seraphAltSpecial:set_skill_animation(shoot1)
	seraphSpecialAltUpgraded:set_skill_animation(shoot1)
	
	-- Seraphs grasp
	seraphPrimary.sprite = sprite_skills
	seraphPrimary.subimage = 0
	seraphPrimary.cooldown = 65
	seraphPrimary.damage = 1.4
	seraphPrimary.require_key_press = false
	seraphPrimary.is_primary = true
	seraphPrimary.disable_aim_stall = true
	seraphPrimary.does_change_activity_state = true
	seraphPrimary.hold_facing_direction = true
	seraphPrimary.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.any

	local stateseraphPrimary = State.new(NAMESPACE, "seraphPrimary")
	
	seraphPrimary:clear_callbacks()
	seraphPrimary:onActivate(function(actor)
	actor:enter_state(stateseraphPrimary)
end)

	stateseraphPrimary:clear_callbacks()
	stateseraphPrimary:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot1
end)
	stateseraphPrimary:onStep(function(actor, data)
    actor:actor_animation_set(sprite_shoot1, 0.2 * actor.attack_speed, gm.constants.STRAFE_SPEED_NORMAL)
	
	actor:skill_util_strafe_and_slide(actor.pHspeed, 0.2 * actor.attack_speed, gm.constants.STRAFE_SPEED_NORMAL)
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then

        local damage = actor:skill_get_damage(seraphPrimary)
		local dir = actor:skill_util_facing_direction()
        
        if actor:is_authority() then
            if not actor:skill_util_update_heaven_cracker(actor, damage) then
                local buff_shadow_clone = Buff.find("ror", "shadowClone")
                for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
				local lasers = actor:fire_bullet(actor.x, actor.y + 5, 350, dir, 0, nil, sprite_seraphSparks4, nil, false).attack_info
				        if can_proc == nil then can_proc = true
					end
				lasers.climb = 10000
				lasers.__ssr_seraph_primary = ATTACK_TAG_SERAPH_PRIMARY
			end
		end
	end
	
Callback.add(Callback.TYPE.onAttackHit, "SeraphPrimaryOnHit", function(hit_info)
	local attack_tag = hit_info.attack_info.__ssr_seraph_primary
	if attack_tag then
		local victim = hit_info.target
	if attack_tag == ATTACK_TAG_SERAPH_PRIMARY then
	
	local explosion = actor:fire_explosion(victim.x, actor.y + 5, 12, 12, damage, nil, sprite_seraphSparks1, true).attack_info
				explosion.climb = 1 * 8 * 1.35
		        if can_proc == nil then can_proc = true end
				
			end
		end
	end)
		actor:screen_shake(4)
	    actor:sound_play(sound_shoot1, 0.6, 1 + math.random() * 0.2)
        data.fired = 1
	end
end)
	
	-- Void Breach
	seraphSecondary.sprite = sprite_skills
	seraphSecondary.subimage = 2
	seraphSecondary.cooldown = 4.5 * 60
	seraphSecondary.damage = 0
	seraphSecondary.require_key_press = true
	seraphSecondary.does_change_activity_state = true
	seraphSecondary.ignore_aim_direction = true
	seraphSecondary.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

	local stateseraphSecondary = State.new(NAMESPACE, "seraphSecondary")
	
	-- Need to rework how this functions, since it procs stuff
	
	local objOrb = Object.new(NAMESPACE, "SeraphOrbProj")
	objOrb.obj_sprite = sprite_seraphOrb
	
	seraphSecondary:clear_callbacks()
	seraphSecondary:onActivate(function(actor)
	actor:enter_state(stateseraphSecondary)
end)

	stateseraphSecondary:clear_callbacks()
	stateseraphSecondary:onEnter(function(actor, data)
	local ORB_LIFE = 14 * 60
	actor.image_index2 = 0
	data.fired = 0
	data.currentAnim = ((data.currentAnim or 1) + 1) % 2
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot1
end)
	stateseraphSecondary:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot1, 0.19)
	
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then

        local damage = actor:skill_get_damage(seraphSecondary)
		local dir = actor:skill_util_facing_direction()
        
        if actor:is_authority() then
                local buff_shadow_clone = Buff.find("ror", "shadowClone")
                for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
				local orb = objOrb:create(actor.x - i * 12 * actor.image_xscale, actor.y)
				if can_proc == nil then can_proc = false end
					orb.parent = actor
					orb.team = actor.team
					if actor.pHspeed ~= 0 then
					orb.speed = actor.pHspeed * 0.8 + 0.3
					if actor.pHspeed == 0 then
					orb.speed = 0
					orb.damage = 0
					orb.direction = actor:skill_util_facing_direction()
					orb.image_xscale = actor.image_xscale
					orb.depth = orb.depth + i
				orb.climb = 10000
				orb.__ssr_seraph_secondary = ATTACK_TAG_APPLY_SHATTER
			end
			
				actor:sound_play(sound_shoot2_1, 0.6, 1 + math.random() * 0.2)
				end
								actor:sound_play(sound_shoot2_1, 0.6, 1 + math.random() * 0.2)
			end
		end
	end
	
	-- This sets up the thing for applying shatter debuff
	
Callback.add(Callback.TYPE.onAttackHit, "SeraphSecondaryCollide", function(hit_info)
	local attack_tag = hit_info.attack_info.__ssr_seraph_secondary
	if attack_tag then
		local victim = hit_info.target
	if attack_tag == ATTACK_TAG_APPLY_SHATTER then
		if victim:buff_stack_count(debuffShatter) == 0 then
				victim:buff_apply(debuffShatter, 6 * 60, 1)
				-- print("applied shatter to enemy") this was used for debugging if shit went wrong, but now that this is finished it's redundant!
		else
				victim:set_buff_time(debuffShatter, 6 * 60)
					end
				end
			end
		end)
        data.fired = 1
end)
	
	objOrb:clear_callbacks()
	objOrb:onCreate(function(inst)
	inst.image_speed = 0.5
	inst.parent = -4
	inst.radius = 12
		local data = inst:get_data()
	data.life = 20 * 60
end)
objOrb:onStep(function(inst)
	local data = inst:get_data()
	if not Instance.exists(inst.parent) then
		inst:destroy()
		return
	end				
					data.life = data.life - 1
									if data.life <= 0 then
					inst:destroy()
				end

	local actors = inst:get_collisions(gm.constants.pActorCollisionBase)

	for _, actor in ipairs(actors) do
		if inst:attack_collision_canhit(actor) then
			if gm._mod_net_isHost() then
				local attack = inst.parent:fire_direct(actor, 0, nil, inst.direction, inst.x, inst.y).attack_info
				attack.__ssr_seraph_secondary = ATTACK_TAG_APPLY_SHATTER
				attack.climb = 10000
			end
			inst:sound_play(sound_shoot2_2, 0.6, 1 + math.random() * 0.2)
					inst:destroy()
				end
		end
end)

	-- Disturbance
	
	
	seraphUtility.sprite = sprite_skills
	seraphUtility.subimage = 3
	seraphUtility.cooldown = 5.5 * 60
	seraphUtility.damage = 1.1
	seraphUtility.require_key_press = true
	seraphUtility.does_change_activity_state = true
	seraphUtility.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

	local stateseraphUtilityPull = State.new(NAMESPACE, "seraphUtilityPull")
	local stateseraphUtilityBash = State.new(NAMESPACE, "seraphUtilityBash")
	
	seraphUtility:clear_callbacks()
	seraphUtility:onActivate(function(actor)
	if actor.pHspeed ~= 0 then
	actor:enter_state(stateseraphUtilityPull)
	end
	if actor.pHspeed == 0 then
	actor:enter_state(stateseraphUtilityBash)
	end
end)

	stateseraphUtilityPull:clear_callbacks()
	stateseraphUtilityPull:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	data.currentAnim = ((data.currentAnim or 1) + 1) % 2
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot3_2
end)
	stateseraphUtilityPull:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot3_2, 0.19)
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then

		local dir = actor:skill_util_facing_direction()
        
        if actor:is_authority() then
                local buff_shadow_clone = Buff.find("ror", "shadowClone")
                for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
				local pull = actor:fire_explosion(actor.x + actor.image_xscale * 180, actor.y, 320, 20, 0, nil, false).attack_info
							if can_proc == nil then can_proc = false end
					pull.climb = 1000000
					pull.__ssr_seraph_utility_pull = ATTACK_UTILITY_PULL
							end
					end
		actor:screen_shake(3)
	    actor:sound_play(sound_shoot3_2, 0.6, 1 + math.random() * 0.2)
        data.fired = 1
	end
end)

	stateseraphUtilityBash:clear_callbacks()
	stateseraphUtilityBash:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	data.currentAnim = ((data.currentAnim or 1) + 1) % 2
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot3_1
end)
	stateseraphUtilityBash:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot3_1, 0.19)
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then

		local dir = actor:skill_util_facing_direction()
        
        if actor:is_authority() then
                local buff_shadow_clone = Buff.find("ror", "shadowClone")
                for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
				local bash = actor:fire_explosion(actor.x, actor.y, 280, 20, 0, nil, false).attack_info
							if can_proc == nil then can_proc = false end
					bash.climb = 1000000
					bash.__ssr_seraph_utility_bash = ATTACK_UTILITY_BASH
							end
					end
		actor:screen_shake(4)
	    actor:sound_play(sound_shoot3_2, 0.6, 1 + math.random() * 0.2)
        data.fired = 1
	end
end)

Callback.add(Callback.TYPE.onAttackHit, "SeraphUtilityPull", function(hit_info)
	local attack_tag = hit_info.attack_info.__ssr_seraph_utility_pull
	if attack_tag then
		local victim = hit_info.target
		local actor = hit_info.parent
		local hit = hit_info.attack_info.hit_number
	if attack_tag == ATTACK_UTILITY_PULL then
			victim.pVspeed = -6
			
							local function actualPull()
					victim.pVspeed = 2
					local pullDamager = actor:fire_direct(victim, 1.1, nil, victim.x, victim.y, nil, true).attack_info
					pullDamager.climb = -20
			
						pullDamager.knockback = 9
						pullDamager.knockback_direction = -actor.image_xscale
				end

				Alarm.create(actualPull, 15)
		
			end
		end
	end)

Callback.add(Callback.TYPE.onAttackHit, "SeraphUtilityBash", function(hit_info)
	local attack_tag = hit_info.attack_info.__ssr_seraph_utility_bash
	if attack_tag then
		local victim = hit_info.target
		local actor = hit_info.parent
	if attack_tag == ATTACK_UTILITY_BASH then
				victim.pVspeed = -12
				
				local function actualBash(print, die)
					victim.pVspeed = 20
					local bashDamager = actor:fire_direct(victim, 3.1, nil, victim.x, victim.y, nil, true).attack_info
					bashDamager.climb = -120
					bashDamager:set_stun(0.6)
				end

				Alarm.create(actualBash, 25, print, die)
			end
		end
	end)


	-- Grace field
	seraphSpecial.sprite = sprite_skills
	seraphSpecial.subimage = 5
	seraphSpecial.cooldown = 11 * 60
	seraphSpecial.damage = 0
	seraphSpecial.require_key_press = true
	seraphSpecial.does_change_activity_state = true
	seraphSpecial.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

	local stateseraphSpecial = State.new(NAMESPACE, "seraphSpecial")
	
	local objFieldD = Object.new(NAMESPACE, "VoidFieldD")
	objFieldD.obj_depth = -260
	
	seraphSpecial:clear_callbacks()
	seraphSpecial:onActivate(function(actor)
	actor:enter_state(stateseraphSpecial)
end)

	stateseraphSpecial:clear_callbacks()
	stateseraphSpecial:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	data.currentAnim = ((data.currentAnim or 1) + 1) % 2
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot4
end)
	stateseraphSpecial:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot4, 0.2)	
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
	   if data.fired == 0 and actor.image_index >= 0 then
				local self = objFieldD:create(actor.x, actor.y)
									self.parent = -4
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
									target:buff_apply(debuffField, 10, 1)
							else
									GM.set_buff_time_nosync(target, debuffField, 10)
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
	seraphSpecialUpgraded.sprite = sprite_skills
	seraphSpecialUpgraded.subimage = 6
	seraphSpecialUpgraded.cooldown = 11 * 60
	seraphSpecialUpgraded.damage = 0
	seraphSpecialUpgraded.require_key_press = true
	seraphSpecialUpgraded.does_change_activity_state = true
	seraphSpecialUpgraded.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

	local stateseraphSpecialUpgraded = State.new(NAMESPACE, "seraphSpecialUpgraded")
	
	local objFieldS = Object.new(NAMESPACE, "VoidFieldS")
	objFieldS.obj_depth = -260
	
	seraphSpecialUpgraded:clear_callbacks()
	seraphSpecialUpgraded:onActivate(function(actor)
	actor:enter_state(stateseraphSpecialUpgraded)
end)

	stateseraphSpecialUpgraded:clear_callbacks()
	stateseraphSpecialUpgraded:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	data.currentAnim = ((data.currentAnim or 1) + 1) % 2
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot5
end)
	stateseraphSpecialUpgraded:onStep(function(actor, data)
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
							if target:buff_stack_count(debuffField) == 0 then
									target:buff_apply(debuffField, 10, 1)
							else
									GM.set_buff_time_nosync(target, debuffField, 10)
							end
							if target.team ~= 1 then
								if target:buff_stack_count(debuffShatter) == 0 then
									target:buff_apply(debuffShatter, 10, 1)
							else
									GM.set_buff_time_nosync(target, debuffShatter, 10)
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

	-- Alt primary
	seraphAltPrimary.sprite = sprite_skills
	seraphAltPrimary.subimage = 1
	seraphAltPrimary.cooldown = 65
	seraphAltPrimary.damage = 1.4
	seraphAltPrimary.require_key_press = false
	seraphAltPrimary.is_primary = true
	seraphAltPrimary.disable_aim_stall = true
	seraphAltPrimary.does_change_activity_state = true
	seraphAltPrimary.hold_facing_direction = true
	seraphAltPrimary.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.any

	local stateseraphAltPrimary = State.new(NAMESPACE, "seraphAltPrimary")
	
	seraphAltPrimary:clear_callbacks()
	seraphAltPrimary:onActivate(function(actor)
	actor:enter_state(stateseraphAltPrimary)
end)

	stateseraphAltPrimary:clear_callbacks()
	stateseraphAltPrimary:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot1
end)

	-- Alt utility
	seraphAltUtility.sprite = sprite_skills
	seraphAltUtility.subimage = 4
	seraphAltUtility.cooldown = 65
	seraphAltUtility.damage = 1.4
	seraphAltUtility.require_key_press = false
	seraphAltUtility.disable_aim_stall = true
	seraphAltUtility.does_change_activity_state = true
	seraphAltUtility.hold_facing_direction = true
	seraphAltUtility.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.any

	local stateseraphAltUtility = State.new(NAMESPACE, "seraphAltUtility")
	
	seraphAltUtility:clear_callbacks()
	seraphAltUtility:onActivate(function(actor)
	actor:enter_state(stateseraphAltUtility)
end)

	stateseraphAltUtility:clear_callbacks()
	stateseraphAltUtility:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot1
end)

	-- Alt special
	seraphAltSpecial.sprite = sprite_skills
	seraphAltSpecial.subimage = 7
	seraphAltSpecial.cooldown = 65
	seraphAltSpecial.damage = 1.4
	seraphAltSpecial.require_key_press = false
	seraphAltSpecial.disable_aim_stall = true
	seraphAltSpecial.does_change_activity_state = true
	seraphAltSpecial.hold_facing_direction = true
	seraphAltSpecial.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.any

	local stateseraphAltSpecial = State.new(NAMESPACE, "seraphAltSpecial")
	
	seraphAltSpecial:clear_callbacks()
	seraphAltSpecial:onActivate(function(actor)
	actor:enter_state(stateseraphAltSpecial)
end)

	stateseraphAltSpecial:clear_callbacks()
	stateseraphAltSpecial:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot1
end)

	-- Alt special upgraded
	seraphSpecialAltUpgraded.sprite = sprite_skills
	seraphSpecialAltUpgraded.subimage = 8
	seraphSpecialAltUpgraded.cooldown = 65
	seraphSpecialAltUpgraded.damage = 1.4
	seraphSpecialAltUpgraded.require_key_press = false
	seraphSpecialAltUpgraded.disable_aim_stall = true
	seraphSpecialAltUpgraded.does_change_activity_state = true
	seraphSpecialAltUpgraded.hold_facing_direction = true
	seraphSpecialAltUpgraded.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.any

	local stateseraphSpecialAltUpgraded = State.new(NAMESPACE, "seraphSpecialAltUpgraded")
	
	seraphSpecialAltUpgraded:clear_callbacks()
	seraphSpecialAltUpgraded:onActivate(function(actor)
	actor:enter_state(stateseraphSpecialAltUpgraded)
end)

	stateseraphSpecialAltUpgraded:clear_callbacks()
	stateseraphSpecialAltUpgraded:onEnter(function(actor, data)
	actor.image_index2 = 0
	data.fired = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot1
end)

local seraphLog = Survivor_Log.new(seraph, sprite_log)


	-- Thanks to Miguelito for this block of code!
	gm.post_script_hook(gm.constants.RunPostgameReport_clone, function(self, other, result, args)
    print("PlayerGameReport")

    local difficulty = args[1].value.difficulty_id
    local artifacts = args[1].value.artifact_ids
    local ending = args[1].value.ending_id
    -- print(difficulty)
    -- for i=1, #artifacts do 
        -- print(artifacts[i])
    -- end
    -- print("Number of artifacts:", #artifacts)
    -- print(ending)
end)

	-- Thanks to TRYAGAIN for this block of code!
	function set_survivor_achievement(achievement_seraph, seraph, difficulty, ending, artifacts)
	
		achievement_seraph.group = Achievement.GROUP.character
		
			achievement_seraph.unlock_kind = survivor
			
				achievement_seraph.token_unlock_name = seraph.token_name
		
						achievement_seraph:set_sprite(sprite_portrait, 0)
						
							seraph:set_survivor_achievement(achievement_seraph)
				
								
			end
			
		if artifacts == 0 then
			if difficulty == hard then
				if ending == win then seraph.progress_achievement()
			else end
			end
		end
		
	
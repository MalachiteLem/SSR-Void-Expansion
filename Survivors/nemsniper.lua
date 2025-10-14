
	local SPRITE_PATH = path.combine(PATH, "Sprites/Survivors/Nemsniper")
	local SOUND_PATH = path.combine(PATH, "Sounds/Survivors/Nemsniper")
	
	local sprite_palette				=Resources.sprite_load(NAMESPACE, "NemsniperPalette", path.combine(SPRITE_PATH, "palette.png"))
	local sprite_loadout		=Resources.sprite_load(NAMESPACE, "NemsniperSelectS0", path.combine(SPRITE_PATH, "selectS0.png"), 12, 28, 0)
	local sprite_portrait		=Resources.sprite_load(NAMESPACE, "NemsniperPortraitS0", path.combine(SPRITE_PATH, "portraitS0.png"), 3)
	local sprite_portrait_small 		=Resources.sprite_load(NAMESPACE, "NemsniperPortraitSmallS0", path.combine(SPRITE_PATH, "portraitSmallS0.png"))
	local sprite_credits		= Resources.sprite_load(NAMESPACE, "CreditsSurvivorNemsniper", path.combine(SPRITE_PATH, "credits.png"), 1, 7, 11)
	local sprite_skills		=Resources.sprite_load(NAMESPACE, "NemsniperSkills", path.combine(SPRITE_PATH, "skills.png"), 5)
	local sprite_idle		=Resources.sprite_load(NAMESPACE, "NemsniperIdle", path.combine(SPRITE_PATH, "idle.png"), 1, 18, 7)
	local sprite_walk		=Resources.sprite_load(NAMESPACE, "NemsniperWalk", path.combine(SPRITE_PATH, "walk.png"), 8, 18, 12)
	local sprite_walk_back		=Resources.sprite_load(NAMESPACE, "NemsniperWalkBack", path.combine(SPRITE_PATH, "walk.png"), 8, 18, 12)
	local sprite_jump		=Resources.sprite_load(NAMESPACE, "NemsniperJump", path.combine(SPRITE_PATH, "jump.png"), 1, 18, 29)
	local sprite_fall			= Resources.sprite_load(NAMESPACE, "NemsniperFall", path.combine(SPRITE_PATH, "fall.png"), 1, 18, 29)
	local sprite_climb			= Resources.sprite_load(NAMESPACE, "NemsniperClimb", path.combine(SPRITE_PATH, "climb.png"), 6, 16, 22)
	local sprite_death			= Resources.sprite_load(NAMESPACE, "NemsniperDeath", path.combine(SPRITE_PATH, "death.png"), 7, 24, 21)
	local sprite_decoy			= Resources.sprite_load(NAMESPACE, "NemsniperDecoy", path.combine(SPRITE_PATH, "decoy.png"), 1, 17, 16)
	local sprite_drone_idle		= Resources.sprite_load(NAMESPACE, "DronePlayerNemsniperIdle", path.combine(SPRITE_PATH, "droneIdle.png"), 5, 11, 14)
	local sprite_drone_shoot	= Resources.sprite_load(NAMESPACE, "DronePlayerNemsniperShoot", path.combine(SPRITE_PATH, "droneShoot.png"), 5, 33, 13)
	local sprite_credits		= Resources.sprite_load(NAMESPACE, "NemsniperCredits", path.combine(SPRITE_PATH, "credits.png"), 1)
	
	local sprite_shoot1_1		=Resources.sprite_load(NAMESPACE, "NemsniperShoot1_1", path.combine(SPRITE_PATH, "shoot1_1.png"), 6, 23, 31)
	local sprite_shoot1_2 		=Resources.sprite_load(NAMESPACE, "NemsniperShoot1_2", path.combine(SPRITE_PATH, "shoot1_2.png"), 6, 23, 31)
	local sprite_shoot1_3			=Resources.sprite_load(NAMESPACE, "NemsniperShoot1_3", path.combine(SPRITE_PATH, "shoot1_3.png"), 4, 24, 24)
	local sprite_shoot3			=Resources.sprite_load(NAMESPACE, "NemsniperShoot3", path.combine(SPRITE_PATH, "shoot3.png"), 16, 20, 29)

	local sound_shoot1_1			=Resources.sfx_load(NAMESPACE, "NemsniperShoot1_1", path.combine(SOUND_PATH, "Shoot1_1.ogg"))
	local sound_shoot1_2			=Resources.sfx_load(NAMESPACE, "NemsniperShoot1_2", path.combine(SOUND_PATH, "Shoot1_2.ogg"))
	local sound_shoot2_1			=Resources.sfx_load(NAMESPACE, "NemsniperShoot2_1", path.combine(SOUND_PATH, "Shoot2_1.ogg"))
	
	local sprite_bar		=Resources.sprite_load(NAMESPACE, "NemsniperBarHeat", path.combine(SPRITE_PATH, "bar_empty.png"))

	local overheated        =Buff.new(NAMESPACE, "debuffOverheated")
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
			damage = 14.5,
			regen = 0.015,
	})
	
	nemsniper:set_stats_level({
			maxhp = 28,
			damage = 4.2,
			regen = 0.003,
	})
	
	nemsniper:set_animations({
		idle = sprite_idle,
		walk = sprite_walk,
		jump = sprite_jump,
		jump_peak = sprite_jumpPeak,
		fall = sprite_fall,
		climb = sprite_climb,
		death = sprite_death,
		decoy = sprite_decoy,	
		
		drone_idle = sprite_drone_idle,
		drone_shoot = sprite_drone_shoot,
	})
	
	nemsniper:set_cape_offset(1, -9, 0, -14)
	nemsniper:set_primary_color(Color.from_rgb(255, 255, 43))
	
	nemsniper.sprite_loadout = sprite_loadout
	nemsniper.sprite_portrait = sprite_portrait
	nemsniper.sprite_portrait_small = sprite_portrait_small
	nemsniper.sprite_title = sprite_walk
	nemsniper.sprite_idle = sprite_idle
	nemsniper.sprite_credits = sprite_credits
	
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
	
    nemsniperPrimary:set_skill_animation(shoot1_1)
	nemsniperSecondary:set_skill_animation(shoot1_2)
	nemsniperUtility:set_skill_animation(shoot3)

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
	
	-- Primary
	nemsniperPrimary.sprite = sprite_skills
	nemsniperPrimary.subimage = 0 
	nemsniperPrimary.cooldown = 30
	nemsniperPrimary.damage = 2
	nemsniperPrimary.require_key_press = false
	nemsniperPrimary.is_primary = true
	nemsniperPrimary.disable_aim_stall = true
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
	data.sprite = sprite_shoot1_1
end)
	statenemsniperPrimary:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot1_1, 0.3)
	
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then

        local damage = actor:skill_get_damage(nemsniperPrimary)
		local dir = actor:skill_util_facing_direction()
        
        if not actor:skill_util_update_heaven_cracker(actor, damage) then
           local buff_shadow_clone = Buff.find("ror", "shadowClone")
        for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
			local projectile = actor:fire_bullet(actor.x, actor.y, 99999, dir, damage, nil, nil, Attack_Info.TRACER.sniper1, true).attack_info
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
	actor:skill_util_fix_hspeed()
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
	nemsniperSecondary.subimage = 1
	nemsniperSecondary.cooldown = 6.5 * 60
	nemsniperSecondary.damage = 0.18
	nemsniperSecondary.require_key_press = true
	nemsniperSecondary.does_change_activity_state = true
	nemsniperSecondary.ignore_aim_direction = true
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
	data.sprite = sprite_shoot1_2
end)
	statenemsniperSecondary:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot1_1, 0.3)
	
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then

        local damage = actor:skill_get_damage(nemsniperSecondary)
		local dir = actor:skill_util_facing_direction()
        
        if not actor:skill_util_update_heaven_cracker(actor, damage) then
           local buff_shadow_clone = Buff.find("ror", "shadowClone")
        for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
			local projectile = actor:fire_bullet(actor.x, actor.y, 99999, dir, damage * heat, 1.8, nil, Attack_Info.TRACER.sniper2, true).attack_info
				actor:screen_shake(1.5)
				actor:sound_play(sound_shoot1_1, 0.6, 1 + math.random() * 0.3)
				heat = 0
				data.fired = 1
			end
		end
	end
end)
	

	-- Disturbance (Utility)
	
	nemsniperUtility.sprite = sprite_skills
	nemsniperUtility.subimage = 2
	nemsniperUtility.cooldown = 6.5 * 60
	nemsniperUtility.damage = 1.1
	nemsniperUtility.require_key_press = true
	nemsniperUtility.does_change_activity_state = true
	nemsniperUtility.required_interrupt_priority = State.ACTOR_STATE_INTERRUPT_PRIORITY.skill

	local statenemsniperUtilityPull = State.new(NAMESPACE, "nemsniperUtilityPull")
	local statenemsniperUtilityBash = State.new(NAMESPACE, "nemsniperUtilityBash")
	
	nemsniperUtility:clear_callbacks()
	nemsniperUtility:onActivate(function(actor)
	if actor.pHspeed ~= 0 then
	actor:enter_state(statenemsniperUtilityPull)
	end
	if actor.pHspeed == 0 then
	actor:enter_state(statenemsniperUtilityBash)
	end
end)

	statenemsniperUtilityPull:clear_callbacks()
	statenemsniperUtilityPull:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot3_2
end)
	statenemsniperUtilityPull:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot3_2, 0.19)
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then
		local dir = actor:skill_util_facing_direction()
        
                local buff_shadow_clone = Buff.find("ror", "shadowClone")
                for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
				local pull = actor:fire_explosion(actor.x + actor.image_xscale * 180, actor.y, 320, 20, 0, nil, false, false).attack_info
							if can_proc == nil then can_proc = false end
						pull.climb = 1000000
					pull.__ssr_nemsniper_utility_pull = ATTACK_UTILITY_PULL
							end
		actor:screen_shake(3)
	    actor:sound_play(sound_shoot3_2, 0.6, 1 + math.random() * 0.2)
        data.fired = 1
		
	end
end)

	statenemsniperUtilityBash:clear_callbacks()
	statenemsniperUtilityBash:onEnter(function(actor, data)
	actor.image_index = 0
	data.fired = 0
	data.currentAnim = 0
	actor:skill_util_strafe_and_slide_init()
	data.sprite = sprite_shoot3_1
end)
	statenemsniperUtilityBash:onStep(function(actor, data)
	actor:skill_util_fix_hspeed()
    actor:actor_animation_set(sprite_shoot3_1, 0.34)
	actor:skill_util_strafe_and_slide(1)
	actor:skill_util_exit_state_on_anim_end()
	
   if data.fired == 0 and actor.image_index >= 0 then

		local dir = actor:skill_util_facing_direction()
        
                local buff_shadow_clone = Buff.find("ror", "shadowClone")
                for i=0, GM.get_buff_stack(actor, buff_shadow_clone) do
				local bash = actor:fire_explosion(actor.x, actor.y, 280, 20, 0, nil, false, false).attack_info
							if can_proc == nil then can_proc = false end
					bash.climb = 1000000
					bash:set_stun(0.15)
					bash.__ssr_nemsniper_utility_bash = ATTACK_UTILITY_BASH
				end
		actor:screen_shake(3)
	    actor:sound_play(sound_shoot3_2, 0.6, 1 + math.random() * 0.2)
		data.fired = 1
	end
end)

		-- Holy shit two cakes that are called pull and bash

	Callback.add(Callback.TYPE.onAttackHit, "SeraphUtilityPull", function(hit_info)
		local attack_tag = hit_info.attack_info.__ssr_nemsniper_utility_pull
	if attack_tag then
		local victim = hit_info.target
		local actor = hit_info.parent
	if attack_tag == ATTACK_UTILITY_PULL then
		actor.direction = actor:skill_util_facing_direction() -- Get the direction of Seraph player so we can pull them + enemies correctly
			if not GM.actor_is_boss(victim) and GM.actor_is_classic(victim) then
					victim.pVspeed = victim.pVspeed - 8.8
			end
			
							local function actualPull()
					local pullDamager = actor:fire_direct(victim, 1.1, nil, victim.x, victim.y, nil, true).attack_info
						pullDamager.climb = -18

					-- Code for when the player is facing <---
						-- Pull enemies to the right
					if actor.direction == 180 then  															-- print("Facing left") 
					if not GM.actor_is_boss(victim) and GM.actor_is_classic(victim) then
							actor:skill_util_reset_activity_state()
						pullDamager.knockback = 14
						pullDamager.knockback_dir = 1 -- (1 = right)
					end
						-- Pull Seraph to the left
						  actor.pHspeed = -14 * actor.image_xscale
					end
					-- Code for when the player is facing --->
						-- Pull enemies to the left
					if actor.direction == 0 then  																-- print("Facing right")
						if not GM.actor_is_boss(victim) and GM.actor_is_classic(victim) then
							actor:skill_util_reset_activity_state()
						pullDamager.knockback = 14
						pullDamager.knockback_dir = -1 -- (-1 = left)
					end
						-- Pull Seraph to the right
						actor.pHspeed = 14 * actor.image_xscale
					end
				end
				
				Alarm.create(actualPull, 35)
			end
		end
	end)

	Callback.add(Callback.TYPE.onAttackHit, "SeraphUtilityBash", function(hit_info)
		local attack_tag = hit_info.attack_info.__ssr_nemsniper_utility_bash
	if attack_tag then
		local victim = hit_info.target
		local actor = hit_info.parent
	if attack_tag == ATTACK_UTILITY_BASH then
		if not GM.actor_is_boss(victim) and GM.actor_is_classic(victim) then
				victim.pVspeed = victim.pVspeed - 13
				
				local function actualBash()
				if not GM.actor_is_boss(victim) and GM.actor_is_classic(victim) then -- No, you can't throw a collossus up into stratosphere.
					victim.pVspeed = victim.pVspeed + 130
					end
					local bashDamager = actor:fire_direct(victim, 3.1, nil, victim.x, victim.y, nil, true).attack_info
					bashDamager.climb = -30
					bashDamager:set_stun(0.75)
					end
					
				Alarm.create(actualBash, 30)
			end
		end
	end
end)

	-- Grace field
	nemsniperSpecial.sprite = sprite_skills
	nemsniperSpecial.subimage = 3
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
	nemsniperSpecialUpgraded.subimage = 4
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
	
	-- Ty Onyx for help with the clamp gamemaker function
	heat = gm.clamp(heat, 0, 110)
	
	if heat > 0 then
		heat = heat - 0.2
	else return end

	if heat > 105 then
		actor:buff_apply(overheated, 120 * 60, 1)
	else return end

	if actor:buff_stack_count(overheated) >= 1 then
		if heat <= 0 then
		actor:buff_remove(overheated)
			print("Removed the overheating")
	else return end end
	end)

objHeatBar:clear_callbacks()
objHeatBar:onCreate(function(self)
	self.parent = -4
	self.persistent = true
end)
objHeatBar:onStep(function(self)
	if not GM.actor_is_alive(self.parent) then
		self:destroy()
	end
end)

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
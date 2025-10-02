	-- Swirld
	
	local SPRITE_PATH = path.combine(PATH, "Sprites/Actors/Stray/Twirl")
	local SOUND_PATH = path.combine(PATH, "Sounds/Actors/Stray/Twirl")

	-- Load sprites
	
	local sprite_mask		=Resources.sprite_load(NAMESPACE, "TwirlMask", path.combine(SPRITE_PATH, "Mask.png"), 1, 0, 0)
	local sprite_idle		=Resources.sprite_load(NAMESPACE, "TwirlIdle", path.combine(SPRITE_PATH, "Idle.png"), 1, 8, 0)
	local sprite_walk		=Resources.sprite_load(NAMESPACE, "TwirlWalk", path.combine(SPRITE_PATH, "Walk.png"), 5, 8, 2)
	local sprite_death		=Resources.sprite_load(NAMESPACE, "TwirlDeath", path.combine(SPRITE_PATH, "Death.png"), 14, 8, 28)
	local sprite_shoot		=Resources.sprite_load(NAMESPACE, "TwirlShoot", path.combine(SPRITE_PATH, "Shoot1.png"), 20, 0, 5)
	local sprite_spawn		=Resources.sprite_load(NAMESPACE, "TwirlSpawn", path.combine(SPRITE_PATH, "Spawn.png"), 25, 8, 0)
	local sprite_palette		=Resources.sprite_load(NAMESPACE, "TwirlPalette", path.combine(SPRITE_PATH, "Palette.png"))
	local sprite_portrait		=Resources.sprite_load(NAMESPACE, "TwirlPortrait", path.combine(SPRITE_PATH, "portrait.png"))
	local sprite_nonsense		=Resources.sprite_load(NAMESPACE, "TwirlNonsense", path.combine(SPRITE_PATH, "Jump.png"), 1, 0, 0)
	local sprite_bullet			=Resources.sprite_load(NAMESPACE, "TwirlBullet", path.combine(SPRITE_PATH, "Bullet.png"), 4, 0, 0)
	local sprite_trail			=Resources.sprite_load(NAMESPACE, "TwirlTrail", path.combine(SPRITE_PATH, "Trail.png"), 5, 0, 0)
	local sprite_trail_mask		=Resources.sprite_load(NAMESPACE, "TwirlTrailMask", path.combine(SPRITE_PATH, "TrailMask.png"), 5, 0, 0)
	
	local sprite_buff		=Resources.sprite_load(NAMESPACE, "TwirlInked", path.combine(SPRITE_PATH, "Buff.png"), 1, 8, -4)
	
	-- Load sounds
	
	local sound_spawn	=Resources.sfx_load(NAMESPACE, "TwirlSpawn", path.combine(SOUND_PATH, "Spawn.ogg"))
	local sound_death		=Resources.sfx_load(NAMESPACE, "TwirlDeath", path.combine(SOUND_PATH, "Death.ogg"))
	local sound_shoot1		=Resources.sfx_load(NAMESPACE, "TwirlShoot1", path.combine(SOUND_PATH, "Shoot_1.ogg"))
	local sound_shoot2		=Resources.sfx_load(NAMESPACE, "TwirlShoot2", path.combine(SOUND_PATH, "Shoot_2.ogg"))
	local sound_applyInked		=gm.constants.wWormHit
	local sound_hurt		=gm.constants.wMushHit

	-- Define
	
	local TWIRL_BULLET = 1
	
	-- Debuffs
	
	local debuffInked		=Buff.new(NAMESPACE, "debuffInked")
							debuffInked.icon_sprite = sprite_buff
							debuffInked.show_icon = true
							debuffInked.is_debuff = true
							debuffInked:clear_callbacks()
	
	local debuffSlowedInk	=Buff.new(NAMESPACE, "debuffSlowedInk")
							debuffSlowedInk.is_debuff = true
							debuffSlowedInk:clear_callbacks()
							
	debuffInked.max_stack = 3
	debuffSlowedInk.max_stack = 1
	
	-- Inked
	debuffInked:clear_callbacks()
	debuffInked:onPostStep(function(actor)
	local max_health = actor.maxhp
	local damage = max_health * 0.001
	actor.hp = actor.hp - damage
	Particle.find("ror", "PixelDust"):create_color(actor.x, actor.y + math.random(-7, 15), Color.BLACK, 7, Particle.SYSTEM.middle)
	end)
	
	-- Ink slowdown
	debuffSlowedInk:clear_callbacks()
	debuffSlowedInk:onPostStep(function(actor)
		actor.pHspeed = actor.pHspeed - 0.25
		Particle.find("ror", "PixelDust"):create_color(actor.x + math.random(-5, 5), actor.y - 3, Color.BLACK, 5, Particle.SYSTEM.middle)
	end)
	
	-- Create the log
	
	local log = Monster_Log.new(NAMESPACE, "Twirl")
	log.sprite_id = sprite_walk
	log.portrait_id = sprite_portrait
	log.sprite_offset_x = 44
	log.sprite_offset_y = 70
	log.stat_hp = 200
	log.stat_damage = 15
	log.stat_speed = 1.1
	
	-- Projectile
	
	local objInk = Object.new(NAMESPACE, "TwirlProj", Object.PARENT.actor)
	objInk.obj_sprite = sprite_bullet
	objInk:clear_callbacks()
	objInk:onCreate(function(inst)
		inst:init_actor_default()	
	
		local data = inst:get_data()
	data.life = 15 * 60
	
	inst.intangible = true
	inst.init = nil
	inst.team = gm.constants.TEAM_MONSTER
	end)
	
	objInk.obj_depth = 14
	
	--Trail
	
	local objTwirlTrail = Object.new(NAMESPACE, "TwirlTrail", Object.PARENT.actor)
	objTwirlTrail.obj_sprite = sprite_trail
	
	objTwirlTrail:clear_callbacks()
	objTwirlTrail:onCreate(function(inst)
	
	inst:move_contact_solid(270, -1)
	inst.team = gm.constants.TEAM_MONSTER
	inst.life = 0.8 * 60
	inst.subimage = math.random(1, 5)
	inst.mask = sprite_trail_mask
	
	
	for i = 1, 100 do
		if inst:is_colliding(gm.constants.pBlock, inst.x, inst.y) then
			break
		else
			inst.y = inst.y + 1
			if i == 100 then
				inst:destroy()
			end
		end
	end
end)

	objTwirlTrail:clear_callbacks()
	objTwirlTrail:onStep(function(inst)
	local actors = inst:get_collisions(gm.constants.pActorCollisionBase)
	
	for _, actor in ipairs(actors) do
		if inst:attack_collision_canhit(actor) then
			if gm._mod_net_isHost() then
			if actor.team ~= 2 then
				GM.set_buff_time_nosync(actor, debuffSlowedInk, 1)
			else return end
				end
			end
		end
	end)
	
	
	-- Enemy
	
	local twirl = Object.new(NAMESPACE, "Twirl", Object.PARENT.enemyClassic)
	local twirl_id = twirl.value
	
	twirl.obj_sprite = sprite_idle
	twirl.obj_depth = 11
	
	local twirlPrimary = Skill.new(NAMESPACE, "twirlZ")
	local stateTwirlPrimary = State.new(NAMESPACE, "twirlPrimary")
	
	twirl:clear_callbacks()
	twirl:onCreate(function(actor)
		actor.sprite_palette = sprite_palette
		actor.sprite_spawn = sprite_spawn
		actor.sprite_idle = sprite_idle
		actor.sprite_walk = sprite_walk
		actor.sprite_death = sprite_death
		actor.sprite_fall = sprite_nonsense
		actor.sprite_jump = sprite_nonsense
		actor.sprite_jump_peak = sprite_nonsense
		
		actor.can_jump = true
		
		actor.mask_index = sprite_mask
		
		actor.sound_spawn = sound_spawn
		actor.sound_death = sound_death
		actor.sound_hit = sound_hurt
		
		actor:enemy_stats_init(15, 200, 0, 36)
		actor.pHmax_base = 1.1
		
		actor.z_range = 370
		twirlPrimary.cooldown = 12 * 60
		actor.monster_log_drop_id = log.value
		actor:set_default_skill(Skill.SLOT.primary, twirlPrimary)
		
		actor:init_actor_late()
	end)
	
	twirlPrimary:clear_callbacks()
	twirlPrimary:onActivate(function(actor)
		actor:enter_state(stateTwirlPrimary)
	end)
	
	stateTwirlPrimary:clear_callbacks()
	stateTwirlPrimary:onEnter(function(actor, data)
		actor.image_index = 0
		data.fired = 0
	end)
	
	stateTwirlPrimary:onStep(function(actor, data)
		actor:skill_util_fix_hspeed()
		actor:actor_animation_set(sprite_shoot, 0.34)
		local dir = actor:skill_util_facing_direction()
		
		if data.fired == 0 and actor.image_index > 1 then
			actor:sound_play(sound_shoot1, 0.6, 1 + math.random() * 0.2)
			data.fired = 1
		end
		
		if data.fired == 1 and actor.image_index > 14 then
			actor:sound_play(sound_shoot2, 0.6, 1 + math.random() * 0.2)
			
			local ink_inst = objInk:create(actor.x - 24, actor.y + 18)
			ink_inst.image_xscale = actor.image_xscale
			ink_inst.parent = actor
			ink_inst.team = actor.team
			ink_inst.direction = dir
			ink_inst.speed = 4.5
				data.fired = 2
			end
		actor:skill_util_exit_state_on_anim_end()
	end)

		
	Callback.add(Callback.TYPE.onAttackHit, "TwirlBulletCollide", function(hit_info)

	local attack_tag = hit_info.attack_info.__ssr_twirl_bullet
	if attack_tag then
		local victim = hit_info.target
	if attack_tag == TWIRL_BULLET then
	victim:sound_play(sound_applyInked, 0.6, 1 + math.random() * 0.2)
		if victim:buff_stack_count(debuffInked) == 0 then
				victim:buff_apply(debuffInked, 4 * 60, 1)
		else
				GM.set_buff_time_nosync(victim, debuffInked, 4 * 60)
				end
			end
		end
	end)

objInk:onStep(function(inst)
	local data = inst:get_data()
	if not Instance.exists(inst.parent) then
		inst:destroy()
	return
end				
		data.life = data.life - 1
					if data.life <= 0 then inst:destroy()
end
	Particle.find("ror", "PixelDust"):create_color(inst.x - 4 + math.random(0, 8), inst.y + 6.5, Color.BLACK, 16, Particle.SYSTEM.middle)
	local actors = inst:get_collisions(gm.constants.pActorCollisionBase)

	for _, actor in ipairs(actors) do
		if inst:attack_collision_canhit(actor) then
				actor:buff_apply(debuffInked, 3.4 * 60, 1)
			end
	end
	
	
end)
	

	local monsterCardTwirl = Monster_Card.new(NAMESPACE, "twirl")
	monsterCardTwirl.object_id = twirl_id
	monsterCardTwirl.spawn_cost = 200
	monsterCardTwirl.spawn_type = Monster_Card.SPAWN_TYPE.classic
	monsterCardTwirl.can_be_blighted = true
	
	local loop = {
	"ror-magmaBarracks",
	"ror-riskOfRain",
	"ssr-torridOutlands"
	}
	
	for _, s in ipairs(loop) do
		local stage = Stage.find(s)
			if stage then
				stage:add_monster_loop(monsterCardTwirl)
		end
	end
	
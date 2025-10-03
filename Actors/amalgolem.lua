	-- Amalgolem? I barely know em
	
	local SPRITE_PATH = path.combine(PATH, "Sprites/Actors/Stray/Amalgolem")
	local SOUND_PATH = path.combine(PATH, "Sounds/Actors/Stray/Amalgolem")

	-- Load sprites
	
	local sprite_mask		=Resources.sprite_load(NAMESPACE, "AmalgolemMask", path.combine(SPRITE_PATH, "Mask.png"), 1, 18, 12)
	local sprite_idle		=Resources.sprite_load(NAMESPACE, "AmalgolemIdle", path.combine(SPRITE_PATH, "Idle.png"), 1, 28, 40)
	local sprite_walk		=Resources.sprite_load(NAMESPACE, "AmalgolemWalk", path.combine(SPRITE_PATH, "Walk.png"), 8, 46, 46)
	local sprite_death		=Resources.sprite_load(NAMESPACE, "AmalgolemDeath", path.combine(SPRITE_PATH, "Death.png"), 15, 56, 72)
	local sprite_spawn		=Resources.sprite_load(NAMESPACE, "AmalgolemSpawn", path.combine(SPRITE_PATH, "Spawn.png"), 14, 52, 64)
	local sprite_shoot		=Resources.sprite_load(NAMESPACE, "AmalgolemShoot", path.combine(SPRITE_PATH, "Shoot1.png"), 28, 58, 42)
	local sprite_palette		=Resources.sprite_load(NAMESPACE, "AmalgolemPalette", path.combine(SPRITE_PATH, "Palette.png"))
	local sprite_portrait		=Resources.sprite_load(NAMESPACE, "AmalgolemPortrait", path.combine(SPRITE_PATH, "portrait.png"))
	local sprite_nonsense		=Resources.sprite_load(NAMESPACE, "AmalgolemNonsense", path.combine(SPRITE_PATH, "Jump.png"), 1, 28, 29)
	
	-- Generate the palettes for elite variants
	
	gm.elite_generate_palettes(sprite_palette)
	
	-- Load sounds
	
	local sound_spawn	=Resources.sfx_load(NAMESPACE, "AmalgolemSpawn", path.combine(SOUND_PATH, "Spawn.ogg"))
	local sound_hit		=gm.constants.wGolemAttack1
	local sound_death	=gm.constants.wGolemDeath
	local sound_hurt	=gm.constants.wChildHit
	
	-- Create the log
	
	local log = Monster_Log.new(NAMESPACE, "Amalgolem")
	log.sprite_id = sprite_shoot
	log.portrait_id = sprite_portrait
	log.sprite_offset_x = 34
	log.sprite_offset_y = 46
	log.stat_hp = 460
	log.stat_damage = 48
	log.stat_speed = 0.9
	
	-- Create the actor
	
	local amalgolem = Object.new(NAMESPACE, "Amalgolem", Object.PARENT.enemyClassic)
	local amalgolem_id = amalgolem.value
	
	amalgolem.obj_sprite = sprite_idle
	amalgolem.obj_depth = 11
	
	local amalgolemPrimary = Skill.new(NAMESPACE, "amalgolemZ")
	local stateAmalgolemPrimary = State.new(NAMESPACE, "amalgolemPrimary")
	
	amalgolem:clear_callbacks()
	amalgolem:onCreate(function(actor)
		actor.sprite_palette = sprite_palette
		actor.sprite_spawn = sprite_spawn
		actor.sprite_idle = sprite_idle
		actor.sprite_walk = sprite_walk
		actor.sprite_death = sprite_death
		actor.sprite_fall = sprite_nonsense
		actor.sprite_jump = sprite_nonsense
		actor.sprite_jump_peak = sprite_nonsense
		
		actor.can_jump = false
		
		actor.mask_index = sprite_mask
		
		actor.sound_spawn = sound_spawn
		actor.sound_death = gm.constants.wGolemDeath
		actor.sound_hit = sound_hurt
		
		actor:enemy_stats_init(48, 460, 50, 65)
		actor.pHmax_base = 0.9
		
		actor.z_range = 50
		amalgolemPrimary.cooldown = 3.5 * 60
		actor.monster_log_drop_id = log.value
		actor:set_default_skill(Skill.SLOT.primary, amalgolemPrimary)
		actor:init_actor_late()
	end)
	
	amalgolemPrimary:clear_callbacks()
	amalgolemPrimary:onActivate(function(actor)
		actor:enter_state(stateAmalgolemPrimary)
	end)
	
	stateAmalgolemPrimary:clear_callbacks()
	stateAmalgolemPrimary:onEnter(function(actor, data)
		actor.image_index = 0
		data.fired = 0
	end)
	
	stateAmalgolemPrimary:onStep(function(actor, data)
		actor:skill_util_fix_hspeed()
		actor:actor_animation_set(sprite_shoot, 0.34)
		actor.knockback_immune = true
		actor.stun_immune = true
		
		if data.fired == 0 and actor.image_index >= 5 then
		local trample1 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 1)
			actor:sound_play(sound_hit, 1.4, 1.3 + math.random() * 0.25)
			data.fired = 1
		end
		
		if data.fired == 1 and actor.image_index >= 11 then
		local trample2 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 1)
			actor:sound_play(sound_hit, 1, 1 + math.random() * 0.28)
			data.fired = 2
		end
		
		if data.fired == 2 and actor.image_index >= 17 then
		local trample3 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 1)
			actor:sound_play(sound_hit, 1.4, 1.3 + math.random() * 0.25)
			data.fired = 3
		end
		
		if data.fired == 3 and actor.image_index >= 23 then
		local trample4 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 1)
			actor:sound_play(sound_hit, 1, 1 + math.random() * 0.28)
			data.fired = 4
		actor.knockback_immune = false
		actor.stun_immune = false
		end
				actor:skill_util_exit_state_on_anim_end()
end)

	

	local monsterCardAmalgolem = Monster_Card.new(NAMESPACE, "amalgolem")
	monsterCardAmalgolem.object_id = amalgolem_id
	monsterCardAmalgolem.spawn_cost = 280
	monsterCardAmalgolem.spawn_type = Monster_Card.SPAWN_TYPE.classic
	monsterCardAmalgolem.can_be_blighted = true
	
	local loop = {
	"ror-magmaBarracks",
	"ror-riskOfRain",
	"ssr-torridOutlands"
	}
	
	for _, s in ipairs(loop) do
		local stage = Stage.find(s)
			if stage then
				stage:add_monster_loop(monsterCardAmalgolem)
		end
	end
	
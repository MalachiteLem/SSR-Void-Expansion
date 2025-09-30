	-- Amalgolem? I barely know em
	
	local SPRITE_PATH = path.combine(PATH, "Sprites/Actors/Stray/Amalgolem")
	local SOUND_PATH = path.combine(PATH, "Sounds/Actors/Stray/Amalgolem")

	-- Load sprites
	
	local sprite_mask		=Resources.sprite_load(NAMESPACE, "AmalgolemMask", path.combine(SPRITE_PATH, "Mask.png"), 1, 18, 12)
	local sprite_idle		=Resources.sprite_load(NAMESPACE, "AmalgolemIdle", path.combine(SPRITE_PATH, "Idle.png"), 1, 28, 30)
	local sprite_walk		=Resources.sprite_load(NAMESPACE, "AmalgolemWalk", path.combine(SPRITE_PATH, "Walk.png"), 8, 46, 30)
	local sprite_death		=Resources.sprite_load(NAMESPACE, "AmalgolemDeath", path.combine(SPRITE_PATH, "Death.png"), 15, 28, 38)
	local sprite_spawn		=Resources.sprite_load(NAMESPACE, "AmalgolemSpawn", path.combine(SPRITE_PATH, "Spawn.png"), 11, 46, 38)
	local sprite_shoot		=Resources.sprite_load(NAMESPACE, "AmalgolemShoot", path.combine(SPRITE_PATH, "Shoot1.png"), 28, 46, 30)
	local sprite_palette		=Resources.sprite_load(NAMESPACE, "AmalgolemPalette", path.combine(SPRITE_PATH, "Palette.png"))
	local sprite_portrait		=Resources.sprite_load(NAMESPACE, "AmalgolemPortrait", path.combine(SPRITE_PATH, "portrait.png"))
	local sprite_nonsense		=Resources.sprite_load(NAMESPACE, "AmalgolemNonsense", path.combine(SPRITE_PATH, "Jump.png"), 1, 28, 29)
	
	-- Load sounds
	
	local sound_spawn	=Resources.sfx_load(NAMESPACE, "AmalgolemSpawn", path.combine(SOUND_PATH, "Spawn.ogg"))
	local sound_hit		=gm.constants.wGolemAttack1
	
	-- Create the log
	
	local log = Monster_Log.new(NAMESPACE, "Amalgolem")
	log.sprite_id = sprite_walk
	log.portrait_id = sprite_portrait
	log.sprite_offset_x = 44
	log.sprite_offset_y = 44
	log.stat_hp = 550
	log.stat_damage = 32
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
		
		actor.can_jump = false
		
		actor.mask_index = sprite_mask
		
		actor.sound_spawn = sound_spawn
		actor.sound_death = gm.constants.wGolemDeath
		
		actor:enemy_stats_init(32, 550, 15, 65)
		actor.pHmax_base = 0.9
		
		actor.z_range = 45
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
		
		if data.fired == 0 then
			data.fired = 1
		
		local function trampleFirst()
		local trample1 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 3.2)
			actor:sound_play(sound_hit, 1, 1.3 + math.random() * 0.25)
		end
		
		local function trampleSecond()
		local trample2 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 3.2)
			actor:sound_play(sound_hit, 1, 1.3 + math.random() * 0.25)
		end
		
		local function trampleThird()
		local trample3 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 3.2)
			actor:sound_play(sound_hit, 1, 1.3 + math.random() * 0.25)
		end
		
		local function trampleFourth()
		local trample4 = actor:fire_explosion(actor.x, actor.y + 45, 125, 15, 3.2)
			actor:sound_play(sound_hit, 1, 1.3 + math.random() * 0.25)
		end
		Alarm.create(trampleFirst, 25)
		Alarm.create(trampleSecond, 45)
		Alarm.create(trampleThird, 65)
		Alarm.create(trampleFourth, 85)
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
	
	-- Shudder em up
	
	local SPRITE_PATH = path.combine(PATH, "Sprites/Actors/Stray/Shudder")
	local SOUND_PATH = path.combine(PATH, "Sounds/Actors/Stray/Shudder")

	-- Load sprites
	
	local sprite_idle		=Resources.sprite_load(NAMESPACE, "ShudderIdle", path.combine(SPRITE_PATH, "Idle.png"), 1, 10, 48)
	local sprite_walk		=Resources.sprite_load(NAMESPACE, "ShudderWalk", path.combine(SPRITE_PATH, "Walk.png"), 8, 18, 62)
	local sprite_death		=Resources.sprite_load(NAMESPACE, "ShudderDeath", path.combine(SPRITE_PATH, "Death.png"), 14, 20, 66)
	local sprite_shoot		=Resources.sprite_load(NAMESPACE, "ShudderShoot", path.combine(SPRITE_PATH, "Shoot2.png"), 24, 26, 70)
	local sprite_spawn		=Resources.sprite_load(NAMESPACE, "ShudderSpawn", path.combine(SPRITE_PATH, "Spawn.png"), 17, 0, 50)
	local sprite_palette		=Resources.sprite_load(NAMESPACE, "ShudderPalette", path.combine(SPRITE_PATH, "Palette.png"))
	local sprite_portrait		=Resources.sprite_load(NAMESPACE, "ShudderPortrait", path.combine(SPRITE_PATH, "portrait.png"))
	local sprite_nonsense		=Resources.sprite_load(NAMESPACE, "ShudderNonsense", path.combine(SPRITE_PATH, "Jump.png"), 1, 0, 0)
	local sprite_mask			=Resources.sprite_load(NAMESPACE, "ShudderMask", path.combine(SPRITE_PATH, "Mask.png"), 1, 10, 47)
	
	local sprite_buff		=Resources.sprite_load(NAMESPACE, "Shuddered", path.combine(SPRITE_PATH, "Buff.png"), 1, 10, 8)
	
	-- Load sounds
	
	local sound_spawn		=Resources.sfx_load(NAMESPACE, "ShudderSpawn", path.combine(SOUND_PATH, "Spawn.ogg"))
	local sound_death		=Resources.sfx_load(NAMESPACE, "ShudderDeath", path.combine(SOUND_PATH, "Death.ogg"))
	local sound_shoot1		=Resources.sfx_load(NAMESPACE, "ShudderShoot1", path.combine(SOUND_PATH, "Shoot.ogg"))
	local sound_shoot2		=Resources.sfx_load(NAMESPACE, "ShudderShoot2", path.combine(SOUND_PATH, "Shoot2.ogg"))
	local sound_hurt		=Resources.sfx_load(NAMESPACE, "ShudderHurt", path.combine(SOUND_PATH, "Hit.ogg"))
	
	-- Debuffs
	
	local debuffShuddered		=Buff.new(NAMESPACE, "debuffShuddered")
							debuffShuddered.icon_sprite = sprite_buff
							debuffShuddered.show_icon = true
							debuffShuddered.is_debuff = false
							debuffShuddered:clear_callbacks()
	
	debuffShuddered.max_stack = 1
	
	-- Shuddered
	debuffShuddered:clear_callbacks()
	debuffShuddered:onPostStep(function(actor)
		actor:set_immune(5)
	end)
		
	local outline = Object.new(NAMESPACE, "EfOutline:create")
	
	outline:clear_callbacks()
	outline:onCreate(function(self, actor)
	outline:set(actor)
	outline.blendColor = Color.WHITE
	outline.alpha = 0.8
	outline.depth = actor.depth + 1
	end)
	
	-- Create the log
	
	local log = Monster_Log.new(NAMESPACE, "Shudder")
	log.sprite_id = sprite_walk
	log.portrait_id = sprite_portrait
	log.sprite_offset_x = 44
	log.sprite_offset_y = 70
	log.stat_hp = 180
	log.stat_damage = 13
	log.stat_speed = 0.7
	
	-- Projectiles
	
	local objShudderOrb = Object.new(NAMESPACE, "ShudderOrb", Object.PARENT.actor)
	
	objShudderOrb:clear_callbacks()
	objShudderOrb:onCreate(function(self)
	local selfData = self:getData()
	selfData.life = 240
	selfData.damage = 15
	selfData.team = gm.constants.TEAM_MONSTER
	self.alpha = 0
	self.xscale = 0.4
	self.yscale = 0.4
end)
	
	objShudderOrb:onStep(function(self)
	local selfData = self:getData()
		if selfData.target and selfData.target:isValid() then
			if self:is_colliding(selfData.target, self.x, self.y) then
				selfData.life = 0
				if Instance.exists(self.parent) then
					selfData.parent:fire_explosion(self.x, self.y, 15 / 19, 15 / 4, 0.4, nil, spr.Sparks7)
				else
					misc.fireExplosion(self.x, self.y, 15 / 19, 15 / 4, selfData.damage, selfData.team, spr.Sparks7)
				end
			end
		else
			local target = nearestMatchingOp(self, pobj.actors, "team", "~=", selfData.team)
			if target then
				self:set("direction", posToAngle(self.x, self.y, target.x, target.y))
				selfData.target = target
			end
		end
		if selfData.life > 0 then
			selfData.life = selfData.life - 1
		else self:destroy()
	end
end)
	
	objShudderOrb:clear_callbacks()
	objShudderOrb:onDraw(function(self)
			local data = inst:get_data()
			data.life = 13 * 60
		
		local size = math.random(4 + math.sin(data.life * 0.4) * 0.5, data.life * 0.5)
		
	local color = Color.WHITE
	if data.elite then color = data.elite.color end
	gm.draw_set_color(Color.WHITE)
	gm.draw_set_alpha(0.8)
	gm.draw_circle(self.x, self.y, size, true)
	gm.draw_set_color(color)
	gm.draw_circle(self.x, self.y, size - 2, false)
	end)
	
	objShudderOrb.obj_depth = 14
	
	
	-- Enemy
	
	local shudder = Object.new(NAMESPACE, "Shudder", Object.PARENT.enemyClassic)
	local shudder_id = shudder.value
	
	shudder.obj_sprite = sprite_idle
	shudder.obj_depth = 11
	
	local shudderPrimary = Skill.new(NAMESPACE, "shudderZ")
	local stateShudderPrimary = State.new(NAMESPACE, "shudderPrimary")
	
	local shudderSecondary = Skill.new(NAMESPACE, "shudderX")
	local stateShudderSecondary = State.new(NAMESPACE, "shudderSecondary")
	
	shudder:clear_callbacks()
	shudder:onCreate(function(actor)
		actor.sprite_palette = sprite_palette
		actor.sprite_spawn = sprite_spawn
		actor.sprite_idle = sprite_idle
		actor.sprite_walk = sprite_walk
		actor.sprite_death = sprite_death
		actor.sprite_fall = sprite_nonsense
		actor.sprite_jump = sprite_nonsense
		actor.sprite_jump_peak = sprite_nonsense
		
		actor.mask_index = sprite_mask
		
		actor.can_jump = false
		
		actor.sound_spawn = sound_spawn
		actor.sound_death = sound_death
		actor.sound_hit = sound_hurt
		
		actor:enemy_stats_init(13, 180, 60, 20)
		actor.pHmax_base = 0.7
		
		actor.z_range = 320000000
		actor.x_range = 400
		shudderPrimary.cooldown = 12 * 60
		shudderSecondary.cooldown = 9 * 60
		actor.monster_log_drop_id = log.value
		actor:set_default_skill(Skill.SLOT.primary, shudderPrimary)
		actor:set_default_skill(Skill.SLOT.secondary, shudderSecondary)
		
		actor:init_actor_late()
	end)
	
	shudderPrimary:clear_callbacks()
	shudderPrimary:onActivate(function(actor)
		actor:enter_state(stateShudderPrimary)
	end)
	
	stateShudderPrimary:clear_callbacks()
	stateShudderPrimary:onEnter(function(actor, data)
		actor.image_index = 0
		data.fired = 0
	end)
	
	stateShudderPrimary:onStep(function(actor, data)
		actor:skill_util_fix_hspeed()
		local dir = actor:skill_util_facing_direction()
		
		if data.fired == 0 and actor.image_index == 0 then
			actor:sound_play(sound_shoot1, 1.3, 1 + math.random() * 0.2)
				local targets = List.wrap(actor:find_characters_rectangle(actor.x - 100, actor.y - 100, actor.x + 100, actor.y + 100))
							for _, target in ipairs (targets) do
							if target.team == actor.team then do
								target:buff_apply(debuffShuddered, 180, 1)
				data.fired = 1
					end
				end
			end
		end
		actor:skill_util_exit_state_on_anim_end()
	end)
	
	
	shudderSecondary:clear_callbacks()
	shudderSecondary:onActivate(function(actor)
		actor:enter_state(stateShudderSecondary)
	end)
	
	stateShudderSecondary:clear_callbacks()
	stateShudderSecondary:onEnter(function(actor, data)
		actor.image_index = 0
		data.fired = 0
	end)
	
	stateShudderSecondary:onStep(function(actor, data)
		actor:actor_animation_set(sprite_shoot, 0.2)	
		actor:skill_util_fix_hspeed()
		
		
		if data.fired == 0 and actor.image_index >= 10 and actor.image_index <= 18 and actor.image_index % 2 == 0 then
			actor:sound_play(sound_shoot2, 1.3, 1 + math.random() * 0.2)
		local bullet = objShudderOrb:create(actor.x, actor.y - 9)
		bullet.damage = actor.damage
		bullet.team = actor.team
		bullet.parent = actor
		bullet.elite = actor:getElite()
	end
	actor:skill_util_exit_state_on_anim_end()
end)

	local monsterCardShudder = Monster_Card.new(NAMESPACE, "shudder")
	monsterCardShudder.object_id = shudder_id
	monsterCardShudder.spawn_cost = 95
	monsterCardShudder.spawn_type = Monster_Card.SPAWN_TYPE.classic
	monsterCardShudder.can_be_blighted = true
	
	local loop = {
	"ror-magmaBarracks",
	"ror-riskOfRain",
	"ssr-torridOutlands"
	}
	
	for _, s in ipairs(loop) do
		local stage = Stage.find(s)
			if stage then
				stage:add_monster_loop(monsterCardShudder)
		end
	end
	

-- All Seraph data

local path = "Survivors/Seraph/"

local seraph = Survivor.new("Seraph")

-- Sounds
local sSeraphShoot1 = Sound.load("SeraphShoot1", path.."skill1")
local sSeraphShoot2_1 = Sound.load("SeraphShoot2_1", path.."skill2_1")
local sSeraphShoot2_2 = Sound.load("SeraphShoot2_2", path.."skill2_2")
local sSeraphShoot2_3 = Sound.load("SeraphShoot2_3", path.."skill2_3")
local sSeraphShoot3_1 = Sound.load("SeraphShoot3_1", path.."skill3_1")
local sSeraphShoot3_2 = Sound.load("SeraphShoot3_2", path.."skill3_2")
local sSeraphShoot4 = Sound.load("SeraphShoot4", path.."skill4")

-- Table sprites
local sprites = {
	idle = Sprite.load("Seraph_Idle", path.."idle", 1, 7, 11),
	walk = Sprite.load("Seraph_Walk", path.."walk", 8, 7, 11),
	jump = Sprite.load("Seraph_Jump", path.."jump", 4, 7, 11),
	climb = Sprite.load("Seraph_Climb", path.."climb", 2, 8, 10),
	death = Sprite.load("Seraph_Death", path.."death", 21, 9, 24),
	decoy = Sprite.load("Seraph_Decoy", path.."decoy", 1, 9, 10),
	
	shoot1 = Sprite.load("Seraph_Shoot1", path.."shoot1", 6, 8, 11),
	shoot2 = Sprite.load("Seraph_Shoot2", path.."shoot2", 6, 8, 11),--Sprite.load("Seraph_Shoot2", path.."shoot2", 18, 8, 11),
	shoot3_1 = Sprite.load("Seraph_Shoot3_1", path.."shoot3_1", 14, 20, 11),
	shoot3_2 = Sprite.load("Seraph_Shoot3_2", path.."shoot3_2", 13, 20, 11),
	shoot4 = Sprite.load("Seraph_Shoot4", path.."shoot4", 9, 16, 24),
	shoot5 = Sprite.load("Seraph_Shoot5", path.."shoot5", 9, 16, 24),
	palette = Sprite.load("SeraphPal", path.."Palette", 1, 0, 0)
}
EliteType.registerPalette(sprites.palette, obj.P)

-- Hit sprites
local sprSparks1 = Sprite.load("Seraph_Sparks1", path.."sparks1", 5, 5, 5)
local sprSparks2 = Sprite.load("Seraph_Sparks2", path.."sparks2", 7, 14, 14)
local sprSparks3 = Sprite.load("Seraph_Sparks3", path.."sparks3", 6, 15, 15)
local sprSparks4 = Sprite.load("Seraph_Sparks4", path.."sparks4", 4, 47, 7)

-- Skill sprites
local sprSkills = Sprite.load("Seraph_Skills", path.."skills", 5, 0, 0)

-- Selection sprite
seraph.loadoutSprite = Sprite.load("Seraph_Select", path.."select", 21, 2, 0)

-- Selection description
seraph:setLoadoutInfo(
[[The &y&Seraph&!& controls the environment with gravity manipulation
skills that allow for debuffing and annihilating groups of enemies quickly.
&y&Grace Field&!& stops time in an area allowing for attack chains with &y&Disturbance&!&
and &y&Void Breach&!& without putting yourself or your allies at risk.]], sprSkills)

-- Skill descriptions

seraph:setLoadoutSkill(1, "Seraph's Grasp",
[[Fire energy at enemies for &y&140% damage on a small area.
You can shoot while moving.]])

seraph:setLoadoutSkill(2, "Void Breach",
[[&y&Create a breach&!& which gives enemies the &y&Shatter debuff&!&.
Enemies with the Shatter debuff &y&explode when hit for 400% damage.]])

seraph:setLoadoutSkill(3, "Disturbance",
[[&lt&Moving:&!& pull enemies towards you for &y&110% damage, &b&pushing you forward.&!&
&lt&Still:&!& raise enemies and bash them to the ground for &y&310% damage.]])

seraph:setLoadoutSkill(4, "Grace Field",
[[&y&Create a void energy field around you&!& for 4 seconds.
In the field; &b&reduced third skill cooldown&!&, &y&enemies get stopped in time.]])

-- Color of highlights during selection
seraph.loadoutColor = Color.fromHex(0xD30097)

-- Misc. menus sprite
seraph.idleSprite = sprites.idle

-- Main menu sprite
seraph.titleSprite = sprites.walk

-- Endquote
seraph.endingQuote = "..and so it left, following the trail for what once was."

seraph:addCallback("init", function(player)
	local playerAc = player:getAccessor()
	local playerData = player:getData()

	player:setAnimations(sprites)
	
	if Difficulty.getActive() == dif.Drizzle then
		player:survivorSetInitialStats(145, 14, 0.041)
	else
		player:survivorSetInitialStats(95, 14, 0.011)
	end
	
	player:setSkill(1, "Seraph's Grasp", "Fire energy at enemies for 140% damage on a small area.",
	sprSkills, 1, 50)
		
	player:setSkill(2, "Void Breach", "Create a breach giving the Shatter debuff on contact. Enemies with the Shatter debuff explode when hit for 400% damage.",
	sprSkills, 2, 6 * 60)
		
	player:setSkill(3, "Disturbance", "Pull enemies towards you for 110% damage, pushing you forward. When stationary: Raise nearby enemies and bash them to the ground for 310% damage.",
	sprSkills, 3, 3 * 60)
		
	player:setSkill(4, "Grace Field", "Create an energy field for 4 seconds. In the field; reduced third skill cooldown while enemies get stopped in time.",
	sprSkills, 4, 11 * 60)
end)


-- Called when the player levels up
seraph:addCallback("levelUp", function(player)
	player:survivorLevelUpStats(24, 3.5, 0.0013, 2)
end)

-- Called when the player picks up the Ancient Scepter
seraph:addCallback("scepter", function(player)
	player:setSkill(4,
		"Void Field",
		"Create an energy field for 4 seconds. In the field; reduced third skill cooldown while enemies get stopped in time and receive the Shatter debuff.",
		sprSkills, 5,
		11 * 60
	)
end)

-- Skills
seraph:addCallback("useSkill", function(player, skill)
	local playerAc = player:getAccessor()
	local override = skill == 4 and playerAc.activity == 3.1
	
	if playerAc.activity == 0 or override then
		
		if skill == 1 then
			-- Z skill
			player:survivorActivityState(1, player:getAnimation("shoot1"), 0.25, true, true)
		elseif skill == 2 then
			-- X skill
			player:getData().prepHspeed = playerAc.pHspeed
			player:survivorActivityState(2, player:getAnimation("shoot2"), 0.25, true, true)
		elseif skill == 3 then
			-- C skill
			if playerAc.moveRight == 1 or playerAc.moveLeft == 1 then
				player:survivorActivityState(3.2, player:getAnimation("shoot3_2"), 0.25, true, true) -- false)
			else
				player:survivorActivityState(3.1, player:getAnimation("shoot3_1"), 0.25, true, true)
			end
		elseif skill == 4 then
			if override then
				playerAc.activity = 0
			end
			-- V skill
			if playerAc.scepter > 0 then
				player:survivorActivityState(4, player:getAnimation("shoot5"), 0.25, true, false)
			else
				player:survivorActivityState(4, player:getAnimation("shoot4"), 0.25, true, false)
			end
		end
		player:activateSkillCooldown(skill)
	end
end)

local THROW_UP = 0
local THROW_SIDE = 1
local THROW_SIDES = 2

buff.seraph = Buff.new("seraph")
buff.seraph.sprite = Sprite.load("Seraph_Buff", path.."buff", 1, 9, 5)
buff.seraph:addCallback("start", function(actor)
	actor:set("pHmax", actor:get("pHmax") - 0.8)
	if not actor:getData().seraphPreAngle then
		actor:getData().seraphPreAngle = actor.angle
	end
end)
buff.seraph:addCallback("step", function(actor)
	if actor:isValid() then
		local shake = 5
		if actor:isBoss() then shake = 2 end
		actor.angle = actor:getData().seraphPreAngle + math.random(-shake, shake)
		actor.spriteSpeed = 0
	end
end)
buff.seraph:addCallback("end", function(actor)
	actor:set("pHmax", actor:get("pHmax") + 0.8)
	if actor:getData().seraphPreAngle then
		actor.angle = actor:getData().seraphPreAngle
	end
end)
local onDrawCall = function()
	for _, actor in ipairs(pobj.actors:findAll()) do
		if actor:hasBuff(buff.seraph) then
			local x, y = actor.x, actor.y
			if not net.host and actor:get("ghost_x") then
				x, y = actor:get("ghost_x"), actor:get("ghost_y")
			end
			graphics.drawImage{
				image = actor.sprite,
				subimage = actor.subimage,
				color = col.voidPink,
				angle = actor.angle,
				alpha = actor.alpha,
				xscale = actor.xscale,
				yscale = actor.yscale,
				x = x,
				y = y
			}
		end
	end
end

local objShard = Object.new("SeraphShard")
objShard.sprite = spr.Pixel
objShard:addCallback("create", function(self)
	local selfData = self:getData()
	local selfAc = self:getAccessor()
	
	self.alpha = 0
	selfData.damage = 5
	selfData.range = 10
	selfData.team = "player"
	selfData.life = 1200
	selfData.pHspeed = 0
	selfData.givenDebuff = {}
	
	selfData.points = {}
	for i = 1, 1 do
		local points = {}
		for i = 1, 3 do
			local dir = 1
			if math.chance(50) then dir = -1 end
			table.insert(points, {l = math.random(360), a = math.random(360), s = (math.random(2, 8) * dir)})
		end
		table.insert(selfData.points, points)
	end
end)
objShard:addCallback("step", function(self)
	local selfData = self:getData()
	local selfAc = self:getAccessor()
	
	if selfData.ef then
		if selfData.ef > 0 then
			selfData.ef = selfData.ef - 1
		else
			selfData.ef = nil
		end
	end
	
	self.x = self.x + selfData.pHspeed
	
	if selfData.parent and selfData.parent:isValid() then
		local r = selfData.range
		for _, actor in ipairs(pobj.actors:findAllEllipse(self.x - r, self.y - r, self.x + r, self.y + r)) do
			if actor:get("team") ~= selfData.team and not selfData.givenDebuff[actor] then
				if selfData.life > 20 then
					selfData.life = 20
				end
				if actor:getObject() == obj.WormBody then
					local explosion = selfData.parent:fireExplosion(self.x, self.y, 10 / 19, 10 / 4, 4, sprSparks3, nil)
					explosion:set("stun", 1)
					explosion:getData().isSeraphBoom = true
					sSeraphShoot2_3:play(0.9 + math.random() * 0.2)
					par.SeraphExplosion:burst("middle", self.x, self.y, 10, col.voidPink)
					selfData.life = selfData.life - 5
					if onScreen(hit) then
						misc.shakeScreen(3)
					end
				else
					actor:applyBuff(buff.seraph, 240)
				end
				
				sSeraphShoot2_2:play(0.9 + math.random() * 0.2)
				selfData.givenDebuff[actor] = true
			end
		end
	end
	if selfData.life > 0 then
		selfData.life = selfData.life - 1
	else
		self:destroy()
	end
end)
objShard:addCallback("draw", function(self)
	local selfData = self:getData()
	local selfAc = self:getAccessor()
	
	local alpha = math.min(selfData.life / 20, 1)
	
	graphics.alpha(alpha * 0.4)
	graphics.color(Color.BLACK)
	--graphics.circle(self.x, self.y, 8, false)
	graphics.circle(self.x, self.y, 4, false)
	
	graphics.alpha(alpha)
	graphics.color(col.voidPink)
	for _, points in ipairs(selfData.points) do
		local cpoints = {}
		for i, point in ipairs(points) do
			local dis = math.sin(math.rad(point.l)) * 10--math.random(8, 12)
			local angle = math.rad(point.a + math.random(-25, 25))
			local x, y = math.cos(angle) * dis, math.sin(angle) * dis
			table.insert(cpoints, {x = self.x +  x, y = self.y + y})
			point.a = point.a + point.s
			point.l = point.l + point.s
		end
		graphics.triangle(cpoints[1].x, cpoints[1].y, cpoints[2].x, cpoints[2].y, cpoints[3].x, cpoints[3].y, false)
	end
	local size = math.sin(global.timer * 0.2)
	graphics.circle(self.x, self.y, 3 + size, true)
	
	if selfData.ef then
		local ef = selfData.ef / 60
		graphics.alpha(ef)
		graphics.color(col.voidPink)--Color.WHITE)
		graphics.circle(self.x, self.y, 4 + size, false)
	end
end)

buff.antigravity = Buff.new("antigravity")
buff.antigravity.sprite = Sprite.load("Seraph_Buff2", path.."buff2", 1, 9, 5)
buff.antigravity:addCallback("start", function(actor)
	if actor:getData().antigravityEnemy then
		if not actor:getData().seraphPreGravity then
			actor:getData().seraphPreGravity = {actor:get("pGravity1"), actor:get("pGravity2")}
			actor:set("pGravity1", 0)
			actor:set("pGravity2", 0)
			if not actor:isClassic() then
				actor:getData().seraphPreAngle = actor.angle
			end
		end
		actor:set("pHmax", actor:get("pHmax") - 10)
		actor:set("activity", 52)
		if actor:getAnimation("idle") then
			actor.sprite = actor:getAnimation("idle")
		end
		local yy = actor.y - 4
		if actor:collidesMap(actor.x, yy) or not actor:isClassic() then
			yy = actor.y
		end
		actor:getData().positionOverride = {x = actor.x, y = yy}
		if actor:hasBuff(buff.seraph) then
			actor:getData().fieldSeraphBuff = true
		end
	end
end)
buff.antigravity:addCallback("step", function(actor)
	if actor:isValid() then
		local actorAc = actor:getAccessor()
		if actorAc.activity ~= 30 then
			--[[
			if actorAc.ropeUp and actorAc.ropeUp == 1 or actorAc.moveUp and actorAc.moveUp == 1 then
				local newy = actor.y - 1
				if not actor:collidesMap(actor.x, newy) then
					actor.y = newy
				end
			elseif actorAc.ropeDown and actorAc.ropeDown == 1 then
				local newy = actor.y + 1
				if not actor:collidesMap(actor.x, newy) then
					actor.y = newy
				end
			end
			if net.online and actor == net.localPlayer and global.timer % 2 == 0 then
				if net.host then
					syncInstanceVar:sendAsHost(net.ALL, nil, actor:getNetIdentity(), "y", actor.y)
				else
					syncInstanceVar:sendAsClient(actor:getNetIdentity(), "y", actor.y)
				end
			end
			]]
			
			if actor:getData().antigravityEnemy then
				actor:setAlarm(2, 60)
				if actor:getData().positionOverride then
					actor.x = actor:getData().positionOverride.x
					actor.y = actor:getData().positionOverride.y
					actor:set("ghost_x", actor.x)
					actor:set("ghost_y", actor.y)
				end
				if actor:getData().xAccel then
					actor:getData().saved_xAccel = math.clamp((actor:getData().saved_xAccel or 0) + actor:getData().xAccel, -5, 5)
					actor:getData().xAccel = nil
				end
				if actor:getData().fieldSeraphBuff then
					actor:applyBuff(buff.seraph, 120)
				end
				actor:set("activity", 52)
			else
				--actorAc.pVspeed = 0
				if global.quality > 1 and math.chance(25) then
					par.PortalPart:burst("below", actor.x, actor.y, 1)
				end
				actor:setAlarm(4, math.max(actor:getAlarm(4) - 1, -1))
			end
			if actor:getData().seraphPreAngle then
				actor.angle = actor:getData().seraphPreAngle
			end
		end
	end
end)
buff.antigravity:addCallback("end", function(actor)
	if actor:getData().seraphPreGravity then
		actor:set("pGravity1", actor:getData().seraphPreGravity[1])
		actor:set("pGravity2", actor:getData().seraphPreGravity[2])
		actor:getData().seraphPreGravity = nil
	end
	if actor:getData().antigravityEnemy then
		if actor:getData().saved_xAccel then
			actor:getData().xAccel = actor:getData().saved_xAccel
			actor:getData().saved_xAccel = nil
		end
		actor:set("pHmax", actor:get("pHmax") + 10)
		actor:set("activity", 0)
		actor:getData().antigravityEnemy = nil
		actor:getData().positionOverride = nil
		actor:getData().fieldSeraphBuff = nil
	end
end)

local objField = Object.new("SeraphField")
objField.depth = -7--10
objField:addCallback("create", function(self)
	local selfData = self:getData()
	local selfAc = self:getAccessor()
	
	selfData.life = 210
	selfData.team = "player"
	selfData.range = 100
	selfData.scepter = 0
end)
objField:addCallback("step", function(self)
	local selfData = self:getData()
	local selfAc = self:getAccessor()
	
	local r = selfData.range
	for _, actor in ipairs(pobj.actors:findAllEllipse(self.x - r, self.y - r, self.x + r, self.y + r)) do
		if actor:get("team") == selfData.team then
			if not isaDrone(actor) then
				actor:applyBuff(buff.antigravity, 10)
			end
		else
			if selfData.scepter > 0  and selfData.life % 10 == 0 then
				actor:applyBuff(buff.seraph, 10)
			end
			actor:getData().antigravityEnemy = true
			actor:applyBuff(buff.antigravity, 10)
		end
	end
	for _, spiteBomb in ipairs(obj.EfGrenadeEnemy:findAllEllipse(self.x - r, self.y - r, self.x + r, self.y + r)) do
		if not spiteBomb:getData().preData then
			spiteBomb:getData().preData = {spiteBomb:get("speed"), spiteBomb:get("direction"), spiteBomb.x, spiteBomb.y, spiteBomb.angle, spiteBomb.subimage}
		else
			spiteBomb.x = spiteBomb:getData().preData[3]
			spiteBomb.y = spiteBomb:getData().preData[4]
			spiteBomb.angle = spiteBomb:getData().preData[5]
			spiteBomb.subimage = spiteBomb:getData().preData[6]
		end
		spiteBomb:set("speed", 0)
		spiteBomb:set("direction", 0)
	end
	if selfData.life > 0 then
		selfData.life = selfData.life - 1
	else
		for _, spiteBomb in ipairs(obj.EfGrenadeEnemy:findAllEllipse(self.x - r, self.y - r, self.x + r, self.y + r)) do
			if spiteBomb:getData().preData then
				spiteBomb:set("speed", spiteBomb:getData().preData[1])
				spiteBomb:set("direction", spiteBomb:getData().preData[2])
				spiteBomb:getData().preData = nil
			end
		end
		self:destroy()
	end
end)
objField:addCallback("draw", function(self)
	local selfData = self:getData()
	local selfAc = self:getAccessor()
	
	local alpha = math.cos(global.timer * 0.08) * 0.1
	
	graphics.color(col.voidPink)
	graphics.alpha(0.2 + alpha)
	graphics.circle(self.x, self.y, selfData.range, true)
	graphics.alpha(alpha * -0.8)
	graphics.circle(self.x, self.y, selfData.range, false)
end)

seraph:addCallback("onSkill", function(player, skill, relevantFrame)
	local playerAc = player:getAccessor()
	local playerData = player:getData()
	
	if skill == 1 then
		-- Seraph's Grasp
		if player:hasBuff(buff.daze) then
			if playerAc.moveRight == 1 and playerAc.moveLeft == 0 then
				playerAc.pHspeed = playerAc.pHmax * -1
			elseif playerAc.moveLeft == 1 and playerAc.moveRight == 0 then
				playerAc.pHspeed = playerAc.pHmax
			end
		else
			if playerAc.moveRight == 1 and playerAc.moveLeft == 0 then
				playerAc.pHspeed = playerAc.pHmax
			elseif playerAc.moveLeft == 1 and playerAc.moveRight == 0 then
				playerAc.pHspeed = playerAc.pHmax * -1
			end
		end
		if relevantFrame == 1 then
			if onScreen(player) then
				misc.shakeScreen(1)
			end
			if not player:survivorFireHeavenCracker(1.5) then
				for i = 0, playerAc.sp do
					local bullet = player:fireBullet(player.x, player.y, player:getFacingDirection(), 150, 0, sprSparks4, DAMAGER_NO_PROC)
					bullet:getData().isSeraphBasic = true
					bullet:set("knockback", 4)
					if i ~= 0 then
						bullet:set("climb", i * 8)
					end
				end
			end
			sSeraphShoot1:play(0.9 + math.random() * 0.2)
		end
		
	elseif skill == 2 and not player:getData().skin_skill2Override then
		-- Void Breach
		if relevantFrame == 1 then
			local shard = objShard:create(player.x + 8 * player.xscale, player.y - 2):getData()
			shard.parent = player
			shard.team = playerAc.team
			shard.pHspeed = playerData.prepHspeed * 0.4
			sSeraphShoot2_1:play(0.9 + math.random() * 0.2)
		end
		
	elseif skill == 3.1 then
        -- Disturbance
		if relevantFrame == 1 then
			sSeraphShoot3_1:play(0.9 + math.random() * 0.2)
			playerData.slam = false
			local bullet = player:fireExplosion(player.x, player.y, 250 / 19, 30 / 4, 0.1, nil, sprSparks1)--player:fireBullet(player.x, player.y - 1, player:getFacingDirection(), 250, 0.1, sprSparks1, DAMAGER_BULLET_PIERCE)
			bullet:getData().isSeraphPush = THROW_UP
			--bullet = player:fireBullet(player.x, player.y - 1, player:getFacingDirection() + 180, 250, 0.1, sprSparks1, DAMAGER_BULLET_PIERCE)
			--bullet:getData().isSeraphPush = THROW_UP
			playerData.shardsGrab = objShard:findAllRectangle(player.x, player.y - 2, player.x + 275 * player.xscale, player.y + 2)
			for _, shard in ipairs(playerData.shardsGrab) do
				if shard:isValid() then
					shard:getData().ef = 60
					shard:set("speed", 0.3)
					shard:set("direction", 90)
				end
			end
		elseif relevantFrame == 10 then
			sSeraphShoot3_2:play(0.9 + math.random() * 0.2)
			playerData.slam = true
			for _, shard in ipairs(playerData.shardsGrab) do
				if shard:isValid() then
					shard:set("speed", 1.1)
					shard:set("direction", 270)
				end
			end
			
			playerData.shardsGrab = nil
		end
		
	elseif skill == 3.2 and not player:getData().skin_skill3Override then
		if player:hasBuff(buff.daze) then
			if playerAc.moveRight == 1 and playerAc.moveLeft == 0 then
				playerAc.pHspeed = playerAc.pHmax * -1
			elseif playerAc.moveLeft == 1 and playerAc.moveRight == 0 then
				playerAc.pHspeed = playerAc.pHmax
			end
		else
			if playerAc.moveRight == 1 and playerAc.moveLeft == 0 then
				playerAc.pHspeed = playerAc.pHmax
			elseif playerAc.moveLeft == 1 and playerAc.moveRight == 0 then
				playerAc.pHspeed = playerAc.pHmax * -1
			end
		end
		if relevantFrame == 1 then
			sSeraphShoot3_1:play(0.9 + math.random() * 0.2)
			playerData.slam = false
			local bullet = player:fireBullet(player.x, player.y - 1, player:getFacingDirection(), 275, 0.1, sprSparks1, DAMAGER_BULLET_PIERCE)
			bullet:getData().isSeraphPush = THROW_SIDE
			playerData.shardsGrab = objShard:findAllRectangle(player.x, player.y - 2, player.x + 275 * player.xscale, player.y + 2)
			for _, shard in ipairs(playerData.shardsGrab) do
				if shard:isValid() then
					shard:getData().ef = 60
				end
			end
		elseif relevantFrame == 9 then
			sSeraphShoot3_2:play(0.9 + math.random() * 0.2)
			playerData.slam = true
			for _, shard in ipairs(playerData.shardsGrab) do
				if shard:isValid() then
					shard:getData().pHspeed = (shard:getData().pHspeed or 0) + 1 * math.sign((shard:getData().pHspeed or 0) - player.xscale)
					playerData.xAccel = (playerData.xAccel or 0) + 2 * player.xscale
				end
			end
			
			playerData.shardsGrab = nil
		end
	elseif skill == 4 and not player:getData().skin_skill4Override then
		-- Grace Field
		if relevantFrame == 1 then
			sSeraphShoot4:play(0.9 + math.random() * 0.2)
		elseif relevantFrame == 3 then
			if onScreen(player) then
				misc.shakeScreen(1)
			end
			local field = objField:create(player.x, player.y)
			field:getData().team = playerAc.team
			field:getData().scepter = playerAc.scepter
		end
	end
end)

ss.whitelist.seraphPush = {
	[obj.WormBody] = true,
	[obj.WormHead] = true,
	[obj.WurmHead] = true,
	[obj.WurmBody] = true,
	[obj.ImpM] = true,
	[obj.Jelly] = true,
	[obj.Bug] = true
}

if not global.rormlflag.ss_disable_enemies then
	ss.whitelist.seraphPush[obj.SquallElver] = true
end

local onHitCall = function(damager, hit, x, y)
	local parent = damager:getParent()
	if hit:isValid() then
		local damagerData = damager:getData()
		local canPush = hit:isClassic() or ss.whitelist.seraphPush[hit:getObject()]
		if parent and parent:isValid() then
			if damagerData.isSeraphBasic then
				local sparks = obj.EfSparks:create(x, y)
				sparks.sprite = sprSparks4
				sparks.xscale = math.sign(x - parent.x)
				local b = parent:fireExplosion(x, y, 10 / 19, 10 / 4, 1.4, sprSparks1)
				b:getData().seraphDebuff = true
				b:set("climb", damager:get("climb"))
			elseif damagerData.isSeraphPush and canPush then
				if onScreen(hit) then
					misc.shakeScreen(1)
				end
				local t = damagerData.isSeraphPush
				local outline = obj.EfOutline:create(0, 0):set("parent", hit.id):set("rate", 0.02)
				outline.blendColor = col.voidPink
				local hoverPos = hit.y - 5
				if t == THROW_UP then
					hoverPos = hit.y - 60
				end
				hit:getData().seraphPickup = {seraph = parent, hoverPos = hoverPos, timer = 120, t = t, ox = math.sign(parent.x - hit.x), speed = parent:get("attack_speed")}
				hit:set("activity", 52)
			end
		end
		--if damagerData.seraphDebuff then
			--hit:applyBuff(buff.voided, 120)
		--end
		if damager:get("damage") > 0 and hit:hasBuff(buff.seraph) and parent and isa(parent, "PlayerInstance") and not damagerData.isSeraphBoom and not damagerData.isSeraphPush then
			--if not damagerData.isSeraphImpact then
				hit:removeBuff(buff.seraph)
				hit:getData().fieldSeraphBuff = nil
			--end
			local explosion = parent:fireExplosion(x, y, 10 / 19, 10 / 4, 4, sprSparks3, nil)
			explosion:set("stun", 1)
			explosion:getData().isSeraphBoom = true
			sSeraphShoot2_3:play(0.9 + math.random() * 0.2)
			par.SeraphExplosion:burst("middle", x, y, 10, col.voidPink)
			if onScreen(hit) then
				misc.shakeScreen(3)
			end
		end
	end
end

local onActorStepCall = function(actor)
	local actorData = actor:getData()
	if actorData.seraphPickup and actor:isValid() then
		local seraph, hoverPos, timer, t, ox, atspeed = actorData.seraphPickup.seraph, actorData.seraphPickup.hoverPos, actorData.seraphPickup.timer, actorData.seraphPickup.t, actorData.seraphPickup.ox, actorData.seraphPickup.speed -- i should just table.unpack, right?
		
		if actorData.seraphPickup.awaiting then
			if actor:isClassic() and actor:collidesMap(actor.x, actor.y + 1) then
				if seraph:isValid() then
					local damage = 1
					if t == THROW_UP then
						damage = 3
					end
					local explosion = seraph:fireExplosion(actor.x, actor.y, 3 / 19, 3 / 4, damage, nil, nil)
					explosion:getData().isSeraphImpact = true
					if t == THROW_UP then
						explosion:set("stun", 1)
					end
				end
				if not actor:hasBuff(buff.antigravity) then
					actor:set("activity", 0)
					if actor:getAnimation("idle") then
						actor.sprite = actor:getAnimation("idle")
					end
					if actor:get("state") then
						actor:set("state", "chase")
					end
					if actor:get("activity_type") then
						actor:set("activity_type", 0)
					end
				end
				if onScreen(actor) then
					misc.shakeScreen(2)
				end
				actorData.seraphPickup = nil
			end
		else
			actor:set("pVspeed", 0):set("pHspeed", 0)
			
			if seraph:isValid() then
				if seraph:getData().slam then
					timer = 0
					if t == THROW_UP then
						actor:set("pVspeed", 20)
						if not actor:isClassic() then
							actor:set("direction", 270)
							if actor:get("speed") ~= 0 then
								actor:set("speed", 4)
							end
						end
						
						local speed = 2
						local preac1 = actorData.xAccel or 0
						actorData.xAccel = preac1 + ox * speed
					else
						local speed = 5
						if t == THROW_SIDES then
							speed = 3 --wew
						end
						local preac1 = actorData.xAccel or 0
						actorData.xAccel = preac1 + ox * speed
						if t == THROW_SIDE then
							local preac2 = seraph:getData().xAccel or 0
							seraph:getData().xAccel = preac2 + ox * -1
						end
						if not actor:isClassic() then
							actor:getData().xAccel = 5 * ox
							actor:set("direction", 180 + seraph:getFacingDirection())
						end
					end
				end
			end
			if timer > 0 then
				local newy = math.approach(actor.y, hoverPos, atspeed)
				if not actor:isClassic() or not actor:collidesMap(actor.x, newy) then
					actor.y = newy
				end
				actorData.seraphPickup.timer = timer - 1
			else
				obj.EfOutline:findMatching("parent", actor.id, "rate", 0.02)
				actorData.seraphPickup.awaiting = true
			end
		end
	end
end

seraph:addCallback("init", function(player)
	tcallback.register("onDraw", onDrawCall)
	tcallback.register("onActorStep", onActorStepCall)
	tcallback.register("onHit", onHitCall)
end)

sur.Seraph = seraph
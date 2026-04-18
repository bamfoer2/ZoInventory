-- @ScriptType: ModuleScript
local Players = game:GetService("Players")

local PlayerService = {}
PlayerService.__index = PlayerService

function PlayerService.new(Game)
	local self = setmetatable({}, PlayerService)

	self.Game = Game
	self.PlayerData = {}

	Players.PlayerAdded:Connect(function(player)
		self:AddPlayer(player)
	end)

	return self
end

function PlayerService:AddPlayer(player)
	local RandomTeam = self.Game.Teams.Open[math.random(#self.Game.Teams.Open)]
	
	self.PlayerData[player] = {
		Level = 1,
		Points = 0,
		Muggets = 0,
		Gems = 0,
		Team = RandomTeam
	}	
	
	table.remove(self.Game.Teams.Open, table.find(self.Game.Teams.Open, RandomTeam))
	self.Game.Teams.Occupied[RandomTeam] = player



	print(self.Game)
end



return PlayerService
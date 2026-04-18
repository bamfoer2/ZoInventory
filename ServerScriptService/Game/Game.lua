-- @ScriptType: ModuleScript
local GameModule = {}
GameModule.__index = GameModule

local PlayerService = require(script.Parent.Player)
local UnitService = require(script.Parent.Units)
local Network = require(game.ReplicatedStorage.Modules.Network)

local RunService = game:GetService("RunService")

function GameModule.new()

	
	local self = setmetatable({}, GameModule)
	
	self.Players = {}
	
	self.State = "Lobby"
	self.Services = {}

	print("Game initialized")

	self.Network = Network.new()
	self.Services.PlayerService = PlayerService.new(self)
	self.Services.UnitService = UnitService.new(self)
	
	self.Network:StartServer()
	
	GameModule.Game = self
	return self
end

function GameModule:Start()
	self.State = "Running"
	print("Game started")
	

	
end

function GameModule:End()
	self.State = "Ended"
end

return GameModule
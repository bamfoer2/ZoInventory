-- @ScriptType: ModuleScript
local UnitCreator = require(script.Unit)
local UnitData = require(game.ReplicatedStorage.Modules.UnitData)
local Sera = require(game.ReplicatedStorage.Modules.Serializer)
local UnitService = {}
UnitService.__index = UnitService

local UnitCreation = Sera.Schema({
	ID = Sera.String8,
	Owner = Sera.String8,
	UnitType = Sera.String8,
	Position = Sera.Vector3,
})

function UnitService.new(game)
	local self = setmetatable({}, UnitService)

	self.Game = game
	self.CurrentID = 0
	self.Units = {}

	self:SpawnStarters()

	return self
end

function UnitService:SpawnStarters()
	local Package = {}
	
	for i,SpawnLocation in pairs(workspace.Spawns:GetChildren()) do
		UnitCreator.New(self,SpawnLocation.Name,"Headquarters",SpawnLocation.Position)
	end
	
	for i,Data in pairs(self.Units) do
		local serialized, error_message = Sera.Serialize(UnitCreation, {
			ID = Data.ID,
			Owner = Data.Owner,
			UnitType = Data.UnitType,
			Position = Sera.Vector3,
		})
		
		table.insert(Package,serialized)
	end
	
	self.Game.Network:FireAll("SyncUnits",Package)
	
	print("sending")
	
	
end


function UnitService:MoveUnits(SelectedUnits,TargetPosition,Adding : boolean)
	
end



function UnitService:ReturnUnitInfo(SelectedUnits)
	
end

return UnitService
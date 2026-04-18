-- @ScriptType: ModuleScript
local Unit = {}
Unit.__index = Unit


local CollectionService = game:GetService("CollectionService")
local UnitData = require(game.ReplicatedStorage.Modules.UnitData)

function Unit.New(UnitHandler,NationOwner,UnitType,SetPosition)
	local self = setmetatable({}, Unit)
	local Information = UnitData
	
	
	self.ID = UnitHandler.CurrentID
	self.Owner = NationOwner
	self.UnitType = UnitType
	
	self.Position = SetPosition

	table.insert(UnitHandler,self)
	UnitHandler.CurrentID += 1
end

function Unit:Update(dt)
	
end

return Unit

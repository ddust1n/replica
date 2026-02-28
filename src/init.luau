--!strict

-- @name Replica
-- @description Roblox server to client state replication solution which lets the developer subscribe certain players to certain states.

local Public = {}

-- [[ Game Services ]] --

local RunService = game:GetService("RunService")

-- [[ Dependencies ]] --

-- [[ Modules ]] --

-- [[ Types ]] --

local Server = require(script:FindFirstChild("ReplicaServer"))
local Client = require(script:FindFirstChild("ReplicaClient"))

-- [[ Constants ]] --

-- [[ Variables ]] --

-- [[ Private Functions ]] --

function Public:GetServer()
	assert(RunService:IsServer(), "You must be on the server to call this method!")

	if not script:FindFirstChildWhichIsA("RemoteEvent") then
		local newRemote = Instance.new("RemoteEvent")
		newRemote.Name = "TweenCommunications"
		newRemote.Parent = script
	end

	return Server
end

function Public:GetClient()
	assert(RunService:IsClient(), "You must be on the client to call this method!")

	return Client
end

return Public

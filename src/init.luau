--!strict

-- @name Replica
-- @description Roblox server to client state replication solution which lets the developer subscribe certain players to certain states.

local Public = {}

-- [[ Game Services ]] --

local RunService = game:GetService("RunService")

-- [[ Modules ]] --

local Types = require(script.ReplicaShared.Types)

-- [[ Types ]] --

export type ReplicaClient<Data> = Types.ReplicaClient<Data>
export type ReplicaServer<Data> = Types.ReplicaServer<Data>

-- [[ Constants ]] --

-- [[ Variables ]] --

-- [[ Private Functions ]] --

function Public:GetServer()
	assert(RunService:IsServer(), "You must be on the server to call this method!")

	return require(script:FindFirstChild("ReplicaServer"))
end

function Public:GetClient()
	assert(RunService:IsClient(), "You must be on the client to call this method!")

	return require(script:FindFirstChild("ReplicaClient"))
end

return Public

local ReplicaShared = script.Parent

local Signal = require(ReplicaShared.Signal)

export type ReplicaClient<Data> = {
	Tags: { [any]: any },
	Data: Data,
	Id: number,
	Token: string,
	Parent: ReplicaClient<Data>?,
	Children: { [ReplicaClient<Data>]: boolean? },
	BoundInstance: Instance?,
	OnClientEvent: { Connect: (self: any, listener: (...any) -> ()) -> { Disconnect: (self: any) -> () } },
	Maid: typeof(require(ReplicaShared.Maid)),

	OnSet: (self: ReplicaClient<Data>, path: {}, listener: () -> ()) -> Signal.Connection,
	OnWrite: (self: ReplicaClient<Data>, function_name: string, listener: (...any) -> ()) -> Signal.Connection,
	OnChange: (
		self: ReplicaClient<Data>,
		listener: (
			action: "Set" | "SetValues" | "TableInsert" | "TableRemove",
			path: { any },
			param1: any,
			param2: any?
		) -> ()
	) -> Signal.Connection,
	GetChild: (self: ReplicaClient<Data>, token: string) -> ReplicaClient<Data>?,
	FireServer: (self: ReplicaClient<Data>, ...any) -> (),
	UFireServer: (self: ReplicaClient<Data>, ...any) -> (),
	Identify: (self: ReplicaClient<Data>) -> string,
	IsActive: (self: ReplicaClient<Data>) -> boolean,
}

export type ReplicaServer<Data> = {
	Tags: { [any]: any },
	Data: Data,
	Id: number,
	Token: string,
	Parent: ReplicaServer<Data>?,
	Children: { [ReplicaServer<Data>]: boolean? },
	BoundInstance: Instance?,
	OnServerEvent: { Connect: (self: any, listener: (Player, ...any) -> ()) -> { Disconnect: (self: any) -> () } },
	Maid: typeof(require(ReplicaShared.Maid)),

	Set: (self: ReplicaServer<Data>, path: { string }, value: any) -> (),
	SetValues: (self: ReplicaServer<Data>, path: { string }, values: { [string]: any }) -> (),
	TableInsert: (self: ReplicaServer<Data>, path: { string }, value: any, index: number?) -> number,
	TableRemove: (self: ReplicaServer<Data>, path: { string }, index: number) -> any,
	Write: (self: ReplicaServer<Data>, function_name: string, ...any) -> ...any,
	FireClient: (self: ReplicaServer<Data>, player: Player, ...any) -> (),
	FireAllClients: (self: ReplicaServer<Data>, ...any) -> (),
	UFireClient: (self: ReplicaServer<Data>, player: Player, ...any) -> (),
	UFireAllClients: (self: ReplicaServer<Data>, ...any) -> (),
	SetParent: (self: ReplicaServer<Data>, new_parent: ReplicaServer<Data>) -> (),
	BindToInstance: (self: ReplicaServer<Data>, instance: Instance) -> (),
	Replicate: (self: ReplicaServer<Data>) -> (),
	DontReplicate: (self: ReplicaServer<Data>) -> (),
	Subscribe: (self: ReplicaServer<Data>, player: Player) -> (),
	Unsubscribe: (self: ReplicaServer<Data>, player: Player) -> (),
	Identify: (self: ReplicaServer<Data>) -> string,
	IsActive: (self: ReplicaServer<Data>) -> boolean,
	Destroy: (self: ReplicaServer<Data>) -> (),
}

return nil

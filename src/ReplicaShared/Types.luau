local ReplicaShared = script.Parent

local Signal = require(ReplicaShared.Signal)

export type ReplicaClient<Data, Tags> = {
	Data: Data,
	Tags: Tags,

	Id: number,
	Token: string,
	Parent: ReplicaClient<Data, Tags>?,
	Children: { [ReplicaClient<Data, Tags>]: boolean? },
	BoundInstance: Instance?,
	OnClientEvent: { Connect: (self: any, listener: (...any) -> ()) -> { Disconnect: (self: any) -> () } },
	Maid: typeof(require(ReplicaShared.Maid)),

	OnSet: (self: ReplicaClient<Data, Tags>, path: {}, listener: () -> ()) -> Signal.Connection,
	OnWrite: (self: ReplicaClient<Data, Tags>, function_name: string, listener: (...any) -> ()) -> Signal.Connection,
	OnChange: (
		self: ReplicaClient<Data, Tags>,
		listener: (
			action: "Set" | "SetValues" | "TableInsert" | "TableRemove",
			path: { any },
			param1: any,
			param2: any?
		) -> ()
	) -> Signal.Connection,
	GetChild: (self: ReplicaClient<Data, Tags>, token: string) -> ReplicaClient<Data, Tags>?,
	FireServer: (self: ReplicaClient<Data, Tags>, ...any) -> (),
	UFireServer: (self: ReplicaClient<Data, Tags>, ...any) -> (),
	Identify: (self: ReplicaClient<Data, Tags>) -> string,
	IsActive: (self: ReplicaClient<Data, Tags>) -> boolean,
}

type ReplicaServerBase = {
	Id: number,
	Token: string,
	Parent: ReplicaServerBase?,
	Children: { [ReplicaServerBase]: boolean? },
	BoundInstance: Instance?,
	OnServerEvent: { Connect: (self: any, listener: (Player, ...any) -> ()) -> { Disconnect: (self: any) -> () } },
	Maid: typeof(require(ReplicaShared.Maid)),

	FireClient: (self: ReplicaServerBase, player: Player, ...any) -> (),
	FireAllClients: (self: ReplicaServerBase, ...any) -> (),
	UFireClient: (self: ReplicaServerBase, player: Player, ...any) -> (),
	UFireAllClients: (self: ReplicaServerBase, ...any) -> (),
	SetParent: (self: ReplicaServerBase, new_parent: ReplicaServerBase) -> (),
	BindToInstance: (self: ReplicaServerBase, instance: Instance) -> (),
	Replicate: (self: ReplicaServerBase) -> (),
	DontReplicate: (self: ReplicaServerBase) -> (),
	Subscribe: (self: ReplicaServerBase, player: Player) -> (),
	Unsubscribe: (self: ReplicaServerBase, player: Player) -> (),
	Identify: (self: ReplicaServerBase) -> string,
	IsActive: (self: ReplicaServerBase) -> boolean,
	Destroy: (self: ReplicaServerBase) -> (),
}

export type ReplicaServer<Data, Tags> = ReplicaServerBase & {
	Data: Data,
	Tags: Tags,

	Set: (self: ReplicaServer<Data, Tags>, path: { string }, value: any) -> (),
	SetValues: (self: ReplicaServer<Data, Tags>, path: { string }, values: { [string]: any }) -> (),
	TableInsert: (self: ReplicaServer<Data, Tags>, path: { string }, value: any, index: number?) -> number,
	TableRemove: (self: ReplicaServer<Data, Tags>, path: { string }, index: number) -> any,
	Write: (self: ReplicaServer<Data, Tags>, function_name: string, ...any) -> ...any,
}

return nil

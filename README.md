## This disables the need for *most* NS2 Entities to need regular OnUpdate calls.
#### This is achieved by modifying the existing SleeperMixin to completely disable the :OnUpdate callback from the engine side
#### If the entity will need to Update, it should either be done via TimedCallbacks for things with known step times, or by 'Waking' up the entity via :WakeUp() which re-enables the :OnUpdate callbacks, until :GetCanSleep() returns true again.

## Known issues:
	- Sound FX optimizations may still be causing clients to not predict their own sounds
	- Sound FX optimizations may occasionally cause server crashes?

## THIS MOD IS STILL A WIP:

	TODOS:
	- Structures:
		- Sentry
		- Tunnel
		- TunnelEntrance (+Exit)
		- Web
	- OTHERS:
		- DOTMarker
		- Effect -- Only Client Side?
		- ObjectiveInfo
		- DropPack
		- Pheromone
		- ResourcePoint
		- SpawnBlocker
		- TechPoint
		- TimedEmitter
		- Tracer
		- PulseEffect
	- PLAYER MIXINS, not important ATM
		- PickupableMixin
		- PickupableWeaponMixin
		- SprintMixin
		- StunMixin
		- TunnelUserMixin
		- WebableMixin

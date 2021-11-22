extends RigidBody2D


const MIN_SOUND_VELOCITY = 500.0
const MAX_SOUND_VELOCITY = 1000.0
const MIN_VOLUME = -40.0
const MAX_VOLUME = -20.0
const MIN_TRAIL_VELOCITY = 2000.0
const CLAMP_VELOCITY = 1700.0

# Turn the particle trail on or off based on ball velocity.
func _process(delta):
	var speed = get_linear_velocity().length()
#	$CPUParticles2D.set_emitting(speed > MIN_TRAIL_VELOCITY)

# After certain rare and difficult-to-reproduce interactions between
# the ball and the environment, the ball acquires a huge velocity
# that bypasses all collisions and sends the ball far off the table.
# Since I'm not sure how this happens, I can't fix the root problem.
# As a safety measure, I'm clamping the ball velocity to a sane
# limit that I chose after observing normal game play.
func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	if velocity.length() > CLAMP_VELOCITY:
		state.set_linear_velocity(velocity.clamped(CLAMP_VELOCITY))

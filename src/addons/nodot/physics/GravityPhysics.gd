class_name GravityPhysics extends Nodot

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var gravity := 9.8

@onready var parent = get_parent()

func _physics_process(delta):
  if not parent.is_on_floor():
    parent.velocity.y -= gravity * delta

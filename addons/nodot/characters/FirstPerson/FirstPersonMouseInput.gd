class_name FirstPersonMouseInput extends Nodot

@export var enabled := true
@export var mouse_sensitivity := 0.1

@onready var parent: FirstPersonCharacterBody3D = get_parent()
@onready var head: Node3D = parent.head

var mouse_rotation = Vector2.ZERO

func _input(event):
  if enabled:
    if event is InputEventMouseMotion:
      mouse_rotation.y = event.relative.x * mouse_sensitivity
      mouse_rotation.x = event.relative.y * mouse_sensitivity

func _physics_process(delta):
  var look_angle = Vector2(-mouse_rotation.x * delta, -mouse_rotation.y * delta)
  
  # Handle look left and right
  parent.rotate_object_local(Vector3(0, 1, 0), look_angle.y)
  
  # Handle look up and down
  head.rotate_object_local(Vector3(1, 0, 0), look_angle.x)
  
  head.rotation.x = clamp(head.rotation.x, -1.36, 1.4)
  head.rotation.z = 0
  head.rotation.y = 0

class_name FirstPersonCharacterBody3D extends CharacterBody3D

@export var fov := 75
@export var head_position := Vector3.ZERO

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D

func _enter_tree():
  var head = Node3D.new()
  head.name = "Head"
  var camera3d = Camera3D.new()
  head.add_child(camera3d)
  add_child(head)
  
func _ready():
  camera.fov = fov
  
  if has_node("HeadPosition"):
    var head_position_node = get_node("HeadPosition")
    head.position = head_position_node.position
    head_position_node.queue_free()
  else:
    head.position = head_position

func _physics_process(delta):
  move_and_slide()

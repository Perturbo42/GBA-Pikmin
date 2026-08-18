class_name Bulborb extends Enemy
@onready var idle: BulborbIdle = $"Bulborb State Machine/Idle"
@onready var chase: BulborbChase = $"Bulborb State Machine/Chase"
@onready var return_state: BulborbReturn = $"Bulborb State Machine/Return"

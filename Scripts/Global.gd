extends Node

var nueva_posicion = Vector2()
#var nueva_posicion_guardian = Vector2()



#dialogos coger dinero
var found_money = false
var given_money = false


var player_current_attack = false
#world cliff_side
var current_scene = "world"
var transition_scene = false

#cliff a world
var current_scene_cliff_world = "cliff_side"
var transition_cliff_world = false

#world house (ida)
var transition_scene_house = false
var current_scene_house = "world_house"

#cliff a pueblo
var transition_pueblo = false
var current_scene_cliff = "cliff_pueblo"

#pueblo_cliff 
var transicion_pueblo_cliff = false
var current_scene_pueblo_cliff = "pueblo"

#casa 1 pueblo
var transicion_casa1 = false
var current_scene_casa1 = "pueblo"
#salir casa1
var transicion_casa1_salir = false
var current_scene_casa1_salir = "casa1"

#casa 2 pueblo
var transicion_casa2 = false
var current_scene_casa2 = "pueblo"

#salir casa 2 
var transicion_casa2_salir = false
var current_scene_casa2_salir ="casa2"


#cambia escena para cliff_side
func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "cliff_side"
		else:
			current_scene = "world"
			
	#cambio escena para house
func finish_changescenes_house():
	if transition_scene_house == true:
		transition_scene_house = false
		if current_scene_house == "world_house":
			current_scene_house = "house"
		else:
			current_scene = "world_house"


func finish_changescene_pueblo():
	if transition_pueblo == true:
		transition_pueblo = false
		if current_scene_cliff == "cliff_pueblo":
			current_scene = "pueblo"
		else:
			current_scene = "cliff_pueblo"
		
func finish_changescene_pueblo_cliff():
	if transicion_pueblo_cliff == true:
		transicion_pueblo_cliff = false
		if current_scene_pueblo_cliff == "pueblo":
			current_scene_pueblo_cliff =  "cliff_side"
		else:
			current_scene_pueblo_cliff = "pueblo"



func finish_changescene_cliff_world():
	if transition_cliff_world == true:
		transition_cliff_world = false
		if current_scene_cliff_world == "cliff_side":
			current_scene_cliff_world = "world"
		else:
			current_scene_cliff_world = "cliff_side"

#casa 1 pueblo
func finish_changescene_casa1():
	if transicion_casa1 == true:
		transicion_casa1 = false
		if current_scene_casa1 == "pueblo":
			current_scene_casa1 = "casa1"
		else:
			current_scene_casa1 = "pueblo"


func finish_changescene_casa1_salir():
	if transicion_casa1_salir == true :
		transicion_casa1_salir = false
		if current_scene_casa1_salir == "casa1":
			current_scene_casa1 = "pueblo"
		else:
			current_scene_casa1_salir ="casa1"
			
func finish_changescene_casa2():
	if transicion_casa2 == true:
		transicion_casa2 = false
		if current_scene_casa2 == "pueblo":
			current_scene = "casa2"
		else:
			current_scene_casa2 = "pueblo"
			
			
func finish_changescene_casa2_salir():
	if transicion_casa2_salir == true:
		transicion_casa2_salir = false
		if current_scene_casa2_salir == "casa1":
			current_scene_casa2_salir = "pueblo"
		else:
			current_scene_casa2_salir = "casa2"

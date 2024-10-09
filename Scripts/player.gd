extends CharacterBody2D


var enemy_inattack_range = false ; #if the enemy is on the attack area
var enemy_attack_cooldown = true #coodown for the enemy
var health = 120 #player health
var player_alive = true # to make the program know that the player is alive

var attack_ip = false #attack in progress / for the attack animation
#dialogo
var dialogo_activo = false

#conversaciones
var madre_conversacion = false
var guardian_conversacion = false
var cartel_entrada_albatros = false
var texto_intro = false

#Player speed
const speed = 100
var current_direction = "none" #becouse our characte start off going no direction

func _ready():
	$AnimatedSprite2D.play("front_idle")#to iniciate the game whit an idle animation
	#para poder cambiar la posicion del personaje en el cambio de escena
	if global.nueva_posicion != Vector2():
		position = global.nueva_posicion
		global.nueva_posicion = Vector2()


func _physics_process(delta):
	#after make the player_movement funcion , we call it in this funcion
	player_movement(delta)
	enemy_attack()#her we call the funcion aenemy attack , to make it work/ that funcion is in this node(esta mas abajo)
	attack()#funcion attack
	current_camera()
	uptade_healt()
	

	if health <= 0:
		player_alive = false # to make the enemy die ( hacer que reaparezca en un spawn
		health = 0
		print("player dead")#to make the enemy attack our player
		#play_death_animation()
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
		GlobalMusic.stop()
#player stuff, animations and movements
	
	#aceptar conversacion
	if madre_conversacion == true :
		if Input.is_action_just_pressed("ui_accept") and not dialogo_activo:
			DialogueManager.show_dialogue_balloon(load("res://Dialogos/main.dialogue"), "main")
			dialogo_activo = true
			return
	if guardian_conversacion == true :
		if Input.is_action_just_pressed("ui_accept") and not dialogo_activo:
			DialogueManager.show_dialogue_balloon(load("res://Dialogos/guardian.dialogue"), "guardian")
			dialogo_activo = true
			return
	if cartel_entrada_albatros == true and not dialogo_activo:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_dialogue_balloon(load("res://Dialogos/cartel_entrada_pueblo_albatros.dialogue"), "cartel_entrada_pueblo_albatros")
			dialogo_activo = true
			return
	if texto_intro == true and not dialogo_activo:
		if Input.is_action_just_pressed("derecha"):
			DialogueManager.show_dialogue_balloon(load("res://Dialogos/intro.dialogue"))
			dialogo_activo = true
			return
	
	
func _on_DialogueManager_dialogue_closed():
	dialogo_activo = false
#func play_death_animation():
	#$AnimatedSprite2D.play("death")
	#await $AnimatedSprite2D.animation_finished
	#show_game_over_screen()
	#self.queue_free()
#func show_game_over_screen():
	#var game_over_scene = load("res://Scenes/gameover.tscn")
	#get_tree().change_scene_to(game_over_scene)

func player_movement(_delta): 
	
		if Input.is_action_pressed("ui_right"): #code to move the player to the right
			 #after call the current direction variable 
			current_direction = "right"#to play the animation to the right
			play_animation(1)#play the animation that we make in the funcion of animations
			#we will only be in the movement of the x coordinate axis
			# because we do not want it to go up or down
			velocity.x = speed
			velocity.y = 0
		elif Input.is_action_pressed("ui_left"):
			current_direction = "left"
			play_animation(1)
			velocity.x = -speed # go to the oposite direction
			velocity.y = 0
		elif Input.is_action_pressed("ui_down"):
			current_direction = "down"
			play_animation(1)
			velocity.y = speed #now the y coordinate 
			velocity.x = 0
		elif Input.is_action_pressed("ui_up"):
			current_direction ="up"
			play_animation(1)
			velocity.y = -speed #the opsite direction 
			velocity.x = 0
			
		else:
			play_animation(0)#here its animation 0 because the player dosent move
			velocity.x = 0#if you dont move the player , it will stay still
			velocity.y = 0
			
			
		move_and_slide()#to make the player movement


func play_animation(movement):#we call movemente in the funcion animation to make the movementes and the idle
	var direction = current_direction # to make the direction equal the current direction of the movements
	var animation = $AnimatedSprite2D # variable to play the animations	
	if direction == "right":
		animation.flip_h = false #becouse we dont have to flip horizontal the right animation
		if movement == 1 :
			animation.play ("side_walk")
		elif movement == 0:
			if attack_ip == false:
				animation.play("side_idle")
	
	if direction == "left":
		animation.flip_h = true #becouse we  have to flip horizontal the left animation to make it work good
		if movement == 1 :
			animation.play ("side_walk")
		elif movement == 0:
			if attack_ip == false:
				animation.play("side_idle")
	
	if direction == "down":
		animation.flip_h = true
		if movement == 1 :
			animation.play ("front_walk")
		elif movement == 0:
			if attack_ip == false:	
				animation.play("front_idle")
			
	if direction == "up":
		animation.flip_h = true 
		if movement == 1 :
			animation.play ("back_walk")
		elif movement == 0:
			if attack_ip == false:
				animation.play("back_idle")



func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):#if the body that enters in the player area is the enemy 
		enemy_inattack_range = true # make the inattack range true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false # the enemy stop attacking
		
		
func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:#basically, if the enemy enters activate the attack range and the cooldown
		health = health - 20 #player lost life
		enemy_attack_cooldown = false #if the cooldown of the enemy is false , activates a cooldown after attack to the player
		$attack_cooldown.start()
		
		print(health)#it prints a lot of times , because we need a cooldown to make it lowr


func _on_attack_cooldown_timeout(): #we connect te node timer(attack cooldown) to the player 
	enemy_attack_cooldown = true #to make the cooldown works
	
	
	
func attack():
	var direction = current_direction

	if Input.is_action_just_pressed("attack"):
		global.player_current_attack = true
		attack_ip = true
		if direction == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			$deal_attack_timer.start()
		if direction == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			$deal_attack_timer.start()
			
		if direction == "down":
			$AnimatedSprite2D.play("front_attack")
			$deal_attack_timer.start()
			$deal_attack_timer.start()
		
		if direction == "up":
			$AnimatedSprite2D.play("back_attack")
			$deal_attack_timer.start()
			$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():#deal attack timer
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false

func current_camera():
	if global.current_scene == "world":
		$worldcamera.enabled =true
		$"cliff side camera".enabled = false
	elif global.current_scene == "cliff_side":
		$worldcamera.enabled = false
		$"cliff side camera".enabled = true



func uptade_healt():
	var healthbar = $"health bar"
	healthbar.value = health
	if health >= 120:
		healthbar.visible = false
	else:
		healthbar.visible = true
	
	
	
func _on_regen_timer_timeout():
	if health < 120:
		health = health + 1
		if health > 120:
			health = 120
	if health <= 0:
		health = 0




#Conversaciones

#conversacion madre

func _on_conversations_body_entered(body):
	if body.has_method("mother"):
		madre_conversacion = true


func _on_conversations_body_exited(body):
	if body.has_method("mother"):
		madre_conversacion = false
		
		
		
		
		
#conversacion guardian

func _on_guardian_conver_body_entered(body):
	if body.has_method("guardian"):
		guardian_conversacion = true


func _on_guardian_conver_body_exited(body):
	if body.has_method("guardian"):
		guardian_conversacion = true


#cartel entrada albatros
func _on_cartel_entrada_albatros_body_entered(body):
	if body.has_method("cartel"):
		cartel_entrada_albatros = true


func _on_cartel_entrada_albatros_body_exited(body):
	if body.has_method("cartel"):
		cartel_entrada_albatros = false

#texto intro
func _on_texto_intro_body_entered(body):
	if body.has_method("intro"):
		texto_intro = true


func _on_texto_intro_body_exited(body):
	if body.has_method("intro"):
		texto_intro = false

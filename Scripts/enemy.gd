extends CharacterBody2D

var speed  = 60
var player_chase = false # to see if the enemt follow or chase (perseguir) the enemy
var player= null


var health = 100
var player_inattack_zone  = false
var can_take_damage = true

func _physics_process(_delta):
	deal_whit_damage() #la funcion de abajo
	uptade_healt()

	
	if player_chase:
		position += (player.position -position)/speed #to make the enemy follow the player
		move_and_collide(Vector2(0,0)) # to make the enemy collide whit the things in the map
		$AnimatedSprite2D.play("walk")
		if (player.position.x -position.x)<0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true #when the enemy go to the left , turns to the left position
	else:
		$AnimatedSprite2D.play("idle")
	

func _on_area_2d_detection_area_body_entered(body): # whit a signal we connect the area2d to the enemy
	player = body # if the player entred in the area the enemy detects it like a body, an objetive to chase
	player_chase = true

func _on_area_2d_detection_area_body_exited(_body):# whit a signal we connect the area2d to the enemy
	player = null # the player leave the area of the enemy to chase it
	player_chase = false


func enemy():#this funcion is to call in the player the "has_methot" to make it work good in her hitbox
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):#the same code that we make in the player
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):#the same code that we make in the player
		player_inattack_zone = false
		
func deal_whit_damage(): # how the enemy recibes damage
	if player_inattack_zone and global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 40
			$"take damage cooldown".start()
			can_take_damage = false
			print("slime=", health)
			if health <= 0:
				self.queue_free()
func die():
	if health <= 0 :
		$AnimatedSprite2D.play("death")
		queue_free()

func _on_take_damage_cooldown_timeout():
	can_take_damage = true
	
	
	
	
	
	
func uptade_healt():
	var healthbar = $"healthbar"
	healthbar.value = health
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
	
	
	
	
	

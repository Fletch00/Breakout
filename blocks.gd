extends StaticBody2D


func _on_hitbox_body_entered(_body: Node2D) -> void:
				var timer = $Timer
				timer.start()


func _on_timer_timeout() -> void:
	self.queue_free()

Framer.Defaults.Animation =
	curve:"ease-in-out"

# initial setup
Star1.opacity = 0
Star2.opacity = 0
Star3.opacity = 0
Star4.opacity = 0
Star5.opacity = 0

# animation functions - explode
# move stars from a distance radius of 48 pt randomly, change opacity from 0 to 1
explode1 = new Animation Star1,
	x: 144
	y: 598
	opacity: 1
	options:
		delay: 0
		time: 1
explode2 = new Animation Star2,
	x: 141
	y: 668
	opacity: 1
	options:
		delay: 0
		time: 1
explode3 = new Animation Star3,
	x: 208
	y: 600
	opacity: 1
	options:
		delay: 0
		time: 1
explode4 = new Animation Star4,
	x: 129
	y: 644
	opacity: 1
	options:
		delay: 0
		time: 1
explode5 = new Animation Star5,
	x: 221
	y: 644
	opacity: 1
	options:
		delay: 0
		time: 1

# animation function - move
# move stars to the star counter
move1 = new Animation Star1,
	x: 330
	y: 43
	options:
		delay: 0
		time: 1
move2 = new Animation Star2,
	x: 330
	y: 43
	options:
		delay: 0
		time: 1
move3 = new Animation Star3,
	x: 330
	y: 43
	options:
		delay: 0
		time: 1
move4 = new Animation Star4,
	x: 330
	y: 43
	options:
		delay: 0
		time: 1
move5 = new Animation Star5,
	x: 330
	y: 43
	options:
		delay: 0
		time: 1

# animation function - bounce star counter
bigStar = new Animation StarCount,
	scale: 1.2
	options:
		time: 0.05
smallStar = bigStar.reverse()

# animation event
# after star explosion ends, move star

explode1.onAnimationStop ->
	move1.start()
	Utils.delay 1, ->
		bigStar.start()
		bigStar.onAnimationEnd ->
			smallStar.start()
			
			smallStar.onAnimationEnd ->
				bigStar.start()

explode2.onAnimationStop ->
	move2.start()

explode3.onAnimationStop ->
	move3.start()

explode4.onAnimationStop ->
	move4.start()

explode5.onAnimationStop ->
	move5.start()

move5.onAnimationStop ->
	bigStar.stop()

explode1.start()
Utils.delay 0.1, ->
	explode2.start()
	Utils.delay 0.1, ->
		explode3.start()
		Utils.delay 0.1, ->
			explode4.start()
			Utils.delay 0.1, ->
				explode5.start()

######## STICKER ########

# Hide sticker on default
Sticker.opactiy = 0

# Animation function - move star up with Spring curve
stickerMoveUp = new Animation Sticker,
	y: 260
	scale: 6
	options:
		curve: "Spring(damping:0.33, mass:1.1)"
		time: 1

# Animatoin function - move sticker down to the sticker tab bar, ease-in curve
stickerMoveDown = new Animation Sticker,
	x: 96
	y: 739
	scale: 0.8
	options:
		curve: "ease-in"
		time: 0.2

# Animation triggers, wait until star explosion completes, then tirgger stickerMoveUp
Utils.delay 1, ->
	stickerMoveUp.start()

# When animation starts, immediately appear sticker, no animation
stickerMoveUp.onAnimationStart ->
	Sticker.opacity = 1

# After 2 seconds  (3 seconds from prototype starts), move star down, 
Utils.delay 3, ->
	stickerMoveDown.start()

# When animation ends, immediately hide sticker, no animation
stickerMoveDown.onAnimationEnd ->
	Sticker.opacity = 0
	
	
	

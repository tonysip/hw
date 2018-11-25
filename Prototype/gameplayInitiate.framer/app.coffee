# Import file "web-gradients-itmeo"
sketch = Framer.Importer.load("imported/web-gradients-itmeo@2x", scale: 1)

Framer.Defaults.Animation =
	curve: Spring(damping: 0.66, mass: 1, velocity: 0)
# 	curve: Bezier(1,-0.8,0,1.8)
	time: 2
#https://medium.com/@RobertGummesson/a-look-at-uiview-animation-curves-part-1-191d9e6de0ab

# initial values
sketch.Sign.y = -sketch.Sign.height
sketch.CompanionBar.y = -sketch.CompanionBar.height
sketch.Panel.y = Screen.height
sketch.BG.scale = 0.9

# initial motivation props
sketch.motivateSign.y = -sketch.motivateSign.height
sketch.motivateBurst.opacity = 0
sketch.motivateBalloons.y = Screen.height

sketch.WorldName.scale = 2
sketch.WorldName.opacity = 0

# Animation Objects
zoomInTitle = new Animation sketch.WorldName,
	scale: 1
	opacity: 1
	options:
		time: 1

zoomOutTitle = zoomInTitle.reverse()

dropCompanionBar = new Animation sketch.CompanionBar,
	y: -44
	options:
		time: 1

upPanel = new Animation sketch.Panel,
	y: 132
	options:
		time: 1

letsgoDown = new Animation sketch.Sign,
	y: -63
	options:
		time: 0.5
letsgoUp = letsgoDown.reverse()

bigBtn = new Animation sketch.NextBtn,
	scale: 1.02
	options:
		time: 0.1
smallBtn = bigBtn.reverse()

# Animation Objects - motivation props
balloonUp = new Animation sketch.motivateBalloons,
	y: -sketch.motivateBalloons.height
	options:
		time: 3
		curve: "Linear"

starShow = new Animation sketch.motivateBurst,
	opacity: 1
	rotation: -30
	options:
		time: 1
starHide = starShow.reverse()

signDown = new Animation sketch.motivateSign,
	y: -63
	options:
		time: 0.5	
signUp = signDown.reverse()

# Trigger Animations

Utils.delay 1, ->
	zoomInTitle.start()

zoomInTitle.onAnimationEnd ->
	Utils.delay 2, ->
		zoomOutTitle.start()

zoomOutTitle.onAnimationStart ->
	Utils.delay 0.3, ->
		dropCompanionBar.start()
		upPanel.start()

upPanel.onAnimationEnd ->
	Utils.delay 0.5, ->
		letsgoDown.start()
		Utils.delay 1.5, ->
			letsgoUp.start()

bigBtn.start()
bigBtn.onAnimationEnd ->
	smallBtn.start()

smallBtn.onAnimationEnd ->
	Utils.delay 3, ->
		bigBtn.start()

sketch.NextBtn.onTap ->
	Utils.delay 0.5, ->
		balloonUp.start()
	balloonUp.onAnimationEnd ->
			sketch.motivateBalloons.y = Screen.height
	
# sketch.NextBtn.onTap ->
# 	Utils.delay 0.5, ->
# 		starShow.start()
# 		starShow.onAnimationEnd ->
# 			Utils.delay 0.5, ->
# 				starHide.start()

# sketch.NextBtn.onTap ->
# 	Utils.delay 0.5, ->
# 		signDown.start()
# 		Utils.delay 1.5, ->
# 			signUp.start()
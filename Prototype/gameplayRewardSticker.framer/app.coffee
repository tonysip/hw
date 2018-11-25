# Import file "web-gradients-itmeo"
sketch = Framer.Importer.load("imported/web-gradients-itmeo@2x", scale: 1)

# Setup hitTarget to trigger animation
hitTarget = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: null

# Initial setup
sketch.target_sticker.scale = 0.2
sketch.target_sticker.opacity = 0

# scale up sticker animation
scaleUpSticker = new Animation sketch.target_sticker,
	scale: 1
	options:
		curve: Spring(damping: 0.33, mass: 1.1)

# trigger animation, opacity change has no animation, scale has animation
hitTarget.onTap ->
	sketch.target_sticker.opacity = 1
	scaleUpSticker.start()
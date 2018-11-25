# Import file "web-gradients-itmeo"
sketch = Framer.Importer.load("imported/web-gradients-itmeo@2x", scale: 1)

# Setup hitTarget to trigger animation
hitTarget = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: null

# move star up animation function
moveUpStar = new Animation sketch.target_star,
	y: 248
	options:
		curve: Spring(damping: 0.33, mass: 1.1)

# trigger animation
# trigger number going up with the same duration as star animation

hitTarget.onTap ->
	moveUpStar.start()

# After moveUpStar animation ends, explode confetti library. continue to explode confetti again and again until user clicks "Ok!"




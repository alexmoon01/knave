// foci is a list of px points, sharpness is the accuracy of the curve
function bezier(foci, sharpness){
	var points = []
	var num_foci = array_length(foci)
	var coeffs = pascal_vals(num_foci - 1)
	for(var i = 0; i <= sharpness; i++) {
		var t = i / sharpness
		var u = 1 - t
		points[i] = [0, 0]
		for(var j = 0; j < num_foci; j++) {
			var coefficient = coeffs[j] * power(t, j) * power(u, num_foci - j - 1)
			points[i][0] += coefficient * foci[j][0]
			points[i][1] += coefficient * foci[j][1]
		}
	}
	return points
}

function pascal_vals(level) {
	var vals = []
	var fac_level = factorial(level)
	for(var k = 0; k <= level; k++) {
		if(k <= level / 2) {
			var fac_col = factorial(k)
			var fac_opp = factorial(level - k)
			vals[k] = fac_level / (fac_col * fac_opp)
		} else {
			vals[k] = vals[level - k]
		}
	}
	return vals
}

function factorial(num) {
	if(num <= 1) {
		return 1
	} else {
		return num * factorial(num - 1)
	}
}
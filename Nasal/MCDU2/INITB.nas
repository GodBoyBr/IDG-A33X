# A3XX mCDU by Joshua Davidson (it0uchpods) and Jonathan Redpath

#########################################
# Copyright (c) it0uchpods Design Group #
#########################################

var initInputB = func(key) {
	var scratchpad = getprop("/MCDU[1]/scratchpad");
	if (key == "R2") {
		if (scratchpad == "CLR") {
			setprop("/FMGC/internal/block", 0.0);
			setprop("/FMGC/internal/block-set", 0);
			setprop("/MCDU[1]/scratchpad-msg", "0");
			setprop("/MCDU[1]/scratchpad", "");
		} else {
			var tfs = size(scratchpad);
			var maxblock = getprop("/options/maxblock");
			if (tfs >= 1 and tfs <= 5) {
				if (scratchpad >= 1.0 and scratchpad <= maxblock) {
					setprop("/FMGC/internal/block", scratchpad);
					setprop("/FMGC/internal/block-set", 1);
					setprop("/MCDU[1]/scratchpad", "");
				} else {
					if (getprop("/MCDU[1]/scratchpad") != "NOT ALLOWED") {
						setprop("/MCDU[1]/last-scratchpad", getprop("/MCDU[1]/scratchpad"));
					}
					setprop("/MCDU[1]/scratchpad-msg", "1");
					setprop("/MCDU[1]/scratchpad", "NOT ALLOWED");
				}
			} else {
				if (getprop("/MCDU[1]/scratchpad") != "NOT ALLOWED") {
					setprop("/MCDU[1]/last-scratchpad", getprop("/MCDU[1]/scratchpad"));
				}
				setprop("/MCDU[1]/scratchpad-msg", "1");
				setprop("/MCDU[1]/scratchpad", "NOT ALLOWED");
			}
		}
	}
}

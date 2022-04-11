function setTextDefaults() {
	line_break_pos = [0, page_number] = 0;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = soundText;
	
	// variables for every letter/character
	for (var c = 0; c < 500; c++) {
		color_1[c, page_number] = c_white;
		color_2[c, page_number] = c_white;
		color_3[c, page_number] = c_white;
		color_4[c, page_number] = c_white;
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*20;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	}
}


// -----------------Text VFX-----------------

/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function textColor(_start, _end, _col1, _col2, _col3, _col4) {
	for(var c = _start; c <= _end; c++) {
		color_1[c, page_number - 1] = _col1;
		color_2[c, page_number - 1] = _col2;
		color_3[c, page_number - 1] = _col3;
		color_4[c, page_number - 1] = _col4;	
	}
}

/// @param 1st_char
/// @param last_char
function textFloat(_start, _end) {
	for(var c = _start; c <= _end; c++) {
		float_text[c, page_number - 1] = true;
	}	
}



/// @param 1st_char
/// @param last_char
function textShake(_start, _end) {
	for(var c = _start; c <= _end; c++) {
		shake_text[c, page_number - 1] = true;
	}	
}



/// @param text
/// @param [character]
/// @param [side]
function newTextbox(_text){
	setTextDefaults();
	text[page_number] = _text;
	
	if argument_count > 1 {
		switch(argument[1]) {
			case "face 1":
				speaker_sprite[page_number] = sFace;
				snd[page_number] = soundAme;
				break;
			case "face 2":
				speaker_sprite[page_number] = sFace2;
				break;
		}
		
	}
	if argument_count > 2 {
		speaker_side[page_number] = argument[2];
	}
	
	page_number++;
}

/// @param text_id
function createTextbox(_text_id) {
	with ( instance_create_depth(0, 0, -9999, oText) ) {
		gameText(_text_id);
	}
	with (oAme) {
		if state != PlayerStateLocked {
			lastState = state;
			state = PlayerStateLocked;
			
		}
		
	}
}


/// @param option
/// @param link_id
function createOptions(_option, _link_id) {
	option[option_number] = _option;
	option_link_id[option_number] = _link_id
	option_number++;
	
}
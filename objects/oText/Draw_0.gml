accept_key = keyboard_check_pressed(ord("Z"));
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 109; //119

// setup
if setup == false {
	setup = true;
	
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// loop through pages
	for (var p = 0; p < page_number; p++) {
		
		// get number of characters(length) of text in every page
		text_length[p] = string_length(text[p]);
		
		//get the position of the textbox
			// character on the left
			text_x_offset[p] = 95;
			portrait_x_offset[p] = 15;
			
			// character on the right
			if speaker_side[p] == -1 {
				text_x_offset[p] = 15;
				portrait_x_offset[p] = 239;
			}
		
		
			// in case if there is no character speaking
			
			if speaker_sprite[p] == noone {
				text_x_offset[p] = 56; //79
			}
			
			
			
		// finding where lines of text should break
		for(var c = 0; c < text_length[p]; c++) {
			
			var _char_pos = c+1;
			
			 // store individual characters in the char array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			 // get current width of line
			 var _txt_to_char = string_copy(text[p], 1, _char_pos);
			 var _current_text_width = string_width(_txt_to_char) - string_width(char[c, p]);
			 
			 // get the last free space
			 if char[c, p] == " " { last_free_space = _char_pos+1 }; 
			 
			 // get the line breaks
			 if _current_text_width - line_break_offset[p] > line_width {
				 
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _txt_to_last_space = string_copy(text[p], 1, last_free_space);
				//var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_to_last_space);// - string_width(_last_free_space_string);
			 }
		}
		
		// getting each character coordinates
		
		for(var c = 0; c < text_length[p]; c++) {
			var _char_pos = c + 1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			// get current width of line
			var _txt_to_char = string_copy(text[p], 1, _char_pos);
			var _current_text_width = string_width(_txt_to_char) - string_width(char[c, p]);
			var _txt_line = 0;
			
			// compensate for string breaks
			for(var lb = 0; lb < line_break_num[p]; lb++) {
				// if the current looping char is after the line break
				if _char_pos >= line_break_pos[lb, p] {
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_text_width = string_width(_str_copy);
					
					// record the line this char should be on
					_txt_line = lb+1;// +1 since ;b starts with 0
				}
			
			}
			// add to the x and y coords base on new info
			char_x[c, p] = _txt_x + _current_text_width;
			char_y[c, p] = _txt_y + _txt_line*line_sep;
			
			
			
		}
		
	}
}



// typing the text

if text_pause_timer <= 0 {
	if draw_char < text_length[page] {
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if _check_char == "." || _check_char == "?" || _check_char == "!" || _check_char == "," {
			text_pause_timer = text_pause_time;
		}
		else {
			// typing sound
			if snd_count < snd_delay {snd_count++};
			else {
				if !audio_is_playing(snd[page]) {
					snd_count = 0;
					audio_play_sound(snd[page], 8, false);
				}
			}
		}
	}
}
else {
	text_pause_timer--;
}

// ========================= turn pages =========================

if accept_key {
	
	// if typing is done
	if draw_char == text_length[page] {
		if page < page_number - 1 {
			page++;
			draw_char = 0;
		}
		else {
			// link text for options
			if option_number > 0 {
				createTextbox(option_link_id[option_pos]);
				
				
				}
			
			
			instance_destroy();
			if !instance_exists(oText) {
				with (oAme) state = lastState;
			}
		}
	}
	// if not done typing
	else {
		draw_char = text_length[page];
	}
}




// ========================= draw the textbox =========================
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y =  textbox_y;
textbox_img += textbox_img_spd;
arrow_img += arrow_img_spd;
textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);

// draw the speaker
if speaker_sprite[page] != noone {
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] {image_index = 0};
	var _speaker_x = portrait_x_offset[page] + textbox_x;
	if speaker_side[page] == -1 {_speaker_x += sprite_width-65};
	draw_sprite_ext(textbox_spr, textbox_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/(textbox_spr_w*1.8), sprite_height/(textbox_spr_h*1.8), 0, c_white, 1);
	//draw_sprite_ext(textbox_spr, textbox_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/textbox_spr_w, sprite_height/textbox_spr_h, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x + border, textbox_y + border, speaker_side[page]/2.2, 1/2.2, 0, c_white, 1);
	//draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
}


// back of the textbox
draw_sprite_ext(textbox_spr, textbox_img, _txtb_x, _txtb_y, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, 1);





// ========================= options =========================
if draw_char == text_length[page] && page == page_number - 1 {
	
	// option selection
	option_pos += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"))
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	// draw the options
	var _op_space = 16;
	var _op_border = 6;
	for(var op = 0; op < option_number; op++) {
		var _op_width = string_width(option[op]) + _op_border*2;
		// draw option box
		draw_sprite_ext(textbox_spr, textbox_img, _txtb_x + 16, _txtb_y - _op_space*option_number + _op_space*op, _op_width/textbox_spr_w, (_op_space - 1)/textbox_spr_h, 0, c_white, 1);
		
		// draw arrow
		if option_pos == op {
			draw_sprite(arrow_spr, arrow_img, _txtb_x, _txtb_y - _op_space*option_number + _op_space*op);
			
		}
		
		
		// draw option text
		draw_text(_txtb_x + 16 + _op_border, _txtb_y - _op_space*option_number + _op_space*op + 2, option[op]);
	}
	
}



// draw text
for(var c = 0; c < draw_char; c++) {
	
	// ----- special stuff -----
	// wavy text
	var _float_y = 0;
	if float_text[c, page] == true {
		
		float_dir[c, page] += -6;
		_float_y += dsin(float_dir[c, page]);
	}
	
	// shaky text
	var _shake_y = 0;
	var _shake_x = 0;
	 if shake_text[c, page] == true {
		 shake_timer[c, page]--;
		 if shake_timer[c, page] <= 0 {
			 shake_timer[c, page] = irandom_range(4, 8);
			 shake_dir[c, page] = irandom(360);
			 _shake_y = lengthdir_y(1, shake_dir[c, page]);
			 _shake_x = lengthdir_x(1, shake_dir[c, page]);
		 }
		 
	 }
	
	
	
	draw_text_color(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], color_1[c, page], color_2[c, page], color_3[c, page], color_4[c, page], 1);
}

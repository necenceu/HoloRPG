accept_key = keyboard_check_pressed(ord("Z"));
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 223;

// setup
if setup == false {
	setup = true;
	
	draw_set_font(fText);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// loop through pages
	page_number = array_length(text);
	for (var _p = 0; _p < page_number; _p++) {
		
		// get number of characters(length) of text in every page
		text_length[_p] = string_length(text[_p]);
		
		//get the position of the textbox
			// in case if there is no character speaking
			
			text_x_offset[_p] = 159;
		
	}
}



// typing the text

if draw_char < text_length[page] {
	draw_char += text_spd;
	
	draw_char = clamp(draw_char, 0, text_length[page]);
	
}

// ==================== turn pages ====================

if accept_key {
	
	// if typing is done
	if draw_char == text_length[page] {
		if page < page_number - 1 {
			page++;
			draw_char = 0;
		}
		else {
			instance_destroy();
		}
	}
	// if not done typing
	else {
		draw_char = text_length[page];
	}
}


// ========================= draw the textbox =========================
textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);
// back of the textbox
draw_sprite_ext(textbox_spr, textbox_img, textbox_x + text_x_offset[page], textbox_y, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, 1);
// draw text
var _drawText = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border,  textbox_y + border, _drawText, line_sep, line_width);









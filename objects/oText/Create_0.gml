// Textbox parameters
textbox_width = 208; //160
textbox_height = 64; //48
border = 8;
line_sep = 11;
line_width = textbox_width - border*2;
textbox_spr = sTextBox;
textbox_img = 0;
arrow_spr = sArrow;
arrow_img = 0;
textbox_img_spd = 6/FRAME_RATE;
arrow_img_spd = 15/FRAME_RATE;


// Text parameters

page = 0;
page_number = 0;
text[0] = "";
text_length = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_spd = 1;


// options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

// sounds
snd_delay = 4;
snd_count = snd_delay;


// effects
setTextDefaults();
last_free_space = 0;
text_pause_time = 16;
text_pause_timer = 0;
// Textbox parameters
textbox_width = 355;//319
textbox_height = 96;//127
border = 18;
line_sep = 20;
line_width = textbox_width - border*2;
textbox_spr = sTextBox;
textbox_img = 0;
textbox_img_spd = 1/60;



// Text parameters

page = 0;
page_number = 0;
text[0] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus";
text[1] = "libero sit amet consequat pellentesque, ipsum massa mollis nulla";
text[2] = "ac placerat nunc mi nec odio. Duis pharetra velit eget molestie cursus";
text[3] = "Praesent eu dictum felis, id fringilla mi. Pellentesque dapibus orci eu sodales aliquet.";
text[4] = "Donec sit amet dapibus augue.";
text_length = string_length(text[0]);
draw_char = 0;
text_spd = 1;
setup = false;

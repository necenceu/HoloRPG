/// @param text_id
function gameText(_text_id){
	switch(_text_id) {
		case "water" :
			newTextbox("Nice Wa'er");
			newTextbox("I succ at coding", "face 1");
			newTextbox("Wanna hang out?", "face 2");
				createOptions("Damn yeah, Lets go", "water - yes");
				createOptions("Hell no, fuck you", "water - no")
			break;
			case "water - yes":
				newTextbox("Yay");
				newTextbox("Im going home");
				break;
			
			case "water - no":
				newTextbox("You should kiss yourself now");
				newTextbox("Please");
				break;

			
		case "skull" :
			newTextbox("Damn, bro... I fucking hate  corruption! What should I do?", "face 1");
				textFloat(1, 12);
				textColor(28, 38, c_red, c_red, c_red, c_red);
			newTextbox("Are you fucking kidding me, asshole?!?!??!", "face 2", -1);
				createOptions("Chill, bro. it's just a joke!", "skull - yes");
				createOptions("You got some problems moron?", "skull - no");
			break;
			case "skull - yes":
				newTextbox("Get the fuck out of here!!!!", "face 2", -1);
				newTextbox("K,.. bye..", "face 1");
				newTextbox("The end");
				break;
			case "skull - no":
				newTextbox("No im so sorry lemme suck your massive cock", "face 2", -1);
				newTextbox("Nah fuck you", "face 1");
				newTextbox("Eventually they just pretended he is still a pekora");
				
			
		case "bone" :
			newTextbox("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
			newTextbox("abcdefghijklmnopqrstuvwxyz", "face 1");
			newTextbox("_!@#$%^&*()_+=-*/<>|\~");
			newTextbox("1234567890", "face 1");
			
			break;
		
		case "scary" :
			newTextbox("It's so cold, When will Alikhan finish the portrait of Amelia Watson, the Announcer of Paladins?")
				textShake(0, 13);
				textFloat(55, 67);
				textColor(55, 67, c_yellow, c_yellow, c_yellow, c_yellow);
			newTextbox("Journey journey objectivization backprojections juxtaglomerular nonobjectivisms unobjectionably39")
			break;
	}

}
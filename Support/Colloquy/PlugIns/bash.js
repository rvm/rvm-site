/* A simple script to have a quote from Bash.org entered into a chatroom.
 * Usage:
 *    Display a specific quote: /bash <id>
 *    Ex:  /bash 5273
 *    Display a random quote: /bash random   
 *    Display usage: /bash help
 *
 * Contact:
 *		Name: Daniel Baucom
 * 		Email: Loudambiance@gmail.com
 *      IRC: danl@irc.freenode.net
 *
 * Copyright © 2009 Daniel Baucom
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation 
 * files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, 
 * modify, merge, publish, distribute the Software, and to permit persons to whom the Software is furnished to do so, subject 
 * to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the 
 * Software. Any derivative works must also include the above copyright statement, and must include a similar license. No copy
 * of this work, or any derivative work is to be sold for any monitary value.
 * 
 * THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 *  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

var xmlhttp;	// Ajax object
var view;		// view object
var connection;	// connection object
var msg; 		// message object;

/* Function for parsing user command */
function processUserCommand(command, arguments, inconnection, inview) {
	if (command == 'bash') { // Check if the command is one for us to process.
		
		// Make the view and connection viewable by all functions (required for AJAX portion see function state_Change)
		view = inview;
		connection = inconnection;
		msg = new JVMutableChatMessage('', connection.localUser());
		
		// Check if parameter is an integer for use as an quote id.
		if (parseInt(arguments) == (arguments - 0)) {
            getBashQuote(arguments);
        } 
		
		// Print usage instructions for user.
		else if (arguments == 'help') {
			usage();
        } 

		// Check if argument signifies a random quote.
		else if (arguments == 'random') {
			getBashQuote(arguments); 
		} 
		
		// Tells user if argument does not match any accepted arguments.
		else {
            view.addEventMessageToDisplay('Bash: Argument must be an integer. For more information type /bash help', 
					'bashError', null);
        }
		return true; // Tell Colloquy that we handled the command.
    }
    return false; // Tell Colloquy we are not going to handle this command
}

/* Function for creating AJAX Request */
function getBashQuote(id) {
	xmlhttp = null; // Reset Ajax object
    try {
        xmlhttp = new XMLHttpRequest(); 
		xmlhttp.onreadystatechange=state_Change;
        xmlhttp.open('GET', 'http://bash.org/?' + id, false);
        xmlhttp.send();
    } catch(err) { // Display error to user if there is a problem creating the ajax object.
        view.addEventMessageToDisplay('Bash: There was an error and the page could not be retrieved. Err: ' 
									+ err, 'bashHelp', null);
    }	
}

/* Function for handling state changes of the ajax object */
function state_Change(){
	// readyState of 4 means the ajax object has fully loaded the page and we can continue.
	if (xmlhttp.readyState==4){
		// status of 200 means the page did not return a server level error.
		if (xmlhttp.status == 200) {
			// Creates a new element for putting the page code in, so we can use DOM functins.
		    var message = document.createElement("div");
			message.innerHTML = xmlhttp.responseText;
			
			var nodes = new Array();
			var id = '0';
			
			// Find the element containing the quote
			nodes = message.getElementsByTagName('p');
			if (nodes[2]){ // checks if quote exists, if not we used an invalid id.
				// Gets quote id from page instead of user input, ensures we have a quote id for random.
				id = nodes[1].childNodes[0].href.match(/\?(.*)/)[1];
				
				// Gets actual quote and splits it into multiple lines if needed.
				message = nodes[2].innerHTML;
				var lines = new Array();
				lines = message.split("<br>");
				
				// Send quote for printing.
				printQuote(id, lines);
		    } else { // Error if quote not found.
				view.addEventMessageToDisplay('Bash: Quote Not Found!', 'bashError', null);
			}
		} else { // Error if page returns status other than 200
			view.addEventMessageToDisplay('Bash: There was an error retrieving the page, the id could be invalid.' + 
											' The server returned (' + req.status + ')', 'bashError', null);
		}
	}
	
}
/* Function for printing the quote to the chat */
function printQuote(id, lines){
	msg.setBodyAsHTML('Bash Quote(' + id + '):');
	view.sendMessage(msg);
	view.echoSentMessageToDisplay(msg);
	
	// Loop for printing all lines of a quote.
	for (var i in lines){
		msg.setBodyAsHTML('      ' + lines[i]	);
		view.sendMessage(msg);
		view.echoSentMessageToDisplay(msg);
	}
}

/* Function for printing usage */
function usage(){
	msg.setBodyAsHTML('Bash Help:');
	view.echoSentMessageToDisplay(msg);
	msg.setBodyAsHTML('    Display a Quote: /bash [integer]');
	view.echoSentMessageToDisplay(msg);
	msg.setBodyAsHTML('    Display a Random Quote: /bash random');
	view.echoSentMessageToDisplay(msg);
	msg.setBodyAsHTML('    Display Help: /bash help');
	view.echoSentMessageToDisplay(msg);
	msg.setBodyAsHTML('    Ex: /bash 5273');
	view.echoSentMessageToDisplay(msg);
}
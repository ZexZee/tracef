// C-like printf -> The AS3 tracef!
// Author: Mattias Langseth -> 19/04/17 -> 11:11
function tracef(str:String, ... args):void 
{
	var newStr:String = "";
	if(str.indexOf("%") == -1 || args.length <=0) 
		newStr = str; // If theres no format identifier, just print the string
	else {
		var arr:Array = str.split(" ");
		for(var i:int = 0; i < arr.length; i++) { // Check all array elements
			var t:int = 0; // loop variable
			switch(arr[i].toLowerCase()) {
				case "%i": // (U)Int identifier (Matches god knows what)
					for(t; t < args.length; t++) {
						if((args[t] is int || args[t] is uint)) {
							arr[i] = args[t]; args.splice(args.indexOf(args[t]), 1); // subsitute and delete
							break;
						}
					} break;
				case "%s": // String identifer (Only matches strings, i think. Halleluja!)
					for(t; t < args.length; t++) {
						if(args[t] is String) {
							arr[i] = args[t]; args.splice(args.indexOf(args[t]), 1); // subsitute and delete
							break;
						}
					} break;
				case "%n": // Number identifier (Matches (u)ints aswell, cause types are duuumb
					for(t; t < args.length; t++) {
						if(args[t] is Number && !(args[t] is int)) {
							arr[i] = args[t]; args.splice(args.indexOf(args[t]), 1); // subsitute and delete
							break;
						}
					} break;
				case "%o": // Object identifier (Matches everything, cause types in AS3 are dumb)
					for(t; t < args.length; t++) {
						if(args[t] is Object) {
							arr[i] = args[t]; args.splice(args.indexOf(args[t]), 1); // subsitute and delete
							break;
						}
					} break;
				default: break;
			}
		} // Structure the new string:
		for(var p:int = 0; p < arr.length; p++) newStr += (arr[p]+" ");
	} 
	trace(newStr); // Print the new formatted string
	return;
}
// Demo
tracef("Without %s", "tracef ::");
trace("%s is a new way to format traces, allows numbers like: %n and ints like: %i");
trace("You may also interpolate objects: %o");
tracef("With %s", "tracef ::");
tracef("%s is a new way to format traces, allows numbers like: %n and ints like: %i", Number(2.9), int(2), "tracef"); 
tracef("You may also interpolate objects: %o", new Object());
// Look out! nothing can be right before, or right after %*!
for(var i:int = 0; i < 100; i++) {
	var iSquared:uint = i * i;
	var iCubed:uint = i * i * i;
	var HalfISquareCubed:uint = (iSquared * iCubed)/(i/2);
	tracef("i = %i \ti^2 = %i \ti^3 = %i \t(i^2*i^3)/(i/2) = %i", i, iSquared, iCubed, HalfISquareCubed);
}

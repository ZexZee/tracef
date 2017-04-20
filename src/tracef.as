// C-like printf -> The AS3 tracef!
// Author: Mattias Langseth -> 19/04/17 -> 11:11



function tracef(str:String, ... args):void {

	var newStr:String = "";

	if (str.indexOf(/%[ions]/) == -1) newStr = str; // Matches only if there actually is a format specifier

	else {

		var arr:Array = str.split(/(%[ions])/); // Grouping parentheses make it so all matches are included in arr; not only the first one

		for (var i:int = 1; i < arr.length; i++) { // Because the first element of the array won't have a format specifier, we can instead start at index 1

			var t:int = 0;

			if(args.length > 1) { // As we are confirming whether or not there is a format specifier we want to know if the highest index is at least 1

				switch(arr[i].substr(0, 2)) { // All elements except the first one start with the format specifier, which is 2 characters long

					case "%i":
						for (t; t < args.length; t++) {
							if (args[t] is int || args[t] is uint) {
								arr[i].replace("%i", args[t]);
								args.pop(args[t]); // As each argument is only supposed to be used once we can remove them from args after they have been used

								break;
							}
						} break;

					case "%s":
						for (t; t < args.length; t++) {
							if (args[t] is String) == -1) {
								arr[i].replace("%s", args[t]);
								args.pop(args[t]);

								break;
							}
						} break;

					case "%n":
						for (t; t < args.length; t++) {
							if (args[t] is Number) {
								arr[i].replace("%n", args[t]);
								args.pop(args[t]);

								break;
							}
						} break;

					case "%o":
						for (t; t < args.length; t++) {
							if (args[t] is Object) {
								arr[i].replace("%o", args[t]);
								args.pop(args[t]);

								break;
							}
						} break;

					default: break;

				}

			}

		}

		for (var p:String in arr) newStr += p;

	}

	trace(newStr);
	return;

}



// Demo
tracef("Without %s", "tracef");
trace("%s is a new way to format traces, allows numbers like: %n and ints like: %i");
trace("You may also interpolate objects: %o");
tracef("With %s", "tracef");
tracef("%s is a new way to format traces, allows numbers like: %n and ints like: %i", Number(2.9), int(2), "tracef");
tracef("You may also interpolate objects: %o", new Object());

for (var i:int = 0; i < 100; i++) { // Look out! nothing can be right before, or right after %*! Also, repeated numbers arent recognized

	var iSquared:uint = i * i;
	var iCubed:uint = i * i * i;
	var HalfISquareCubed:uint = (iSquared * iCubed)/(i/2);

	tracef("i = %i \ti^2 = %i \ti^3 = %i \t(i^2*i^3)/(i/2) = %i", i, iSquared, iCubed, HalfISquareCubed);

}

// Tests
tracef("Does this%s?", " work");
tracef("Same argument multiple times: %i %i %i", 1, 1, 1);

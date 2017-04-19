// C-like printf -> The AS3 tracef!
// Author: Mattias Langseth -> 19/04/17 -> 11:11



function tracef(str:String, ... args):void {

    var newStr:String = "";
    var usedArgs:Array = new Array;

    if(str.indexOf(/%[ions]{1}/) == -1) newStr = str; // Matches only if there actually is a format specifier

    else {

        var arr:Array = str.split(/(%[ions]{1})/); // Grouping parentheses make it so all matches are included in arr; not only the first one

        for(var i:int = 1; i < arr.length; i++) { // Because the first element of the array won't have a format specifier, we can instead start at index 1

            if(args.length > 1) { // As we are confirming whether or not there is a format specifier we want to know if the highest index is at least 1

                switch(arr[i].substr(0, 2)) { // All elements except the first one start with the format specifier and are 2 characters long

                    case "%i":
                        if((args[i - 1] is int || args[i - 1] is uint) { // Because we set i to start at one we need find the argument at index i - 1 in args because args has its first argument at index 1. This works because there is one more element in arr than in args
                            arr[i] = arr[i].replace("%i", args[i - 1]);
                        }
                        break;

                    case "%s":
                        if(args[t] is String && usedArgs.indexOf(args[t]) == -1) {
                            arr[i] = arr[i].replace("%s", args[i - 1]);
                        }
                        break;

                    case "%n":
                        if(args[t] is Number && usedArgs.indexOf(args[t]) == -1) {
                            arr[i] = arr[i].replace("%n", args[i - 1]);
                        } break;

                    case "%o":
                        if(args[t] is Object && usedArgs.indexOf(args[t]) == -1) {
                            arr[i] = arr[i].replace("%o", args[i - 1]);
                        } break;

                    default: break;

                }

            }

        }

        for(var p:int = 0; p < arr.length; p++) newStr += arr[p];

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

for(var i:int = 0; i < 100; i++) { // Look out! nothing can be right before, or right after %*! Also, repeated numbers arent recognized

    var iSquared:uint = i * i;
    var iCubed:uint = i * i * i;
    var HalfISquareCubed:uint = (iSquared * iCubed)/(i/2);

    tracef("i = %i \ti^2 = %i \ti^3 = %i \t(i^2*i^3)/(i/2) = %i", i, iSquared, iCubed, HalfISquareCubed);

}

// Tests
tracef("Does this%s?", " work");
tracef("Same argument multiple times: %i %i %i", 1, 1, 1);

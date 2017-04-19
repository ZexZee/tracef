// C-like printf -> The AS3 tracef!
// Author: Mattias Langseth -> 19/04/17 -> 11:11





function tracef(str:String, ... args):void {

	var newStr:String = "";
    var usedArgs:Array = new Array;
    
	if(str.indexOf("%") == -1) newStr = str;
        
	else {
    
		var indices:int = args.length;
        var index:int = 0;
        var arr:Array = str.split(" ");
        
        
        
		for(var i:int = 0; i < arr.length; i++) {
        
			var t:int = 0;
            
			if(index < indices) {
            
				switch(arr[i].toLowerCase()) {
                
					case "%i":
						for(t; t < args.length; t++) {
							if((args[t] is int || args[t] is uint) && (usedArgs.indexOf(args[t]) == -1)) {
								arr[i] = args[t]; usedArgs.push(args[t]);
								break;
							}
						} break;
                        
					case "%s":
						for(t; t < args.length; t++) {
							if(args[t] is String && usedArgs.indexOf(args[t]) == -1) {
								arr[i] = args[t]; usedArgs.push(args[t]);
								break;
							}
						} break;
                        
					case "%n":
						for(t; t < args.length; t++) {
							if(args[t] is Number && usedArgs.indexOf(args[t]) == -1) {
								arr[i] = args[t]; usedArgs.push(args[t]);
								break;
							}
						} break;
                        
					case "%o":
						for(t; t < args.length; t++) {
							if(args[t] is Object && usedArgs.indexOf(args[t]) == -1) {
								arr[i] = args[t]; usedArgs.push(args[t]);
								break;
							}
						} break;
                        
					default: break;
				}
                
			}
            
		}
        
		for(var p:int = 0; p < arr.length; p++) newStr += arr[p]+" ";
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

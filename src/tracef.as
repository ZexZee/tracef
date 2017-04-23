/*
 *  tracef() -> trace() with formating, similar to C/C++'s printf()
 *  Copyright (C) 2017  Mattias Langseth <ZxZ>
 *  Thanks go towards JaxonWasTaken for contributions (mainly RegExp, which made everything cleaner).
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
 
function tracef(str:String, ... args):void {
	var newStr:String = "";
	if (str.search(/%[ions]/) != -1 && args.length > 0) {  // Matches only if there actually is a format specifier and an argument to replace it with
		var arr:Array = str.split(/(%[ions])/); // Grouping parentheses make it so all matches are included in arr; not only the first one
		for (var i:int = 1; i < arr.length; i++) { // Because the first element of the array won't have a format specifier, we can instead start at index 1
			if (args.length > 0) { // As we are confirming whether or not there is a format specifier we want to know if the highest index is at least 1
				var t:Object;
				switch(arr[i]) { // All matched format identifiers go in their own index - without any other part of the original string
					case "%i":
						for each (t in args) {
							if (t is int || t is uint) {
								arr[i] = t;
								args.splice(args.indexOf(t), 1); // As each argument is only supposed to be used once we can remove them from args after they have been used
								break;
							}
						} break;
					case "%s":
						for each (t in args) {
							if (t is String) {
								arr[i] = t;
								args.splice(args.indexOf(t), 1);
								break;
							}
						} break;
					case "%n":
						for each (t in args) {
							if (t is Number && !(t is int || t is uint)) {
								arr[i] = t;
								args.splice(args.indexOf(t), 1);
								break;
							}
						} break;
					case "%o":
						for each (t in args) {
							if (t is Object && !(t is int || t is uint || t is String)) {
								arr[i] = t;
								args.splice(args.indexOf(t), 1);
								break;
							}
						} break;
					default: break;
				}
			}
		}
		for each (var p:String in arr) newStr += p;
	}
	else newStr = str;
	trace(newStr);
	return;
}

// Demo
tracef("Without %s", "tracef");
trace("%s is a new way to format traces, allows numbers like: %n and ints like: %i");
trace("You may also interpolate objects: %o");
tracef("With %s", "tracef");
tracef("%s is a new way to format traces, allows numbers like: %n and ints like: %i", int(2), Number(2.9), "tracef");
tracef("You may also interpolate objects: %o", new Object());
// Tests
tracef("Does this%s?", " work");
tracef("Same argument multiple times: %i %i %i", 1, 1, 1);

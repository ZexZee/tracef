# Tracef Version 1.0.20
printf() in as3, as an alternative to trace()
# Usage
tracef() works alot like printf(), in that specific identifiers add different variables to an output string, before writing it.
As of right now, it handles 4 different 'types':
 + %i for int and uint
 + %n for Number
 + %s for String
 + %o for Objects (Arrays, Vectors, Timers, you name it) (Basically all complex types)
As an example of usage, consult the demo found in the tracef.as file
**If you're lazy:**
```
tracef("Without %s", "tracef");
trace("%s is a new way to format traces, allows numbers like: %n and ints like: %i");
trace("You may also interpolate objects: %o");
tracef("With %s", "tracef");
tracef("%s is a new way to format traces, allows numbers like: %n and ints like: %i", Number(2.9), int(2), "tracef"); 
tracef("You may also interpolate objects: %o", new Object());
```
# ***If you find any bugs, or wish to contribute, then you're more than welcome to do so.***

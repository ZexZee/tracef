# Tracef
printf() in as3, as an alternative to trace()
# Warnings
***Having anything right before, or right after '%' breaks it***
  + **example** `tracef("Hello%s", name);` will not work, neither will `tracef("Hello %sis a nice name", name);`



***Repeated values in the same tracef are not recognized***

  + **example** `tracef("These are the number one: %i %i %i", ONE, ONE, ONE);` will print `"These are the number one: 1 %i %i"`



# ***If you find any other bugs, or wish to contribute, then you're more than welcome to do so. Especially if you fix one of the warnings!***

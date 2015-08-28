# scd_stuff
Specific Carbohydrate Diet &amp; Colitis Information, Data, etc...

Currently used to power the pages here http://www.dflock.co.uk/colitis/, including:

* http://www.dflock.co.uk/colitis/recipes/recipes.html
* http://www.dflock.co.uk/colitis/foods/foods.html
* http://www.dflock.co.uk/colitis/foods/enumbers.html
* http://www.dflock.co.uk/colitis/remedies/remedies.html

Currently transitioning over to http://duncanlock.net, here: http://duncanlock.net/pages/e-numbers-food-additives.html


## Building

To publish the XML as HTML, you currently need [Saxon https://en.wikipedia.org/wiki/Saxon_XSLT]. For example, to publish the e-numbers do this:

    saxon-xslt -a -o ./enumbers.html ./enumbers.xml

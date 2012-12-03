resto-health-scores
===================

Rails app to view Nashville's restaurants' health food scores

Features to be Added
------
* Google charts of restaurant's scores over time
* Google map of restaurant location
* Search feature
  
ToDo
--
* Seed data will come from http://dogwood.healthspace.com/tdh whereas delayed job will scrape from
  http://health.nashville.gov/env/food/FoodScores/default.aspx
* Clean address, name data using one or more of the following: ( Probably necessary before I can implement maps )
    * http://code.google.com/p/google-refine/
    * http://geoservices.tamu.edu/Services/AddressNormalization/Default.aspx
    * https://www.usps.com/business/webtools.htm
    * http://smartystreets.com/products/liveaddress-api
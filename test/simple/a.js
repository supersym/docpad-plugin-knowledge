#!/usr/bin/env node

var freebase = require('freebase');



/*
    Freebase methods
*/

console.log("\n\n")
console.log("Books about planets");
var query = [{
            "type":  "/astronomy/planet",
            "name":  null,
            "/book/book_subject/works": []
           }]
freebase.mqlread(query, {}, function(r){console.log(r)})


console.log("\n\n")
console.log("Every Tornado, ever");
query=[{
      "type":"/base/disaster2/tornado",
      "name":null
     }]
freebase.paginate(query, {max:400}, console.log)

console.log("\n\n")
console.log("Hockey players named 'doug'");
freebase.search("doug",{type: "/ice_hockey/hockey_player"}, console.log)


/*
    Sugar
*/

console.log("Sugar");
console.log("Which pronoun to use for this topic");

freebase.pronoun("banana", {}, console.log)
   //-> "they"
freebase.pronoun(["prince harry", "miranda july"], {}, console.log)
   //-> ["he", "she"]
freebase.pronoun("washing machine", {}, console.log)
   //-> "they"
freebase.pronoun("cheddar", {type:"/food/food"}, console.log)
   //-> "it"


freebase.related("toronto", {}, function(r){
    r.forEach(function(v){return console.log(v.name)})
  })

/* -> Toronto FC
      Toronto Maple Leafs
      Toronto Argonauts
      North York
      Toronto Marlies
*/


// A common-sense search that only matches when confident:
freebase.lookup("tom green", {}, console.log)
freebase.lookup(["toronto","suddenly susan"], {}, console.log)

//sameAs weblinks for a topic, or url
freebase.same_as_links("toronto", {}, console.log)
freebase.same_as_links("http://toronto.ca", {}, console.log)

//The first sentence from a wikipedia article:
freebase.sentence("tokyo", {}, console.log)


//Graph-type queries on topics, dancing over tough values and mediators:
freebase.graph("ubuntu", {}, console.log )
freebase.outgoing("ubuntu", {}, console.log )
freebase.incoming("ubuntu", {}, console.log )

//A list of topics in a collection:
freebase.list("earthquakes", {}, console.log)

//The first paragraph of something's wikipedia article:
freebase.description("mike myers", {}, console.log)
freebase.description("http://myspace.com/u2", {}, console.log)

//Translated names for topics:
freebase.translate("radiohead", {lang:"/lang/ko"}, console.log)// 라디오헤드

//The most accurate, or notable type for a topic:
freebase.notable("canada", {}, console.log) // {id:"/location/country", name:"Country"}

//Get the wikipedia link for a topic
freebase.wikipedia_link("tony hawk", {}, console.log) //http://en.wikipedia/wiki/Tony_Hawk

//Encode a string for inclusion in a freebase id/key/whatever
freebase.mql_encode("Aarno Yrjö-Koskinen") //"Aarno_Yrj$00F6-Koskinen"

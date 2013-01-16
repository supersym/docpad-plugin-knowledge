#!/usr/bin/env coffee

yql = require 'yql'
CSON = require 'cson'

# Our abstract class super-type blueprint
# builds upon the Object.prototype behind curtains
class BaseQuery

  # method is done automagical on creation of instance
  constructor: (@type, @created = '#{new Date()}') ->

    # Base of query/inquiry is 'the question', so we offer a generic output
    @question = -> "TODO perform login on question to derive type of question"

  # Returns a stdout string with class type info
  getType: () ->

    # First get the derived type, next this one (>?)
    console.log "#{@constructor.name} #{constructor.name}"

  setAnswer: () ->

    @answer = "TODO"

  getQuestion: () ->

    # if answer?  console.log "TODO formulate natural language answer to what the question is"

  hasAnswer: () ->

    console.log "Provide an answ"

  getAllInstances: () ->

    # list all current in-memory instances derived from this base type


class DataQuery extends BaseQuery

  # Creates a new instance of the DataQuery blueprint
  constructor: (@target, @source = 'data.html.cssselect') ->

    # Get a unique identifier for this entity
    @uid = new Date().getTime()

    # Process console messages (TODO abstract)
    console.log "Created a new DataQuery with identifier #{@uid} at #{new Date()}."
    console.log "Set to scrape HTML from URL address #{@target}."



  # Flexible CSS selectors and query return fields as parameters
  scrape: (@selector, @fields = '*', callback) ->

      # Execute a YQL query and provide immediate callback for asynchronous non-blocking results promise
      yql.exec "select #{@fields} from #{@source} where url='#{@target}' and css='#{@selector}'", (response) =>

        console.log "This is the result in CSON..."
        console.log CSON.stringifySync response
        #console.log @result






# How to use?

# Specify a new data query to perform YQL on
t1 = new DataQuery "http://rosettacode.org/wiki/CoffeeScript"

# CSS selectors for scraping the web page (target)
# cut away the last excess data using YQL data fields
t1.scrape '#mw-pages td a','a.href, a.title', () ->
    console.log "aa" + this


# This actually gets run before the callback is returned
console.log "I set out for a answer my lord!"
#t1.select



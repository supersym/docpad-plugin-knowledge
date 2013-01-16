#!/usr/bin/env coffee

yql = require 'yql'

### @namespace Is a container for a set of identifiers (names), and allows the disambiguation
of homonym identifiers residing in different namespaces. Namespaces
usually group names based on their functionality.

The namespaces help us devide our code, not based upon only the module.exports,
but more in a domain centric philosophy like Domain Driven Design

To implement namespaces means you can further logically devide your source code
into maintainable portions of your domain portion. That with the power of Node.js
modules provides us with enough DDD tools to model reality / features in code.

This also means we don't have to put everything its own file which helps the
maintainer to keep the file structure clean, based upon the things that actually
change most often to be exposed to public and

###

# Abstract classes are kept in their own namespace"
namespace "knowledge.domain.abstract"

  # A question; an inquiry. To put a question to (a person). Synonym to 'ask'.
  ### @idea is to be able and easily as a question and this tool will help
  you get answers
  ###

  BaseQuery :

    # Represents a structured approach to asking 'things' about 'stuff'

    ###
    @note: this can take a very broad range... you can add something like
    a query aimed at asking your local machine what it's memory is, or
    ask wikipedia to return first paragraph of a specific thing.
    ###

    class BaseQuery

      # Automagical on birth of a entity
      constructor: (@type, @created) ->

        # At the base of all knowledge is philosophy which is asking questions
        @question = -> "TODO perform login on question to derive type of question"

      # Reflect upon self
      getType: () ->
        console.log "#{@constructor.name} #{constructor.name}"

      setAnswer: () ->
        @answer = "TODO"

      getQuestion: () ->
        console.log "What is the question?"
        if answer?  console.log "Do you want to know the answer?"

      hasAnswer: () ->

        console.log "Provide an answ"

      getAllInstances: () ->
        # list all current in-memory instances derived from this base type

namespace "knowledge.domain.queries"
class DataQuery extends BaseQuery

  # Creates a new instance of the DataQuery blueprint
  constructor: (@target, @source = 'data.html.cssselect') ->

    # Get a unique identifier for this entity
    @uid = new Date().getTime()

    # Process console messages (TODO abstract)
    console.log "Created a new DataQuery with identifier #{@uid} at #{new Date()}."
    console.log "Set to scrape HTML from URL address #{@target}."

    # Public instance methods
    @task = -> "Tasked for ... foo"


  # Flexible CSS selectors and query return fields as parameters
  select: (@selector, @fields = '*') ->

    # Execute a YQL query and provide immediate callback for asynchronous non-blocking results promise
    yql.exec "select #{@fields} from #{@source} where url='#{@target}' and css='#{@selector}'", (response) ->

      console.log response

# Specify a new data query to perform YQL on
t1 = new DataQuery "http://rosettacode.org/wiki/CoffeeScript"

# CSS selector and fields we like to retrieve, cut away the last excess data
#t1.select '#mw-pages td a' 'a.href, a.title'
t1.getQuestion()



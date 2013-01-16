doRequest = (url, callback) ->

  httpRequest = undefined # create our XMLHttpRequest object

  if window.XMLHttpRequest
    httpRequest = new XMLHttpRequest()

  # Internet Explorer is stupid
  else httpRequest = new ActiveXObject("Microsoft.XMLHTTP")  if window.ActiveXObject
  httpRequest.onreadystatechange = ->

    # inline function to check the status
    # of our request
    # this is called on every state change
    callback.call httpRequest.responseXML  if httpRequest.readyState is 4 and httpRequest.status is 200


  # call the callback function
  httpRequest.open "GET", url
  httpRequest.send()

# call the function
doRequest "text.xml", ->
  console.log this

console.log "this will run before the above callback"

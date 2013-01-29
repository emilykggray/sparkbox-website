# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  setBindings: ->
    $( "#build-reveal" ).click ->
      $( "#build-reveal" ).toggleClass( "bh-collapsed" )

  methodName: ->

  # Initializers
  common:
    init: ->

    finalize: ->


  bodyId_or_className:
    init: ->

    finalize: ->

$(document).ready ->
  UTIL.loadEvents
  APP.setBindings

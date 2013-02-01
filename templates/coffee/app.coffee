# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  init: ->
    @setBindings()
    @hero.init()

  setBindings: ->
    $( "#build-reveal" ).click ->
      $( "#build-header" ).toggleClass "bh-collapsed"

    $(".chain-icon").on "click", (e) ->
      console.log e
      APP.hero.toggle( $(".hero-teaser"), $(".hero-more") )

  hero:
    init: ->
      $heroMore = $(".hero-more")
      $heroTeaser = $(".hero-teaser")
      $hero = $(".hero")
      $parent = $(".hero-wrapper")
      $icon = $(".chain-icon")

      $hero.on "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", (event) ->
        if $( event.target ).is( $hero )
          $heroTeaser.hide()
          $parent.css
            "-webkit-transition": "none"
            "height": "auto"
          $hero.css
            "-webkit-transition": "none"
            "-webkit-transform": "translate3d( 0, 0, 0 )"
          $heroMore.css( "position", "static" )

    toggle: ( $from, $to ) ->
      $slider = $from.parent() # slider does the sliding
      $wrapper = $slider.parent() # wrapper does the cropping

      $slider.toggleClass("more-revealed")

      $to.show()

      # get height values for $wrapper transition
      oldHeight = $from.outerHeight()
      newHeight = $to.outerHeight()

      # set fixed height on $wrapper
      $wrapper.height( oldHeight )

      # repaint
      $wrapper.height()

      # set transition
      $wrapper.css( "-webkit-transition", "height 0.4s" ) # this should use a css hook for other browsers

      # set new height
      $wrapper.height( newHeight )

      # (set height to auto on animation end with callback)
      # (event set in init())

      # slide to proper position
      $slider.css( "-webkit-transform", "translate3d( 0, #{newHeight}px, 0 )" )

      # (set transform to 0 on animation end with callback)
      # (event in init())

$(document).ready ->
  UTIL.loadEvents
  APP.init()

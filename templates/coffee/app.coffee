# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  init: ->
    @setBindings()
    @hero.init()

  setBindings: ->
    $( "#build-reveal" ).click ->
      $( "#build-header" ).toggleClass "bh-collapsed"

    $(".chain-icon").on "click", ->
      APP.hero.toggle()

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

    oldToggle: ->
      $heroTeaser = $(".hero-teaser")
      $hero = $(".hero")
      $parent = $(".hero-wrapper")
      $icon = $(".chain-icon")

      if !$hero.hasClass "more-revealed"
        $hero.addClass "more-revealed"
        $heroMore.show()

        #newHeight = $heroMore.outerHeight()

        $parent.height( oldHeight )
        $parent.height() # force a repaint
        $parent.css( "-webkit-transition", "height 0.4s" ) # this should use a css hook for other browsers
        $parent.height( newHeight )

        $hero.css( "-webkit-transform", "translate3d( 0, #{newHeight}px, 0 )" )

      else
        $hero.removeClass "more-revealed"
        $heroMore.hide()
        $heroTeaser.show()

    toggle: ( $from, $to ) ->
      $slider = $from.parent()
      $wrapper = $slider.parent()

      if !$slider.hasClass("more-revealed")
        $slider.addClass("more-revealed")

        $to.show()

        # get height values for $wrapper transition
        oldHeight = $from.outerHeight()
        newHeight = $to.outerHeight()

        # set fixed height on $wrapper

        # repaint

        # set transition

        # set new height

        # (set height to auto on animation end with callback)
        # (done on init())

        # slide to proper position

$(document).ready ->
  UTIL.loadEvents
  APP.init()

# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  init: ->
    @setBindings()
    @hero.init()

  setBindings: ->
    $( "#build-reveal" ).click ->
      $( "#build-header" ).toggleClass "bh-collapsed"

    $(".chain-icon").on "click", (e) ->
      $heroTeaser = $( ".hero-teaser" )
      $heroMore = $( ".hero-more" )
      $slider = $( ".hero" )
      $wrapper = $( ".hero-wrapper" )

      if !$slider.hasClass( "more-revealed" )
        console.log "leaving teaser, entering more"
        APP.hero.toggle( $heroTeaser, $heroMore )
      else
        console.log "leaving more, entering teaser"
        APP.hero.toggle( $heroMore, $heroTeaser )

  hero:

    init: ->
      $slider = $( ".hero" )
      $wrapper = $( ".hero-wrapper" )
      $heroMore = $( ".hero-more" )
      $heroTeaser = $( ".hero-teaser" )
      $iconWrapper = $( ".icon-wrapper" )

      $wrapper.on "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", (event) ->
        # make sure height is done transitioning
        if $( event.target ).is( $wrapper )

          # if we went from teaser to more
          if $slider.hasClass( "more-revealed" )
            $from = $( ".hero-teaser" )
            $to = $( ".hero-more" )
            console.log "entered hero-more"
          # if we went from more to teaser
          else
            $from = $( ".hero-more" )
            $to = $( ".hero-teaser" )
            console.log "entered hero-teaser"

          $to.removeAttr("style")
          $slider.removeAttr("style")
          $from.removeAttr("style")
          $wrapper.removeAttr("style")

          $slider.toggleClass("more-revealed")

    toggle: ( $from, $to ) ->
      $slider = $from.parent() # slider does the sliding
      $wrapper = $slider.parent() # wrapper does the cropping
      $iconWrapper = $( ".icon-wrapper" ) # should this be passed in as a parameter?

      fromHeight = $slider.outerHeight()
      toHeight = $to.outerHeight()
      iconHeight = $iconWrapper.outerHeight()

      # get values for $wrapper transition
      offset = toHeight
      newHeight = toHeight + iconHeight

      # set fixed height on $wrapper
      $wrapper.css
        "height": fromHeight

      # repaint
      $wrapper.height()

      # set transition
      $wrapper.css( "-webkit-transition", "all 0.3s" ) # this should use a css hook for other browsers

      # set new height
      $wrapper.height( newHeight )

      # (set height to auto on animation end with callback)
      # (event set in init())

      # slide to proper position
      $slider.css
        "-webkit-transition": "all 0.3s"
        "-webkit-transform": "translate3d( 0, #{toHeight}px, 0 )"

      # (set transform to 0 on animation end with callback)
      # (event in init())

$(document).ready ->
  UTIL.loadEvents
  APP.init()

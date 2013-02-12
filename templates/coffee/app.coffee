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
      console.log e

      if !$slider.hasClass( "more-revealed" )
        # if it's currently collapsed
        APP.hero.open()
      else
        # if it's currently open
        APP.hero.close()

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
          console.log event

          $heroTeaser = $( ".hero-teaser" )
          $heroMore = $( ".hero-more" )
          $slider = $heroTeaser.parent() # slider does the sliding
          $wrapper = $slider.parent() # wrapper does the cropping

          $heroTeaser.removeAttr("style")
          $heroMore.removeAttr("style")
          $slider.removeAttr("style")
          $wrapper.removeAttr("style")

          $slider.toggleClass("more-revealed")

    open: ->
      $heroTeaser = $( ".hero-teaser" )
      $heroMore = $( ".hero-more" )
      $slider = $heroTeaser.parent() # slider does the sliding
      $wrapper = $slider.parent() # wrapper does the cropping
      $iconWrapper = $( ".icon-wrapper" ) # should this be passed in as a parameter?

      teaserHeight = $slider.outerHeight()
      moreHeight = $heroMore.outerHeight()
      iconHeight = $iconWrapper.outerHeight()

      # get values for $wrapper transition
      offset = moreHeight # slider offset
      newHeight = moreHeight + iconHeight

      # set fixed height on $wrapper
      $wrapper.css
        "height": teaserHeight

      # repaint
      $wrapper.height()

      # set transition
      $wrapper.css( "-webkit-transition", "all 0.3s" ) # this should use a css hook for other browsers

      # set more height
      $wrapper.height( newHeight )

      # (set height to auto on animation end with callback)
      # (event set in init())

      # slide to proper position
      $slider.css
        "-webkit-transition": "all 0.3s"
        "-webkit-transform": "translate3d( 0, #{offset}px, 0 )"

      # (set transform to 0 on animation end with callback)
      # (event in init())

    close: ->
      $heroTeaser = $( ".hero-teaser" )
      $heroMore = $( ".hero-more" )
      $slider = $heroTeaser.parent() # slider does the sliding
      $wrapper = $slider.parent() # wrapper does the cropping
      $iconWrapper = $( ".icon-wrapper" ) # should this be passed in as a parameter?

      $slider.removeClass( "more-revealed" )

      teaserHeight = $heroTeaser.outerHeight() + $iconWrapper.outerHeight()
      moreHeight = $heroMore.outerHeight()
      iconHeight = $iconWrapper.outerHeight()

      # get values for $wrapper transition
      offset = moreHeight # slider offset
      newHeight = teaserHeight

      $wrapper.height( moreHeight )

      $wrapper.height()

      $wrapper.height( newHeight )


$(document).ready ->
  UTIL.loadEvents
  APP.init()

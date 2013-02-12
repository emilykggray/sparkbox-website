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
        # if it's currently collapsed
        APP.hero.open()
      else
        # if it's currently open
        APP.hero.close()

  hero:

    TRANSITION_NAMES: "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"

    init: ->
      @$slider = $( ".hero" )
      @$wrapper = $( ".hero-wrapper" )
      @$heroMore = $( ".hero-more" )
      @$heroTeaser = $( ".hero-teaser" )
      @$iconWrapper = $( ".icon-wrapper" )

    endTransition: (event) ->
      # make sure height is done transitioning
      console.log event.target

      if $( event.target ).is( @$wrapper )
        console.log "removing styles!"
        @$heroTeaser.removeAttr("style")
        @$heroMore.removeAttr("style")
        @$slider.removeAttr("style")
        @$wrapper.removeAttr("style")
        @$wrapper.off @TRANSITION_NAMES

    endClose: (event) ->
      @endTransition(event)

    endOpen: (event) ->
      @endTransition(event)
      @$slider.addClass("more-revealed") if $( event.target ).is( @$wrapper )

    open: ->
      teaserHeight = @$slider.outerHeight()
      moreHeight = @$heroMore.outerHeight()
      iconHeight = @$iconWrapper.outerHeight()

      # get values for @$wrapper transition
      offset = moreHeight # slider offset
      newHeight = moreHeight + iconHeight

      # set fixed height on @$wrapper
      @$wrapper.css
        "height": teaserHeight

      # repaint
      @$wrapper.height()

      @$wrapper.on @TRANSITION_NAMES, $.proxy( @endOpen, this )

      # set transition
      @$wrapper.css( "-webkit-transition", "all 0.3s" ) # this should use a css hook for other browsers

      # set more height
      @$wrapper.height( newHeight )

      # (set height to auto on animation end with callback)
      # (event set in init())

      # slide to proper position
      @$slider.css
        "-webkit-transition": "all 0.3s"
        "-webkit-transform": "translate3d( 0, #{offset}px, 0 )"

      # (set transform to 0 on animation end with callback)
      # (event in init())

    close: ->
      teaserHeight = @$heroTeaser.outerHeight() + @$iconWrapper.outerHeight()
      moreHeight = @$heroMore.outerHeight()
      iconHeight = @$iconWrapper.outerHeight()

      # get values for @$wrapper transition
      offset = moreHeight # slider offset
      newHeight = teaserHeight

      @$slider.removeClass("more-revealed")

      @$wrapper.height( moreHeight )
      @$wrapper.height()
      @$wrapper.on @TRANSITION_NAMES, $.proxy( @endClose, this )
      @$wrapper.css( "-webkit-transition", "all 0.3s" ) # this should use a css hook for other browsers
      @$wrapper.height( newHeight )


$(document).ready ->
  APP.init()

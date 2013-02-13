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

      APP.hero.toggle()

  hero:

    OPEN_CLASS: "more-revealed"

    init: ->
      @$slider = $( ".hero" )
      @$wrapper = $( ".hero-wrapper" )
      @$heroMore = $( ".hero-more" )
      @$heroTeaser = $( ".hero-teaser" )
      @$iconWrapper = $( ".icon-wrapper" )
      @$chainLeft = $( ".chain-left" )
      @$chainRight = $( ".chain-right" )

    toggle: ->
      action = if @$slider.hasClass( @OPEN_CLASS ) then "closing" else "opening"

      if action is "opening"
        teaserHeight = @$heroTeaser.outerHeight()
        moreHeight = @$heroMore.outerHeight()
        iconHeight = @$iconWrapper.outerHeight()

        oldHeight = iconHeight + teaserHeight
        newHeight = iconHeight + moreHeight
        offset = moreHeight
      else
        teaserHeight = @$heroTeaser.outerHeight()
        moreHeight = @$heroMore.outerHeight()
        iconHeight = @$iconWrapper.outerHeight()

        oldHeight = moreHeight
        newHeight = iconHeight + teaserHeight
        offset = moreHeight - iconHeight

      @$wrapper.height( oldHeight )
      @$wrapper.height() # force redraw
      if action is "opening"
        @$wrapper.animate { height: newHeight }, 500, -> APP.hero.openEnd() # crop!
        @$slider.animate { top: offset }, 500, -> APP.hero.openEnd() # slide!
      else
        @$slider.removeClass( @OPEN_CLASS )
        # we need to recreate styles from @OPEN_CLASS
        # so we can transition from them
        @$heroMore.css
          position: "relative"
        @$iconWrapper.css
          position: "absolute"
          top: moreHeight - iconHeight
        @$heroTeaser.css
          position: "absolute"
          top: moreHeight
        @$slider.css
          top: 0
          position: "absolute"

        @$wrapper.animate { height: newHeight }, 500, -> APP.hero.closeEnd() # crop!
        @$slider.animate { top: -offset }, 500, -> APP.hero.closeEnd() # slide!

    openEnd: ->
      # clear inline styles
      @$wrapper.removeAttr( "style" )
      @$slider.removeAttr( "style" )
      # add "real" styles
      @$slider.addClass( @OPEN_CLASS )

    closeEnd: ->
      # clear inline styles
      @$wrapper.removeAttr( "style" )
      @$slider.removeAttr( "style" )
      @$heroMore.removeAttr( "style" )
      @$iconWrapper.removeAttr( "style" )
      @$heroTeaser.removeAttr( "style" )

    breakChain: ->
      @$chainLeft.animate
        left: "-0.1em"
        top: "0.05em"
        rotate: "-6deg"
      , 200

      
      #transform( translate3d( -0.1em, 0.05em, 0 ) rotate( -6deg ) );


$(document).ready ->
  APP.init()

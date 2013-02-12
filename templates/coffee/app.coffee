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

    TRANSITION_NAMES: "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"

    init: ->
      @$slider = $( ".hero" )
      @$wrapper = $( ".hero-wrapper" )
      @$heroMore = $( ".hero-more" )
      @$heroTeaser = $( ".hero-teaser" )
      @$iconWrapper = $( ".icon-wrapper" )

    toggle: ->
      teaserHeight = @$heroTeaser.outerHeight()
      moreHeight = @$heroMore.outerHeight()
      iconHeight = @$iconWrapper.outerHeight()
      oldHeight = iconHeight + teaserHeight
      newHeight = iconHeight + moreHeight
      offset = moreHeight

      @$slider.height( oldHeight )
      @$slider.height()
      @$slider.animate { height: newHeight }, 500, -> APP.hero.openEnd() # crop!
      @$slider.animate { top: offset }, 500 # slide!

    openEnd: ->
      @$wrapper.removeAttr( "style" )
      @$slider.removeAttr( "style" )
      @$slider.addClass( "more-revealed" )

$(document).ready ->
  APP.init()

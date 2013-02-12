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

    open: ->
      teaserHeight = @$slider.outerHeight()
      moreHeight = @$heroMore.outerHeight()
      iconHeight = @$iconWrapper.outerHeight()
      oldHeight = iconHeight + teaserHeight
      newHeight = moreHeight

      @$wrapper.animate( { height: "200px" }, 600, ->
        alert "animation callback!"
      )

$(document).ready ->
  APP.init()

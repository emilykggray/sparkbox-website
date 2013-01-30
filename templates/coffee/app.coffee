# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  init: ->
    @setBindings()

  setBindings: ->
    $( "#build-reveal" ).click ->
      $( "#build-header" ).toggleClass "bh-collapsed"

    $(".chain-icon").on "click", ->
      $( ".hero" ).toggleClass "more-revealed"
      APP.hero.toggleMore()

  hero:
    toggleMore: ->
      $heroMore = $(".hero-more")
      $heroTeaser = $(".hero-teaser")
      $slider = $(".hero")
      $parent = $(".hero-wrapper")
      $icon = $(".chain-icon")

      heroMoreHeight = $heroMore.outerHeight()
      heroTeaserHeight = $heroTeaser.outerHeight()

      if $slider.hasClass "more-revealed"
        iconHeight = $icon.height()
        iconOffset = iconHeight * .4
        newParentHeight = heroMoreHeight + iconHeight - iconOffset

        # set proper parent height
        $parent.height( newParentHeight )

        # slide to correct view
        $slider.css( "-webkit-transform", "translate3d( 0, #{heroMoreHeight}px, 0 )" )
      else
        newParentHeight = heroTeaserHeight

        # set proper parent height
        $parent.height( newParentHeight )

        # slide to correct view
        $slider.css( "-webkit-transform", "translate3d( 0, 0, 0 )" )

$(document).ready ->
  UTIL.loadEvents
  APP.init()

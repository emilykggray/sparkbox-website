# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  init: ->
    @setBindings()

  setBindings: ->
    $( "#build-reveal" ).click ->
      $( "#build-header" ).toggleClass "bh-collapsed"

    $(".chain-icon").on "click", ->
      APP.hero.toggleHero()

  hero:
    toggleHero: ->
      $heroMore = $(".hero-more")
      $heroTeaser = $(".hero-teaser")
      $hero = $(".hero")
      $parent = $(".hero-wrapper")
      $icon = $(".chain-icon")

      if !$hero.hasClass "more-revealed"
        $hero.addClass "more-revealed"
        $heroMore.show()

        newHeight = $heroMore.outerHeight()
        oldHeight = $heroTeaser.outerHeight()

        $parent.height( oldHeight )
        $parent.height() # force a repaint
        $parent.css( "-webkit-transition", "height 3s" ) # this should be a css hook for other browsers
        $parent.height( newHeight )

      else
        $hero.removeClass "more-revealed"
        $heroMore.hide()
        $heroTeaser.show()
        





$(document).ready ->
  UTIL.loadEvents
  APP.init()

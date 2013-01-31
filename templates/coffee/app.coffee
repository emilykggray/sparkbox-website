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

      if !$hero.hasClass( "more-revealed" )
        $heroMore.show()

        newHeight = $heroMore.outerHeight()
        oldHeight = $heroTeaser.outerHeight()
        $parent.height( oldHeight )
        $parent.height( newHeight )

      else
        $heroMore.hide()
        $heroTeaser.show()
        

      $hero.toggleClass "more-revealed"




$(document).ready ->
  UTIL.loadEvents
  APP.init()

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

    toggle: ( $from, $to ) ->
      $slider = $from.parent()
      $wrapper = $slider.parent()



$(document).ready ->
  UTIL.loadEvents
  APP.init()

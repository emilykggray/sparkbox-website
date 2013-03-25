describe "This App", ->

  describe "Chain icon", ->

    beforeEach ->
      affix( ".hero .chain-icon" )
      APP.init()

    xit "should exist", ->
      expect( $( ".hero" ).length).toEqual 1

    xit "should not have a class of more-revealed initially", ->
      expect( $( ".hero" ).hasClass( "more-revealed" ) ).toBe false

    xit "should have a class of more-revealed after clicking chain-icon", ->
      $( ".chain-icon" ).click()
      expect( $( ".hero" ).hasClass( "more-revealed" ) ).toBe true

    xit "should not have a class of more-revealed after being clicked twice", ->
      $( ".hero" ).click()
      $( ".hero" ).click()
      expect( $( ".hero" ).hasClass( "more-revealed" ) ).toBe false

describe "This App", ->

  describe "Chain icon", ->

    beforeEach ->
      affix( ".hero .chain-icon" )
      SPB.init()

    it "should exist", ->
      expect( $( ".hero" ).length).toEqual 1

    it "should not have a class of more-revealed initially", ->
      expect( $( ".hero" ).hasClass( "more-revealed" ) ).toBe false

    it "should have a class of more-revealed after clicking chain-icon", ->
      $( ".chain-icon" ).click()
      expect( $( ".hero" ).hasClass( "more-revealed" ) ).toBe true

    it "should not have a class of more-revealed after being clicked twice", ->
      $( ".hero" ).click()
      $( ".hero" ).click()
      expect( $( ".hero" ).hasClass( "more-revealed" ) ).toBe false

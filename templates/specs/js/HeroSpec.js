(function() {
  describe("This App", function() {
    return describe("Chain icon", function() {
      beforeEach(function() {
        affix(".hero .chain-icon");
        return APP.init();
      });
      xit("should exist", function() {
        return expect($(".hero").length).toEqual(1);
      });
      xit("should not have a class of more-revealed initially", function() {
        return expect($(".hero").hasClass("more-revealed")).toBe(false);
      });
      xit("should have a class of more-revealed after clicking chain-icon", function() {
        $(".chain-icon").click();
        return expect($(".hero").hasClass("more-revealed")).toBe(true);
      });
      return xit("should not have a class of more-revealed after being clicked twice", function() {
        $(".hero").click();
        $(".hero").click();
        return expect($(".hero").hasClass("more-revealed")).toBe(false);
      });
    });
  });

}).call(this);

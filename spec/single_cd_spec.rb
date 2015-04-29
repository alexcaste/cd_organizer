require("rspec")
require("single_cd")


describe(SingleCd) do
  before() do
    SingleCd.clear()
  end

  describe("#album") do
    it("it returns the name of the album and artist") do
      test_cd = SingleCd.new("10", "pearl jam")
      expect(test_cd.album()).to(eq("10"))
      expect(test_cd.artist()).to(eq("pearl jam"))
    end
end

  describe("#save") do
    it("it saves the cd") do
      test_cd = SingleCd.new("10", "pearl jam")
      test_cd.save()
      expect(SingleCd.all()).to(eq([test_cd]))
    end
  end

  describe(".clear") do
    it("it clears cd list array") do
      test_cd = SingleCd.new("10", "pearl jam")
      test_cd.save()
      SingleCd.clear()
      expect(SingleCd.all()).to(eq([]))
    end
  end
  describe("#id") do
    it("it returns the id of the cd") do
      test_cd = SingleCd.new("10", "pearl jam")
      test_cd.save()
      test_cd2 = SingleCd.new("Grace", "jeff buckley")
      test_cd2.save()
      expect(test_cd.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("it returns the cd by its id number") do
      test_cd = SingleCd.new("10", "pearl jam")
      test_cd.save()
      test_cd2 = SingleCd.new("Grace", "jeff buckley")
      test_cd2.save()
      expect(SingleCd.find(test_cd.id())).to(eq(test_cd))
    end
  end
end

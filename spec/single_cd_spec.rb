require("rspec")
require("single_cd")


describe(SingleCd) do

  describe("#album") do
    it("it returns the name of the album and artist") do
      test_cd = SingleCd.new("10", "pearl jam")
      expect(test_cd.album()).to(eq("10"))
      expect(test_cd.artist()).to(eq("pearl jam"))
    end
end


end

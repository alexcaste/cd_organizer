require("rspec")
require("single_cd")
require("cd_rack")


describe(CdRack) do
  before() do
    CdRack.clear()
  end

  describe("#genre") do
    it("it returns the name of the genre") do
      test_rack = CdRack.new("Techno")
      expect(test_rack.genre()).to(eq("Techno"))
    end
  end

  describe("#save") do
    it("it saves the genre") do
      test_rack = CdRack.new("Techno")
      test_rack.save()
      expect(CdRack.all()).to(eq([test_rack]))
    end
  end

  describe(".clear") do
    it("it clears cd list array") do
      test_rack = CdRack.new("Techno")
      test_rack.save()
      CdRack.clear()
      expect(CdRack.all()).to(eq([]))
    end
  end
  describe("#id") do
    it("it returns the id of the genre") do
      test_rack = CdRack.new("Techno")
      test_rack.save()
      test_rack2 = CdRack.new("Smooth Jazz")
      test_rack2.save()
      expect(test_rack.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("it returns the genre by its id number") do
      test_rack = CdRack.new("Techno")
      test_rack.save()
      test_rack2 = CdRack.new("Smooth Jazz")
      test_rack2.save()
      expect(CdRack.find(test_rack.id())).to(eq(test_rack))
    end
  end
end

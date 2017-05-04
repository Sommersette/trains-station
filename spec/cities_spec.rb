require "cities"
require "spec_helper"
require "pg"
require "rspec"
require "pry"


describe(City) do

  describe(".all") do
    it("it starts off without any cities") do
      expect(City.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a city to the schedule") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      expect(City.all[0].name).to(eq("Portland"))
      # expect(City.all).to(eq("Portland"))
    end
  end

  describe("#==") do
    it("is the same city if it has the same city name") do
      city = City.new({:name => "Portland", :id => nil})
      city2 = City.new({:name => "Portland", :id => nil})
      expect(city.name()).to(eq("Portland"))
    end
  end

  describe("#update") do
    it("lets the city be updated") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city.update({:name => "Seattle"})
      expect(city.name()).to(eq("Seattle"))
    end
  end

  describe("#delete") do
    it("allows the conductor to delete a destination") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "Portland", :id => nil})
      city2.save()
      city.delete()
      expect(City.all()).to(eq([city2]))
    end
  end

  describe(".find") do
    it("returns a city by city") do
      test_city = City.new({:name => "Portland", :id => nil})
      test_city.save()
      test_city2 = City.new({:name => "Seattle", :id => nil})
      test_city2.save()
     expect(City.find(test_city2.id())).to(eq(test_city2))
    end
  end

  describe("#name") do
    it("let's the city be viewed by city")do
      city = City.new({:name => "Portland", :id => nil})
      expect(city.name()).to(eq("Portland"))
    end
  end

  describe("#id") do
    it("lets you read the city ID")do
      city = City.new({:name => "Portland", :id => nil})
      expect(city.id()).to(eq(nil))
    end
  end

end

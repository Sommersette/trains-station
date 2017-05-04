require "trains"
require "rspec"
require "pg"
require "pry"


describe(Train) do

  describe(".all") do
    it("it starts off without any trains") do
      expect(Train.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a train to the schedule") do
      train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      train.save()
      expect(Train.name()).to(eq([train]))
    end
  end

  describe(".find") do
    it("returns a train by name") do
      test_train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      test_train.save()
      test_train2 = Train.new({:name => "EW", :stop => "Astoria", :id => nil})
      test_train2.save()
      expect(Train.find(test_train2.id())).to(eq(test_train2))
    end
  end

  describe("#==") do
    it("is the same train if it has the same name") do
      train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      train2 = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      expect(train.name()).to(eq("NS"))
    end
  end


  describe("#update") do
    it("lets the train be updated") do
      train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      train.save()
      train.update({:stop => "Olympia"})
      expect(train.stop()).to(eq("Olympia"))
    end
  end

  describe("#delete") do
    it("allows the conductor to delete a stop") do
      train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      train.save()
      train2 = Train.new({:name => "NS", :stop => "Olympia", :id => nil})
      train2.save()
      train.delete()
      expect(Train.all()).to(eq([train2]))
    end
  end

  describe("#name") do
    it("let's the train be viewed by name")do
      train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      expect(train.name()).to(eq("NS"))
    end
  end

  describe("#stop") do
    it("allows you to view the cities the train stops in")do
      train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      expect(train.stop()).to(eq("Seattle"))
    end
  end

  describe("#id") do
    it("lets you read the train ID")do
      train = Train.new({:name => "NS", :stop => "Seattle", :id => nil})
      expect(train.id()).to(eq(nil))
    end
  end

end

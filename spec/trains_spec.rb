require "trains"
require "rspec"
require "spec_helper"
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
      train = Train.new({:name => "NS", :id => nil})
      train.save()
      expect(Train.all[0].name).to(eq("NS"))
    end
  end

  describe("#==") do
    it("is the same train if it has the same name") do
      train = Train.new({:name => "NS", :id => nil})
      train2 = Train.new({:name => "NS", :id => nil})
      expect(train.name()).to(eq("NS"))
    end
  end

  describe("#update") do
    it("lets the train be updated") do
      train = Train.new({:name => "NS", :id => nil})
      train.save()
      train.update({:name => "ES"})
      expect(train.name()).to(eq("ES"))
    end
  end
  #

  describe("#delete") do
    it("allows the conductor to delete a stop") do
      train = Train.new({:name => "NS", :id => nil})
      train.save()
      train2 = Train.new({:name => "NS", :id => nil})
      train2.save()
      train.delete()
      expect(Train.all()).to(eq([train2]))
    end
  end

  describe(".find") do
    it("returns a train by name") do
      test_train = Train.new({:name => "NS", :id => nil})
      test_train.save()
      test_train2 = Train.new({:name => "EW", :id => nil})
      test_train2.save()
     expect(Train.find(test_train2.id())).to(eq(test_train2))
    end
  end

  describe("#name") do
    it("let's the train be viewed by name")do
      train = Train.new({:name => "NS", :id => nil})
      expect(train.name()).to(eq("NS"))
    end
  end

  describe("#id") do
    it("lets you read the train ID")do
      train = Train.new({:name => "NS", :id => nil})
      expect(train.id()).to(eq(nil))
    end
  end

end

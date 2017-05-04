class Train

  attr_accessor(:name, :id)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes[:id]
    end


  define_singleton_method(:all) do
    returned_train = DB.exec("SELECT * FROM train;")
    trains = []
    returned_train.each() do |train|
      name = train.fetch("name")
      id = train.fetch("id").to_i()
      trains.push(Train.new({:name => name, :id => id}))
      end
      trains
    end

  define_method(:save) do
      result = DB.exec("INSERT INTO train (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

  define_method(:==) do |another_train|
    self.name().==(another_train.name())
 end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE train SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM train WHERE id = #{self.id()};")
    # DB.exec("DELETE FROM city WHERE id_train = #{self.id()};")
  end

  define_singleton_method(:find) do |id|
    found_train = nil
    Train.all.each do |train|
      if train.id .== id
        found_train = train
      end
    end
    found_train
  end



end

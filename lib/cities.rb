require "pry"

class City
  attr_accessor(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_city = DB.exec("SELECT * FROM city;")
    citys = []
    returned_city.each() do |city|
      name = city.fetch("name")
      id = city.fetch("id").to_i()
      citys.push(City.new({:name => name, :id => id}))
      end
      citys
    end

  define_method(:save) do
    result = DB.exec("INSERT INTO city (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_city|
    self.name().==(another_city.name())
 end

 define_method(:update) do |attributes|
   @name = attributes.fetch(:name)
   @id = self.id()
   DB.exec("UPDATE train SET name = '#{@name}' WHERE id = #{@id};")
 end

 define_method(:delete) do
   DB.exec("DELETE FROM city WHERE id = #{self.id()};")
  #  DB.exec("DELETE FROM city WHERE id_train = #{self.id()};")
 end

 define_singleton_method(:find) do |id|
   found_city = nil
   City.all.each do |city|
     if city.id .== id
       found_city = city
     end
   end
   found_city
 end


end

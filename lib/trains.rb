class Train

  attr_accessor(:name, :stop, :id)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @stop = attributes.fetch(:stop)
      @id = attributes[:id]
    end


  # def self.find_by(field, value) do
  #   DB.exec("SELECT * FROM train WHERE #{field} = #{value} Order BY train DESC;").to_a
  # end

end

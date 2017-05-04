require("trains")
require("cities")
require("pg")
require("rspec")


DB = PG.connect({:dbname => "railroad"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM city *;")
    DB.exec("DELETE FROM train *;")
    DB.exec("DELETE FROM stops *;")
  end
end

require("trains")
require("cities")
require("pg")
require("rspec")


DB = PG.connect({:dbname => "railroad"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM trains *;")
  end
end

class Customer < ApplicationRecord
    # set of headers, column names, will be ignored
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Customer.create! row.to_hash
            # if does not work, throw error
        end
    end
    
end

class Customer < ApplicationRecord
    # set of headers, column names, will be ignored
    def self.import(file)
        # CSV.foreach(file.path, headers: true) do |row|
        CSV.foreach(file.path) do |row|
            # Customer.create! row.to_hash
            # # if does not work, throw error

            Customer.create({
                first_name: row[0],
                last_name: row[1],
                email: row[2],
                vehicle_type: row[3],
                vehicle_name: row[4],
                vehicle_length: row[5]
            })
        end
    end
    
end


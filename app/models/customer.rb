class Customer < ApplicationRecord
    # set of headers, column names, will be ignored
    def self.import(file)
        # File.new("/tmp/big.csv").grep(/(^,|,(,|%))/).each do |row_string|
        #     CSV.parse(row_string) do |row|
        #       puts row[1]
        #     end
        #   end

        # col_sep only accepts one value as a string
        byebug
        CSV.foreach(file.path, col_sep: "|") do |row|
            # CSV.foreach(file.path) do |row|
                # Customer.create! row.to_hash
                # if does not work, throw error

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
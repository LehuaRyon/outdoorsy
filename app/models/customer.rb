class Customer < ApplicationRecord
    # set of headers, column names, will be ignored
    def self.import(file)
        # File.new("/tmp/big.csv").grep(/(^,|,(,|%))/).each do |row_string|
        #     CSV.parse(row_string) do |row|
        #       puts row[1]
        #     end
        #   end

        # col_sep only accepts one value as a string

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

    # scope :order_by_vehicle_type, -> {customer(vehicle_type: :asc)}
    def self.order_by_vehicle_type
        Customer.order(vehicle_type: :asc)
    end

    # def self.sort_by_vehicle_type
    #     Customer.all.sort_by { |customer| customer.vehicle_type }
    # end

#   def self.search_by_vehicle_type(search)
#     vehicle_type = Customer.find_by(vehicle_type: search)
#     if vehicle_type
#       self.where(vehicle_type: vehicle_type)
#     else
#       Customer.order_by_created_at
#     end
#   end

    def full_name
        "#{first_name} #{last_name}"
    end

end
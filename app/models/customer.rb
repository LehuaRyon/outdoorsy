class Customer < ApplicationRecord
    scope :order_by_vehicle_type, -> {customer(vehicle_type: :asc)}
    # def self.order_by_vehicle_type
    #     Customer.order(vehicle_type: :asc)
    # end

    def self.sort_by_full_name
        # Customer.all.sort_by { |customer| customer.first_name customer.last_name }
        Customer.all.sort_by { |customer| [customer[:first_name], customer[:last_name]] }
    end

    # This Method was only capable of accepting only one separator value
    # col_sep only accepts one value as a string
        # def self.import(file)
        #     CSV.foreach(file_path, headers: false, col_sep: "|") do |row|
        #             Customer.find_or_create_by({
        #                 first_name: row[0],
        #                 last_name: row[1],
        #                 email: row[2],
        #                 vehicle_type: row[3],
        #                 vehicle_name: row[4],
        #                 vehicle_length: row[5]
        #             })
        #     end
        # end

    def self.import(file)
        separators = ["|", ","]
        csv_first_input = File.open(file).first
        CSV.foreach(file, headers: false, col_sep:  separators.detect{ |separator| csv_first_input.include?(separator)}) do |row|
                # Customer.create!({
                Customer.find_or_create_by({
                    first_name: row[0],
                    last_name: row[1],
                    email: row[2],
                    vehicle_type: row[3],
                    vehicle_name: row[4],
                    vehicle_length: row[5]
                })
        end
    end

#   def self.search_by_vehicle_type(search_vehicle)
#     vehicle_type = Customer.find_by(vehicle_type: search_vehicle)
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
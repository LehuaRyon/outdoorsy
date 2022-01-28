class Customer < ApplicationRecord
    scope :order_by_vehicle_type, -> {customer(vehicle_type: :asc)}
    # def self.order_by_vehicle_type
    #     Customer.order(vehicle_type: :asc)
    # end

    scope :order_by_created_at, -> {order(created_at: :desc)}
    # def self.order_by_created_at
    #   Customer.order(created_at: :desc)
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
        CSV.foreach(file, headers: false, col_sep:  separators.detect { |separator| csv_first_input.include?(separator)}) do |row|
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

    def self.search_by_vehicle_name(search)
        search_downcase_vehicle_name = search.downcase
        downcased_vehicle_names = Customer.all.map { |customer| customer.vehicle_name.downcase}
        vehicle_name = downcased_vehicle_names.find { |name| name == search_downcase_vehicle_name}.titleize
        if vehicle_name
          self.where(vehicle_name: vehicle_name)
        else
          Customer.order_by_created_at
        end
      end

#   def self.search_by_vehicle_name(search)
#     vehicle_name = Customer.find_by(vehicle_name: search)
#     if vehicle_name
#       self.where(id: vehicle_name)
#     else
#       Customer.order_by_created_at
#     end
#   end

    def full_name
        "#{first_name} #{last_name}"
    end

end
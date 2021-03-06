class Customer < ApplicationRecord
    validates :first_name, :last_name, :email, :vehicle_type, :vehicle_name, :vehicle_length, presence: true
    scope :order_by_vehicle_type, -> {customer(vehicle_type: :asc)}
    scope :order_by_vehicle_type, -> {customer(vehicle_length: :asc)}
    scope :order_by_created_at, -> {order(created_at: :desc)}

    def self.sort_by_full_name
        Customer.all.sort_by { |customer| [customer[:first_name], customer[:last_name]] }
    end

    # previous method I had was only capable of accepting only one separator value
    # col_sep only accepts one value as a string
    # This method accepts both, more dynamic
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

    def self.to_csv
        attributes = ["first_name", "last_name", "vehicle_type", "vehicle_name", "vehicle_length"]
        CSV.generate do |csv|
            csv << attributes
            all.each do |customer|
                csv << attributes.map { |attribute| customer.send(attribute) }
            end
        end
    end

    def self.search_by_first_name_or_last_name(search)
        search_downcase_first_name_or_last_name = search.downcase
        first_names = Customer.all.map { |customer| customer.first_name}
        last_names = Customer.all.map { |customer| customer.last_name}
        first_names_and_last_names = Customer.all.map { |customer| customer.full_name.downcase}.join(" ").split(" ")
        first_name_or_last_name = first_names_and_last_names.find { |name| name == search_downcase_first_name_or_last_name}
        if first_name_or_last_name != nil
            titleized_name = first_name_or_last_name.titleize
            if first_names.include?(titleized_name)
                self.where(first_name: titleized_name)
            else last_names.include?(titleized_name)
                self.where(last_name: titleized_name)
            end
        else
          Customer.order_by_created_at
        end
    end

    def self.search_by_vehicle_name(search)
        search_downcase_vehicle_name = search.downcase
        downcased_vehicle_names = Customer.all.map { |customer| customer.vehicle_name.downcase}
        vehicle_name = downcased_vehicle_names.find { |name| name == search_downcase_vehicle_name}
        if vehicle_name != nil
            titleized_vehicle_name = vehicle_name.titleize
            self.where(vehicle_name: titleized_vehicle_name)
        else
            Customer.order_by_created_at
        end
    end

    def self.search_by_vehicle_type(search)
        search_downcase_vehicle_type = search.downcase
        downcased_vehicle_types = Customer.all.map { |customer| customer.vehicle_type.downcase}
        vehicle_type = downcased_vehicle_types.find { |name| name == search_downcase_vehicle_type}
        if vehicle_type == "rv"
            rv_vehicle_type = vehicle_type.upcase
            self.where(vehicle_type: rv_vehicle_type)
        elsif vehicle_type
            self.where(vehicle_type: vehicle_type)
        else
          Customer.order_by_created_at
        end
    end

    def full_name
        "#{first_name} #{last_name}"
    end
end
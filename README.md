# Outdoor.sy
A small tool for a a fake company called Outdoor.sy that take some of their customer lists and returns the data in various sorted orders.

[![Alternate Text]({https://www.loom.com/share/94be3b26333e45dd970e40a7dd611a89})]({https://www.loom.com/share/94be3b26333e45dd970e40a7dd611a89} "Outdoor.sy Demo")

## Description
This app was built for the [The Wanderlust Group's](https://thewanderlustgroup.com/) code exercise and is meant to let Outdoor.sy add data from an upload file that is separated by a pipe or comma.  The customers' data is shown in a table with the column names: Full Name, Email, Vehicle Name, Vehicle Type, Vehicle Length.  The data can be sorted by: Full Name, Vehicle Type, or Vehicle Length.  The data can also be filtered through for a specific customer by the customer's First name, Last name, or Vehicle Name.  When searched by Vehicle Type, the customers that have the same Vehicle Type that matches the searched input will show on the table.  Outdoor.sy can create a new customer manually, delete any manually created customer as well as imported customer, import a list of customers via CSV file, and export a CSV file of all the data on the customer's table.  Whenever a new file is uploaded, the application will not add any duplicate information to the table.

## Local Installation
To install and run the app on your local machine:
1. Click the green Clone or download button above and click the copy to clipboard button
2. From your terminal, run `git clone [paste the link from step 1]`
3. Then run `cd outdoorsy` to navigate to the outdoorsy directory
4. Run `bundle install` to install the necessary gems and dependencies
5. Run `rails db:create` to create a database
5. Run `rails db:migrate` to perform the database migrations
7. Run `rails s` to start a local rails server
8. Go to `http://localhost:3000/` to view the app!

## Technologies
Ruby on Rails
• PostgreSQL
• Bootstrap

## Future Improvements
1. User Friendly Interaction Upgrades:
    1. Create dropdown menu for searching by Vehicle Type
    2. Search Vehicle Name by partial input
    3. Search Customer First or Last Name by partial input
    4. Toggle sort functionality on table columns
2. Increase Import Capacity:
    1. Import more than one CSV file to the database at once
3. Outdoor.sy Employee Registration
    1. Add Signup, Login, and Logout functionality so people outside the Outdoor.sy network don't have access to Outdoor.sy's customers' information

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LehuaRyon/outdoorsy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/LehuaRyon/outdoorsy/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/LehuaRyon/outdoorsy/blob/main/LICENSE).

## Code of Conduct

Everyone interacting in the Outdoor.sy's project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/LehuaRyon/outdoorsy/blob/main/CODE_OF_CONDUCT.md).
## 


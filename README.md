# ruby-ass-650-Database

Database - Ruby assignment (CIS 650 : Fall 2016)

Download this csv file and study its contents. 

There are three + one parts to this assignment.

Part 1: SQL commands
Write sql command to create a table named books_xy, where xy are your initials.  Create the table in a sqlite3 database in your account. (1 point)
Part 2: Ruby code
Populate the database using a Ruby program.  Use csv methods to read the CSV file. Then use Ruby code to insert the data to your books_xy table.  (2 points)
Part 3: Interface development (3 points)
Part of the interface is already developed for you to use. 
Study the code in database_demo3.rb available at this link.  Copy this code to your folder where you have created the products.db database and run to see what it does.
Use this code a starting point.  Use the first 20 lines of code in this .rb file in your assignment as they are.  
Modify lines 22 onwards to add these functionalities 
Prompt the user for column name, comparison operator and value. (using a series of gets calls).  Store them in appropriate hashes.
Write code to run the query and get the results.  
Print back the number of records retrieved and the actual query results. 
Your interface should work for these conditions
book_code == 808
Title like '%ve%'
Price == 8.00
Price <= 15
Type == HOR
And two more such conditions
Part 4: Create a demo video (the fun part) (Bonus: 1 point)
Create a Tegrity recording of you demonstrating your app.  In the recording, (a) explain how you solved Part 2 problem and (b) demonstrate your app by running the it for the five + two conditions mentioned.  (Imagine your are talking to a client, who will pay you handsomely for this marvellous work!) I have posted a link to Tegrity recorder on Canvas / Modules.​ Include presenter video while you are recording.

Upload the answers from Part 1, Part 2 and Part 3 to the assignment link as separate files, not zipped.



# successful working logic
require 'sqlite3'
db = SQLite3::Database.new('test_database.db')

 h1 = { field_name: :book_code, operator: "==", value: "'808'"}
 query_condition = build_condition(h1)
 
 h2 = {database: db, table: :books, condition: query_condition}
 query_result = run_query(h2)
 
 print_query_result(query_result)

puts "enter value"
value= gets.chomp
puts "comparision"
operator= gets.chomp


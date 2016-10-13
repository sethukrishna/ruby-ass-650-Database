require 'csv'
require 'sqlite3'

  def csv_to_array(file_name)
    array = []
    CSV.foreach(file_name) {|line| array <<  line}
    array
  end


# creating row array and stripping last and first array within array
books = csv_to_array('Books.csv')
books.pop
books.shift

# Creating database with below schema

db =SQLite3::Database.new( "test_database.db" )

db.execute <<-SQL
  CREATE TABLE books(BOOK_CODE ,TITLE ,PUBLISHER_CODE ,TYPE ,PRICE ,PAPERBACK);
SQL




#Adding books to the database | Didn't know how to add objects :S
books.each do |row|
  db.execute("INSERT INTO books(BOOK_CODE ,TITLE ,PUBLISHER_CODE ,TYPE ,PRICE ,PAPERBACK)
  VALUES (?, ?, ?, ?, ?, ?)", [row[0], row[1], row[2], row[3], row[4], row[5]])
end







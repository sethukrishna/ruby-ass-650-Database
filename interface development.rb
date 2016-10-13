#build the condition string for a given set column, operator and value
def build_condition(params)                         
    #build where clause using the hash
    where_condition = params[:field_name].to_s
    where_condition += params[:operator].to_s
    where_condition += params[:value].to_s
    where_condition
end


#run query against a specific database, a specific table and for a given condition
def run_query(params) 
    query_string = "Select * from #{params[:table]} where #{params[:condition]}"
    query_result = params[:database].query(query_string)
end 


#print the result of a query
def print_query_result(result)                      
    puts result.columns.to_s
    result.each do |record|
        puts record.to_s
    end
end


puts "enter field_name"
field = gets.chomp

puts "enter operator: == or <= or >="
compare = gets.chomp.to_s

puts "enter value"
value = gets.chomp
value = "\'#{value}\'"


require 'sqlite3'
db = SQLite3::Database.new('test_database.db')

 h1 = { field_name: field, operator: compare, value: value }
 query_condition = build_condition(h1)
 
 h2 = {database: db, table: :books, condition: query_condition}
 query_result = run_query(h2)
 
 print_query_result(query_result)
 
 
 
 
 
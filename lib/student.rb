class Student
 attr_accessor :name, :grade
 attr_reader :id
 
  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade 
  end
  
  def self.create_table 
    sql = %{
      CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY, 
      name TEXT, 
      grade INTEGER)
    } 
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = %{
      DROP TABLE students
    }
    DB[:conn].execute(sql)
  end
  
 def save
    sql = <<-SQL
      INSERT INTO songs (name, album) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.album)
 
  end

 
  
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
end

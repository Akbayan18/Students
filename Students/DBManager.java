package kz.baibalaeva.javaEE;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;
    static{
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","qwerty123");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static boolean addStudent(Student student){
        int rows = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement("insert into students(name,surname,birthdate,city) " +
                    "values(?,?,?,?)");
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getSurname());
            stmt.setString(3, student.getBirthdate());
            stmt.setString(4,student.getCity());

            rows = stmt.executeUpdate();
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows > 0;
    }
    public static ArrayList<Student> getAllStudents(){
        ArrayList<Student> list = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("select * from students");
            ResultSet resultSet = stmt.executeQuery();
            while(resultSet.next()){
                Student student = new Student();
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setBirthdate(resultSet.getString("birthdate"));
                student.setCity(resultSet.getString("city"));
                list.add(student);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static Student getStudent(Long id){
        Student student = null;
        try {
            PreparedStatement stmt = connection.prepareStatement("select * from students " +
                    "where id = ?");
            stmt.setLong(1, id);
            ResultSet resultSet = stmt.executeQuery();
            if(resultSet.next()){
                student = new Student();
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setBirthdate(resultSet.getString("birthdate"));
                student.setCity(resultSet.getString("city"));
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return student;

    }

    public static boolean updateStudent(Student student){
        int rows=0;
    try {
        PreparedStatement stmt = connection.prepareStatement("update students set name=?, surname=?, birthdate=?, city=? " +
                "where id=?");
        stmt.setString(1, student.getName());
        stmt.setString(2, student.getSurname());
        stmt.setString(3, student.getBirthdate());
        stmt.setString(4, student.getBirthdate());
        stmt.setLong(5, student.getId());
        rows = stmt.executeUpdate();
        stmt.close();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    return rows>0;
    }

    public static boolean deleteStudent(Long id){
        int rows=0;
        try {
            PreparedStatement stmt = connection.prepareStatement("delete from students  " +
                    "where id=?");
           stmt.setLong(1, id);
          rows=stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

}


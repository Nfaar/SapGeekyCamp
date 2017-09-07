import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTools {
    public Connection conn;

    public void Initialize() throws SQLException{
        String url = "jdbc:postgresql://localhost/geekycamp";
        Properties props = new Properties();
        props.setProperty("user", "postgres");
        props.setProperty("password", "xaxa123");
        conn = DriverManager.getConnection(url, props);


    }
    public void DropDB(String name){

        try {
            conn.prepareStatement("DROP TABLE " + name).executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void CreateDB(String name, String params){
            try {
                conn.prepareStatement("CREATE TABLE Students_Courses (studentId INTEGER NOT NULL REFERENCES Students (id) ON DELETE CASCADE, COURSEID INTEGER NOT NULL REFERENCES Courses (ID) ON DELETE CASCADE )").executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

    }
    public void PrintDB(String name) throws SQLException {
        ResultSet executeQuery = null;
        try {
            executeQuery = conn.prepareStatement("SELECT * FROM " + name).executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        while (executeQuery.next()) {
            System.out.println(executeQuery.getInt(1) + ". " + executeQuery.getString(2)+ " " + executeQuery.getString(3));
        }
    }
    public void InsertStudents(String db, String params) throws SQLException {

        if (db.toLowerCase().equals("students")){
            String[] args = params.split(" ");
            int id = Integer.parseInt(args[0]);
            String firstName = args[1];
            String lastName = args[2];
            int fId = Integer.parseInt(args[3]);

            try {
                conn.prepareStatement(String.format("INSERT INTO " + db + " (ID, FIRST_NAME, LAST_NAME, FACULTYID) VALUES (%d, '%s', '%s', '%d')",id, firstName, lastName, fId)).executeUpdate();

            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (db.toLowerCase().equals("faculties")){

            String[] args = params.split(" ");
            int id = Integer.parseInt(args[0]);
            String name = args[1];

            try {
                conn.prepareStatement(String.format("INSERT INTO " + db + " (ID, NAME) VALUES (%d, '%s')",id, name)).executeUpdate();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (db.toLowerCase().equals("courses")){
            String[] args = params.split(" ");
            int id = Integer.parseInt(args[0]);
            String name = args[1];
            String desc = args[2].replace("-", " ");
            int credits = Integer.parseInt(args[3]);

            try {
                conn.prepareStatement(String.format("INSERT INTO " + db + " (ID, NAME, DESCRIPTION, CREDITS) VALUES (%d, '%s', '$s', '%d')",id, name, desc, credits)).executeUpdate();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (db.toLowerCase().equals("students_courses")){
            String[] args = params.split(" ");
            int studentId = Integer.parseInt(args[0]);
            int courseId = Integer.parseInt(args[1]);

            try {
                conn.prepareStatement(String.format("INSERT INTO " + db + " (STUDENTID, COURSEID) VALUES ('%d', '%d')",studentId, courseId)).executeUpdate();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }


    }

}

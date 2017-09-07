import java.sql.*;
import java.util.Properties;

import java.util.PropertyPermission;
import java.util.Scanner;

public class DBStudents {
    public static void main(String[] args) throws SQLException {

        JDBCTools jdbc = new JDBCTools();
        jdbc.Initialize();

        Scanner sc = new Scanner(System.in);

        while(true){
            String[] input = sc.nextLine().split(" ");
            if (input[0].toLowerCase().equals("drop")){
                jdbc.DropDB(input[1]);
            }
            if (input[0].toLowerCase().equals("print")){
                jdbc.PrintDB(input[1]);
            }
            if (input[0].toLowerCase().equals("insert")){
                String str = "";
                for (int i = 2; i < input.length; i++){
                    str += input[i] + " ";
                }
                jdbc.InsertStudents(input[1], str);
            }
        }
    }
}
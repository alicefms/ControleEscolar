package Infra;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private Connection connection = null;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "654321";
    private final String DATABASE_URL = "jdbc:mysql://localhost:3306/escola?useTimezone=true&serverTimezone=UTC";

    public Conexao() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        this.connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
        this.connection.setAutoCommit(false);
    }

    public Connection getConnection(){
        return this.connection;
    }

    public void close(){
        if(this.connection != null){
            try{
                this.connection.close();
            }catch (SQLException e){
                System.out.println(e);
            }
        }
    }

    public void commit() throws SQLException {
        this.connection.commit();
    }

    public void rollback(){
        if(this.connection != null){
            try{
                this.connection.rollback();
            }catch (SQLException e){
                System.out.println(e);
            }
        }
    }
}

package hangout.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Connection conn;//데이터베이스에 접근하게 해주는 하나의 객체
    private PreparedStatement pstmt;
    private ResultSet rs;//정보를 담을 수 있는 객체
    private final String JDBC_URL = "jdbc:mysql://localhost:3305/hangout";
    private final String dbID = "admin";
    private final String dbPassword = "1234";

    public void open() {//mysql에 접속을 하게 해줌,자동으로 데이터베이스 커넥션이 일어남
        try {//예외처리
            Class.forName("com.mysql.cj.jdbc.Driver");//mysql드라이버를 찾는다.
            //드라이버는 mysql에 접속할 수 있도록 매개체 역할을 하는 하나의 라이브러리
            conn= DriverManager.getConnection(JDBC_URL,dbID,dbPassword);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public int login(String userID, String userPassword) {//로그인을 시도하는 함수
        open();
        String SQL="SELECT userPassword FROM USER WHERE userID = ?";
        try {
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1,userID);//아이디가 일치하면 비밀번호를 가져온다.
            rs=pstmt.executeQuery();//rs에 실행한 결과를 넣어준다.
            if(rs.next()) {//결과가 존재한다면
                if(rs.getString(1).equals(userPassword))//sql문장을 실행해서 나온 결과와 접속을 시도했던 passwd비교
                    return 1;//로그인 성공
                else
                    return 0; //비밀번호 불일치
            }
            return -1;//아이디가 없음,rs의 결과가 존재 하지 않음
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return -2; //데이터베이스 오류
    }

    public int join(User user) {
        open();
        String SQL = "INSERT INTO USER(userId, userPassword, userName, userGender, userAge) VALUES (?,?,?,?,?)";
        try {
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setInt(5, user.getUserAge());

            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();//예외처리
        } finally {
            close();
        }

        return -1;//데이터베이스 오류
    }

    public User getUser(String userID) {
    	open();
        String SQL="SELECT * from USER where userId = ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs=pstmt.executeQuery();    //select
            if(rs.next()) { //결과가 있다면
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserId(rs.getString("userId"));
                user.setUserPassword(rs.getString("userPassword"));
                user.setUserName(rs.getString("userName"));
                user.setUserGender(rs.getString("userGender"));
                user.setUserAge(rs.getInt("userAge"));
                return user;    //5개의 항목을 user인스턴스에 넣어 반환한다.
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    // test: get all users
    public List<User> getAllUsers() {
        open();
        List<User> userList = new ArrayList<>();

        try {
            String SQL = "SELECT * FROM USER";
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getString("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserGender(rs.getString("userGender"));
                user.setUserAge(rs.getInt("userAge"));
                // You may need to set other fields based on your User class

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return userList;
    }
    
    public boolean userExists(String userId) {
        open();
        String SQL = "SELECT COUNT(*) FROM USER WHERE userId = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // If count is greater than 0, userId already exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return false; // Database error or userId doesn't exist
    }

    
}

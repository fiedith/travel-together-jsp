package hangout.article;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ArticleDao {

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

    public int createArticle(Article article, int loggedInUserId) {
        open();
        String SQL = "INSERT INTO board (user_id, title, content, travel_start, travel_end, travel_region, travel_city, number_of_partners, image_number, created_at) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, loggedInUserId); // Use the logged-in user's ID
            pstmt.setString(2, article.getTitle());
            pstmt.setString(3, article.getContent());
            pstmt.setObject(4, article.getTravelStart());
            pstmt.setObject(5, article.getTravelEnd());
            pstmt.setString(6, article.getTravelRegion());
            pstmt.setString(7, article.getTravelCity());
            pstmt.setInt(8, article.getNumberOfPartners());
            pstmt.setInt(9, article.getImageNumber());

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return -1; // Database error
    }


    public List<Article> getAllArticles() {
        open();
        List<Article> articleList = new ArrayList<>();

        try {
            String SQL = "SELECT * FROM board";
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Article article = new Article();
                article.setArticleId(rs.getLong("article_id"));
                article.setUserId(rs.getInt("user_id"));
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setTravelStart(rs.getObject("travel_start", LocalDateTime.class));
                article.setTravelEnd(rs.getObject("travel_end", LocalDateTime.class));
                article.setTravelRegion(rs.getString("travel_region"));
                article.setTravelCity(rs.getString("travel_city"));
                article.setNumberOfPartners(rs.getInt("number_of_partners"));
                article.setImageNumber(rs.getInt("image_number"));
                article.setCreatedAt(rs.getObject("created_at", LocalDateTime.class));

                articleList.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return articleList;
    }

    // Other methods...
}

package hangout.comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private final String JDBC_URL = "jdbc:mysql://localhost:3305/hangout";
    private final String dbID = "admin";
    private final String dbPassword = "1234";

    public void open() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, dbID, dbPassword);
        } catch (Exception e) {
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

    public int createComment(Comment comment) {
        open();
        String SQL = "INSERT INTO comment (article_id, user_id, content, created_at) VALUES (?, ?, ?, NOW())";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setLong(1, comment.getArticleId());
            pstmt.setLong(2, comment.getUserId());
            pstmt.setString(3, comment.getContent());

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return -1; // Database error
    }

    public List<Comment> getCommentsByArticleId(String articleId) {
        open();
        List<Comment> commentList = new ArrayList<>();

        try {
            String SQL = "SELECT c.*, u.userName FROM comment c JOIN user u ON c.user_id = u.id WHERE article_id = ?";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, articleId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getLong("id"));
                comment.setArticleId(rs.getLong("article_id"));
                comment.setUserId(rs.getLong("user_id"));
                comment.setUserName(rs.getString("userName"));
                comment.setContent(rs.getString("content"));
                comment.setCreatedAt(rs.getObject("created_at", LocalDateTime.class));

                commentList.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return commentList;
    }
}

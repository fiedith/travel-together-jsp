package hangout.article;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import hangout.comment.Comment;

public class Article {
	
	private int userId;
	private long articleId;
    private String title;
    private String content;
    private LocalDate travelStart;
    private LocalDate travelEnd;
    private String travelRegion;
    private int numberOfPartners;
    private int imageNumber;
    private LocalDateTime createdAt;
    private String userName;	// 작성자명
    private List<Comment> comments;  // List of comments associated with the article
    
    
    
    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    
    public long getArticleId() {
		return articleId;
	}
	public void setArticleId(long articleId) {
		this.articleId = articleId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDate getTravelStart() {
		return travelStart;
	}
	public void setTravelStart(LocalDate travelStart) {
		this.travelStart = travelStart;
	}
	public LocalDate getTravelEnd() {
		return travelEnd;
	}
	public void setTravelEnd(LocalDate travelEnd) {
		this.travelEnd = travelEnd;
	}
	public String getTravelRegion() {
		return travelRegion;
	}
	
	public void setTravelRegion(String travelRegion) {
		this.travelRegion = travelRegion;
	}
	
	public int getNumberOfPartners() {
		return numberOfPartners;
	}
	
	public void setNumberOfPartners(int numberOfPartners) {
		this.numberOfPartners = numberOfPartners;
	}
	
	public int getImageNumber() {
		return imageNumber;
	}
	
	public void setImageNumber(int imageNumber) {
		this.imageNumber = imageNumber;
	}
	
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	
	// 작성자명 
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
	
}

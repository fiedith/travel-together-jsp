package hangout.article;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Article {
	
	private int userId;
    private String title;
    private String content;
    private LocalDate travelStart;
    private LocalDate travelEnd;
    private String travelRegion;
    private int numberOfPartners;
    private int imageNumber;
    private LocalDateTime createdAt;
    
    private long articleId;
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
	
}

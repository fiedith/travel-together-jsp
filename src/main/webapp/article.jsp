<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Travel Together</title>
</head>
<style>
  body{
    margin: 0;
    padding: 0;
    background-color: #eaf0f8;
  }
  .layout{
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  .headerLayout{
    width: 80%;
    height: 60px;
    background-color: white;
    display: flex;
    flex-direction: column;
    color: #3db9ff;
    justify-content: center;
  }
  .headerLayout_L{
    justify-content: space-between;
    display: flex;
    flex-direction: row;
  }
  .logo{
    display: flex;
    flex-direction: row;
    align-items: center;
    height: 100%;
    font-size: 1.4rem;
    letter-spacing: 2px;
    color: #3db9ff;
    background-color: white;
    font-weight: bold;
    border: none;
    transition: transform 0.7s;
    cursor: pointer;
  }
  .H_select{
    width: 50%;
    height: 100%;
    border: 1.5px groove #c2c3c5;
    border-radius: 0.9rem;
    padding-left: 1rem;
    padding-right: 1.5rem;
    align-items: center;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    font-size: medium;
  }
  .selects{
    border: none;
    color: #3db9ff;
    font-size: large;
    font-weight: bolder;
    cursor: pointer;
  }
  .H_search{
    width: 80%;
    border: none;
    height: 100%;
    opacity: 0.7;
    font-size: large;
    font-weight: bolder;
  }
  .S_button{
    width: 4rem;
    color: #3db9ff;
    border: none;
    font-size: large;
    font-weight: bolder;
    background-color: white;
    cursor: pointer;
  }
  .headerLayout_R{
    display: flex;
    margin-left: 1rem;
  }
  .button{
    width: 5.5rem;
    display: flex;
    justify-content: center;
    padding: 0.5rem;
    background-color: #4ab8f7;
    color: white;
    border-radius: 1rem;
    font-weight: bold;
    font-family: 'NanumSquareNeo-Variable';
    margin-top: 4px;
    margin-bottom: 4px;
    cursor: pointer;
    margin: 4px;
  }
  .postLayout{
    background-color: #eaf0f8;
    height: 100%;
    padding-bottom: 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .post{
    width: 70rem;
    height: 30rem;
    display: flex;
    align-items: center;
    flex-direction:  column;
  }

  .title{
    font-size: 1.7rem;
    height: 3rem;
    width: 40rem;
    overflow: visible;
    margin-top: 2rem;
    color: #73a1ec;
    border-bottom: 2px solid #afbdd3;
    font-weight: 750;
  }
  .detail{
    width: 100%;
    display: flex;
  }
  .content{
    width: 44rem;
    height: 13rem;
    display: flex;
    line-height: 5rem;
  }
  .value{
    font-size: 1.1rem;
    height: 2rem;
    width: 8rem;
    overflow: visible;
    margin-top: 2rem;
    color: #9f9e9e;
    font-weight: 600;
    display: flex;
    margin: 4px;

  }
  .data{
    font-size: 1.1rem;
    height: 2rem;
    overflow: visible;
    margin-top: 2rem;
    color: #73a1ec;
    font-weight: 600;
    display: flex;
    margin: 4px;
  }
  .contentData{
    font-size: 1.1rem;
    height: 2rem;
    min-width: 38rem;
    overflow: visible;
    margin-top: 3rem;
    margin-left: 1rem;
    color: #3c3a3a;
    font-weight: 600;
    line-height: 1.6rem;
  }
  .userLayout{
    width: 30rem;
    justify-content: center;
    display: flex;
  }
  .comments{
    width: 45rem;
    display: flex;
    align-items: start;
    flex-direction:  column;
    margin: 0;
  }
  .commentData{
    width: auto;
    display: flex;
    flex-direction: row;
  }
  .commentdetail{
    margin: 2px;
  }
  .inputselect{
    width: 40rem;
  }
  .commentlayout{
    width: 420px;
  }
  .createcomment{
    display: flex;
    flex-direction: row;
  }
</style>
<body>
    <div class="layout">
        <div class="headerLayout">
            <div class="headerLayout_L">
                <a href="hello.jsp" class="logo">Travel Together</a>
                <div class="H_select">
                    <select class="selects">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="nickname">닉네임</option>
                    </select>
                    <input placeholder="검색어를 입력해주세요" class="H_search" value="">
                    <button class="S_button">검색</button>
                </div>
                <div class="headerLayout_R">
                    <a href="login.jsp" class="button">로그인</a>
                    <a href="signup.jsp" class="button">회원가입</a>
                </div>
            </div>
        </div>
    </div>
    <div class="postLayout">
        <div class="post">
            <div class="postContent">
                <div class="title">${article.title}</div>
                <div class="detail">
                    <div class="value">닉네임</div>
                    <div class="data">${article.userName}</div>
                </div>
                <div class="detail">
                    <div class="value">여행지역</div>
                    <div class="data">${article.travelRegion}</div>
                </div>
                <div class="detail">
                    <div class="value">모집인원</div>
                    <div class="data">${article.numberOfPartners}명</div>
                </div>
                <div class="detail">
                    <div class="value">여행날짜</div>
                    <div class="data">${article.travelStart} ~ ${article.travelEnd}</div>
                </div>
                <div class="content">
                    <div class="contentData">
                        <div>${article.content}</div>
                    </div>
                </div>
                <div class="detail">
                    <div class="data">${article.createdAt}
                </div>
            </div>
        </div>
    </div>  
    <div class="comment">
      <div class="comments">
        <h2>댓글</h2>
        <c:forEach var="comment" items="${comments}">
            <div class="commentlayout">
              <div class="commentData">
                <p class="commentdetail">${comment.userName}</p>
                <p class="commentdetail">${comment.createdAt}</p>
              </div  class="commentdetail">
                <p>${comment.content}</p>
            </div>
        </c:forEach>
      </div>
    </div>
    <div >
      <form action="CommentServlet" class="createcomment" method="post">
        <input type="hidden" name="articleId" value="${article.articleId}">
        <input type="hidden" name="userId" value="${user.id}">
        <textarea name="content" rows="4" class="inputselect" cols="50" placeholder="댓글을 입력하세요"></textarea>
        <button type="submit" class="button">게시</button>
      </form>
    </div>
  </div>
</body>
</html>
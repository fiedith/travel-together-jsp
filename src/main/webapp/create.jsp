<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Check if the user is not logged in (session does not exist)
    if (session.getAttribute("user") == null) {
        response.sendRedirect("hello.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>글 작성</title>
</head>
<style>
  body{
    margin: 0;
    padding: 0;
  	padding-bottom: 100px;
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
  .pic{
    height: 600px;
    background-color: #3db9ff;
  }
  .mainText{
    margin-top: 1rem;
    width: 100%;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    font-weight: 500;
    font-size: 1.5rem;
    font-family: 'SUITE-Regular';
  }
  .postform {
    width: 70%;
    height: 80%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    
  }

  .text {
	width: 100px;
  	font-size: 16px;
  	margin: 0.5rem;
    margin-top: 1rem;
    font-weight: bold;
  }

  .input {
    width: 40%;
    padding: 0.5rem;
    margin: 0.5rem 0;
    border: 1px solid #ccc;
    border-radius: 0.3rem;
  }

  .select {
    width: 40%;
    padding: 0.5rem;
    margin: 0.5rem 0;
    border: 1px solid #ccc;
    border-radius: 0.3rem;
  }

  .buttons {
    width: 10rem;
    padding: 0.5rem;
    margin-top: 1rem;
    background-color: #4ab8f7;
    color: white;
    border: none;
    border-radius: 0.3rem;
    font-weight: bold;
    cursor: pointer;
  }
  .pic{
    height: 300px;
   	width: 100%;
    background-color: #3db9ff;
  }
  .contentlayout{
   	width: 100%;
   	height: 100%;
   	display: flex;
   	flex-direction: column;
    align-items: center;
    justify-content: center;
  }
  .list{
  	width : 100%;
  	margin: 4px;
  	display: flex;
  	flex-direction: row;
  }
  .inputtext{
  	width: 100%;
  	height:500px;
  	vertical-align: top;
  }
  .inputday{
  	width:20%;
  	margin:0.5rem;
  }
</style>
<body>
  <div class="layout">
    <div class="headerLayout">
      <div class="headerLayout_L">
        <a href="hello.jsp" class="logo">HANGOUT</a>
        <div class="H_select">
          <select class="selects">
            <option value="title" >제목</option>
            <option value="content" >내용</option>
            <option value="nickname" >닉네임</option>
          </select>
          <input placeholder="검색어를 입력해주세요" class="H_search" value="">
          <button class="S_button">검색</button>
        </div>	
        <div class="headerLayout_R">
          <c:choose>
            <c:when test="${empty sessionScope.user}">
              <!-- User is not logged in -->
              <a href="login.jsp" class="button">로그인</a>
              <a href="signup.jsp" class="button">회원가입</a>
            </c:when>
            <c:otherwise>
              <!-- User is logged in -->
              <a href="LogoutServlet" class="button">로그아웃</a>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>
  <div class="contentlayout">
  	<div class="pic">
    
  	</div>
  	 <div class="text">게시글 작성</div>
  	
  	<form class="postform" action="CreateArticleServlet" method="post">
  	<div class="list" >
  		<div class="text">제목</div>
  		<input type="text" placeholder="제목" class="input" name="title" required>

  		<div class="text">여행지 선택</div>
  		<select class="select" name="travel_region" required>
    		<option value="seoul">서울</option>
    		<option value="busan">부산</option>
    		<option value="jeju">제주</option>
    		<option value="gyeonggi-do">경기도</option>
    		<option value="daegu">대구</option>
    		<option value="incheon">인천</option>
    		<option value="daejeon">대전</option>
    		<option value="ulsan">울산</option>
    		<option value="sejong">세종시</option>
    		<option value="chungcheong-bukdo">충청북도</option>
    		<option value="chungcheong-namdo">충청남도</option>
    		<option value="jeonra-bukdo">전라북도</option>
    		<option value="jeonra-namdo">전라남도</option>
    		<option value="gyeongsang-bukdo">경상북도</option>
    		<option value="gyeongsang-namdo">경상남도</option>
  		</select>
  	</div>
  	<div class="list" >
  		<div class="text">여행기간</div>
  		<input type="date" placeholder="출발일" class="inputday" name="travel_start" required>
  		<input type="date" placeholder="종료일" class="inputday" name="travel_end" required>

  		<div class="text">여행인원</div>
  		<input type="number" placeholder="인원" class="input" name="number" required>
  	</div>
  	    <div>
    	<div class="text">이미지</div>
    	<input type="radio" name="image_number" id="image1" value="1" class="image-option">
    	<label for="image1">
      		<img src="images/1.jpg" alt="이미지 1">
    	</label>

    	<input type="radio" name="image_number" id="image2" value="2" class="image-option">
    	<label for="image2">
      		<img src="images/2.jpg" alt="이미지 2">
    	</label>

    	<input type="radio" name="image_number" id="image3" value="3" class="image-option">
    	<label for="image3">
      	<img src="images/3.jpg" alt="이미지 3">
    	</label>
    </div>
    <input type="text" placeholder="내용을 입력해주세요" class="inputtext" name="content" required>

  	<button type="submit" class="buttons">게시글 작성</button>
	</form>
  </div>
  </body>
</html>
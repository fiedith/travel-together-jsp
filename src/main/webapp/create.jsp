<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Hello JSP</title>
</head>
<style>
  body{
    margin: 0;
    padding: 0;
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
          <a href="login.jsp" class="button">로그인</a>
          <a href="signup.jsp" class="button">회원가입</a>
        </div>
      </div>
    </div>
  </div>
  <div>
  </div>
  <div>
  	<div>게시글 작성</div>
  		<form action="CreateArticleServlet" method="post">
        	<div class="text">제목</div>
        	<input type="text" placeholder="제목" class="input" name="title" required>
        	<div class="text">여행기간</div>
        	<input type="date" placeholder="출발일" class="input" name="travel_start" required>
        	<input type="date" placeholder="종료일" class="input" name="travel_end" required>
        	<div class="text">여행인원</div>
        	<input type="number" placeholder="인원" class="input" name="number" required>
        	<div>
        		<input type="text" placeholder="내용을 입력해주세요" class="input" name="content" required>
        	</div>
        	<button type="submit" class="buttons">게시글 작성</button>
        </form>
  </div>
</body>
</html>

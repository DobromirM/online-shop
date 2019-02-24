<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>

<head>
	<jsp:include page="sections/head.jsp"/>
	<link rel="stylesheet" href="css/userLogin.css">
	<script src="js/loginValidation.js"></script>
	
</head>

<body>

	<% if(session.getAttribute("name") != null)
		{
	%>	
		<c:redirect url="index.jsp"/>
	<%
		}
	%>
	
	<div class="main-container">

		<jsp:include page="sections/header.jsp" />
		<jsp:include page="sections/left.jsp" />
		
		<div class="content">
			<h2 class="page-text">
					User Login
			</h2>

			<form method="Post" name="login" onsubmit="return validate();" action="sections/userLoginVerification.jsp" >
				
				<div class="num">
  					 Number:&nbsp;&nbsp;&nbsp;
  					<input type="text" name="num">
  				</div>

  				<div class="pass">
  					Password:
  					<input type="password" name="pass">
				</div>

				<input type="submit" class="submit" value="Login" onclick="clear()">

			</form> 
			
			<div class="err-msg">
				<div id="num-err">Number cannot be empty!</div>
				<div id="num-incorrect">Your number should only have digits!</div>
				<div id="pass-err">Password cannot be empty!</div>

				<% if(session.getAttribute("isWrong") == "1")
				{%>
					<div id="wrong">Wrong username or password!</div>
					<c:set var="isWrong" scope="session" value="0"/>
				<%
				}
				%>

			</div>

		</div>

		<jsp:include page="sections/footer.jsp" />

	</div>
</body>
</html> 
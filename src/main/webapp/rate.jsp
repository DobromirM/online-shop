<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>

<head>
	<jsp:include page="sections/head.jsp"/>
	<link rel="stylesheet" href="css/rate.css">
</head>

<body>
	<div class="main-container">

		<% if(session.getAttribute("name") == null || session.getAttribute("isManager") == "1")
		{
		%> 
			<c:redirect url="index.jsp"/>   
		<%
		}
		%>

		<jsp:include page="sections/header.jsp" />
		<jsp:include page="sections/left.jsp" />

		<div class="content">
				<h2 class="page-text">
					Rate this item
				</h2>

				<form method="POST" action="sections/rateTransaction.jsp">

					<div class="rate">
						<div class="numbers">1 &nbsp;2 &nbsp;3 &nbsp;4 &nbsp;5</div>
  						<input type="radio" name="rating" value="1">
  						<input type="radio" name="rating" value="2">
  						<input type="radio" name="rating" value="3">
  						<input type="radio" name="rating" value="4">
  						<input type="radio" name="rating" value="5" checked="checked">
  					</div>

  						<input type="hidden" name="item-code" value=<%=request.getParameter("item-code")%>>

  					<input type="submit" class="submit" value="Rate">
  			
				</form>
		</div>
			
		<jsp:include page="sections/footer.jsp" />

	</div>

</body>
</html> 
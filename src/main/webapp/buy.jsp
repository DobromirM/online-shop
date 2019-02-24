<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>

<head>
	<jsp:include page="sections/head.jsp"/>
	<link rel="stylesheet" href="css/buy.css">
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
					Enter Promo Code
				</h2>

				<form method="POST" action="sections/buyTransaction.jsp">

					<div class="code">
  						<input type="text" name="code">
  					</div>
  						<input type="hidden" name="item-code" value=<%=request.getParameter("item-code")%>>

  					<input type="submit" class="submit" value="Complete Purchase">
  			
				</form>
		</div>
			
		<jsp:include page="sections/footer.jsp" />

	</div>

</body>
</html> 
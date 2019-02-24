<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>

<head>
	<jsp:include page="sections/head.jsp"/>
	<link rel="stylesheet" href="css/rateSuccess.css">
</head>

<body>

	<% if(session.getAttribute("transaction") != "1")
    {
    %>
    <c:redirect url="index.jsp"/>   
	<%
    }
	%>

	<c:set var="transaction" scope="session" value="0"/>

	<div class="main-container">

		<jsp:include page="sections/header.jsp" />
		<jsp:include page="sections/left.jsp" />

		<div class="content">
				<h2 class="page-text">
					Your rating was recorded successfully!
				</h2>
		</div>
			
		<jsp:include page="sections/footer.jsp" />

	</div>

</body>
</html> 
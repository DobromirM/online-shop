<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>

<head>
	<jsp:include page="sections/head.jsp"/>
	<link rel="stylesheet" href="css/index.css">
</head>

<body>
	<div class="main-container">

		<jsp:include page="sections/header.jsp" />
		<jsp:include page="sections/left.jsp" />

		<div class="content">
			<div class="page-info">
				<h2 class="page-text">
					If you are looking for the newest books, games, music or movies, you've come to the right place!
				</h2>
			</div>
			<img class="page-img" src="img/img.png" alt="Shop">
		</div>
			
		<jsp:include page="sections/footer.jsp" />

	</div>

</body>
</html> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="sections/head.jsp"/>
	<link rel="stylesheet" href="css/items.css">
</head>

<body>

	<div class="main-container">

		<jsp:include page="sections/header.jsp" />
		<jsp:include page="sections/left.jsp" />

		<div class="content">
			
			<h2 class="page-text">
					Games
			</h2>

			<div class="search">

				<form method="Get" name="search" action="games.jsp" >
				
					<div class="search-bar">
	  					<input type="text" name="search-bar">
	  				</div>

	  				<input type="submit" class="submit-search" value="Search">

  				</form> 

			</div>

			<%
			 	if(request.getParameter("search-bar") == null)
			 	{
			 %>
				 	<sql:query var="result">
    					SELECT * FROM inventory WHERE item_group = (SELECT group_code FROM inventory_group WHERE group_name = 'Games');
    				</sql:query> 
    		 <%
   				}
   				else
   				{
   			 %>
   					<sql:query var="result">
    					SELECT * FROM inventory WHERE item_group = (SELECT group_code FROM inventory_group WHERE group_name = 'Games') AND item_description LIKE "%<%=request.getParameter("search-bar")%>%";
    				</sql:query> 
    		<%
   				}
   			%>

    		<div class="items">
				<c:forEach var = "row" items = "${result.rows}">	 

					<div class="item">

						<div class="picture">
	        				<img src='img/<c:out value = "${row.item_image_loc}"/>' alt="tumbnail">
	        			</div>

	        			<div class="description">
	        				<c:out value = "${row.item_name}"/><br/>
	        				(<c:out value = "${row.item_author}"/>)<br/><br/>
	          				<c:out value = "${row.item_description}"/>
	          			</div>

	          			
	          			<% if(session.getAttribute("name") != null && session.getAttribute("isManager") != "1")
						{
						%> 

	          			<div class="buy">

	          				<form name="buy" action="buy.jsp" >
				
	  							<input type="hidden" name="item-code" value=<c:out value = "${row.item_code}"/>>
	  							<input type="submit" class="submit" value="Buy">

  							</form> 

	          			</div>

	          			<div class="rate">
	          				<form name="rate" action="rate.jsp" >
				
	  							<input type="hidden" name="item-code" value=<c:out value = "${row.item_code}"/>>
	  							<input type="submit" class="submit" value="Rate">

  							</form> 

	          			</div>

						<%
						}else{
						%>
							<div class="login-notice">You have to be logged in as customer to buy items!</div>
						<%}%>

	        			<div class="code">
	        				Item Code:
	        				<c:out value = "${row.item_code}"/>
	        			</div>

	        			<div class="price">
	        				Price:
	          				<c:out value = "${row.item_price}"/>&pound;
	          			</div>
	          			
	          			<div class="stock-count">
	          				Left in stock:
	          				<c:out value = "${row.item_stock_count}"/>
	          			</div>
	          		</div>		

	      		</c:forEach>
      		</div>

		</div>
			
		<jsp:include page="sections/footer.jsp" />

	</div>

	

</body>
</html> 
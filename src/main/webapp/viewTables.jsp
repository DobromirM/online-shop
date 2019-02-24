<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="sections/head.jsp"/>
	<link rel="stylesheet" href="css/viewTables.css">
</head>

<body>

	<% if(session.getAttribute("isManager") != "1")
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
					Database Tables
				</h2>

				<sql:query var="result">
    					SELECT * FROM customer;
    			</sql:query> 
    			<div class="table">
	    			Customer:<br/>
	    			customer_number; surname; initials; firstname; title; address1; address2; city; county; postcode; passwd; passphrase; <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.customer_number}"/>;
	    				<c:out value = "${row.surname}"/>;
	    				<c:out value = "${row.initials}"/>;
	    				<c:out value = "${row.firstname}"/>;
	    				<c:out value = "${row.title}"/>;
	    				<c:out value = "${row.address1}"/>;
	    				<c:out value = "${row.address2}"/>;
	    				<c:out value = "${row.city}"/>;
	    				<c:out value = "${row.county}"/>;
	    				<c:out value = "${row.postcode}"/>;
	    				<c:out value = "${row.passwd}"/>;
	    				<c:out value = "${row.passphrase}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

    			<sql:query var="result">
    					SELECT * FROM customer_order;
    			</sql:query> 
    			<div class="table">
	    			Customer Order:<br/>
	    			order_number; order_date; delivered; shipping_date; customer_number; <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.order_number}"/>;
	    				<c:out value = "${row.order_date}"/>;
	    				<c:out value = "${row.delivered}"/>;
	    				<c:out value = "${row.shipping_date}"/>;
	    				<c:out value = "${row.customer_number}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

    			<sql:query var="result">
    					SELECT * FROM inventory;
    			</sql:query> 
    			<div class="table">
	    			Inventory:<br/>
	    			item_code; item_name; item_description; item_author; item_image_loc; item_group; item_price; item_stock_location; item_stock_count; item_order_count; <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.item_code}"/>;
	    				<c:out value = "${row.item_name}"/>;
	    				<c:out value = "${row.item_description}"/>;
	    				<c:out value = "${row.item_author}"/>;
	    				<c:out value = "${row.item_image_loc}"/>;
	    				<c:out value = "${row.item_group}"/>;
	    				<c:out value = "${row.item_price}"/>;
	    				<c:out value = "${row.item_stock_location}"/>;
	    				<c:out value = "${row.item_stock_count}"/>;
	    				<c:out value = "${row.item_order_count}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

    			<sql:query var="result">
    					SELECT * FROM inventory_group;
    			</sql:query> 
    			<div class="table">
	    			Inventory Group:<br/>
	    			group_code; group_name; <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.group_code}"/>;
	    				<c:out value = "${row.group_name}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

    			<sql:query var="result">
    					SELECT * FROM manager;
    			</sql:query> 
    			<div class="table">
	    			Manager:<br/>
    				manager_number; surname; initials; firstname; passwd; passphrase <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.manager_number}"/>;
	    				<c:out value = "${row.surname}"/>;
	    				<c:out value = "${row.initials}"/>;
	    				<c:out value = "${row.firstname}"/>;
	    				<c:out value = "${row.passwd}"/>;
	    				<c:out value = "${row.passphrase}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

    			<sql:query var="result">
    					SELECT * FROM order_item;
    			</sql:query> 
    			<div class="table">
	    			Order Item:<br/>
    				item_code; value; order_number; quantity; <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.item_code}"/>;
	    				<c:out value = "${row.value}"/>;
	    				<c:out value = "${row.order_number}"/>;
	    				<c:out value = "${row.quantity}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

    			<sql:query var="result">
    					SELECT * FROM promotion_code;
    			</sql:query> 
    			<div class="table">
	    			Promotion Code:<br/>
    				code; discount; <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.code}"/>;
	    				<c:out value = "${row.discount}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

    			<sql:query var="result">
    					SELECT * FROM review;
    			</sql:query> 
    			<div class="table">
	    			Review:<br/>
	    			review_number; customer_number; item_code; rating; <br/><br/>
	    			<c:forEach var = "row" items = "${result.rows}">

	    				<c:out value = "${row.review_number}"/>;
	    				<c:out value = "${row.customer_number}"/>;
	    				<c:out value = "${row.item_code}"/>;
	    				<c:out value = "${row.rating}"/>;
	    				<br/>

	    			</c:forEach>
    			</div>

		</div>
			
		<jsp:include page="sections/footer.jsp" />

	</div>

</body>
</html> 
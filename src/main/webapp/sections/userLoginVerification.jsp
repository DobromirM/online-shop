<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<body>

		<sql:query var="result">
    		SELECT * FROM customer WHERE customer_number = <%=request.getParameter("num")%> AND passwd = MD5('<%=request.getParameter("pass")%>');
    	</sql:query>

    	<c:set var="name" scope="session" value="${result.rows[0].firstname}"/>
    	<c:set var="sur" scope="session" value="${result.rows[0].surname}"/>
    	<c:set var="number" scope="session" value="${result.rows[0].customer_number}"/>
    	<c:set var="isManager" scope="session" value="0"/>

    	<% if(session.getAttribute("name") == null)
		{%>
			<c:set var="isWrong" scope="session" value="1"/>
			<c:redirect url="../userLogin.jsp"/>
		<%
		}%>

		<c:set var="isWrong" scope="session" value="0"/>
		<c:redirect url="../index.jsp"/>

</body>
</html>


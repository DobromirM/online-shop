<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<body>

    	<c:set var="name" scope="session" value="${null}"/>
    	<c:set var="sur" scope="session" value="${null}"/>
    	<c:set var="number" scope="session" value="${null}"/>
    	<c:set var="isManager" scope="session" value="${null}"/>

		<c:redirect url="../index.jsp"/>

</body>
</html>
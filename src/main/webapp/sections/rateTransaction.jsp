<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<!DOCTYPE html>
<html>
<body>

        <% if(session.getAttribute("name") == null || session.getAttribute("isManager") == "1")
        {
        %> 
        <c:redirect url="../index.jsp"/>   
        <%
        }
        %>	

        <sql:query var="rated">
                SELECT * FROM review WHERE item_code ="<%= request.getParameter("item-code")%>" AND customer_number = "<%=session.getAttribute("number")%>";
        </sql:query>

        <c:set var="exist" value="${rated.rows[0].item_code}"/>

        <% if(pageContext.getAttribute("exist") == null) 
        {

            Integer fixRating = Integer.parseInt("5");

            if(request.getParameter("rating").toString().equals("1") || request.getParameter("rating").toString().equals("2") || request.getParameter("rating").toString().equals("3") || request.getParameter("rating").toString().equals("4") || request.getParameter("rating").toString().equals("5"))
            {
                fixRating = Integer.parseInt(request.getParameter("rating").toString());
            }

            if(fixRating < Integer.parseInt("1"))
            {
                fixRating = Integer.parseInt("1");
            }

            if(fixRating > Integer.parseInt("5"))
            {
                fixRating = Integer.parseInt("5");
            }


            String stringRating = String.valueOf(fixRating);
        %>

            <sql:update var="item">
                INSERT INTO review (customer_number, item_code, rating)
                VALUES("<%=session.getAttribute("number")%>", "<%=request.getParameter("item-code")%>", "<%=stringRating%>");
            </sql:update>

            <c:set var="transaction" scope="session" value="1"/>
            <c:redirect url="../rateSuccess.jsp"/>
        <%
        }
        %>

        <c:set var="transaction" scope="session" value="1"/>
        <c:redirect url="../rateFail.jsp"/>
       
</body>
</html>
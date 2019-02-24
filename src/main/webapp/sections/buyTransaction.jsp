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

        <%@ page import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat,java.util.Calendar" %>
		<sql:query var="result">
    		SELECT discount FROM promotion_code WHERE code = "<%=request.getParameter("code")%>";
    	</sql:query>

    	<sql:query var="item">
    		SELECT * FROM inventory WHERE item_code = "<%=request.getParameter("item-code")%>";
    	</sql:query>

    	<c:set var="discount" value="${result.rows[0].discount}"/>
        <c:set var="value" value="${item.rows[0].item_price}"/>
        <c:set var="stockCount" value="${item.rows[0].item_stock_count}"/>
        <c:set var="orderCount" value="${item.rows[0].item_order_count}"/>
    	

        <% if ((Integer)pageContext.getAttribute("stockCount") > 0) 
        {
        %>

            <%

                DateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
                Date curDate = new Date();

                Calendar c = Calendar.getInstance();
                c.setTime(curDate);
                c.add(Calendar.DATE, 3);
                String shipDate = df.format(c.getTime());

            %>

            <sql:update var="item">
                INSERT INTO customer_order (order_date, delivered, shipping_date, customer_number)
                VALUES("<%=df.format(curDate)%>", false, "<%=shipDate%>", "<%= session.getAttribute("number")%>");
            </sql:update>

            <sql:query var="order">
                SELECT * FROM customer_order WHERE order_date = "<%=df.format(curDate)%>" AND shipping_date = "<%=shipDate%>" AND customer_number = "<%= session.getAttribute("number")%>";
            </sql:query>

            <c:set var="orderNum" value="${order.rows[0].order_number}"/>

            <sql:update var="item">
                UPDATE inventory
                SET item_stock_count = <%=(int)pageContext.getAttribute("stockCount") - 1%> , item_order_count = <%=(int)pageContext.getAttribute("orderCount") + 1%>
                WHERE item_code = "<%=request.getParameter("item-code")%>"; 
            </sql:update>

            


        	<% if(pageContext.getAttribute("discount") == null)
    		{%>

                <sql:update var="item">
                    INSERT INTO order_item (item_code, value, order_number, quantity)
                    VALUES("<%=request.getParameter("item-code")%>", "<%=pageContext.getAttribute("value")%>", "<%=pageContext.getAttribute("orderNum")%>", 1);
                </sql:update>
                
                <c:set var="transaction" scope="session" value="1"/>
                <c:redirect url="../transactionSuccess.jsp"/>   
    		
    		<%
    		}else{

            Object discountValueObj = pageContext.getAttribute("value");
            Double discountValue = new Double(discountValueObj.toString());

            Integer discount = (Integer)pageContext.getAttribute("discount");

            Double test = Double.parseDouble(discount.toString(discount));

            discountValue = discountValue - (discountValue * (test / 100));

            %>

                <sql:update var="item">
                    INSERT INTO order_item (item_code, value, order_number, quantity)
                    VALUES("<%=request.getParameter("item-code")%>", "<%=discountValue%>", "<%=pageContext.getAttribute("orderNum")%>", 1);
                </sql:update>

                <c:set var="transaction" scope="session" value="1"/>
                <c:redirect url="../transactionSuccess.jsp"/>
            <%
            }
            %>
		
        <%
        }
        %>

        <c:set var="transaction" scope="session" value="1"/>
        <c:redirect url="../transactionFail.jsp"/>  

</body>
</html>
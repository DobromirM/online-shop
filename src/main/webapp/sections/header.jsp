<link rel="stylesheet" href="css/header.css">

<div class="header">
	<h1 class="header-title"> Welcome to our online shop 
		<% if(session.getAttribute("name") != null)
		{
			out.print(session.getAttribute("name")); %>! 
		<%
		}
		else
		{
			out.print("!");
		}
		%>
	</h1>

	<% if(session.getAttribute("name") != null)
	{
	%>
		<div class="header-nav">
			<a class="header-button" href="index.jsp">Home</a>
			<% if(session.getAttribute("isManager") == "1")
			{%>
			<a class="header-button" href="viewTables.jsp">View Tables</a>
			<%
			}
			%>
			<a class="header-button" href="sections/logout.jsp">Logout</a>
		</div>
	<%
	}
	else
	{%>
		<div class="header-nav">
			<a class="header-button" href="index.jsp">Home</a>
			<a class="header-button" href="userLogin.jsp">User Login</a>
			<a class="header-button" href="managerLogin.jsp">Manager Login</a>
		</div>
	<%
	}
	%>
</div> 
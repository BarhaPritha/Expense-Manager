<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("userid");
    String driver = "com.mysql.cj.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "bjit_db";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
	<title>Expense Manager</title>
	<link rel="icon" type="image/png" href="images/calculator.png">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="fontawesome-free-6.4.0-web\css\all.min.css">
    <link rel="stylesheet" href="fontawesome-free-6.4.0-web\js\all.min.js">

      <style>
        th, td {
            border: 1px solid black;
            padding: 2px 10px;
            height: 50px;
        }

        table {
            border: 3px solid black;
        }

        th {
            border-bottom: 2px solid black;
            font-size: 20px;
            background-color: #ACBCCC;
        }

        a i:hover{
            font-size:larger;
        }

        @media only screen and (min-width: 800px) {
            table {
                width:100%;
            }
        }

    </style>

</head>

<body>

    <nav class="navbar navbar-expand-lg justify-content-center fixed-top navbar-dark mb-5 p-3 pr-5 pl-5" style="background-color:rgb(35, 44, 81);">
        <a class="navbar-brand ml-4" style="font-size:25px; font-weight:600;" href="#">
            <img src="images/calculator.png" height="40" class="d-inline-block align-top" > &nbsp; Expense Manager</a>
        <button class="navbar-toggler ml-auto mt-3" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNavAltMarkup">
          <div class="navbar-nav" style="font-size:18px;">
            <a class="nav-link pl-4 pr-4" href="index.jsp">Insert Expense</a>
            <a class="nav-link active pl-4 pr-4" href="retrieve.jsp">See all Expenses <span class="sr-only">(current)</span></a>
          </div>
        </div>
    </nav>

   <div class="container mt-5 pt-5 pb-5">

       <br><br> <h2 style="text-align: center;">Expenses</h2> <br>

       <div class="row" style="min-height:550px; overflow-x:auto;">

        <table>

            <tr>
                <th>Category</th>
                <th>Date</th>
                <th>Name</th>
                <th>Description</th>
                <th>Amount</th>
            </tr>

            <%
            try{
            double sum = 0;
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            String sql ="select * from expense order by date desc";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                sum = sum + resultSet.getDouble("amount");
            %>

            <tr>
                <td><%=resultSet.getString("category") %></td>
                <td><%=resultSet.getString("date") %></td>
                <td><%=resultSet.getString("name") %></td>
                <td><%=resultSet.getString("description") %></td>
                <td style="text-align:right;"><%=resultSet.getString("amount") %></td>
            </tr>


            <%
            }
            %>
            <tr style="font-weight:600; font-size:18px; border-top:2px solid black; background-color:rgb(210, 250, 200);">
                <td colspan="4" style="text-align:right; border-left:none; border-right:none">Total expense amount: </td>
                <td style="text-align:right; border-left:none;"><%=sum %></td>
            </tr>
            <%
            connection.close();
            } catch (Exception e) {
            e.printStackTrace();
            }
            %>

         </table>
        </div>
    </div>

	<footer class="text-center mt-4 sticky-bottom" style="color:white; background-color:rgb(35, 44, 81);">
	    <br>
	    <p style="font-size:20px;">Barha Meherun Pritha</p>
	    <p>&copy; <a href="https://bjitgroup.com/" style="">BJIT Group</a> 2023 | All rights reserved.</p>
	    <a href="#" style="color:white;"><i class="fa-brands fa-facebook"></i></a> &nbsp; &nbsp;
	    <a href="#" style="color:white;"><i class="fa-brands fa-instagram"></i></a> &nbsp; &nbsp;
	    <a href="#" style="color:white;"><i class="fa-brands fa-youtube"></i></a> &nbsp; &nbsp;
	    <a href="#" style="color:white;"><i class="fa-brands fa-github"></i></a> &nbsp; &nbsp;
	    <a href="#" style="color:white;"><i class="fa-brands fa-linkedin"></i></a>
	    <br><br>
	</footer>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
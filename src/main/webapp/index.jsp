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
        a i:hover{
            font-size:larger;
        }

        .btn{
            border:1px solid navy;
            color: navy;
            font-weight:600;
        }

        .form-control{
            border: 1px solid grey;
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
            <a class="nav-link active pl-4 pr-4" href="index.jsp">Insert Expense <span class="sr-only">(current)</span></a>
            <a class="nav-link pl-4 pr-4" href="retrieve.jsp">See all Expenses</a>
          </div>
        </div>
    </nav>

    <div class="container mt-5 pt-5 pb-5">

        <br><br> <h2 style="text-align:center;">Insert Expense</h2> <br>

        <p style="text-align:center;">The current date and time is: <%= new java.util.Date() %></p>

        <form action="processForm.jsp" class="row justify-content-center" method="post">

            <div style="border:1px solid black; border-radius:20px; color:black; background-color:rgb(210, 250, 200); background-image: linear-gradient(to bottom right,rgba(255,255,255,0.2),rgba(0,0,200,0.2)); box-shadow:5px 5px 10px grey;" class="col-md-9 m-4 p-5">

                <div class="form-row justify-content-center">
                    <div class="form-group col-md-6">
                        <label for="category">Expense Category:</label>
                        <select id="category" name="category" type="text" class="form-control" required>
                           <option value="Transportation" selected>Transportation</option>
                           <option value="Food">Food</option>
                           <option value="Fees">Fees</option>
                           <option value="Bills">Bills</option>
                           <option value="Entertainment">Entertainment</option>
                        </select>
                        <br>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="date">Date:</label>
                        <input class="form-control" value="<%=new java.util.Date()%>" type="date" id="date" name="date" required />
                        <br> <br>
                    </div>
                </div>

                <div class="form-row justify-content-center">
                    <div class="form-group col-md-6">
                        <label for="name">Expense Name:</label>
                        <input class="form-control" type="text" id="name" name="name" required />
                        <br>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="amount">Amount:</label>
                        <input class="form-control" type="number" min="0" value="0" step="0.01" id="amount" name="amount" required />
                        <br>
                    </div>
                </div>

                <div class="form-row justify-content-center">
                    <div class="form-group col-md-12">
                        <label for="description">Description:</label>
                        <textarea class="form-control" type="text" id="description" name="description" rows="2" required ></textarea>
                        <br>
                    </div>
                </div>

                <div class="text-center">
                    <input class="btn btn-outline-dark" type="submit" value="Submit" />
                </div>

            </div>
        </form>

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
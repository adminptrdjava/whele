<%@page import="Model.Bean.User"%>
<!DOCTYPE html>
<html>
	<head>
		<title> Admin 3.0</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="library/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<!-- Kuta -->		
		<link href="library/css/styles.css" rel="stylesheet" media="screen">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="library/bootstrap/assets/js/html5shiv.js"></script>
		<script src="library/bootstrap/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
    
    <% User usr = (User)session.getAttribute("usr");
    System.out.print("on page :"+usr);
    int L = Integer.parseInt(usr.getLevel());
%>
    
	<body>
		<!-- top header navbar -->
		<nav class="navbar navbar-top-header hidden-xs" role="navigation">
			<div class="navbar-header">
				<img class="logo" src="sample-images/" />
			</div>
			
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder=".....">
				</div>
				<button type="submit" class="btn btn-no-rc btn-v">Search</button>
			</form>
			
			<ul class="nav navbar-nav navbar-left">
				<li><a href="#"><i class="icon-earth"></i></a></li>
				<li><a href="#"><i class="icon-email"></i></a></li>
				<li><a href="#"><i class="icon-settings-2"></i></a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-user-6"></i>
					</a>
					
					<ul class="dropdown-menu dropdown-user-account">
					
						<li class="account-img-container">
							<img class="thumb account-img" src="sample-images/">
						</li>
						
						<li class="account-info">
							<h3><%=usr.getUid()%></h3>
							<p>USER DETAILS.</p>
							<p>
								<a href="#">Edit</a> | <a href="#">Account Settings</a>
							</p>
						</li>
						
						<li class="account-footer">
							<a class="btn btn-sm btn-primary btn-flat" href="#">Change avatar</a>
							<a class="btn btn-sm btn-danger btn-flat" href="index.jsp">Logout</a>
						</li>
						
					</ul>
				</li>
			</ul>
		</nav>
		<!-- ./ top header navbar -->
		
		<div id="main_wrapper">
                   
                            <div id="main_content">
                                
                                
                                
                               <!---  WRITE UR CONTENT HERE :)     --->
                                <h3> HI HI </h3>
                                
                            </div>
                       <!-- sidebar -->
			<ul id="sidebar" class="nav nav-pills nav-stacked">
				<li class="avatar">
					<a href="#">
					</a>
				</li>
				<li class="active">
					<a href="Main.jsp">
						<i class="icon-home-3"></i>
						<span>Dashboard</span>
					</a>
				</li>
                 <% if(L==0||L==1){ %>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-params"></i>
						<span>UI</span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> User Creation
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> Credit Set
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> Report
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> GAME PLAN
						  </a>
						</li>
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> Dropdowns
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> Tabs
							</a>
						</li>
						<li>
							<a href="breadcrumbs-paginations.html">
								<i class="icon-stack-3"></i> Breadcrums &amp; Paginations
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> Alerts &amp; Progress Bars
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon-stack-3"></i> Panels
							</a>
						</li>
					</ul>
				</li>
				<li>
					
			  </li>
              <%} else {%>
              
				<li><a href="beading.jsp">
						<i class="icon-bars-3"></i>
						<span>Play</span>
					</a>
                    
                </li>
                <li>
                <a href="#">
						<i class="icon-bars-3"></i>
						<span>USER DETAILS</span>
					</a>
                
                </li>
                <%}%>
			</ul>
			<!-- ./ sidebar -->
		</div>
	
		<!-- base -->
		<script src="library/js/jquery.js"></script>
		<script src="library/js/jquery-migrate-1.2.1.js"></script>
		<script src="library/bootstrap/dist/js/bootstrap.min.js"></script>	

		<!-- addons -->
		<script src="library/plugins/moment.min.js"></script>
		<script src="library/plugins/chart-plugins.js"></script>
		<script src="library/plugins/redactor/redactor.min.js"></script>
		<script src="library/plugins/jquery.nice-file-input.js"></script>
		<script src="library/plugins/selectize.min.js"></script>
		<script src="library/plugins/jquery.icheck.min.js"></script>
		<script src="library/plugins/ion.rangeSlider.min.js"></script>
		<script src="library/plugins/pikaday.js"></script>
		<script src="library/plugins/pikaday.jquery.js"></script>
		<script src="library/js/loader.js"></script>
		
	</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="Service.Getvv"%>
<%@page import="Model.Bean.User"%>
<!DOCTYPE html>

<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% User usr = (User)session.getAttribute("usr");
    System.out.print("on page :"+usr);
    int L = Integer.parseInt(usr.getLevel());
%>
<script>
    
    function initElement() {
  var p = document.getElementById("ibutton");
  p.onclick = showAlert;
    }
  function showAlert() {
  alert("onclick Event detected!");
}
    //var timer0 = setInterval("main_init()",3000);
    var timer = setInterval("normal_set()",30000);
    
     function main_init(){
         
      //  $(document).ready(function() {
    
     //var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "TestTing",
     //type: "post",
     //data: value,
     cache: false,
     success: function(data) {
     //$("#BidVal").val('');
     $("#scrp").add(data);//append(data);
     }
     });
//});

load_whlIns();
     };
     
     function set_bd(){
         
      //  $(document).ready(function() {
    
     //var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "SetBd",
     //type: "post",
     //data: value,
     cache: false,
     success: function(data) {
     //$("#BidVal").val('');
     $("#scrp").html(data);
     }
     });
 }

</script>
<div id="scrp"></div> 

<script>
     
   function normal_set(){
       set_bd();
       load_whl();
   }
    
    
      function load_whl(){window.location.replace("whele.jsp"); document.getElementById("content").innerHTML='<object type="type/html" data="whele.jsp" ></object>';
            window.clearTimeout();
  }
  
  $(document).ready(function(e) {
   
});
 $(document).ready(function() {
	 var uid= '<%=usr.getUid() %>';
	 var coin ;
	  $('#v10').click( function(e){
		coin = '10';
		 alert("CALL" +coin+ 'USER: '+uid);
		
	});
	
	 $('#v20').click( function(e){
		coin = '20';
		 alert("CALL" +coin);
		
	});
	 $('#v50').click( function(e){
		coin = '50';
		 alert("CALL" +coin);
		
	});
	
	 $('#v100').click( function(e){
		coin = '100';
		 alert("CALL" +coin);
		
	});
	
	
	 $('#v500').click( function(e){
		coin = '500';
		 alert("CALL" +coin);
		
	});
     $('#ibutton').click(function(e) {
     e.preventDefault();
     var ajaxdata = $("#BidVal").val();
     var ajxuid=uid;
     var ajxcoin=coin;
     var value ='BidVal='+ajaxdata+'&uid='+ajxuid+'&mony='+ajxcoin ;
 
     $.ajax({
     url: "BookBid",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
     $("#BidVal").val('');
     $("#message").append(("<br> <b> SELECTED NO: "),data,("<b> BID VALUE "),coin,("<b> INR"));
     }
     });
});
});

function  click(){
    alert("CALL");
}
 


</script>
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
                                <div class="panel panel-default">
                              <div class="panel-heading">
                                <h4 class="panel-title"> BOOK YOUR BID NOW</h4>
                                
                                <form name="form1" id="form1" action="BookBid" method="" >
        <select name="BidVal"  id="BidVal">
            <option>0</option>
             <option>1</option> 
             <option>2</option>
             <option>3</option>
              <option>4</option>
               <option>5</option>
                <option>6</option>
                 <option>7</option>
                  <option>8</option>
                   <option>9</option>
        </select>
        <input type="button" id="ibutton" value="BOOK"  class="icon-loop-2" />
        <label id="result" value=""/>
        
        </form>
                              </div>
                            
                            <div id="panel panel-default">
    <div id ="message"style=""> </div>
        </div>
        </div>
        
        
        <div id="panel panel-default">
    
          <div class="panel-heading">
          <div class="panel-heading">
          <h3 class="panel-title">SELECT BID VALUE</h3></div>
          <ul class="icon-list">
          
          <table class="table">
          <tr>
          <td><li id="v10"><img src="coins/10a.png" width="100" height="100"></li></td>
          <td><li id="v20" onClick=""><img src="coins/20.png" width="100" height="100"></li></td>
          <td><li id="v50"><img src="coins/50.png" width="100" height="100"></li></td>
          <td><li id="v100"><img src="coins/100.png" width="100" height="100"></li></td>
          <td><li id="v500"><img src="coins/500.png" width="100" height="100"></li><td>
          </table>
          </ul>
          </div>
       </div>
            <div class="panel panel-default">
	          <div class="panel-heading">
			<h3 class="panel-title">LAST 5 RESULT </h3>
                         <table class="table">
                             <thead>
                                 <tr>
                                     <th>NO</th>
                                     <th>DATE</th>
                                 </tr>
                             </thead>
                        <% Getvv gv = new Getvv();
                         ResultSet rs = gv.last5show(usr.getUid());
                                 if(rs!=null){
                                     while(rs.next()){
                                         %>
                                        
                                         <tr><td><%=rs.getString("win_no") %></td>
                                             <td><%=rs.getString("date") %></td>
                                         </tr>
                                         
                                    <% }
                                 }
                                    %>
                         </table>
                    </div>
            </div>

     </div>
                                
                                
                               <!---  WRITE UR CONTENT HERE :)     --->
                              <h1> HI HI </h1>
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
              
				<li><a href="#">
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
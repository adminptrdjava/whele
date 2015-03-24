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
                               <%@page import="Service.Getvv"%>
<!--[if IE]><script type="text/javascript" src="/sites/default/files/1010/source/excanvas.js"></script><![endif]-->
<script src="js.js" type="text/javascript"></script>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<audio controls>
    <source id="FF" src="rw.wav" type="audio/wav">
    
</audio>
<% Getvv gv = new Getvv();

int i = gv.getMaxval();

gv.setResult(Integer.toString(i));
%>
<script>
var timer = setInterval("mytimer()",600);
seconds = 0;
function mytimer()
{
 // this is the same as $("div_timer").html(timer) in       jquery.
seconds++;
if(seconds < 3)
    document.getElementById("div_timer").innerHTML = 'TIME: '+seconds;
if(seconds===3){
      
    spin(<%=i%>);
	
    window.clearTimeout();
    document.getElementById("div_timer").innerHTML = 'DONE';
    document.getElementById("msg").innerHTML = '<h3 class="panel-title"> NO <%=i%> WIN </h3>';
}
if(seconds===40){
  //  alert("call");
  // main_init();
     load_whl();
     
}

}

function main_init(){
         
      //  $(document).ready(function() {
    
     //var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "ResetBd",
     //type: "post",
     //data: value,
     cache: false,
     success: function(data) {
     //$("#BidVal").val('');
     $("#scrp").html(data);
     }
     });
 }
     //////////////////////////////////
 function load_whl(){window.location.replace("beading.jsp"); document.getElementById("content").innerHTML='<object type="type/html" data="whele.jsp" ></object>';
            window.clearTimeout();
           
        }
        
        </script>
        <div class="panel-heading" id="div_timer"></div> 
        <div id="msg" class="panel-heading"> </div>  
<form action="Getval">
<input type="button" value="spin" onClick="spin(<%=i%>);" style="float: left;" />
</form>
<canvas id="wheelcanvas" width="500" height="500"></canvas>

<script type="application/javascript">
  var colors = ["#B8D430", "#3AB745", "#029990", "#3501CB",
               "#2E2C75", "#673A7E", "#CC0071", "#F80120",
               "#F35B20", "#FB9A00", ];
  var restaraunts = ["3", "4", "5", "6",
                     "7", "8", "9", "0",
                     "1", "2" ];
  
  var startAngle = 0;
  var arc = Math.PI / 5;
  var spinTimeout = null;
  
  var spinArcStart = 10;
  var spinTime = 0;
  var spinTimeTotal = 0;
  
  var ctx;
  
  function draw() {
    drawRouletteWheel();
  }
  
  function drawRouletteWheel() {
    var canvas = document.getElementById("wheelcanvas");
    if (canvas.getContext) {
      var outsideRadius = 200;
      var textRadius = 160;
      var insideRadius = 125;
      
      ctx = canvas.getContext("2d");
      ctx.clearRect(0,0,500,500);
      
      
      ctx.strokeStyle = "black";
      ctx.lineWidth = 2;
      
      ctx.font = 'bold 12px sans-serif';
      
      for(var i = 0; i < 10; i++) {
        var angle = startAngle + i * arc;
        ctx.fillStyle = colors[i];
        
        ctx.beginPath();
        ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
        ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
        ctx.stroke();
        ctx.fill();
        
        ctx.save();
        ctx.shadowOffsetX = -1;
        ctx.shadowOffsetY = -1;
        ctx.shadowBlur    = 0;
        ctx.shadowColor   = "rgb(220,220,220)";
        ctx.fillStyle = "black";
        ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius, 250 + Math.sin(angle + arc / 2) * textRadius);
        ctx.rotate(angle + arc / 2 + Math.PI / 2);
        var text = restaraunts[i];
        ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
        ctx.restore();
      } 
      
      //Arrow
      ctx.fillStyle = "black";
      ctx.beginPath();
      ctx.moveTo(250 - 4, 250 - (outsideRadius + 5));
      ctx.lineTo(250 + 4, 250 - (outsideRadius + 5));
      ctx.lineTo(250 + 4, 250 - (outsideRadius - 5));
      ctx.lineTo(250 + 9, 250 - (outsideRadius - 5));
      ctx.lineTo(250 + 0, 250 - (outsideRadius - 13));
      ctx.lineTo(250 - 9, 250 - (outsideRadius - 5));
      ctx.lineTo(250 - 4, 250 - (outsideRadius - 5));
      ctx.lineTo(250 - 4, 250 - (outsideRadius + 5));
      ctx.fill();
    }
  }
  
 
  draw();
  
  
  
  
            

</script>
                               
                      
                               
                               
                                
                                
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
        
        
    <%gv.bidToZero();%>
</html>
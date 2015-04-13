<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>
</head>
 <%@page import="Service.Getvv"%>
<% Getvv gv = new Getvv();

int i = gv.getMaxval();

gv.setResult(Integer.toString(i));
%>
<script src="js.js" type="text/javascript"></script>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
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
<body bgcolor="#000000">

<center>
<div>
    <input type="button" value="spin" onclick="spin(<%=i%>);" style="float: left;" />
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
      
      
      ctx.strokeStyle = "blue";
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
      ctx.fillStyle = "magenta";
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
<div>


</div>


</center>
</body>
<%gv.bidToZero();%>
</html>

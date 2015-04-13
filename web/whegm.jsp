<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css2/style.css" rel="stylesheet" type="text/css" />
<%@page import="Service.Getvv"%>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<% Getvv gv = new Getvv();

int i = gv.getMaxval();

gv.setResult(i);
%>
<script src="js/js.js" type="text/javascript"></script>
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
 function load_whl(){window.location.replace("bead.jsp"); document.getElementById("content").innerHTML='<object type="type/html" data="whele.jsp" ></object>';
            window.clearTimeout();
           
        }
    
  
        </script>
</head>

<body>
<section class="wraper">
<section class="topleft">
<blockquote class="play">
<form action="" method="get">
<div class="playt">Play</div>
<input name="" type="text" class="playtb text-gap" />
<div class="clear"></div>
<div class="playt">Win</div>
<input name="" type="text" class="playtb" />
<div class="clear"></div>
</form>
</blockquote>

<blockquote class="history">history</blockquote>
<blockquote class="history-bt">
<dd class="hist1">NA</dd>
<dd class="hist2">NA</dd>
<dd class="hist3">NA</dd>
<dd class="hist4">NA</dd>
<div class="clear"></div>
</blockquote>
</section>
<section class="top-mid">
<div>
    <input type="button" value="spin" onclick="spin(<%=i%>);" style="float: left;" />
<canvas id="wheelcanvas" width="250" height="320"></canvas>
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
      var outsideRadius = 100;
      var textRadius = 70;
      var insideRadius = 50;
      
      ctx = canvas.getContext("2d");
      ctx.clearRect(0,0,250,250);
      
      
      ctx.strokeStyle = "blue";
      ctx.lineWidth = 2;
      
      ctx.font = 'bold 14px sans-serif';
      
      for(var i = 0; i < 10; i++) {
        var angle = startAngle + i * arc;
        ctx.fillStyle = colors[i];
        
        ctx.beginPath();
        ctx.arc(125, 125, outsideRadius, angle, angle + arc, false);
        ctx.arc(125, 125, insideRadius, angle + arc, angle, true);
        ctx.stroke();
        ctx.fill();
        
        ctx.save();
        ctx.shadowOffsetX = -1;
        ctx.shadowOffsetY = -1;
        ctx.shadowBlur    = 0;
        ctx.shadowColor   = "rgb(220,220,220)";
        ctx.fillStyle = "black";
        ctx.translate(125 + Math.cos(angle + arc / 2) * textRadius, 125 + Math.sin(angle + arc / 2) * textRadius);
        ctx.rotate(angle + arc / 2 + Math.PI / 2);
        var text = restaraunts[i];
        ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
        ctx.restore();
      } 
      
      //Arrow
      ctx.fillStyle = "magenta";
      ctx.beginPath();
      ctx.moveTo(125 - 4, 125 - (outsideRadius + 5));
      ctx.lineTo(125 + 4, 125 - (outsideRadius + 5));
      ctx.lineTo(125 + 4, 125 - (outsideRadius - 5));
      ctx.lineTo(125 + 9, 125 - (outsideRadius - 5));
      ctx.lineTo(125 + 0, 125 - (outsideRadius - 13));
      ctx.lineTo(125 - 9, 125 - (outsideRadius - 5));
      ctx.lineTo(125 - 4, 125 - (outsideRadius - 5));
      ctx.lineTo(125 - 4, 125 - (outsideRadius + 5));
      ctx.fill();
    }
  }
  
  
  
  draw();
</script>

</div>
</section>
<div class="clear"></div>

<blockquote class="number-box">
<ul>
<li class="zero" id="N0">0</li>
<li class="one" id="N1">1</li>
<li class="two" id="N2">2</li>
<li class="three" id="N3">3</li>
<li class="four" id="N4">4</li>
<li class="five" id="N5">5</li>
<li class="six" id="N6">6</li>
<li class="seven" id="N7">7</li>
<li class="eight" id="N8">8</li>
<li class="nine" id="N9">9</li>
<div class="clear"></div>
</ul>
</blockquote>

<blockquote class="nm-bt">
<dd class="nm-btn1" id ="message1">NA</dd>
<dd class="nm-btn2" id ="message2">NA</dd>
<dd class="nm-btn3" id ="message3">NA</dd>
<dd class="nm-btn4"id ="message4">NA</dd>
<dd class="nm-btn5"id ="message5">NA</dd>
<dd class="nm-btn6" id ="message6">NA</dd>
<dd class="nm-btn7"id ="message7">NA</dd>
<dd class="nm-btn8"id ="message8">NA</dd>
<dd class="nm-btn9"id ="message9">NA</dd>
<dd class="nm-btn0">NA</dd>
<div class="clear"></div>
</blockquote>
<div class="clear"></div>

<section class="numb-bt">
<a href="#" class="two-bt" id="v10"></a>
<a href="#" class="five-bt" id="v20"></a>
<a href="#" class="ten-bt" id="v50"></a>
<a href="#" class="twenty-bt" id="v100"></a>
<a href="#" class="fifty-bt"id="v200"></a>
<a href="#" class="twenty-bt"id="v500"></a>
<div class="clear"></div>
</section>

<section class="bt-por">
<a href="#" class="info"></a>
<a href="#" class="clearbt"></a>
<a href="#" class="recent"></a>
<a href="#" class="duble"></a>
<a href="#" class="bet" id="ibutton"></a>
<div class="clear"></div>
</section>

<div class="clear"></div>
</section>
</body>
</html>

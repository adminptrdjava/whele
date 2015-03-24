<%-- 
    Document   : admin.jsp
    Created on : 15 Mar, 2015, 1:54:38 PM
    Author     : Swarnendu
--%>
<%@page import="Service.Getvv"%>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<script>
    var p = document.getElementById("ibutton");
$(document).ready(function() {
     $('#ibutton').click(function(e) {
     e.preventDefault();
     var ajaxdata = $("#gp").val();
     var value ='gp='+ajaxdata;
 
     $.ajax({
     url: "GamePlane",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
     $("#gp").val('');
     $("#message").html(data);
     }
     });
});
});

$(document).ready(function() {
     $('#bt2').click(function(e) {
     e.preventDefault();
    // var ajaxdata = $("#gp").val();
     //var value ='gp='+ajaxdata;
 
     $.ajax({
     url: "DeleteAll",
     //type: "post",
    // data: value,
     cache: false,
     success: function(data) {
    // $("#BidVal").val('');
     $("#msg2").html(data);
     }
     });
});
});
</script>

<% Getvv gv = new Getvv(); 
 String p =gv.getGPS();
 
%>
<center >
    <div style="background-color: cornsilk; border-color: crimson">
        <br>
        <br>
<h4 style="color: brown">GAME PLAN & SETINGS </h4>
<form action="GamePlane" >
    <select name="gp" id="gp">
        <option>MAX</option>
        <option>MIN</option>
        <option>AVARAGE</option>
    </select>
    
    <input type="button" id="ibutton" value="submit"/>
</form>
<div id="message">
    <h5 style="color: blueviolet">  YOUR PRESENT STATUS:  <%= p %> </h5>
</div>
<h5 style="color: red">CLICK BELLOW TO DELETE ALL BID DATA </h5>
<form action="">
    <input id="bt2"type="button"value="CLEAR ALL DATA"/>
</form>
<div id="msg2"></div>
<br>
<br>
<br>
    </div>
</center>
<%-- 
    Document   : beading
    Created on : 15 Mar, 2015, 3:57:33 PM
    Author     : Swarnendu
--%>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    
    function initElement() {
  var p = document.getElementById("ibutton");
  p.onclick = showAlert;
    }
  function showAlert() {
  alert("onclick Event detected!");
}
    
    var timer = setInterval("load_whl()",300000);
      function load_whl(){window.location.replace("whele.jsp"); document.getElementById("content").innerHTML='<object type="type/html" data="whele.jsp" ></object>';
            window.clearTimeout();
  }
  
  
 $(document).ready(function() {
     $('#ibutton').click(function(e) {
     e.preventDefault();
     var ajaxdata = $("#BidVal").val();
     var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "BookBid",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
     $("#BidVal").val('');
     $("#message").html(data);
     }
     });
});
});

function  click(){
    alert("CALL");
}
 


</script>
<h1> BOOK YOUR NO NOW </h1>
<div style="width: 50%;
    margin: 0 auto;;">
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
        <input type="button" id="ibutton" value="BOOK"/>
        <label id="result" value=""/>
    </form>     
    
    
</div>

<div id ="message"style=""> 

</div>
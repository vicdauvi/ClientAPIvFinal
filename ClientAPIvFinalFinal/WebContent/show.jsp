<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta charset="ISO-8859-1">
<title>Calcul Distance</title>
</head>
<body>

	<%
		String ville1 = request.getSession().getAttribute("ville1").toString();
	%>
	<%
		String ville2 = request.getSession().getAttribute("ville2").toString();
	%>
	<form method="post" action="CalculServlet">
		<input type="hidden" id="ville1_session" value=<%=ville1%> /> <input
			type="hidden" id="ville2_session" value=<%=ville2%> />
		<%=ville1%>
		<%=ville2%>
		<br> Ville 1 : <span id="ville1id"></span><br> Latitude 1 :<span
			id="ville1latitude"></span><br> Longitude 1 :<span
			id="ville1longitude"></span><br> Ville 2 : <span id="ville2id"></span><br>
		Latitude 2 :<span id="ville2latitude"></span><br> Longitude 2 :<span
			id="ville2longitude"></span><br> <input type="hidden"
			name="lat1" id="lat1" /> <input type="hidden" name="lng1" id="lng1" />
		<input type="hidden" name="lat2" id="lat2" /> <input type="hidden"
			name="lng2" id="lng2" /> <input type="submit"
			name="calculerLaDistance" />
	</form>

	<script type="text/javascript"> 
var request = new XMLHttpRequest() 
var ville1 = document.getElementById("ville1_session").value 
var ville2 = document.getElementById("ville2_session").value

function trouverVille(ville,id,latitude, longitude,hiddenLatitude, hiddenLongitude){
	 request.open('GET', 'http://localhost:8181/getville?value='+ ville, true)
     request.onload = function() {
		 var data = JSON.parse(this.response)
		  if (request.status>= 200 && request.status < 400) {
			  data.forEach(ville => {
                  console.log(ville.nom)
                  console.log(ville.latitude)
                  console.log(ville.longitude)
                  var variable = ville.nom
                  document.getElementById(id).textContent = variable
                  document.getElementById(latitude).textContent = ville.latitude
                  document.getElementById(longitude).textContent = ville.longitude 
                  document.getElementById(hiddenLatitude).value=ville.latitude; 
                  document.getElementById(hiddenLongitude).value=ville.longitude; 
			  })
			  
		  } else{
			  console.log('error');
		  }
	 }
	 request.send(); 
}

trouverVille(ville1,"ville1id","ville1latitude","ville1longitude","lat1","lng1");
setTimeout(function(){
	trouverVille(ville2,"ville2id","ville2latitude","ville2longitude","lat2","lng2");
},1000)



</script>
</body>
</html>
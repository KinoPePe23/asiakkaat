<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
table, td, th {
  border: 1px solid #E8E8E8;
}

table {
  width: 40%;
  border-collapse: collapse;
}

.hakusana{
text-align: right
}

.hakunappi{
text-align: left
}

th {
  height: 50px;
  background-color: #228B22;
  color: white; 
}

td {
  height: 30px;
  text-align: left;
}

tr:nth-child(even) {background-color: #f2f2f2;}
tr:nth-child(even) {text-align: left}


</style>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/table.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<table id="listaus">
	<thead>	
		<tr>
			<th colspan="2" class="hakusana">Hakusana:</th>
			<th colspan="1"><input type="text" id="hakusana"></th>
			<th class="hakunappi"><input type="button" value="hae" id="hakunappi"></th>
		</tr>	
			
		<tr>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sposti</th>							
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>

<script>
$(document).ready(function(){
	
	haeAsiakkaat();
	$("#hakunappi").click(function(){		
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event){
		  if(event.which==13){ 
			  haeAsiakkaat();
		  }
	});
	$("#hakusana").focus();
});	

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>"; 
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
}

</script>
</body>
</html>
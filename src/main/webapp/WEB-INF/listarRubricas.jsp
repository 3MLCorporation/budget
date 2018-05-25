<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div>
	<div class="container">
		<h2>Rubricas cadastradas</h2>
		<input class="form-control" id="myInput" type="text" placeholder="Pesquisar...">
		<table class="table table-sm">
	    	<thead class="thead-dark">
	      		<tr>
	        		<th>Categoria</th>
	        		<th>Rubrica</th>
	        		<th>Valor</th>
	        		<th>Valor Parcial</th>
	        		<th>Excluir</th>
	      		</tr>
	    	</thead>
	    	<tbody id="myTable">
	        	<c:forEach items="${rubricasMaps}" var="rubricaMap">
					<tr>
						<td> ${rubricaMap.nomeCategoria}</td>
						<td> ${rubricaMap.rubrica.nome}</td>
						<td> ${rubricaMap.rubrica.valorTotal}</td>
						<td> ${rubricaMap.rubrica.valorParcial}</td>
						<td style="width: 16%">
							<form action="excluirRubrica" method="POST">
								<input type="hidden" class="form-control" value="${rubricaMap.rubrica.id}" name="rubrica_id">
								<button type="submit" class="btn btn-link"><img src="../img/excluir.png" alt="Logo" style="width:100%;"> </button>
				           	</form>	
   						</td>
					</tr>
				</c:forEach>
		   	</tbody>
	  	</table>
	  </div>
</div>

<script>
	$(document).ready(function(){
		$("#myInput").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#myTable tr").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
</script>
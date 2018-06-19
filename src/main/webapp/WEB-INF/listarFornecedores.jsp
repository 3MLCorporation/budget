<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div>     
   	<div class="card mb-3">
   	    <div class="card-header">
        	<i class="fa fa-area-chart"></i> Fornecedores cadastradas
        </div>
	   	<div class="card-body">
		   	<div class="table-responsive">
	            <table class="table table-bordered" id="dataTable">
			   		<thead>
			   			<tr>
		        			<th>Fornecedor</th>
		        			<th>CNPJ</th>
		        			<th>UF</th>
		        			<th>Editar fornecedor</th>
      					</tr>
			   		</thead>
			   		<tbody id="myTable">
		        		<c:forEach items="${categorias}" var="categoria">
							<tr>
								<td> ${fornecedor.nome}</td>
								<td> ${fornecedor.cnpj}</td>
								<td> ${fornecedor.uf}</td>
								<td>
									<div class="btn-group">
										<form action="atualizarFornecedor" method="GET">
											<input type="hidden" class="form-control" value="${fornecedor.id}" name="fornecedorId">												
											<button type="submit" class="btn btn-link"><img src="../img/atualizar.png" alt="Logo"></button>
										</form>
							           												
										<form action="excluirFornecedor" method="POST">
											<input type="hidden" class="form-control" value="${fornecedor.id}" name="fornecedor_id">
											<button type="submit" class="btn btn-link"><img src="../img/excluir.png" alt="Logo"></button>
							           	</form>
						            </div>
		   						</td>
							</tr>
						</c:forEach>
			   	 	</tbody>
			  	</table>
		  	</div>
	  	</div>
  	</div>
</div>
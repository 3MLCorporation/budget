<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div>
   	<div class="card mb-3">
   		<div class="card-header">
        	<i class="fa fa-area-chart"></i> Atualizar fornecedor
        </div>

	   	<div class="card-body">
		   	<form action="atualizarFornecedor" method="POST">
		  		<div class="form-group">
		       	   <label for="text">Nome de fantasia:</label> <input type="text"
		        	class="form-control" placeholder="Fornecer o novo nome de fantasia" value="${fornecedor.nomeFantasia }"
		       	   name="nomeFantasia">
		      	</div>
		      	<div class="form-group">
		       	   <label for="text">Razão social:</label> <input type="text"
		        	class="form-control" placeholder="Fornecer a nova razão social" value="${fornecedor.razaoSocial }"
		       	   name="razaoSocial">
		      	</div>
		      <div class="form-group">
		           <label for="text">CNPJ:</label> <input type="number"
		           class="form-control" placeholder="Fornecer o novo cnpj do fornecedor"  value="${fornecedor.cnpj }"
		           name="cnpj">
		       </div>
		      <div class="form-group">
		           <label for="text">UF:</label> 
			       <select class="form-control" name="uf">
			         <c:forEach items="${ufs}" var="uf">
			            <option value="${uf}" ${fornecedor.uf == uf ? 'selected' : ''}>${uf}</option>
			          </c:forEach>
			       </select>		           
		       </div>		
		       <input type="hidden" class="form-control" value="${fornecedor.id}" name="fornecedorId">       
		      <button type="submit" class="btn btn-dark botaoCadastro" title="Atualizar fornecedor">Atualizar</button>
		  	</form>
	  	</div>
  	</div>
</div>
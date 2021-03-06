<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<div>
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <c:if test="${not empty orcamentoSelecionado}">
            <a href="">
        ${orcamentoSelecionado}
            </a>
          </c:if>
        </li>
        <c:if test="${sessionScope.usuario.perfil == 0 || sessionScope.usuario.perfil == 1 }"><!--PERFIL_ADMIN || PERFIL_GERENTE-->
          <li class="breadcrumb-item active">
            <a href="/listarProjetos">Projeto</a>
          </li>
        </c:if>
        <li class="breadcrumb-item active">
          <a href="/listarOrcamentos">Orçamento</a>
        </li>
        <li class="breadcrumb-item active">
          <a href="/listarCategorias">Categoria</a>
        </li>
        <li class="breadcrumb-item active">
        <a href="/listarRubricas">Rubrica</a>
        </li>
        <li class="breadcrumb-item active">
          <a href="/listarItens">Item</a>
        </li>
      </ol>
    </div>
      
    <div class="card mb-3">
      <div class="card-header">
          <i class="fa fa-area-chart"></i> Cadastrar pagamento
        </div>
        <div class="card-body">
          <form action="cadastrarPagamento" method="POST" enctype="multipart/form-data">
            <div class="form-group">
              <input type="hidden" name="nota_fiscal_id" value="${nota_fiscal_id }">
              <label for="text">Arquivo</label> <input type="file"
              class="form-control" placeholder="Fornecer o arquivo da nota"
              name="arquivo" required="required" accept=".pdf">
            </div>
            
            <div class="form-group">
		    	<label for="text">Tipo de pagamento: </label>
	     		<select class="form-control" name="tipo">
			      <option value="1">Boleto bancário</option>
			      <option value="2">Depósito bancário</option>
			      <option value="3">Cheque</option>
			      <option value="4">Fatura</option>
			      <option value="5">DARF</option>
			      <option value="6">ISSQN</option>
			    </select>
		  	</div>
			  
            <div class="row">
              <div class="form-group col-lg-6">
                <label for="text">Valor</label> <input type="number" pattern="[0-9.]"
                class="form-control" placeholder="Fornecer o valor da nota" id="valor"
                name="valor" required="required">
              </div>


              <div class="form-group col-lg-6">
                <label for="text">Data</label> <input type="date"
                class="form-control" placeholder="Fornecer a data de emissão da nota"
                name="data" required="required">
              </div>
            </div>
            
            <br/>
            <button type="submit" class="btn btn-dark">Cadastrar</button> 
          </form>
        </div>
    </div>
</div>

<script>
  $(document).ready(function(){
      $("form").delegate('#valor', 'focusout', function(){
          if($(this).val() < 0){
              $(this).val('0');
          }
      });
  });
</script>
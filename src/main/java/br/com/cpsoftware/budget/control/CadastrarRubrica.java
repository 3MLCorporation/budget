package br.com.cpsoftware.budget.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cpsoftware.budget.dao.CategoriaDAO;
import br.com.cpsoftware.budget.dao.OrcamentoDAO;
import br.com.cpsoftware.budget.dao.RubricaDAO;
import br.com.cpsoftware.budget.model.Categoria;
import br.com.cpsoftware.budget.model.Orcamento;
import br.com.cpsoftware.budget.model.Rubrica;
import br.com.cpsoftware.budget.model.Usuario;

@SuppressWarnings("serial")
public class CadastrarRubrica extends HttpServlet {

	private RubricaDAO dao = new RubricaDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");

		List<Orcamento> orcamentos = new OrcamentoDAO().getOrcamentos(usuario.getId());
		List<Categoria> categorias = new ArrayList<>();
		
		
		for(Orcamento orcamento : orcamentos) {
			for(Categoria categoria : new CategoriaDAO().getCategorias(orcamento.getId())) {
				categorias.add(categoria);
			}
		}
		
		
	    req.setAttribute("page", "criarRubrica");
	    
	    req.setAttribute("orcamentos", orcamentos);
	    req.setAttribute("categorias", categorias);
	    
	    req.getRequestDispatcher("/WEB-INF/base.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long categoriaId = Long.parseLong(req.getParameter("categoriaId"));
		
		Rubrica rubrica = new Rubrica(categoriaId, req.getParameter("nome"), Double.parseDouble(req.getParameter("valor")));
		
		dao.create(rubrica);
	
		resp.sendRedirect("/listarRubricas");
		
		/*req.setAttribute("page", "visualizarResumo");           
		req.getRequestDispatcher("/WEB-INF/base.jsp").forward(req, resp);*/
	}
}

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

@SuppressWarnings("serial")
public class ListarRubricas extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long orcamentoEditavelId = Long.parseLong((String) req.getSession().getAttribute("orcamentoEditavel"));
		Orcamento orcamento = (Orcamento) new OrcamentoDAO().read(orcamentoEditavelId);
		
		CategoriaDAO categoriaDao = new CategoriaDAO();
		RubricaDAO rubricaDao = new RubricaDAO();
		
		List<Rubrica> rubricas = new ArrayList<>();
		
			for(Categoria categoria : categoriaDao.getCategorias(orcamento.getId())) {
				for(Rubrica rubrica : rubricaDao.getRubricas(categoria.getId())) {
					rubricas.add(rubrica);
				}
			}
		
		req.setAttribute("rubricas", rubricas);
		
		req.setAttribute("page", "listarRubricas");
	    req.getRequestDispatcher("/WEB-INF/base.jsp").forward(req, resp);
	}
	
}

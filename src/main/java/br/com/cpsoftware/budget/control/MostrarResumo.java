package br.com.cpsoftware.budget.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cpsoftware.budget.dao.OrcamentoDAO;

public class MostrarResumo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		OrcamentoDAO dao = new OrcamentoDAO();
		
		req.setAttribute("orcamentos", dao.getOrcamentos());
		
		req.setAttribute("page", "visualizarResumo");           
		req.getRequestDispatcher("/WEB-INF/base.jsp").forward(req, resp);
	}
	
}

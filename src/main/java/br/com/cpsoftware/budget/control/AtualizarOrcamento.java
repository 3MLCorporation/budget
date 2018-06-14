package br.com.cpsoftware.budget.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cpsoftware.budget.dao.OrcamentoDAO;

@SuppressWarnings("serial")
public class AtualizarOrcamento extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long orcamentoId = Long.parseLong(req.getParameter("orcamentoId"));
		
		req.setAttribute("orcamento", new OrcamentoDAO().read(orcamentoId));
		req.setAttribute("page", "atualizarOrcamento");           
		req.getRequestDispatcher("/WEB-INF/base.jsp").forward(req, resp);
	}
	
}
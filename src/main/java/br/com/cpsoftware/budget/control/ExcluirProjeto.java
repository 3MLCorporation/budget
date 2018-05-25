package br.com.cpsoftware.budget.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cpsoftware.budget.util.Excluir;

@SuppressWarnings("serial")
public class ExcluirProjeto extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Excluir.excluirProjeto(req, resp);
		
		req.getSession().setAttribute("projetoEditavel", null);
		req.getSession().setAttribute("orcamentoEditavel", null);
		
		resp.sendRedirect("/listarProjetos");
		
	}
}

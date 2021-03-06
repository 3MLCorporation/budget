package br.com.cpsoftware.budget.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cpsoftware.budget.dao.CategoriaDAO;
import br.com.cpsoftware.budget.dao.OrcamentoDAO;
import br.com.cpsoftware.budget.model.Categoria;
import br.com.cpsoftware.budget.model.Orcamento;

@SuppressWarnings("serial")
public class AtualizarCategoria extends HttpServlet {
	
	private CategoriaDAO categoriaDao = new CategoriaDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long categoriaId = Long.parseLong(req.getParameter("categoriaId"));
		
		Long orcamentoEditavelId = Long.parseLong((String) req.getSession().getAttribute("orcamentoEditavel"));
		Orcamento orcamento = (Orcamento) new OrcamentoDAO().read(orcamentoEditavelId);
		
		req.setAttribute("orcamentoSelecionado", orcamento.getNome());
		req.setAttribute("categoria", this.categoriaDao.read(categoriaId));
		req.setAttribute("page", "atualizarCategoria");           
		req.getRequestDispatcher("/WEB-INF/base.jsp").forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long categoriaId = Long.parseLong(req.getParameter("categoriaId"));
		String nome = req.getParameter("nome");
		int codigo = Integer.parseInt(req.getParameter("codigo"));
		
		Categoria categoria = (Categoria) this.categoriaDao.read(categoriaId);
		categoria.setNome(nome);
		categoria.setCodigo(codigo);
		
		this.categoriaDao.update(categoria);
		
		resp.sendRedirect("/listarCategorias");
		
	}
	
}

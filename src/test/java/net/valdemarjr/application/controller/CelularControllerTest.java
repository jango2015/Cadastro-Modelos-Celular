package net.valdemarjr.application.controller;

import java.util.List;
import java.util.Map;

import net.valdemarjr.application.dominios.entidades.Celular;
import net.valdemarjr.application.infraestrutura.AbstractTestDAO;
import net.valdemarjr.application.infraestrutura.hibernatedao.RepositorioCelular;
import net.valdemarjr.fixtures.CelularFixture;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.ModelAndViewAssert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class CelularControllerTest extends AbstractTestDAO {
	
	private static final String CADASTRO_REMOVER = "/cadastro/remove";
	private static final String CADASTRO_PESQUISAR = "/cadastro/pesquisar";
	private static final String CADASTRO_FORMULARIO = "/cadastro/formulario";

	@Autowired
	private CelularController controller;
	
	@Autowired
	private RepositorioCelular repoCelular;
	
	public void init() throws Exception {
		repoCelular.inserir(CelularFixture.criaCelularOK());
	}
	
	public void destroy() throws Exception {
		repoCelular.remover(CelularFixture.criaCelularOK());
	}
	
	@Test
	public void testPesquisarModelosVazio() throws Exception {
		init();
		// GET
		request.setMethod(RequestMethod.GET.name());
		request.setRequestURI(CADASTRO_PESQUISAR);
		
		request.setParameter("nome", CelularFixture.MODELO_INEXISTENTE);

		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();

		List<Celular> listaModelos = (List<Celular>) model.get("celulares");
		Assert.assertTrue(listaModelos.isEmpty());

		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.TELA_LISTA_MODELOS);
	}
	
	@Test
	public void testPesquisarModelosOK() throws Exception {
		init();
		
		// GET
		request.setMethod(RequestMethod.GET.name());
		request.setRequestURI(CADASTRO_PESQUISAR);
		
		request.setParameter("nome", "Milestone 2");

		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();

		List<Celular> modeloCelular = (List<Celular>) model.get("celulares");
		Assert.assertNotNull(modeloCelular);
		Assert.assertEquals(CelularFixture.MILESTONE_2, modeloCelular.get(0).getNome());
		Assert.assertEquals(CelularFixture.MILESTONE_2_DESCRICAO, modeloCelular.get(0).getDescricao());

		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.TELA_LISTA_MODELOS);
		
		destroy();
	}
	
	@Test
	public void testProcessaFormularioOperacaoInserirErrorValidacao() throws Exception {
		// POST
		request.setMethod(RequestMethod.POST.name());
		request.setRequestURI(CADASTRO_FORMULARIO);
		
		request.setParameter("operacao", "inserir");
		
		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();
		
		// Validação do cadastro do Idioma
		BindingResult result = (BindingResult) model.get(BindingResult.MODEL_KEY_PREFIX + "celular");
		Assert.assertTrue(result.hasErrors());

		
		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.CADASTRO_FORMULARIO);
		
	}
	
	@Test
	public void testProcessaFormularioOperacaoInserirOK() throws Exception {
		
		// POST
		request.setMethod(RequestMethod.POST.name());
		request.setRequestURI(CADASTRO_FORMULARIO);
		request.setSession(session);
		
		request.setParameter("operacao", "inserir");
		
		request.setParameter("nome", CelularFixture.MILESTONE_2);
		request.setParameter("descricao", CelularFixture.MILESTONE_2_DESCRICAO);
		
		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();
		
	}
	
	@Test
	public void testCarregarFormularioInserirNovo() throws Exception {
		// GET
		request.setMethod(RequestMethod.GET.name());
		request.setRequestURI(CADASTRO_FORMULARIO);
		
		request.setParameter("nome", "");
		
		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();
		
		Celular celular = (Celular) model.get("celular");
		
		Assert.assertEquals(celular.getNome(), null);
		Assert.assertEquals(celular.getDescricao(), null);
		Assert.assertEquals(celular.getNovoCelular(), Boolean.TRUE);
		
		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.CADASTRO_FORMULARIO);
		
	}
	
	@Test
	public void testCarregarFormularioEditarModelo() throws Exception {
		init();
		// GET
		request.setMethod(RequestMethod.GET.name());
		request.setRequestURI(CADASTRO_FORMULARIO);
		
		request.setParameter("nome", CelularFixture.MILESTONE_2);
		
		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();
		
		Celular celular = (Celular) model.get("celular");
		
		Assert.assertEquals(celular.getNome(), CelularFixture.MILESTONE_2);
		Assert.assertEquals(celular.getDescricao(), CelularFixture.MILESTONE_2_DESCRICAO);
		
		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.CADASTRO_FORMULARIO);
		
		destroy();
		
	}
	
	@Test
	public void testProcessaFormularioOperacaoEditarErrorValidacao() throws Exception {
		// POST
		request.setMethod(RequestMethod.POST.name());
		request.setRequestURI(CADASTRO_FORMULARIO);
		
		request.setParameter("operacao", "editar");
		
		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();
		
		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.CADASTRO_FORMULARIO);
		
	}
	
	//@Test
	public void testRemoveModeloCelularOK() throws Exception {
		init();
		// POST
		request.setMethod(RequestMethod.POST.name());
		request.setRequestURI(CADASTRO_REMOVER);
		
		request.setParameter("nome", CelularFixture.MILESTONE_2);
		request.setParameter("descricao", CelularFixture.MILESTONE_2_DESCRICAO);
		
		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();
		
		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.TELA_LISTA_MODELOS);
		
		destroy();
	}
	
	@Test(expected = MissingServletRequestParameterException.class)
	public void testRemoveModeloCelularSemModelo() throws Exception {
		// POST
		request.setMethod(RequestMethod.POST.name());
		request.setRequestURI(CADASTRO_REMOVER);
		
		// Invocação do Controller
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		Map<String, Object> model = mav.getModel();
		
		// Validação da Visão
		ModelAndViewAssert.assertViewName(mav, CelularController.TELA_LISTA_MODELOS);
	}

}

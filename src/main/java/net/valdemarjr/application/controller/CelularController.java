package net.valdemarjr.application.controller;

import java.util.ArrayList;
import java.util.List;

import net.valdemarjr.application.controller.validators.CelularValidator;
import net.valdemarjr.application.dominios.entidades.Celular;
import net.valdemarjr.application.infraestrutura.hibernatedao.RepositorioCelular;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

@Controller
public class CelularController {
	
	public static final String CADASTRO_FORMULARIO = "cadastro.formulario";

	public static final String TELA_LISTA_MODELOS = "cadastro.lista";

	@Autowired
	private RepositorioCelular repositorio;
	
	@Autowired
	private Validator validator;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(false));
		binder.setValidator((org.springframework.validation.Validator) this.validator);
		
	}
	
	@RequestMapping(value = "/cadastro/formulario", method = RequestMethod.POST)
	public String processarFormulario(Model model, @RequestParam(value = "operacao", required = true, defaultValue = "inserir") String operacao, 
			@ModelAttribute("celular") Celular celular, BindingResult result, WebRequest request) throws Exception {
		
		ValidationUtils.invokeValidator(new CelularValidator(), celular, result);
		
		Boolean operacaoOK = Boolean.FALSE;
		
		if (result.hasErrors()) {
			return CADASTRO_FORMULARIO;
		}
		
		if (operacao.equals("editar")) {
			repositorio.atualizar(celular);
			celular.setNovoCelular(Boolean.FALSE);
			operacaoOK = Boolean.TRUE;
		} else {
			operacaoOK = repositorio.inserir(celular);
		}
		
		model.addAttribute("operacaoOK", operacaoOK);
		model.addAttribute("operacao", operacao);
		

		return CADASTRO_FORMULARIO;
	}
	
	@RequestMapping(value = "/cadastro/remove", method = RequestMethod.POST)
	public String removerModelo(@RequestParam(value = "nome", required = true) String nome, 
			@ModelAttribute Celular celular, WebRequest request) throws Exception {
		
		repositorio.remover(celular);
		
		return "redirect:" + "/cadastro/pesquisar";
		
	}
	
	@RequestMapping(value = "/cadastro/pesquisar", method = RequestMethod.GET)
	public String pesquisarModelos(Model model, @ModelAttribute Celular celular, @RequestParam(value = "nome", required = false) String nome
			, WebRequest request) throws Exception {
		
		List<Celular> listaModelos = new ArrayList<Celular>(); // lista de modelos de celular

		if (StringUtils.hasText(nome)) {
			Celular modelo = repositorio.pesquisarModelo(nome);
			if (modelo != null) {
				listaModelos.add(modelo);
			}
		}  else {
			listaModelos = repositorio.listarTodos();
		}
		
		model.addAttribute("celulares", listaModelos);
		
		return TELA_LISTA_MODELOS;
	}
	
	/**
	 * Carregar o formulário novo ou para atualização. 
	 * 
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/cadastro/formulario", method = RequestMethod.GET)
	public String carregarFormulario(@RequestParam(value = "nome", required = false) String nome, Model model) throws Exception {
		
		Celular celular = (nome != null && StringUtils.hasText(nome)) ? repositorio.pesquisarModelo(nome) : null;
		if (celular == null) {
			celular = new Celular();
			model.addAttribute("operacao", "inserir");
		} else {
			celular.setNovoCelular(Boolean.FALSE);
			model.addAttribute("operacao", "editar");
		}
		
		model.addAttribute("celular", celular);
		
		return CADASTRO_FORMULARIO;
		
	}

}

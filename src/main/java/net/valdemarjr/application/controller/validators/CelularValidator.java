package net.valdemarjr.application.controller.validators;

import net.valdemarjr.application.dominios.entidades.Celular;

import org.apache.commons.lang.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class CelularValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Celular.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Celular celular = (Celular) target;
		
		if (StringUtils.isBlank(celular.getNome())) {
			errors.rejectValue("nome", "campo.nome.obrigatorio");
		}
		
		if (StringUtils.isBlank(celular.getDescricao())) {
			errors.rejectValue("descricao", "campo.descricao.obrigatorio");
		}
		
	}

}

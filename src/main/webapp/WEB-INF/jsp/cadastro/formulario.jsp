<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:choose>
	<c:when test="${celular.novoCelular}">
		<c:set var="btnSubmit" ><spring:message code="botao.cadastro.celular" /></c:set>
		<c:set var="tituloCadastro" ><spring:message code="cadastro.titulo.incluirCadastro" /></c:set>
		<c:set var="tituloDescricao" ><spring:message code="cadastro.titulo.descricao" /></c:set>		
		<c:set var="mensagem" ><spring:message code="mensagem.cadastro.inserir" /></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="btnSubmit" ><spring:message code="botao.cadastro.alterar" /></c:set>
		<c:set var="tituloCadastro" ><spring:message code="cadastro.titulo.alterarCadastro" /></c:set>
		<c:set var="tituloDescricao" ><spring:message code="cadastro.titulo.descricao" /></c:set>
		<c:set var="mensagem" ><spring:message code="mensagem.cadastro.alterar" /></c:set>		
	</c:otherwise>
</c:choose>

<div id="conteudo_direita_interna">
	<h3><spring:message code="cadastro.manter" /></h3>
	<br />
	<c:if test="${operacaoOK}">
		<span class="mensagem success">${mensagem}</span>
	</c:if>
	<form:form acceptCharset="UTF-8;" modelAttribute="celular" method="post" cssClass="padrao validarcadastro">
		<p class="text">
			<label for="nome"><spring:message code="cadastro.label.nome.celular" /> <span class="obrigatorio">*</span></label>
			<form:input id="nome" path="nome" maxlength="100" disabled="${operacao eq 'editar'}" />
		</p>
		<form:errors path="nome" cssClass="mensagemAviso" element="p" />
		
		<p class="text">
			<label for="descricao"><spring:message code="cadastro.descricao" /><span class="obrigatorio">*</label>
			<form:input id="descricao" path="descricao" maxlength="255" />
		</p>
		<form:errors path="descricao" cssClass="mensagemAviso" element="p" />
		
		<hr class="crud"/>
		<span class="botao">
			<span class="bordaDireita">
				<input name="submit" type="submit" value="${btnSubmit}"  
				title="${btnSubmit} <spring:message code="botao.cadastro.celular" />" />
			</span>
		</span>
	</form:form>
	<c:url var="urlListar" value="/cadastro/pesquisar" />
	<a href="${urlListar}" >
		<spring:message code="lista.cadastro.celulares" />
	</a>
</div>
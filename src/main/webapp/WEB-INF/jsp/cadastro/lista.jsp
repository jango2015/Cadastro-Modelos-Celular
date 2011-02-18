<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- inicio coluna direita interna -->
<div id="conteudo_direita_interna">
	<h3><spring:message code="cadastro.pesquisa" /></h3>
	
	<mectools:msg tipo="INFO">
		<span class="mensagem success">${mensagem}</span>
	</mectools:msg>
	<mectools:msg tipo="AVISO">
		<span class="mensagem unsuccess">${mensagem}</span>
	</mectools:msg>
	
	<br />
	<!-- FORMULÁRIO COM CAMPOS PARA PESQUISA -->
		<form accept-charset="UTF-8; ISO-8859-1" 
			action="<c:url value='/cadastro/pesquisar' />" method="get" class="padrao">
			
			<p class="text">
				<label for="nome"><spring:message code="cadastro.label.nome.celular" /></label>
				<input id="nome" type="text" name="nome" value="${cadastro.nome}" maxlength="255" />
			</p>
			<span class="botao">
				<span class="bordaDireita">
					<input name="submit" type="submit" value="<spring:message code="botao.pesquisar" />" 
					title="<spring:message code="botao.pesquisar" /> "/>
				</span>
			</span>
			
			<hr class="crud"/>
			
			<a class="botao" href="<c:url value='/cadastro/formulario' />" title="<spring:message code="botao.cadastro.celular" /> <spring:message code="botao.cadastro.celular" />">
				<span class="bordaDireita">
					<span class="submit"><spring:message code="botao.cadastro.celular" /></span>
				</span>
			</a>
		</form>
	<!-- FORMULÁRIO COM CAMPOS PARA PESQUISA -->
	
	<h3 class="resultado_pesquisa"><spring:message code="cadastro.listaCelulares" /></h3>
    <br/>
	<c:choose>
		<c:when test="${not empty celulares}">
			<table class="padrao"> 
				<tbody>
					<c:forEach items="${celulares}" var="celular" varStatus="celulares">
						<tr class="${corLinha}" >
							<td>${celular.nome}</td>
							<td>${celular.descricao}</td>
							<td class="acoes">
								<c:url var="urlEditar" value="/cadastro/formulario?nome=${celular.nome}&operacao=editar" />
								<a href="${urlEditar}" >
									<spring:message code="cadastro.titulo.alterarCadastro" />
								</a>
							</td>
							<td>
								<c:url var="urlExcluir" value="/cadastro/remove" />
								<form:form id="categoria${celular.nome}" acceptCharset="UTF-8; ISO-8859-1" action="${urlExcluir}" modelAttribute="celular" method="post" >
									<input type="hidden" name="nome" value="${celular.nome}" />
									<input type="hidden" name="descricao" value="${celular.descricao}" />
									<input type="image" src="<c:url value='/imagens/cross-script.png' />" title="<spring:message code="cadastro.titulo.excluirCadastro" />"   
										onclick="return confirm('<spring:message code="cadastro.excluir" /> ${celular.nome}?');"/>
								</form:form>
							</td>									
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<table class="padrao">
				<tbody>
					<tr>
						<td><spring:message code="cadastro.celularNaoEncontrado" /></td>
					</tr>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</div>
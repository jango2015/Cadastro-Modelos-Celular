<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="topo">
	<div class="identidade_visual">
		<h1>
			<a href="<c:url value='/'/>">
				<img class="high_contrast" src="<c:url value='/static/imagens/logo_dominio.gif' />" alt="Domí­nio Público" />
			</a>
		</h1>
		<div class="acessibilidade">
			<img class="high_contrast tooltipTopo" src="<c:url value='/static/imagens/borda_acessibilidade.png' />" alt="Dominio" style="display:block;"/>
			<ul>
				<li>
					<span></span>
					<a id="j_aumentar" href="#">Aumentar Fonte</a>
				</li>
				<li class="alto_contraste">
					<span></span>
					<a id="contraste" href="#">Alto Contraste</a>
				</li>
				<li class="diminuir" >
					<span></span>
					<a id="j_diminuir" class="diminuir" href="#">Diminuir Fonte</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="boas_vindas">
		<span class="boas_vindas"></span>
		<ul>
			<c:if test="${sessionScope.colaboradorLogado ne null}">
				<li>
					<span></span>
					<a href="<c:url value='/sair' />" >Sair</a>
				</li>
			</c:if>
			<li class="ajuda">
				<span></span>
				<a href="#" ><spring:message code="Topo.ajuda" /></a>
			</li>
		</ul>
	</div>
	<div class="pesquisa">
		<div class="borda_superior"></div>
		<div class="formulario">
			<form action="${pageContext.request.contextPath}/obra/pesquisar/topo" method="get" id="form_consultar_topo">
				<span class="formulario">
					<span class="pesquisa">pesquisa:</span>
	                <select class="my-dropdown" id="pesquisaTopoId">
	                    <option value="TITULO" ${tipoPesquisa eq 'TITULO' ? 'selected="selected"' : ''}>
	                    	<spring:message code="Topo.combo.option.por.titulo" />
	                    </option>
	                    <option value="AUTOR" ${tipoPesquisa eq 'AUTOR' ? 'selected="selected"' : ''}>
	                    	<spring:message code="Topo.combo.option.por.autor" />
	                    </option>
						<option value="PALAVRA_CHAVE" ${tipoPesquisa eq 'PALAVRA_CHAVE' ? 'selected="selected"' : ''}>
	                    	<spring:message code="Topo.combo.option.por.palavra.chave" />
	                    </option>
	                    <option value="CONTEUDO" ${tipoPesquisa eq 'CONTEUDO' ? 'selected="selected"' : ''}>
	                    	<spring:message code="Topo.combo.option.por.conteudo" />
	                    </option>
	                </select>
			        <c:choose>
						<c:when test="${empty conteudo || conteudo eq 'Pesquisar...'}">
							<c:set var="valorCampoPesquisa"><spring:message code="Topo.input.pesquisar" /></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="valorCampoPesquisa">${conteudo}</c:set>
						</c:otherwise>
					</c:choose>
					<input id="resultado_select" type="hidden" name="tipoPesquisa" value="${not empty tipoPesquisa ? tipoPesquisa : 'TITULO'}" />
					<input id="pesquisaTopo" value='${valorCampoPesquisa}' name="conteudo" class="campo_pesquisa" type="text" />
					<input value="" class="botao_pesquisa" id="botao_pesquisa_topo" type="submit"  />
				</span>
			</form>
			<a href="<c:url value='/obra/pesquisar/formulario' />" class="pesquisa_avancada">
				<spring:message code="Topo.pesquisa.avancada" />
			</a>
		</div>
		<div class="borda_inferior"></div>
	</div>
	
	<span class="flashcontent">
		<img class="dominio_publico high_contrast" src="<c:url value='/static/imagens/header2.jpg' />" alt="Dominio Publico" />
		<img class="dominio_publico high_contrast" src="<c:url value='/static/imagens/header3.png' />" alt="Dominio Publico" />
		<img class="dominio_publico high_contrast" src="<c:url value='/static/imagens/header4.png' />" alt="Dominio Publico" />
		<img class="dominio_publico high_contrast" src="<c:url value='/static/imagens/header5.png' />" alt="Dominio Publico" />
		<img class="dominio_publico high_contrast" src="<c:url value='/static/imagens/header6.png' />" alt="Dominio Publico" />
	</span>
	
	<div class="menu_principal" >
		<ul>
			<li class="primeiro">
				<a href="<c:url value='/' />">
					<spring:message code="paginaPrincipal" />
				</a>
			</li>
			<li><a href="<c:url value='/indicadores/dashboard' />">
					<spring:message code="indicadores"/>
				</a></li>
			<li><a href="<c:url value='/faq/listar' />">
					<spring:message code="faq"/>
				</a></li>			
			<li><a href="<c:url value='/faleconosco/formulario' />">
					<spring:message code="faleconosco"/>
				</a></li>				
			<c:if test="${sessionScope.colaboradorLogado eq null}">  
				<li>
					<a href="<c:url value='/administrativo-usuario?s=50' />">
						<spring:message code="Topo.menu.quero.colaborar" />
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<tiles:insertAttribute name="header" />
		
</head>
	<body>

		<div id="geral">

			<!--inicio da barra governo -->
			<div class="barra_governo">
				<div class="barra_governo_box">
					<div class="box2">
						<div class="box3">
							<div class="box4">
								<div class="marca_mec">
									<a id="top_barra" name="top_barra" target="_blank" href="http://portal.mec.gov.br" class="txtIndent" title="Minist&eacute;rio da Educa&ccedil;&atilde;o">MEC - Minist&eacute;rio da Educa&ccedil;&atilde;o</a>
								</div>
								<div class="marca_brasil">
									<a href="http://www.brasil.gov.br/" target="_blank" title="Portal Brasil">Portal Brasil</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--fim da barra governo -->
		
			<!-- Topo (topo.jsp)-->
			<tiles:insertAttribute name="topo" />

			<!-- inicio das colunas (esquerda (colunaEsquerda.jsp), direta (colunaDireita.jsp) ) -->
			<div id="colunas">	
	
				<!-- Coluna direita (conteudo em geral) -->
				<tiles:insertAttribute name="colunasDireita" />
			
			</div>
						
	    	<tiles:insertAttribute name="rodape" />

		</div>
	
	</body>
	
</html>

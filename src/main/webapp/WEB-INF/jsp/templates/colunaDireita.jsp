<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div style="height: 1057px;" id="conteudo_direita_interna">
		<div id="tit_interna">
        	<img src="<c:url value='/static/imagens/tit_visualizar_detalhes_obra.gif' />" alt="Imagem" />
        </div>
        <br />
        <div id="mensagem_aviso">
        	<img align="middle" src="<c:url value='/static/imagens/aviso_ico.png' />" />Texto da Mensagem de Aviso
        </div>
        <div id="info_obra">
        	<div id="ferramentas_obra">
            	<img src="<c:url value='/static/imagens/ico_qualificacoes.gif' />" alt="Imagem" /><a href="#">Qualificações da obra</a>
                <img src="<c:url value='/static/imagens/ico_favoritos.gif' />" alt="Imagem" /><a href="#">Adicionar aos favoritos</a>
                <img src="<c:url value='/static/imagens/ico_adicionar_autor.gif' />" alt="Imagem" /><a href="#">Adicionar autor aos favoritos</a>
            </div>
            <div id="img_obra">
            	<img src="<c:url value='/static/imagens/img_obra.gif' />" alt="Imagem" />
            </div>
            <div id="tit_descricao">
            	<h3>Memorias Postumas de Bras Cubas</h3><br />
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a nisl
					arcu. Sed quis bibendum lectus. Curabitur sollicitudin quam vel mi
					auctor ut vestibulum velit molestie. Vivamus diam ante, accumsan sed
					varius nec, consequat gravida nisl. Phasellus eleifend massa id sem
					egestas et elementum lectus bibendum. 
			</div>
        </div>
        <form name="frm" action="index.html" method="post">
	        <div id="formulario" style="width: 689px;" >
	        		<dl id="conteudo_formulario">
	        			<dt class="label">
	        				<label for="subtitulo">Subtítulo</label>
	        				<input id="subtitulo" name="txt" size="60" class="input_txt" type="text" />
	        			</dt>
	        			<dd>
	        				<div id="nomeErro" class="error">
	        					Campo obrigatório: Favor preencher o nome.
	        				</div>
	       				</dd>
	       				
	        			<dt  class="label">
	        				<label for="titulo">Título</label>
	        				<input id="subtitulo" name="txt" size="60" class="input_txt" type="text" />	        				
	        			</dt>
	        			<dd>
	        				<div id="nomeErro" class="error" >
	        					Campo obrigatório: Favor preencher o nome.
	        				</div>
	        			</dd>
	        			
	        			<dt  class="label">
	        				<label for="titulo">Idioma</label>
	        				<input id="subtitulo" name="txt" size="60" class="input_txt" type="text" />	        				
	        			</dt>
	        			<dd>
	        			</dd>
	        			
	        			<dt  class="label">
	        				<label for="titulo">Volume/Módulo</label>
	        				<input id="subtitulo" name="txt" size="60" class="input_txt" type="text" />	        				
	        			</dt>
	        			<dd>
	        				<div id="nomeErro" class="error" >
	        					Campo obrigatório: Favor preencher o nome.
	        				</div>
	        			</dd>
	        			
	       				<dt  class="label">
	        				<label for="titulo">Série, Coleção ou Programa</label>
	        				<input id="subtitulo" name="txt" size="60" class="input_txt" type="text" />	        				
	        			</dt>
	        			<dd>
	        			</dd>
	       				<dt  class="label">
	        				<label for="titulo">Endereço Eletrônico</label>
	        				<input id="subtitulo" name="txt" size="60" class="input_txt" type="text" />	        				
	        			</dt>
	        			<dd>
	        				<div id="nomeErro" class="error" >
	        					Campo obrigatório: Favor preencher o nome.
	        				</div>
	        			</dd>
	        		</dl>
	        </div>
			<div id="botoes_formulario">
	             <input src="<c:url value='/static/imagens/bt_editar_cadastro.gif' />" type="image" />
	             <input src="<c:url value='/static/imagens/bt_download.gif' />" type="image" />
	             <input src="<c:url value='/static/imagens/bt_denunciar_conteudo.gif' />" type="image" />
         	</div>  
		</form>

        <div id="resultado_pesquisa">
            <div id="tit_interna">
             	<img src="<c:url value='/static/imagens/bullet_azul.gif' />"  alt="imagemsss" />RESULTADO DA PESQUISA</div>
            <br/>
		   <div id="item">

            	<b>T&Iacute;tulo:</b>&nbsp;Mem&oacute;rias P&oacute;stumas<br/>
             <b>Autores:</b>&nbsp;Jos&eacute; Jorge, Jorge Jos&eacute;<br/>
             <b>Fonte:</b>&nbsp;Biblioteca Nacional<br/>

             <b>Tipo de M&iacute;dia:</b>&nbsp;Texto<br/>
             <b>Qualifica&ccedil;&atilde;o:</b>&nbsp;<img src="<c:url value='/static/imagens/estrela.gif' />" alt="imagem"  /><img src="<c:url value='/static/imagens/estrela.gif' />" /><br/>
             <div id="visualizar">
             	<a href="#"><img src="<c:url value='/static/imagens/bt_visualizar_obra.gif' />" alt="imagem" /></a>
             </div>
            </div>

            
            <div id="item">
            	<b>T&Iacute;tulo:</b>&nbsp;Mem&oacute;rias P&oacute;stumas<br/>
             <b>Autores:</b>&nbsp;Jos&eacute; Jorge, Jorge Jos&eacute;<br/>
             <b>Fonte:</b>&nbsp;Biblioteca Nacional<br/>

             <b>Tipo de M&iacute;dia:</b>&nbsp;Texto<br/>
             <b>Qualifica&ccedil;&atilde;o:</b>&nbsp;<img src="<c:url value='/static/imagens/estrela.gif' />" /><img src="<c:url value='/static/imagens/estrela.gif' />" /><img src="<c:url value='/static/imagens/estrela.gif' />" /><br/>
             <div id="visualizar">
             	<a href="#"><img src="<c:url value='/static/imagens/bt_visualizar_obra.gif' />" /></a>
             </div>
            </div>

             <table width="100%" border="0">
              	<tr>
                 	<td align="center">
                     	<div id="paginacao">
					<span class="disabled_paginacao"><img src="<c:url value='/static/imagens/seta_pag_esq_des2.gif' />" /></span><span class="disabled_paginacao"><img src="images/seta_pag_esq_des.gif"></span><span class="active_link">1</span><a href="#2">2</a><a href="#3">3</a><a href="#4">4</a><a href="#5">5</a><a href="#6">6</a><a href="#7">7</a><a href="#8">8</a><a href="#9">9</a><a href="#10">10</a><a href="#forward"><img src="images/seta_pag_dir.gif"></a><a href="#forward"><img src="images/seta_pag_dir2.gif"></a></div>
                     </td>
                 </tr>
              </table>

 	   </div>


</div>

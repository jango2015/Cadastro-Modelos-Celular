<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<title>Domínio Público</title>

<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<link type="image/x-icon" href="<c:url value='/static/imagens/favicon.ico' />" rel="shortcut icon" />

<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/reset-min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/nyroModal.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/jquery-plugins.css' />" />
<link href="http://bibliotecaweb.mec.gov.br/barra_do_governo/css/barra_do_governo.css" rel="stylesheet" media="screen" type="text/css" />
<link id="fontes" rel="stylesheet" type="text/css" href="<c:url value='/static/css/fonte-normal.css' />" />
<link id="estilo" rel="stylesheet" type="text/css" href="<c:url value='/static/css/padrao.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/principal.css' />" />

<script type="text/javascript" src="<c:url value='/static/javascript/messages_${pageContext.request.locale}.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery-1.4.2.min.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery-ui-1.8.6.custom.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/ajaxfileupload.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.tooltip.min.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.validate.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.alphanumeric.pack.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.numeric.pack.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.wslide.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.stylish-select.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.nyroModal-1.6.2.pack.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.ajaxQueue.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.autocomplete.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.maskedinput.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.treeTable.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.form.js' />"></script>
<!--[if IE]><script type="text/javascript" src="<c:url value='/static/javascript/excanvas.compiled.js' />"></script><![endif]-->
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.flot-0.6.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.cycle.all.min.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.highlight-3.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.Jcrop.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.uniform.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/localizacao.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/jquery.ui.stars.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/filtro.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/swfobject.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/player.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/javascript/cookie.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/indicadores.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/npdp.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/npdp.modais.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/javascript/npdp.validate.js' />" ></script>

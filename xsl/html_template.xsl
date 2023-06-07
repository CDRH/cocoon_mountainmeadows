<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--<xsl:output method="html" encoding="UTF-8" />-->
	<xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>

<xsl:param name="section" />
	<xsl:param name="pagetype" />
	
	<xsl:include href="../xsl/common.xsl"/>
	<xsl:include href="../config/config.xsl"/>
	
  <xsl:template match="/">
  <html xmlns="http://www.w3.org/1999/xhtml" class="{$pagetype}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--<base href="http://mountainmeadows.unl.edu" />-->
	<base href="{$siteroot}" />

<title>&quot;Horrible Massacre of Emigrants!!&quot; The Mountain Meadows Massacre in Public Discourse</title>

<link rel="stylesheet" type="text/css" href="css/reset-min.css" />
<link rel="stylesheet" type="text/css" href="css/mmm.css" />


	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"> 
	&#160;
	</script>
	
	<script src="{$siteroot}js/prettyPhoto_compressed_3.1.3/js/jquery.prettyPhoto.js"> &#160; </script>

	<script language="javascript" src="{$siteroot}js/mmm.js">
	&#160;
	</script>
	
	<link rel="stylesheet" href="{$siteroot}js/prettyPhoto_compressed_3.1.3/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
	<script async="true" src="https://www.googletagmanager.com/gtag/js?id=G-2V9RJZHY17"></script>
	
<script type="text/javascript">
		
		  window.dataLayer = window.dataLayer || [];
  	      function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'G-2V9RJZHY17');
		
	</script>


</head>

<body>

<div id="mainBody">

	<div id="titleBlock">
	<h1><span>&quot;Horrible Massacre of Emigrants!!&quot; The Mountain Meadows Massacre in Public Discourse</span></h1>
	
	<ul class="mainMenu">
		<li><a href="index.html" title="Project Home Page">Home</a></li>
		<li><a href="introduction.html" title="Project Overview">Overview</a></li>
		<li><xsl:if test="$section = 'archive'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
		  <a href="archive/index.html" title="Archive of Sources">Archive</a></li>
		<li><xsl:if test="$section = 'visualizations'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
		  <a href="visualizations/index.html" title="Visualizations">Visualizations</a></li>
		<!--<li><xsl:if test="$section = 'browse'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
		  <a href="browse/index.html" title="Browse source materials">Browse</a></li>-->
		<!--<li><xsl:if test="$section = 'search'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
			<a href="search/index.html" title="Search source materials">Search</a></li>-->
	</ul>
	
	<ul class="projectMenu">
		<li><a href="about.html" title="Learn about this project.">About the Project</a></li>
		
	</ul>
	
	</div>
	
	<div class="bodyContent">
		<xsl:copy-of select="//body" />
	</div>
	
	<div class="footer">
	<p class="copyStmt">
	&#169; 2007 University of Nebraska&#8211;Lincoln. Please send comments to <a href="mailto:cdrh@unl.edu" title="Contact the Center for Digital Research in the Humanities.">cdrh@unl.edu</a>.<br/>
		<a href="http://www.unl.edu/" ><img src="web-images/unl.jpg" alt="University of Nebraska-Lincoln" /></a>
	</p>
	</div>

</div>

</body>
</html>
  </xsl:template>

</xsl:stylesheet>

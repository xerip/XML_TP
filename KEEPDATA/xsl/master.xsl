<?xml version="1.0" encoding="iso-8859-1"?>

	<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="css.xsl" />
	<xsl:import href="intervenant.xsl" />
	<xsl:import href="ue.xsl" />
	<xsl:import href="parcours.xsl" />
	<xsl:output 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		encoding = "iso-8859-1"
		method="html"
	/>
	
	
<!-- ARBRE -->
	<xsl:template match="/">
		<html>
			<head>
				<title>Plan du Master Informatique</title>
				<xsl:apply-templates select="/" mode="head-css" /> 
			</head>
			<body>
				<xsl:apply-templates select="master" /> 
	        </body></html>
    </xsl:template>
	
<!-- MASTER -->
	<xsl:template match="master">
		<h1><a href="master.html" title="MASTER INFORMATIQUE Accueuil"><span>MASTER INFORMATIQUE</span></a></h1>
		<div id="conteneur">
			<ul id="menu">
				<li><a href="master.html">Index</a></li>
			</ul>
		<div id="contenu">
			<!-- TEMP -->
			<h2>Liste Intervenants</h2>
			<ul><xsl:apply-templates select="intervenant" mode="ref" /></ul>
			<h2>Liste UE</h2>
			<ul><xsl:apply-templates select="ue" mode="ref" /></ul>
			<h2>Liste Parcours</h2>
			<ul><xsl:apply-templates select="parcours" mode="ref" /></ul>
			<!-- Index -->
			<xsl:document href="Index.html">
		        <html>
					<head>
						<title>Index</title>
						<xsl:apply-templates select="/" mode="head-css" />
					</head>
					<body>
						<h1><a href="master.html" title="MASTER INFORMATIQUE Accueuil"><span>MASTER INFORMATIQUE</span></a></h1>
						<div id="conteneur">
							<ul id="menu">
								<li><a href="Index.html">Index</a></li>
							</ul>
							<div id="contenu">
								<h2>Index</h2>
								<h3>Liste Intervenants</h3>
								<xsl:apply-templates select="intervenant" mode="ref" />
								<h3>Liste UE</h3>
								<xsl:apply-templates select="ue" mode="ref" />
								<h3>Liste Parcours</h3>
								<xsl:apply-templates select="parcours" mode="ref" />
							</div>
						</div>
						<p id="footer">C'est la page du master</p>
					</body>
				</html>
			</xsl:document>
			<!-- Unités -->
			<xsl:apply-templates select="ue" mode="fiche" />		
			<!-- Intervenants -->
			<xsl:apply-templates select="intervenant" mode="fiche" />
			<!-- Parcours -->
			<xsl:apply-templates select="parcours" mode="fiche" />
		</div>
		</div>
		<p id="footer">C'est la page du master</p>
	</xsl:template>
	
	<xsl:template name="lien">
	    <xsl:param name="href"/>
	    <xsl:param name="target"/>
		<a href="{$href}.html#{$href}">
			<xsl:value-of select="$target"/>
	    </a>
	</xsl:template>
	
	
</xsl:stylesheet>

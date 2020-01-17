<?xml version="1.0" encoding="iso-8859-1"?>

	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
			</head>
			<body>
				<xsl:apply-templates select="master" /> 
	        </body></html>
    </xsl:template>
	
<!-- MASTER -->
	<xsl:template match="master">
		<!-- TEMP -->
		<h1>MASTER INFORMATIQUE</h1>
		<h2>Liste Intervenants</h2>
		<xsl:apply-templates select="intervenant" mode="ref" />
		<h2>Liste UE</h2>
		<xsl:apply-templates select="ue" mode="ref" />
		<h2>Liste Parcours</h2>
		<xsl:apply-templates select="parcours" mode="ref" />
		<!-- Index -->
		<xsl:document href="Index.html">
	        <html>
				<head><title>Index</title></head>
					<body>
						<h2>Liste Intervenants</h2>
						<xsl:apply-templates select="intervenant" mode="ref" />
						<h2>Liste UE</h2>
						<xsl:apply-templates select="ue" mode="ref" />
						<h2>Liste Parcours</h2>
						<xsl:apply-templates select="parcours" mode="ref" />
					</body>
			</html>
		</xsl:document>
		<!-- Unités -->
		<xsl:apply-templates select="ue" mode="fiche" />		
		<!-- Intervenants -->
		<xsl:apply-templates select="intervenant" mode="fiche" />
		<!-- Parcours -->
		<xsl:apply-templates select="parcours" mode="fiche" />
	</xsl:template>
	
	<xsl:template name="lien">
	    <xsl:param name="href"/>
	    <xsl:param name="target"/>
		<a href="{$href}.html#{$href}">
			<xsl:value-of select="$target"/>
	    </a>
	</xsl:template>
	
</xsl:stylesheet>

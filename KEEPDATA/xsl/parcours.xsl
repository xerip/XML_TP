<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" >
	
	<xsl:output 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		encoding = "iso-8859-1"
		method="html"
	/>
	
<!-- PARCOURS -->
	<xsl:template match="parcours" mode="fiche">
		<!-- ... produire la fiche d'un parcours ... -->
		<xsl:variable name="idParcours" select="@id"/>
		<xsl:document href="{$idParcours}.html">
			<html>
				<head>
					<title><xsl:value-of select="nom"/></title>
					<xsl:apply-templates select="/" mode="head-css" />
				</head> 
				<body>
					<xsl:variable name="idVar" select="@id"/>
					<h1>MASTER INFORMATIQUE</h1>
					<h1><a href="master.html" title="MASTER INFORMATIQUE Accueuil"><span>MASTER INFORMATIQUE</span></a></h1>
					<div id="conteneur">
						<ul id="menu">
							<li><a href="master.html">Index</a></li>
						</ul>
						<div id="contenu">
							<h2 id="{$idVar}"><xsl:value-of select="nom"/></h2>
							<ul>
								<li>
									responsable: 
									<xsl:call-template name="lien_intervenant">
										<xsl:with-param name="href">
											<xsl:value-of select="ref-intervenant/@ref"/>
										</xsl:with-param>
									</xsl:call-template>
								</li>
								<li>Description: <p><xsl:value-of select="nom"/></p></li>
								<xsl:apply-templates select="semestre" mode="fiche" />
							</ul>
						</div>
					</div>
					<p id="footer">C'est la page du master</p>
				</body>
			</html>
		</xsl:document>
	</xsl:template>
	
	<xsl:template match="parcours" mode="ref">
	<!-- ... produire un lien vers la fiche d'un parcours ... -->
		<li>
			<xsl:call-template name="lien_parcours">
				<xsl:with-param name="href">
					<xsl:value-of select="@id"/>
				</xsl:with-param>
				<xsl:with-param name="target">
					<xsl:value-of select="nom"/>
				</xsl:with-param>
			</xsl:call-template>
		</li>
	</xsl:template>
	
	<xsl:template name="lien_parcours">
	    <xsl:param name="href"/>
	    <xsl:param name="target"/>
		<a href="{$href}.html#{$href}">
			<xsl:value-of select="$target"/>
	    </a>
	</xsl:template>
	
<!-- SEMESTRE -->
	<xsl:template match="semestre" mode="fiche">
		<!-- ... produire la fiche d'un semestre ... -->
		<li><h3>Semestre</h3></li>
		<ul><xsl:apply-templates select="bloc" mode="fiche" /></ul>
	</xsl:template>
	
<!-- BLOC -->
	<xsl:template match="bloc" mode="fiche">
		<!-- ... produire la fiche d'un bloc ... -->
		<li><h4><xsl:value-of select="role"/></h4></li>
		<ul><xsl:apply-templates select="ref-ue" mode="parcours"/></ul>
	</xsl:template>
	
<!-- REF-UE -->
	<xsl:template match="ref-ue" mode="parcours">
		<xsl:variable name="ref" select="@ref"/>
		<xsl:variable name="nom-ue" select="/master/ue[@id=$ref]/nom"/>
		<li>
			<xsl:call-template name="lien_ue">
				<xsl:with-param name="href">
					<xsl:value-of select="@ref"/>
				</xsl:with-param>
				<xsl:with-param name="target">
					<xsl:value-of select="$nom-ue"/>
				</xsl:with-param>
			</xsl:call-template>
		</li>
	</xsl:template>


</xsl:stylesheet>

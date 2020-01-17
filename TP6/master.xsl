<?xml version="1.0" encoding="iso-8859-1"?>

	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
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
				<h1>Master Informatique</h1>
				<h2>Liste Intervenants</h2>
				<xsl:apply-templates select="master/intervenant" mode="ref" />
				<h2>Liste UE</h2>
				<xsl:apply-templates select="master/ue" mode="ref" />
				<h2>Intervenants</h2>
				<xsl:apply-templates select="master/intervenant" />
				<h2>UE</h2>
				<xsl:apply-templates select="master/ue" />
				<h2>Parcours</h2>
				<xsl:apply-templates select="//parcours"/>
	        </body></html>
    </xsl:template>
	
	
	<!-- INTERVENANTS -->
	
	<xsl:template match="intervenant">
		<!-- ... produire la fiche d'un intervenant ... -->
		<xsl:call-template name="fiche_intervenant">
			<xsl:with-param name="href">
				<xsl:value-of select="@id"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="intervenant" mode="ref">
		
	<!-- ... produire un lien vers la fiche d'un intervenant ... -->
		<xsl:call-template name="lien_intervenant">
			<xsl:with-param name="href">
				<xsl:value-of select="@id"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	<!-- UE -->
	<xsl:template match="ue">
		<!-- ... produire la fiche d'une ue ... -->
		<xsl:call-template name="fiche_ue">
			<xsl:with-param name="href">
				<xsl:value-of select="@id"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="ue" mode="ref">
	<!-- ... produire un lien vers la fiche d'une ue ... -->
		<xsl:call-template name="lien_ue">
			<xsl:with-param name="href">
				<xsl:value-of select="@id"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	<!-- PARCOURS -->
	<xsl:template match="parcours">
		<xsl:value-of select="."/>
	</xsl:template>
	
<!-- REGLES NOMMEES -->
	
	<!-- INTERVENANTS -->
	<xsl:template name="fiche_intervenant">
		<xsl:param name="href"/>
		<h4 id="{$href}"><xsl:value-of select="nom"/></h4>
		<ul>
			<li><xsl:value-of select="email"/></li>
			<li><xsl:value-of select="web"/></li>
		</ul>
	</xsl:template>
	
	<xsl:template name="lien_intervenant">
	    <xsl:param name="href"/>
	    <li>
			<a href="#{$href}">
				<xsl:variable name="ref" select="$href"/>
				<xsl:value-of select="//intervenant[@id=$ref]/nom"/>
		    </a>
		</li>
	</xsl:template>
	
	<!-- UE -->
	<xsl:template name="fiche_ue">
		<xsl:param name="href"/>
		<h4 id="{$href}"><xsl:value-of select="nom"/></h4>
		<ul>
			<li><xsl:value-of select="credit"/> crédits</li>
			<li><xsl:value-of select="resume"/></li>
			<li><xsl:value-of select="lieu"/></li>
			<xsl:if test="ref-intervenant/@ref">
				<xsl:call-template name="lien_intervenant">
					<xsl:with-param name="href">
						<xsl:value-of select="ref-intervenant/@ref"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</ul>
	</xsl:template>
	
	<xsl:template name="lien_ue">
	    <xsl:param name="href"/>
	    <li>
			<a href="#{$href}">
				<xsl:value-of select="nom"/>
		    </a>
		</li>
	</xsl:template>
	
</xsl:stylesheet>

<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output 
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding = "iso-8859-1"
	method="html"
/>
	
	
	<!-- PARCOURS -->
	<xsl:template match="parcours">
		<!-- ... produire la fiche d'un parcours ... -->
		<xsl:call-template name="fiche_parcours">
			<xsl:with-param name="href">
				<xsl:value-of select="@id"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="parcours" mode="ref">
	<!-- ... produire un lien vers la fiche d'un parcours ... -->
		<li>
			<xsl:call-template name="lien_parcours">
				<xsl:with-param name="href">
					<xsl:value-of select="@id"/>
				</xsl:with-param>
			</xsl:call-template>
		</li>
	</xsl:template>
	
	
	<!-- SEMESTRE -->
	<xsl:template match="semestre">
		<!-- ... produire la fiche d'un semestre ... -->
		<li><h4>Semestre</h4></li>
		<ul>
			<xsl:apply-templates select="bloc" />
		</ul>
	</xsl:template>
	
	
	<!-- BLOC -->
	<xsl:template match="bloc">
		<!-- ... produire la fiche d'un bloc ... -->
		<li><h5><xsl:value-of select="role"/></h5></li>
		<ul>
			<xsl:apply-templates select="ref-ue" />
		</ul>
	</xsl:template>
	
	
	<!-- REF-UE -->
	<xsl:template match="ref-ue">
		<!-- ... produire la fiche d'un ref-ue ... -->
		<xsl:call-template name="lien_ue">
			<xsl:with-param name="href">
				<xsl:value-of select="@ref"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<!-- REGLES NOMMEES -->
	
	<!-- PARCOURS -->
	<xsl:template name="fiche_parcours">
		<xsl:param name="href"/>
		<h3 id="{$href}"><xsl:value-of select="nom"/></h3>
		<ul>
			<li>Responsable :
				<xsl:call-template name="lien_intervenant">
					<xsl:with-param name="href">
						<xsl:value-of select="ref-intervenant/@ref"/>
					</xsl:with-param>
				</xsl:call-template>
			</li>
			<li>Description : <xsl:value-of select="description"/></li>
			<xsl:apply-templates select="semestre" />
		</ul>
	</xsl:template>
	
	<xsl:template name="lien_parcours">
	    <xsl:param name="href"/>
		<a href="{$href}.html#{$href}">
			<xsl:variable name="ref" select="$href"/>
			<xsl:value-of select="/master/parcours[@id=$ref]/nom"/>
	    </a>
	</xsl:template>

</xsl:stylesheet>

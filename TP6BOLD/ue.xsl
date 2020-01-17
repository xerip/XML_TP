<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output 
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding = "iso-8859-1"
	method="html"
/>


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
		<li>
			<xsl:call-template name="lien_ue">
				<xsl:with-param name="href">
					<xsl:value-of select="@id"/>
				</xsl:with-param>
			</xsl:call-template>
		</li>
	</xsl:template>
	
	
	
	<!-- REGLES NOMMEES -->
	
	<!-- UE -->
	<xsl:template name="fiche_ue">
		<xsl:param name="href"/>
		<h3 id="{$href}"><xsl:value-of select="nom"/></h3>
		<ul>
			<li><xsl:value-of select="credit"/> crédits</li>
			<li><xsl:value-of select="resume"/></li>
			<li><xsl:value-of select="lieu"/></li>
			<xsl:if test="ref-intervenant/@ref">
				<li>
					<xsl:call-template name="lien_intervenant">
						<xsl:with-param name="href">
							<xsl:value-of select="ref-intervenant/@ref"/>
						</xsl:with-param>
					</xsl:call-template>
				</li>
			</xsl:if>
			<!-- var -->
			<xsl:variable name="id_ue" select="@id"/>
			<xsl:variable name="ref_parcours" select="//parcours/semestre/bloc[ref-ue/@ref=$id_ue]"/>
			<!-- trouver lien parcours -->
			<li>
				<xsl:for-each select="$ref_parcours">
					<xsl:call-template name="lien_parcours">
						<xsl:with-param name="href">
							<xsl:value-of select="@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</li>
		</ul>
	</xsl:template>
	
	<xsl:template name="lien_ue">
	    <xsl:param name="href"/>
			<a href="{$href}.html#{$href}">
				<xsl:variable name="ref" select="$href"/>
				<xsl:value-of select="/master/ue[@id=$ref]/nom"/>
		    </a>
	</xsl:template>


</xsl:stylesheet>

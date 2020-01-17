<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output 
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding = "iso-8859-1"
	method="html"
/>


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
		<li>
			<xsl:call-template name="lien_intervenant">
				<xsl:with-param name="href">
					<xsl:value-of select="@id"/>
				</xsl:with-param>
			</xsl:call-template>
		</li>
	</xsl:template>
	
	
	
	<!-- REGLES NOMMEES -->
	
	<!-- INTERVENANTS -->
	<xsl:template name="fiche_intervenant">
		<xsl:param name="href"/>
		<h3 id="{$href}"><xsl:value-of select="nom"/></h3>
		<ul>
			<li><xsl:value-of select="email"/></li>
			<li><xsl:value-of select="web"/></li>
			<!-- var -->
			<xsl:variable name="id_int" select="@id"/>
			<xsl:variable name="ref_ue" select="//ue[ref-intervenant/@ref=$id_int]"/>
			<xsl:variable name="ref_parcours" select="//parcours[ref-intervenant/@ref=$id_int]"/>
			<!-- trouver lien ue -->
			<li>
				<xsl:for-each select="$ref_ue">
					<xsl:call-template name="lien_ue">
						<xsl:with-param name="href">
							<xsl:value-of select="@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</li>
			<!-- trouver lien parcours -->
			<xsl:for-each select="$ref_parcours">
				<li>
				<xsl:call-template name="lien_parcours">
					<xsl:with-param name="href">
						<xsl:value-of select="@id"/>
					</xsl:with-param>
				</xsl:call-template>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template name="lien_intervenant">
	    <xsl:param name="href"/>
			<a href="{$href}.html#{$href}">
				<xsl:variable name="ref" select="$href"/>
				<xsl:value-of select="/master/intervenant[@id=$ref]/nom"/>
				
		    </a>
	</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		encoding = "iso-8859-1"
		method="html"
	/>

<xsl:key name="parcoursParUe"  match="/master/parcours/semestre/bloc/ref-ue"  use="@ref"/>

<!-- UE -->
	<xsl:template match="ue" mode="fiche">
		<!-- ... produire la fiche d'une ue ... -->
		<xsl:variable name="idUe" select="@id"/>
		<xsl:document href="{$idUe}.html">
			<html>
				<head>
					<title><xsl:value-of select="nom"/></title>
				</head>
				<body>
					<a href= "Index.html" ><i><b>Index</b></i></a>
					<hr />
					<h2 id="{$idUe}"><xsl:value-of select="nom"/></h2>
					<ul>
						<li><xsl:value-of select="credit"/> crédits</li>
						<li><xsl:value-of select="resume"/></li>
						<li><xsl:value-of select="lieu"/></li>
						<xsl:if test="ref-intervenant/@ref">
							<li>
								Responsable : 
								<xsl:call-template name="lien_intervenant">
									<xsl:with-param name="href">
										<xsl:value-of select="ref-intervenant/@ref"/>
									</xsl:with-param>
								</xsl:call-template>
							</li>
						</xsl:if>
						<!-- Parcours -->
						<li>Lié aux parcours</li>
						<ul>
							<xsl:for-each select="key('parcoursParUe', $idUe)">
								<xsl:variable name="nameParc" select="//../../../nom"/>
								<xsl:variable name="idParc" select="//../../../@id"/>
								<li>
									<xsl:call-template name="lien_parcours">
										<xsl:with-param name="href">
											<xsl:value-of select="$idParc"/>
										</xsl:with-param>
										<xsl:with-param name="target">
											<xsl:value-of select="$nameParc"/>
										</xsl:with-param>
									</xsl:call-template>
								</li>
							</xsl:for-each>
						</ul>
					</ul>	
				</body>
			</html>
		</xsl:document>
	</xsl:template>
	
	<xsl:template match="ue" mode="ref">
	<!-- ... produire un lien vers la fiche d'une ue ... -->
		<li>
			<xsl:call-template name="lien_ue">
				<xsl:with-param name="href">
					<xsl:value-of select="@id"/>
				</xsl:with-param>
				<xsl:with-param name="target">
					<xsl:value-of select="nom"/>
				</xsl:with-param>
			</xsl:call-template>
		</li>
	</xsl:template>
	
	<xsl:template name="lien_ue">
	    <xsl:param name="href"/>
	    <xsl:param name="target"/>
		<a href="{$href}.html#{$href}">
			<xsl:value-of select="$target"/>
	    </a>
	</xsl:template>


</xsl:stylesheet>

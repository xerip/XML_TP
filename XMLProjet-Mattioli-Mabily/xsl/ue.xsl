

<xsl:stylesheet version="2.0"   
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	>

	<xsl:key name="parcoursParUe"  match="/master/parcours/semestre/bloc/ref-ue"  use="@ref"/>

<!-- UE -->
	<xsl:template match="ue" mode="fiche">
		<!-- ... produire la fiche d'une ue ... -->
		<xsl:variable name="idUe" select="@id"/>
		<xsl:result-document href="{$idUe}.html">
			<html>
				<head>
					<title><xsl:value-of select="nom"/></title>
					<xsl:apply-templates select="/" mode="head-css" /> 
				</head>
				<body>
					<h1><a href="master.html" title="MASTER INFORMATIQUE Accueuil"><span>MASTER INFORMATIQUE</span></a></h1>
					<div id="conteneur">
						<ul id="menu">
							<li><a href="master.html">Index</a></li>
						</ul>
						<div id="contenu">
							<h2 id="{$idUe}"><xsl:value-of select="nom"/></h2>
							<ul>
								<li><xsl:value-of select="credit"/> crédits</li>
								<li><p><xsl:value-of select="resume"/></p></li>
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
						</div>
					</div>
					<p id="footer">C'est la page du master</p>
				</body>
			</html>
		</xsl:result-document
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

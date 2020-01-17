

<xsl:stylesheet version="2.0"   
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	>
	

	<xsl:key name="ueParIntervenants"  match="//ue/ref-intervenant"  use="@ref"/>
	<xsl:key name="parcoursParIntervenants"  match="//parcours/ref-intervenant"  use="@ref"/>

<!-- INTERVENANTS -->	
	<xsl:template match="intervenant" mode="fiche">
		<!-- ... produire la fiche d'un intervenant ... -->
		<xsl:variable name="idInterv" select="@id"/>
		<xsl:result-document href="{$idInterv}.html">
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
							<h2 id="{$idInterv}"><xsl:value-of select="nom"/></h2>
							<ul>
								<li><xsl:value-of select="email"/></li>
								<li><xsl:value-of select="web"/></li>
								<!-- Unités liées -->
								<!-- <xsl:variable name="chemin-ue" select="//ue/ref-intervenant[@ref=$idInterv]"/> -->
								<li>Intervient dans</li>
								<ul>
									<xsl:for-each select="key('ueParIntervenants', $idInterv)">
										<li>
											<xsl:call-template name="lien_ue">
												<xsl:with-param name="href">
													<!-- id de l'ue -->
													<xsl:value-of select="../@id"/>
												</xsl:with-param>
												<xsl:with-param name="target">
													<!-- nom de l'ue -->
													<xsl:value-of select="../nom"/>
												</xsl:with-param>
											</xsl:call-template>
										</li>
									</xsl:for-each>
								</ul>
								<!-- Parcours liées -->
								<!-- <xsl:variable name="chemin-parcours" select="//parcours/ref-intervenant[@ref=$idInterv]"/> -->
								<li>Responsable des parcours</li>
								<ul>
									<xsl:for-each select="key('parcoursParIntervenants', $idInterv)">
										<li>
											<xsl:call-template name="lien_ue">
												<xsl:with-param name="href">
													<!-- id du parcours -->
													<xsl:value-of select="../@id"/>
												</xsl:with-param>
												<xsl:with-param name="target">
													<!-- nom du parcours -->
													<xsl:value-of select="../nom"/>
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
		</xsl:result-document>
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
	
	<xsl:template name="lien_intervenant">
	    <xsl:param name="href"/>
			<a href="{$href}.html#{$href}">
				<xsl:variable name="ref" select="$href"/>
				<xsl:value-of select="//intervenant[@id=$ref]/nom"/>
		    </a>
	</xsl:template>
	
</xsl:stylesheet>

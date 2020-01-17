<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<xsl:import href="intervenant.xsl" />
	<xsl:import href="ue.xsl" />
	<xsl:import href="parcours.xsl" />
	<xsl:include href="intervenant.xsl" />
	<xsl:include href="ue.xsl" />
	<xsl:include href="parcours.xsl" />
	<xsl:output 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		encoding = "iso-8859-1"
		method="html"
	/>
	
	
	<!-- ARBRE -->
	
	<!-- ATTENTION Faire sans frame, c'est dépassé apparemment -->
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Plan du Master Informatique</title>
			</head>
			<xsl:document href="Index.html">
		        <html>
					<head><title>Index</title></head>
						<body>
							<h2>Liste Intervenants</h2>
							<xsl:apply-templates select="master/intervenant" mode="ref" />
							<h2>Liste UE</h2>
							<xsl:apply-templates select="master/ue" mode="ref" />
							<h2>Liste Parcours</h2>
							<xsl:apply-templates select="master/parcours" mode="ref" />
						</body>
				</html>
			</xsl:document>
					
			<xsl:for-each select="//ue">
				<xsl:variable name="id" select="@id"/>
				<xsl:document href="{$id}.html">
					<html>
						<head>
							<title><xsl:value-of select="nom"/></title>
						</head>
						<body>
							<xsl:apply-templates select="." mode="menu"/>
							<xsl:call-template name="fiche_ue">
								<xsl:with-param name="href">
									<xsl:value-of select="@id"/>
								</xsl:with-param>
							</xsl:call-template>
						<hr />
						<a href= "Index.html" ><i><b>Retour vers la page d'accueil</b></i></a>
						</body>
					</html>
				</xsl:document>
			</xsl:for-each>
			
			<xsl:for-each select="//intervenant">
				<xsl:variable name="id" select="@id"/>
				<xsl:document href="{$id}.html">
					<html>
						<head>
							<title><xsl:value-of select="nom"/></title>
						</head>
						<body>
							<xsl:call-template name="fiche_intervenant">
								<xsl:with-param name="href">
									<xsl:value-of select="@id"/>
								</xsl:with-param>
							</xsl:call-template>
						<hr />
						<a href= "Index.html" ><i><b>Retour vers la page d'accueil</b></i></a>
						</body>
					</html>
				</xsl:document>
			</xsl:for-each>
			
			<xsl:for-each select="//parcours">
				<xsl:variable name="id" select="@id"/>
				<xsl:document href="{$id}.html">
					<html>
						<head>
							<title><xsl:value-of select="nom"/></title>
						</head>
						<body>
							<xsl:call-template name="fiche_parcours">
								<xsl:with-param name="href">
									<xsl:value-of select="@id"/>
								</xsl:with-param>
							</xsl:call-template>
						<hr />
						<a href= "Index.html" ><i><b>Retour vers la page d'accueil</b></i></a>
						</body>
					</html>
				</xsl:document>
			</xsl:for-each>
			
			
			<body>
	        </body></html>
	</xsl:template>
	
	
	<xsl:template select="." mode="menu">
		<ul>
			<li>
				<xsl:apply-templates select="master/intervenant" mode="ref" />
			</li>
			<li>
				<xsl:apply-templates select="master/ue" mode="ref" />
			</li>
			<li>
				<xsl:apply-templates select="master/parcours" mode="ref" />
			</li>
		</ul>
	</xsl:template>



</xsl:stylesheet>

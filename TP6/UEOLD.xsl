<?xml version="1.0" encoding="iso-8859-1"?>

	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		encoding = "iso-8859-1"
		method="html"
	/>
	
	 <xsl:template match="/">                              <!-- R1 -->
        <html>
			<head>
				<title>Master</title>
			</head>
			<body>
	            <xsl:apply-templates/>
	        </body></html>
    </xsl:template>

    <xsl:template match="master">                          <!-- R2 -->
        <h1>Plan du master</h1>
        <h2>Intervenants</h2>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="master/intervenant">                          <!-- R3 -->
		<xsl:call-template name='liste_intervenants'>
			<!-- PARAMETRES -->
		</xsl:call-template>
    </xsl:template>

    <xsl:template match="master/parcours">                        <!-- R4 -->
        <h2> Parcours <xsl:value-of select="nom"/></h2>
        <!-- <p> Responsable : <xsl:value-of select="."/> -->
       <!-- en <xsl:value-of select="prix/@monnaie"/></p>
        <xsl:if test="comment">
            <p><xsl:value-of select="comment"/></p>
        </xsl:if> -->
    </xsl:template>
	
	<!-- REGLES NOMMEES -->
	<xsl:template name='liste_intervenants'>
		<p><xsl:value-of select="nom"/></p>
	</xsl:template>
	
	<xsl:template match="semestre" name='tt'>
		<p><xsl:value-of select="nom"/></p>
	</xsl:template>
	
	<!--
	<xsl:template match="produit">
		<h2>Produit <xsl:value-of select="nom"/></h2>
		<xsl:apply-templates select="prix"/>
	</xsl:template>
	
	<xsl:template match="prix">
		<p>Prix : <xsl:value-of select="."/> en
		<xsl:value-of select="@monnaie"/></p>
	</xsl:template> 
	-->
	
</xsl:stylesheet>

<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" method="html"/>

  <xsl:template match="master">
    <html><body>
      <h1>master</h1>
      <xsl:apply-templates/>
    </body></html>
  </xsl:template>

  <xsl:template match="UE">
    <h2>UE <xsl:value-of select="nom"/></h2>
    <xsl:apply-templates select="id"/>
  </xsl:template>

  <xsl:template match="prix">
    <p>Prix : <xsl:value-of select="."/> en
    <xsl:value-of select="@monnaie"/></p>
  </xsl:template>

</xsl:stylesheet>
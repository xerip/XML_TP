<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		encoding = "iso-8859-1"
		method="html"
	/>
	
	<xsl:template match="/" mode="head-css">
		<style type="text/css">
			body
			{
				margin: 10px 0 ;
				padding: 0 ;
				text-align: center ;
				font: 0.8em "Trebuchet MS", helvetica, sans-serif ;
				background: #abf ;
			}
			div#conteneur
			{
				width: 770px ;
				margin: 0 auto ;
				text-align: left ;
				border: 2px solid #00f ;
				background: #fff ;
			}
			h1
			{
				height: 100px;
				background: #cdf no-repeat left top;
				margin: 0 ;
			}
			<!--
			h1 a
			{
				width: 400px ;
				height: 70px ;
				display: block ;
				background: #fff no-repeat ;
				position: relative ;
				left: 350px ;
				top: 15px ;
				text-indent: -5000px ;
			}
			-->
			ul#menu
			{
				height: 35px ;
				margin: 0 ;
				padding: 0 ;
				background: #89f repeat-x 0 -25px ;
				list-style-type: none ;
			}
			ul#menu li
			{
				float: left ;
				text-align: center ;
			}
			ul#menu li a
			{
				width: 130px ;
				line-height: 25px ;
				font-size: 1.2em ;
				font-weight: bold ;
				letter-spacing: 2px ;
				color: #00f ;
				display: block ;
				text-decoration: none ;
				border-right: 2px solid #000 ;
			}
			ul#menu li a:hover
			{
				background: #ccf repeat-x 0 0 ;
			}
			
			div#contenu
			{
				padding: 0 25px 0 100px ;
				background: #ddf no-repeat 15px 15px ;
			}
			div#contenu h2
			{
				padding-left: 25px ;
				line-height: 25px ;
				font-size: 1.4em ;
				background: #9af no-repeat left bottom ;
				color: #000 ;
				border-bottom: 1px solid #000 ;
			}
			div#contenu h3
			{
				margin-left: 15px ;
				padding-left: 5px ;
				border-bottom: 1px solid #34f ;
				border-left: 3px solid #34f ;
				color: #000 ;
			}
			div#contenu p
			{
				text-align: justify ;
				text-indent: 2em ;
				line-height: 1.7em ;
			}
			div#contenu a
			{
				color: #00f ;
			}
			
			div#contenu a:hover
			{
				color: #09f;
			}
			p#footer
			{
				margin: 0 ;
				padding-right: 10px ;
				line-height: 30px ;
				text-align: right ;
				color: #00f ;
			}
			pre
			{
				overflow: auto ;
				background: #dea ;
				border: 2px solid #9b2 ;
				padding: 5px 0 0 5px ;
				font-size: 1.2em ;
			}
			pre span
			{
				color: #560 ;
			}
			pre span.comment
			{
				color: #b30000 ;
			}
			<!--[if IE]>
			<style type="text/css">
			html pre
			{
				width: 636px ;
			}
			</style>
			<![endif]-->
		</style>
	</xsl:template>


</xsl:stylesheet>

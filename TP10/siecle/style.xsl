<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">

    <xsl:output indent="yes" />
    
    
    <xsl:template match="/">
        <resultats>
           <!-- <xsl:copy-of select="(//mois[nom = 'février 1950']/jour/nom), //jour[starts-with[nom, 'lundi']/nom)[][]" />-->
        </resultats>
        
    <exemple1>
        <liste v="{  (1, 2, 3, 'hello', 10.5)            }"/>
        <liste v="{  (//semaine/numero, //semaine[numero='50'])  }"/>

        <vrai v="{  (1,2,3) instance of xs:integer*     }"/>
        <vrai v="{  (1,2,3) instance of xs:integer+     }"/>
        <faux v="{  (1,2,3) instance of xs:integer?     }"/>
        <vrai v="{  //prix  instance of element(prix)+  }"/>
    </exemple1>
    
    </xsl:template>



</xsl:stylesheet>

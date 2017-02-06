<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:param name="reveal" />

<xsl:output method="xml" encoding="UTF-8" />
  



  <xsl:template match="/">


  <html>
  <head>
<title>404: Page not found</title>  
  </head>
  <body>
  <h2>ERROR<br/><em>Page not found</em></h2>
  <p class="error">This website is a work in progress. As such, certain links will lead to pages that are currently still in development. We apologize for any inconvenience and hope that you check back often as we finalize work on these pages.
  </p>
  
  
  
  
  
  <xsl:if test="$reveal='true'">
    <xsl:copy-of select="." />
  </xsl:if>
  
  
  
</body>    
  </html>  

  </xsl:template>

</xsl:stylesheet>

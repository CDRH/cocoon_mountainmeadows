<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="xml" encoding="UTF-8" />
  



  <xsl:template match="/">


  <html>
  <body>
  <h1>Browse</h1>

  


<div class="twoCol">
<div class="menuSide">
<h2 class="h4" id="document_type">Document Type</h2>
<nav aria-labelledby="document_type">
<ul>
<li class="selected">Newspaper Accounts (<xsl:value-of select="count(//document)" />)</li>
<li>Anti-mormon Publications (0)</li>
<li>Western Americana (0)</li>
<li>Fiction (0)</li>
<li>Film (0)</li>
</ul>  
</nav>
  </div>
  <div class="contentSide">
  <table>
  <tr><th>Title</th><th>Source</th><th>Date</th></tr>
  <xsl:for-each select="//document">
  <tr><xsl:if test="(position() mod 2) = 1"><xsl:attribute name="class">odd</xsl:attribute></xsl:if>
    <td><a href="archive/{./@id}.html"><xsl:value-of select="./title" /></a></td>
    <td class="source"><xsl:value-of select="./source" /></td>
    <td class="date"><xsl:value-of select="./date" /></td>
    </tr>
    
    </xsl:for-each>
  </table>
  </div>
</div>
  
  
  
</body>    
  </html>  

  </xsl:template>

</xsl:stylesheet>

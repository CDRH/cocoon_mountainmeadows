<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="xml" encoding="UTF-8" />
    
    <xsl:include href="../xsl/common.xsl"/>
    <xsl:include href="../config/config.xsl"/>
    
    <xsl:template match="/">
        
        
        <html>
            <body>
                <h2>Search Results</h2>
                
                 
                 <p>Your search for <xsl:value-of select="//str[@name='q']"/> returned  
                     <xsl:value-of select="//result/@numFound"/> result(s).</p>
                
                <ul>
                <xsl:for-each select="//doc">
                    <xsl:variable name="filename"><xsl:value-of select="str[@name='id']"/></xsl:variable>
                   <li><a href="{$siteroot}archive/{$filename}.html"> 
                    <xsl:value-of select="str[@name='titleMain']"/>
                    </a></li>
                </xsl:for-each>
                
              </ul>
                
                
                
                
                
            </body>    
        </html>  
        
    </xsl:template>
    
</xsl:stylesheet>

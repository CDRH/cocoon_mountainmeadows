<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="xml" encoding="UTF-8" />
    
    <xsl:include href="../xsl/common.xsl"/>
    
    <xsl:template match="/">
        
        
        <html>
            <body>
                <h2>Search</h2>
                
                 
                    <p>
                        Here is where you search. And get results. 
                    </p>
                     
                    
                <form action="search/result.html" method="get" enctype="application/x-www-form-urlencoded">
                   
                        <h3>Search by keyword:</h3>
                        
                        
                        <input id="basic-q" type="text" name="q" value="" class="textField"/>
                        
                        <p class="submit">
                            <input type="submit" value="Search Documents" class="submit"/>
                        </p>
                        
                        <p>Tips: <br/> To exclude a word, preceed with "-" (i.e. cody
                            -buffalo)<br/> To search for a phrase, include in quotations
                            (i.e. "bringing indians")</p>
                   
                    
                </form>
                
              
                
                
                
                
                
            </body>    
        </html>  
        
    </xsl:template>
    
</xsl:stylesheet>

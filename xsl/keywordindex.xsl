<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:source="http://apache.org/cocoon/source/1.0" xmlns:dir="http://apache.org/cocoon/directory/2.0" version="2.0">

<!--
<xsl:import href="common.xsl"/>
-->

<xsl:output method="xml" encoding="UTF-8"/>


<xsl:template match="/">

    <page> 
        
            <source:write>
                <source:source>final_xml/mmm.index.xml</source:source>
       
                <source:fragment>
        <index>
        

            <xsl:for-each select="//dir:file">
            
                <document>
                    <xsl:variable name="file" select="concat('../final_xml/', ./@name)"/>
                    <xsl:variable name="tei" select="../document($file)/TEI.2"/>
                    
                    <xsl:attribute name="id" select="$tei/@id"/>
                    <xsl:attribute name="date"><xsl:value-of select="$tei//sourceDesc/biblFull/publicationStmt/date/text()"/></xsl:attribute>
                    <xsl:attribute name="sympathy"><xsl:value-of select="($tei//keywords[@n='sympathy']/term)[1]"/></xsl:attribute>
                    
                    <title><xsl:value-of select="$tei//sourceDesc/biblFull/titleStmt/title[@level = 'a']"/></title>
                    
                    <source><xsl:value-of select="$tei//sourceDesc/biblFull/titleStmt/title[@level = 'j']"/></source>
                    
                    <date><xsl:call-template name="extractDate"><xsl:with-param name="date" select="$tei//sourceDesc/biblFull/publicationStmt/date/text()"/></xsl:call-template></date>
                    
                    <note><xsl:apply-templates select="$tei/teiHeader/fileDesc/notesStmt/note[@type='summary']"/></note>

                    
                    <segs>
                    <xsl:for-each select="$tei/text//seg[@type and @subtype]">
                        <seg type="{@type}" subtype="{@subtype}" qtype="{@type}: {@subtype}">
                            <xsl:apply-templates select="."/>
                        </seg>
                    </xsl:for-each>
                    </segs>
                    
                </document>
            
            </xsl:for-each>
            
        </index>
                  </source:fragment>
                  </source:write>
                  </page>



</xsl:template>

    <xsl:template name="extractDate">
        <xsl:param name="date"/>
        <!--This template converts a date from format YYYY-MM-DD to mm D, YYYY (MM, MM-DD, optional)-->
        
        
        <xsl:variable name="YYYY" select="substring($date,1,4)"/>
        <xsl:variable name="MM" select="substring($date,6,2)"/>
        <xsl:variable name="DD" select="substring($date,9,2)"/>
        <!--
        (Y:"<xsl:value-of select="$YYYY" />" M:"<xsl:value-of select="$MM" />" D:"<xsl:value-of select="$DD" />")
        -->
        <xsl:choose>
            <xsl:when test="($DD != '') and ($MM != '') and ($DD != '')">
                <xsl:call-template name="lookUpMonth"><xsl:with-param name="numValue" select="$MM"/></xsl:call-template><xsl:text> </xsl:text> <xsl:number format="1" value="$DD"/>, <xsl:value-of select="$YYYY"/>
            </xsl:when>
            <xsl:when test="($DD != '') and ($MM != '')">
                <xsl:call-template name="lookUpMonth"><xsl:with-param name="numValue" select="$MM"/></xsl:call-template>, <xsl:value-of select="$YYYY"/>
            </xsl:when>
            <xsl:when test="($YYYY != '')">
                <xsl:value-of select="$YYYY"/>
            </xsl:when>
            <xsl:otherwise>
                N.D.
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template name="lookUpMonth">
        <xsl:param name="numValue"/>
        <xsl:choose>
            <xsl:when test="$numValue = '01'">January</xsl:when>
            <xsl:when test="$numValue = '02'">February</xsl:when>
            <xsl:when test="$numValue = '03'">March</xsl:when>
            <xsl:when test="$numValue = '04'">April</xsl:when>
            <xsl:when test="$numValue = '05'">May</xsl:when>
            <xsl:when test="$numValue = '06'">June</xsl:when>
            <xsl:when test="$numValue = '07'">July</xsl:when>
            <xsl:when test="$numValue = '08'">August</xsl:when>
            <xsl:when test="$numValue = '09'">September</xsl:when>
            <xsl:when test="$numValue = '10'">October</xsl:when>
            <xsl:when test="$numValue = '11'">November</xsl:when>
            <xsl:when test="$numValue = '12'">December</xsl:when>
            <xsl:otherwise/></xsl:choose>
    </xsl:template>

</xsl:stylesheet>

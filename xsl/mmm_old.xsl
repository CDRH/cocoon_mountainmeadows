<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:param name="highlight">zNoTerm</xsl:param>
    
    <xsl:include href="../xsl/common.xsl"/>

    <xsl:variable name="expansions" select="document('mmm.expansions.xml')//abbr" />    
    
    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="//sourceDesc/biblFull/titleStmt/title[@level = 'a']"/>&#8212;<xsl:value-of select="//sourceDesc/biblFull/titleStmt/title[@level = 'j']"/>, <xsl:call-template name="extractDate"><xsl:with-param name="date" select="//sourceDesc/biblFull/publicationStmt/date/text()" /></xsl:call-template></title>
  
               <style type="text/css">
                  .highlight {background-color: yellow;}
               </style>         
                
                <script language="javascript" src="js/mmm.js">
					//Main scripts
                
                </script>
                
                
            </head>
            <body>

<div class="twoCol">

<div class="menuSide">

<h4>Source</h4>
<p><em><xsl:value-of select="//sourceDesc/biblFull/titleStmt/title[@level = 'j']"/></em>
<br/>
<xsl:call-template name="extractDate"><xsl:with-param name="date" select="//sourceDesc/biblFull/publicationStmt/date/text()" /></xsl:call-template>
</p>

<h4>Concepts</h4>
                <div class="keywords">
                <ul>
                  <xsl:for-each select="//seg[@type and @subtype and not(@subtype=preceding::seg/@subtype)]" >
                  <xsl:sort select="./@type" />
                  <xsl:sort select="./@subtype" />
                  <xsl:variable name="this_type" select="./@type"/>
                  <xsl:variable name="this_subtype" select="./@subtype" />
                      <xsl:variable name="qtype"><xsl:value-of select="@type"/>: <xsl:value-of select="@subtype"/></xsl:variable>
                  <li><span title="{$qtype}">
                      <xsl:if test="starts-with($qtype, $highlight)"><xsl:attribute name="class">highlight</xsl:attribute></xsl:if>
                      <a onmouseover="highlightSpan(this.getAttribute('title'))" title="{./@type}: {./@subtype}"><xsl:value-of select="./@type" />: <br/><strong><xsl:value-of select="$expansions[./@type=$this_type and ./@n=$this_subtype]/@expan" /></strong></a></span></li>
                </xsl:for-each>
                </ul>
                </div>            
              </div>
              
              <div class="contentSide">
                   <xsl:apply-templates select="//body" />
            </div>
            
 </div>
            
            
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="div1/head"><h2><xsl:apply-templates /></h2></xsl:template>
    
    <xsl:template match="dateline"><p class="dateLine"><xsl:apply-templates /></p></xsl:template>
    
    <xsl:template match="div2/head"><h3><xsl:apply-templates /></h3></xsl:template>
    
  <xsl:template match="opener">
  <p class="opener">
  <xsl:apply-templates />  
  </p>
  </xsl:template>  
    
    <xsl:template match="p">
        <p><xsl:apply-templates /></p>
    </xsl:template>
    
   <xsl:template match="q">
    <blockquote>
    <xsl:choose>

    <xsl:when test="descendant::p">
      <xsl:apply-templates />
      </xsl:when>
      <xsl:otherwise>
        <p><xsl:apply-templates /></p>
        </xsl:otherwise>
        </xsl:choose>
    </blockquote>
  </xsl:template>
    
    <xsl:template match="hi[@rend='italic']">
      <em><xsl:apply-templates /></em>
  </xsl:template>
      
    <xsl:template match="hi[@rend='bold']">
      <strong><xsl:apply-templates /></strong>
  </xsl:template>      
      
    <xsl:template match="body//lb">
    <br/>
    </xsl:template>
    
    <xsl:template match="seg[@type and @subtype]">
        <xsl:variable name="qtype"><xsl:value-of select="@type"/>: <xsl:value-of select="@subtype"/></xsl:variable>
            <span title="{$qtype}">
                <xsl:if test="starts-with($qtype, $highlight)"><xsl:attribute name="class">highlight</xsl:attribute></xsl:if>
            <xsl:apply-templates />
            </span>
    </xsl:template>
    
    <xsl:template match="figure[@entity]">
        <p class="figure">
         <a href="../images/{@entity}"><img src="../images/thumbs/{@entity}" /></a><br/>
         <small class="caption"><xsl:apply-templates select="./figdesc"/></small>
         </p>
        
    </xsl:template>
    

    
</xsl:stylesheet>

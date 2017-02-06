<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    
    <!--<xsl:output method="html" omit-xml-declaration="yes" indent="yes"  encoding="UTF-8" />-->
   

    <xsl:param name="highlight">zNoTerm</xsl:param>

    <xsl:include href="../xsl/common.xsl"/>
    <xsl:include href="../config/config.xsl"/>

    <xsl:variable name="expansions" select="document('mmm.expansions.xml')//abbr"/>

    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <xsl:template match="tei:*[not(parent::*)]"> 
        <html>
            <head>
                <title><xsl:value-of select="//tei:sourceDesc/tei:bibl/tei:title[@level = 'a']"
                        />&#8212;<xsl:value-of
                        select="//tei:sourceDesc/tei:bibl/tei:title[@level = 'j']"/>,
                        <xsl:call-template name="extractDate"><xsl:with-param name="date"
                            select="//tei:sourceDesc/tei:bibl/tei:date/@when"
                            /></xsl:call-template></title>


                <style type="text/css">
                    .highlight {
                        background-color: yellow;
                    }</style>

                <script language="javascript" src="js/mmm.js">
                    //Main scripts</script>


            </head>
            <body>

                <div class="twoCol">

                    <div class="menuSide">

                        <h4>Source</h4>
                        <xsl:choose>
                            <xsl:when test="string(//tei:note[@type='source'])">
                                <p><xsl:apply-templates select="//tei:note[@type='source']"/>
                                    <br/>
                                    <a href="{$siteroot}archive/{/tei:TEI/@xml:id}.xml">View full xml</a>
                            </p>
                            </xsl:when>
                            <xsl:otherwise>
                                <p>
                                    <em>
                                        <xsl:value-of
                                            select="//tei:sourceDesc/tei:bibl/tei:title[@level = 'j']"/> 
                                        <xsl:text>&#160;</xsl:text></em>
                                    <em>
                                        <xsl:value-of
                                            select="//tei:sourceDesc/tei:bibl/tei:title[@level = 'm']"/> 
                                        <xsl:text>&#160;</xsl:text></em>
                                    <br/>
                                    <xsl:value-of
                                        select="//tei:sourceDesc/tei:bibl/tei:pubPlace"/> 
                                    <xsl:text>&#160;</xsl:text>
                                    <br/>

                                    <xsl:call-template name="extractDate">
                                        <xsl:with-param name="date"
                                            select="//tei:sourceDesc/tei:bibl/tei:date/@when"/>
                                    </xsl:call-template>
                                    
                                    <br/>
                                    <a href="{$siteroot}archive/{/tei:TEI/@xml:id}.xml">View full xml</a> 
                                </p>
 
                            </xsl:otherwise>
                        </xsl:choose>
    
                        
                       

                        <h4>Concepts</h4>
                        
                        <xsl:choose>
                            <xsl:when test="//tei:seg">
                                <div class="keywords">
                                    <ul>
                                        <xsl:for-each
                                            select="//tei:seg[@type and @subtype and not(@subtype=preceding::tei:seg/@subtype)]">
                                            <xsl:sort select="./@type"/>
                                            <xsl:sort select="./@subtype"/>
                                            <xsl:variable name="this_type" select="./@type"/>
                                            <xsl:variable name="this_subtype" select="./@subtype"/>
                                            <xsl:variable name="qtype"><xsl:value-of select="@type"/>: <xsl:value-of select="@subtype"/></xsl:variable>
                                            <li>
                                                <span title="{$qtype}">
                                                    <xsl:if test="starts-with($qtype, $highlight)">
                                                        <xsl:attribute name="class">highlight</xsl:attribute>
                                                    </xsl:if>
                                                    <a onmouseover="highlightSpan(this.getAttribute('title'))"
                                                        title="{./@type}: {./@subtype}"><xsl:value-of
                                                            select="./@type"/>: <br/><strong><xsl:value-of
                                                                select="$expansions[./@type=$this_type and ./@n=$this_subtype]/@expan"/><xsl:text>&#160;</xsl:text></strong></a>
                                                </span>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </div>
                            </xsl:when>
                            <xsl:otherwise><p>Forthcoming</p></xsl:otherwise>
                        </xsl:choose>
                        
                        
                    </div>

                    <div class="contentSide">
                        <xsl:apply-templates select="//tei:text"/>
                      
                    </div>

                </div>


            </body>
        </html>
    </xsl:template>


    <xsl:template match="tei:head"> 
        
        <xsl:choose>
            <xsl:when test="@type='sub'">
                <h3>
                    <xsl:apply-templates/>
                </h3>
            </xsl:when>
            <xsl:otherwise>
                <h2>
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text></h2>
            </xsl:otherwise>
        </xsl:choose>
        
      
    </xsl:template>

    <xsl:template match="tei:dateline">
        <p class="dateLine">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:head[preceding::tei:div1]">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

    <xsl:template match="tei:opener">
        <p class="opener">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:p | tei:closer">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:quote">
        
            <xsl:choose>

                <xsl:when test="parent::tei:p">
                   <blockquote> <xsl:apply-templates/></blockquote>
                </xsl:when>
                <xsl:when test="parent::tei:head">
                     <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <p><blockquote>
                        <xsl:apply-templates/>
                    </blockquote></p>
                </xsl:otherwise>
            </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:choose>
            <xsl:when test="tei:sic">
                <a>
                    <xsl:attribute name="rel"><xsl:text>tooltip</xsl:text></xsl:attribute>
                    <xsl:attribute name="class"><xsl:text>sic</xsl:text></xsl:attribute>
                    <xsl:attribute name="title"><xsl:value-of select="tei:corr"/></xsl:attribute>
                    <xsl:apply-templates select="tei:sic"/>
                </a>
          
                <!--<a rel="tooltip" class="sic" title="test"><xsl:value-of select="tei:sic"/></a>-->
            </xsl:when>
            <xsl:when test="tei:orig">
                <xsl:apply-templates select="tei:orig"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="@target"><!--
                <a href="{$siteroot}archive/{@target}">--><xsl:apply-templates/><!--</a>-->
            </xsl:when>
            <xsl:otherwise>
                <sup>
                    <xsl:apply-templates/>
                </sup>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    
    <xsl:template match="tei:note">
        <div class="noteline">&#160;</div>
        <div class="note">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:hi[@rend='italic']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <xsl:template match="tei:hi[@rend='bold']">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>

    <xsl:template match="tei:body[child::tei:lb]"> <!--body//lb-->
        <br/>
    </xsl:template>

    <xsl:template match="tei:seg[@type and @subtype]">
        <xsl:variable name="qtype"><xsl:value-of select="@type"/>: <xsl:value-of select="@subtype"/></xsl:variable>
        
        <span title="{$qtype}">
            <xsl:if test="starts-with($qtype, $highlight)">
                <xsl:attribute name="class">highlight</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </span>
        
    </xsl:template>

    <xsl:template match="tei:figure[@entity]">
        <p class="figure">
            <a href="../images/{@entity}">
                <img src="../images/thumbs/{@entity}"/>
            </a>
            <br/>
            <small class="caption">
                <xsl:apply-templates select="./tei:figdesc"/>
            </small>
        </p>

    </xsl:template>
    
    <xsl:template match="tei:pb">
        <!--
        <xsl:choose>
            <xsl:when test="ancestor::tei:quote">
               <![CDATA[    </p></blockquote>    ]]>
                <div class="hr">&#160;</div>
                <span class="pageimage">
                    <a href="{$siteroot}figures/pages/fullsize/{@xml:id}.jpg" rel="prettyPhoto[pp_gal]">
                        <img src="{$siteroot}figures/pages/thumbnails/{@xml:id}.jpg"/>
                        <br/>
                        <xsl:if test="@n != 'unknown'">
                            [p. <xsl:value-of select="@n"></xsl:value-of>]</xsl:if>
                    </a>
                    <br/>
                    
                </span>
                <![CDATA[    <blockquote><p>    ]]>
            </xsl:when>
            <xsl:when test="ancestor::tei:p">
                <![CDATA[    </p>    ]]>
                <div class="hr">&#160;</div>
                <p class="pageimage">
                    <a href="{$siteroot}figures/pages/fullsize/{@xml:id}.jpg" rel="prettyPhoto[pp_gal]">
                        <img src="{$siteroot}figures/pages/thumbnails/{@xml:id}.jpg"/>
                        <br/>
                        <xsl:if test="@n != 'unknown'">
                            [p. <xsl:value-of select="@n"></xsl:value-of>]</xsl:if>
                    </a>
                    <br/>
                    
                </p>
                <![CDATA[    <p>    ]]>
            </xsl:when>
            <xsl:otherwise>
            -->
            
                <span class="hr">&#160;</span>
                <span class="pageimage">
                    <a href="{$siteroot}figures/pages/fullsize/{@xml:id}.jpg" rel="prettyPhoto[pp_gal]">
                        <img src="{$siteroot}figures/pages/thumbnails/{@xml:id}.jpg"/>
                        <br/>
                        <xsl:if test="@n != 'unknown'">
                            [p. <xsl:value-of select="@n"></xsl:value-of>]</xsl:if>
                    </a>
                    <br/>
                    
                </span>
        <!--
            </xsl:otherwise>
        </xsl:choose>
        -->
        
        
       
       
    </xsl:template>

</xsl:stylesheet>

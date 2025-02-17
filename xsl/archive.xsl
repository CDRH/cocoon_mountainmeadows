<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:param name="pagetype"></xsl:param>

<xsl:output method="xml" encoding="UTF-8" />

  <xsl:include href="../xsl/common.xsl"/>
  <xsl:include href="../config/config.xsl"/>

  <xsl:template match="/">


  <html>
  <body>

  <h2>Archive</h2>

  <div class="scope">

<p class="descriptionfirst">
Since September 1857, the events of the Mountain Meadows Massacre have been recounted and interpreted by innumerable writers. From newspaper articles, to government reports, to novels, to plays, and even to films, the massacre has been represented in popular culture and public discourse in ways that reflect the historical context of the writers and the meanings they derived from the events of September 11, 1857.
</p>

    <span class="descriptionmore">
    <p>
Rather than delving into the facts surrounding the massacre, this archive focuses on these portrayals of the Mountain Meadows Massacre and how their creators represented the event and its aftermath. Additionally, this archive gives users tools to explore these representations. With these tools, which include advanced browsing functions, concept highlighting that reveals narrative elements within texts, and visualizations that illustrate language usage and information dissemination, visitors can begin to develop their own understanding of the ways the massacre was reported on, ignored, contextualized, and reinterpreted over time. 
</p>

<p>
The initial stages of this project focus on newspaper coverage of the massacre from 1857-1870. Many of the descriptions of the Mountain Meadows Massacre in later works spring from this early period of reportage, particularly from the earliest California reports of the massacre. Reports of a poisoned ox and the verbal abuse of Mormon women, as well as assertions of Mormon guilt and unburied corpses arise in these first articles and editorials and recur for many years. 
</p>

<p>
Upon the completion of the first stages, newspaper accounts from the years following Philip Klingensmith’s confession and John D. Lee’s arrest, trial, and subsequent execution will be integrated into the archive. As these later newspaper articles are added, government reports about the massacre, burial of victims, the quest for reparations for families of the victims, and the Lee trial also will be folded into the archive. 
</p>

<p>
In later phases of the project, fictional treatments of the Mountain Meadows Massacre will be added, as will depictions of the massacre in non-fiction works of Western Americana. Dramatizations of the massacre on stage and in film will round out the archive. 

</p>
      
    </span>
    
    
       
  </div>  

<div class="twoCol" id="doclist">
<div class="menuSide">
<h4>Document Type</h4>
  <ul class="{$pagetype}"> 
    
    
    <xsl:variable name="searchurl">
      <xsl:value-of select="$searchroot"/>  <xsl:text>&amp;q=itemCategory:(*)&amp;start=0&amp;rows=0&amp;indent=on&amp;facet=true&amp;facet.field=itemCategory&amp;sort=dateSearch+asc&amp;fl=id,itemCategory,place,source,dateDisp,dateSearch,titleMain,author</xsl:text>
    </xsl:variable>
<xsl:for-each select="document($searchurl)">    
  
  <li class="newspaper"><a href="{$siteroot}archive/newspaper/index.html#doclist">Newspaper Accounts</a> (<xsl:value-of select="//int[@name='newspaper']"/>)</li>
  
  <li class="government_document"><a href="{$siteroot}archive/government_document/index.html#doclist">Government Documents</a> (<xsl:value-of select="//int[@name='government_document']" />)</li>
  
  <li class="western_americana"><a href="{$siteroot}archive/western_americana/index.html#doclist">Western Americana</a> (<xsl:value-of select="//int[@name='western_americana']" />)</li>
  
  <li class="anti-mormon_publication"><a href="{$siteroot}archive/anti-mormon_publication/index.html#doclist">Anti-Mormon Publications</a> (<xsl:value-of select="//int[@name='anti-mormon_publication']" />)</li>
  
  <li class="fiction"><a href="{$siteroot}archive/fiction/index.html#doclist">Fiction</a> (<xsl:value-of select="//int[@name='fiction']" />)</li>
  
  <li class="lds_publication"><a href="{$siteroot}archive/lds_publication/index.html#doclist">LDS Publications</a> (<xsl:value-of select="//int[@name='lds_publication']" />)</li>
  
  <li class="utah_history"><a href="{$siteroot}archive/utah_history/index.html#doclist">Utah Histories</a> (<xsl:value-of select="//int[@name='utah_history']" />)</li>
  
  <li class="arkansas_history"><a href="{$siteroot}archive/arkansas_history/index.html#doclist">Arkansas Histories</a> (<xsl:value-of select="//int[@name='arkansas_history']" />)</li>
  

</xsl:for-each>
    

    
    
</ul>  
  </div>
  <div class="contentSide">
  <table>
    <tr><th>Date</th><th class="source">Source</th><th class="author">Author</th><th>Title</th></tr>
  <xsl:for-each select="//doc">
  <tr><xsl:if test="(position() mod 2) = 1"><xsl:attribute name="class">odd</xsl:attribute></xsl:if>
      <td class="date"><xsl:value-of select="str[@name='dateDisp']" /></td>
    <td class="source"><xsl:value-of select="str[@name='source']" /></td>
    <td class="author"><xsl:value-of select="arr[@name='author']/str" /></td>
    <td><a href="archive/{str[@name='id']}.html"><xsl:value-of select="str[@name='titleMain']" /></a></td>
    
    
    </tr>
    
    </xsl:for-each>
  </table>
  </div>
</div>

  
  
  
</body>    
  </html>  

  </xsl:template>

</xsl:stylesheet>

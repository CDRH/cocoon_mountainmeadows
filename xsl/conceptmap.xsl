<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:dir="http://apache.org/cocoon/directory/2.0">
    
   <xsl:variable name="expansions" select="document('mmm.expansions.xml')//abbr" />    
    
    <xsl:output method="xml" encoding="UTF-8" />
    
    <xsl:variable name="time_spans">
        <time start="1857" end="1860" title="Mountain Meadows to the Civil War"/>
        <!--<time start="1861" end="1865" title="Civil War Era"/>
        <time start="1866" end="1870" title="Post-war to J.D. Lee excommunication" />
        <time start="1871" end="1877" title="Klingensmith's confession, J.D. Lee arrest, trials, and execution" />-->
        
    </xsl:variable>
    
    <xsl:variable name="concepts">
        
        <seg type="Source" subtype="Christian" title="Christian" />
        <seg type="Source" subtype="Powers"  title="Powers" />
        <seg type="Source" subtype="Warn"  title="Warn" />
        <seg type="Source" subtype="TannerMathews"  title="Tanner Mathews" />
        <seg type="Source" subtype="Klingensmith"  title="Klingensmith" />
        <seg type="Source" subtype="Cradlebaugh"  title="Cradlebaugh" />
        <seg type="Source" subtype="Lynch"  title="Lynch" />
        <seg type="Source" subtype="Young"  title="Young" />
        <seg type="Source" subtype="Children"  title="Children" />
        <seg type="Source" subtype="WordofMouth"  title="Word of Mouth" />
        <seg type="Source" subtype="PublicMind"  title="Public Mind" />
        <seg type="Source" subtype="Government"  title="Government" />
        <seg type="Source" subtype="Indians"  title="Indians" />
        <seg type="Source" subtype="UnattributedPublishedAccount"  title="Unattributed Published Account" />
        
        <seg type="Emigrants" subtype="WagonTrain" title="Wagon Train"/>
        <seg type="Emigrants" subtype="Route" title="Route"/>
        <seg type="Emigrants" subtype="StateAffiliationArkansas" title="State Affiliation Arkansas"/>
        <seg type="Emigrants" subtype="StateAffiliationMissouri" title="State Affiliation Missouri"/>
        
        <seg type="Encounter" subtype="Poison" title="Poison"/>
        <seg type="Encounter" subtype="Slander" title="Slander"/>
        <seg type="Encounter" subtype="Trade LDS" title="Trade LDS"/>
        <seg type="Encounter" subtype="Trade Indian" title="Trade Indian"/>
        
        <seg type="Massacre" subtype="Location" title="Location"/>
        <seg type="Massacre" subtype="Dates" title="Dates"/>
        <seg type="Massacre" subtype="Planning" title="Planning"/>
        <seg type="Massacre" subtype="Battle" title="Battle"/>
        <seg type="Massacre" subtype="Rescue Attempt" title="Rescue Attempt"/>
        <seg type="Massacre" subtype="Casualties" title="Casualties"/>
        <seg type="Massacre" subtype="Survivors" title="Survivors"/>
        <seg type="Massacre" subtype="Landscape" title="Landscape"/>
        <seg type="Massacre" subtype="Spoils" title="Spoils"/>
        

        <seg type="Coverage" subtype="LDS" title="LDS"/>
        <seg type="Coverage" subtype="Utah" title="Utah"/>
        <seg type="Coverage" subtype="California" title="California"/>
        <seg type="Coverage" subtype="Arkansas" title="Arkansas"/>
        <seg type="Coverage" subtype="Eastern" title="Eastern"/>
        <seg type="Coverage" subtype="Western" title="Western"/>
        <seg type="Coverage" subtype="Midwestern" title="Midwestern"/>
        <seg type="Coverage" subtype="Southern" title="Southern"/>
        <seg type="Coverage" subtype="Foreign" title="Foreign"/>
        
        <seg type="Reaction" subtype="FederalInvestigation" title="Federal Investigation"/>
        <seg type="Reaction" subtype="MilitaryRetaliation" title="Military Retaliation"/> 
        <seg type="Reaction" subtype="State Investigation" title="State Investigation"/>
        <seg type="Reaction" subtype="Mob Violence" title="Mob Violence"/>
        <seg type="Reaction" subtype="AntiMormonAction" title="Anti-Mormon Action"/>
        
        <seg type="Blame" subtype="LDS" title="LDS"/>
        <seg type="Blame" subtype="LDSRetribution" title="LDS Retribution"/>
        <seg type="Blame" subtype="LDSBloodAtonement" title="LDS Blood Atonement"/>
        <seg type="Blame" subtype="LDSGreed" title="LDS Greed"/>
        <seg type="Blame" subtype="LDSZealots" title="LDS Zealots"/>
        <seg type="Blame" subtype="LDSLeadership" title="LDS Leadership"/>
        <seg type="Blame" subtype="USGovernment" title="US Government"/>
        <seg type="Blame" subtype="EmigrantBehavior" title="Emigrant Behavior"/>
        <seg type="Blame" subtype="MissouriWildCats" title="Missouri Wild Cats"/>
        <seg type="Blame" subtype="IndiansIndependently" title="Indians Independently"/>
        <seg type="Blame" subtype="IndiansLDSInfluence" title="Indians LDS Influence"/>
        <seg type="Blame" subtype="Gentiles" title="Gentiles"/>

        <seg type="Context" subtype="LDSPersecution" title="LDS Persecution"/>
        <seg type="Context" subtype="LDSReformation" title="LDS Reformation"/>
        <seg type="Context" subtype="IndianRelationsUS" title="Indian Relations US"/>
        <seg type="Context" subtype="IndianRelationsLDS" title="Indian Relations LDS"/>
        <seg type="Context" subtype="TerritorialAdministration" title="Territorial Administration"/>
        <seg type="Context" subtype="UtahWar" title="Utah War"/>
        <seg type="Context" subtype="PrattMurder" title="Pratt Murder"/>
        <seg type="Context" subtype="Polygamy" title="Polygamy"/>


    </xsl:variable>
	
	
    
    <xsl:template match="/">

      <xsl:variable name="document" select="." />
      <html>
      <body>
        <h2>Narrative Map</h2>        
          <p>Note: This concept map is a prototype and contains only a sampling of data. </p>
        <p>
        
        <div style="clear: both"><div class="marker" style="width: 10px; height: 10px; overflow: hidden; background-color:red; line-height: 0em; float: left; margin-top: 4px; margin-right: 4px;"  />  Source sympathetic to LDS</div>
        <div style="clear: both margin-top: 5px;"><div class="marker" style="width: 10px; height: 10px; overflow: hidden; background-color:blue; line-height: 0em; float: left; margin-top: 4px; margin-right: 4px; "  />  Source not sympathetic to LDS</div>
        <div style="clear: both margin-top: 5px;"><div class="marker" style="width: 10px; height: 10px; overflow: hidden; background-color:black; line-height: 0em; float: left; margin-top: 4px; margin-right: 4px; "  />  Source sympathetic to emigrants</div>
        </p>
        
        <table id="concepts" width="80%">
        
            <tr>
            
                <th>Term</th>
                
                <xsl:for-each select="$time_spans/time">    
                    <th ><xsl:value-of select="./@start"/>&#8211;<xsl:value-of select="./@end"/></th>
                </xsl:for-each>
                
            
            </tr>
            
            
            <xsl:for-each select="distinct-values($concepts/seg/@type)"><tr style="background: #2f2827; "><td colspan="5" ><h3 class="typeTitle" title="{.}" style="color: #ce8c27; font-weight: normal; font-size: 1.2em; margin: 0px; padding: 3px 0px 4px 0px;  text-decoration: underline"><xsl:value-of select="."/></h3></td></tr>
            <xsl:variable name="sec_type" select="."/>
                

                
                <xsl:for-each select="$concepts/seg[@type=$sec_type]">
                    
                    <xsl:variable name="this_type" select="./@type"/>
                    <xsl:variable name="this_subtype" select="./@subtype"/>
                    <tr class="subType" title="{$this_type}" ><xsl:if test="(position() mod 2) = 1"><xsl:attribute name="class">odd</xsl:attribute></xsl:if>

                
                <td valign="top"><strong><xsl:value-of select="./@title"/></strong></td>
                
                <xsl:for-each select="$time_spans/time">
                    
                    <xsl:variable name="this_year_start" select="./@start"/>
                    <xsl:variable name="this_year_end" select="./@end"/>
                    
                <td valign="top">
                    
                    <xsl:for-each select="$document//document[./@date &gt; string($this_year_start) and ./@date &lt; string($this_year_end +1)]/segs/seg[./@type=$this_type and starts-with(./@subtype, $this_subtype)]">
                        
		  <div class="mention" style="float: left; padding: 2px 0px 2px 3px;">
		      <xsl:variable name="my_id" select="generate-id()"/>
		      <div class="marker" style="width: 10px; height: 10px; overflow: hidden; background-color: {if (ancestor::document/@sympathy = 'LDS') then 'red' else 
(if (ancestor::document/@sympathy = 'Non-Mormon') then 'blue' else 'black')}; line-height: 0em; cursor: pointer" 
onmouseover="document.getElementById('{$my_id}').style.display = 'block';" onmouseout="document.getElementById('{$my_id}').style.display = 'none';" 
onclick="window.open('http://spacely.unl.edu:8080/cocoon/mountainmeadows/archive/{ancestor::document/@id}.html?highlight={$this_type}: {$this_subtype}')"/>

		       
		      <div class="popup" style="display: none; position: absolute; width: 300px; border: solid 1px; background: white; font-size: .9em; padding: 5px; margin-top: 10px;" id="{$my_id}">
		          <div class="text"><xsl:value-of select="./text()"/></div>
		          <div class="title" style="margin-top: 4px;"><strong><xsl:value-of select="ancestor::document/title"/> -<xsl:value-of select="ancestor::document/source"/>, <xsl:value-of select="ancestor::document/date"/></strong></div>
		      </div>

		      
		  </div>
                        
                            
                        
		</xsl:for-each>
                </td>
                
                </xsl:for-each>
                    
            </tr>
            </xsl:for-each>
            </xsl:for-each>
        </table>
        </body>
      </html>
    </xsl:template>
    
</xsl:stylesheet>

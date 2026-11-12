<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!--ebb: Here's the extra special
    line we need to do an Identity Transformation. -->
    
   <xsl:mode on-no-match="shallow-copy"/>
    
  
    <!-- ebb: Now we write template rules to match on patterns in the source document, and output new patterns.  -->
  
    <xsl:template match="poemTitle">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="body">
            <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="line">
        <lb n="{count(preceding::line) + 1}">
            <xsl:apply-templates/>
        </lb>
    </xsl:template>
  
  <xsl:template match="poem">
     
          <xsl:copy>
              <xsl:copy-of select="@* except @xml:id"></xsl:copy-of>
              <xsl:attribute name="xml:id"
                 select="concat('p-', count(preceding::poem) + 1)">
              </xsl:attribute>
              <xsl:apply-templates/>
          </xsl:copy>
     
  </xsl:template>
    
</xsl:stylesheet>
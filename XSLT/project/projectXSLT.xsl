<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    
    
    <xsl:template match="chapter">
            <summary>
                <totalPages><xsl:value-of select="count(//page)"/></totalPages>
                <speechCount><xsl:value-of select="count(//bubble[@type='speech'])"/></speechCount>
                <thoughtCount><xsl:value-of select="count(//caption[@type='thought'] | //bubble[@type='thought'])"/></thoughtCount>

                <uniqueSpeakers>
                    <xsl:value-of select="count(//unique[@ans = 'y'])"/>
                </uniqueSpeakers>
            </summary>
    </xsl:template>
</xsl:stylesheet>
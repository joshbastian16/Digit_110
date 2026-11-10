<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="skyrim/cover/title"/>
                </title>
                <link rel="stylesheet" href="Bastian-Skyrim.css"/>
            </head>
            
            <body>
                <header>
                    <h1>
                        <xsl:value-of select="skyrim/cover/title"/>
                    </h1>
                    
                    <h2>
                        <xsl:apply-templates select="skyrim/cover/subtitle/node()"/>
                    </h2>
                    
                    <p>
                        <xsl:value-of select="skyrim/cover/attribution"/>
                    </p>
                </header>
                
                <main>
                    <xsl:apply-templates select="skyrim/body"/>
                </main>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="character">
        
        <xsl:variable name="ref-id" select="string(@ref)"/>
        
        <xsl:variable name="alignment"
            select="string((/skyrim/cast/character[@id = tokenize(normalize-space(@ref-id), '\s+')])[1]/@alignment)"/>
        
        <span>
            <xsl:attribute name="class">
                <xsl:choose>
                    

                    <xsl:when test="tokenize(normalize-space(@ref-id), '\s+') = 'hero'">
                        character hero
                    </xsl:when>
                    

                    <xsl:when test="@alignment = 'good'">
                        character good
                    </xsl:when>
                    

                    <xsl:when test="@alignment = 'evil'">
                        character evil
                    </xsl:when>
                    

                    <xsl:when test="@alignment = 'neutral'">
                        character neutral
                    </xsl:when>
                    

                    <xsl:otherwise>
                        character
                    </xsl:otherwise>
                    
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    

    <xsl:template match="QuestEvent">
        <span class="quest-event">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
   
    <xsl:template match="QuestItem">
        <span class="quest-item">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <xsl:template match="epithet">
        <em class="epithet">
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <xsl:template match="faction">
        <span class="faction">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="location">
        <span class="location">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
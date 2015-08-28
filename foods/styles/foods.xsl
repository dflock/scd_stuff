<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0"
    >
<!--    exclude-result-prefixes="saxon xlink"-->
<!--    xmlns:saxon="http://icl.com/saxon"-->
    
<!--    <xsl:output-->
<!--        method="saxon:xhtml"-->
<!--        encoding="utf-8"-->
<!--        omit-xml-declaration="no"-->
<!--        doctype-public = "-//W3C//DTD XHTML 1.0 Strict//EN"-->
<!--        doctype-system = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"-->
<!--        standalone="yes"-->
<!--        indent="yes"-->
<!--        media-type = "text/html" />-->
    
    <xsl:template match="/" >
        <html xml:lang="en" lang="en">
            <head>
                <title>SCD Foods List</title>
                <link rel="stylesheet" href="../../styles/default.css" type="text/css" />
                <link rel="stylesheet" href="./styles/foods.css" type="text/css" />
                
                <link rel="Shortcut Icon" href="../../images/duncs favicon.ico" type="image/x-icon" />
                <link rel="Author" title="About the author" href="../../about/dunc.html" />
                <link rel="Home" title="Home" href="../../index.html" />
                
                <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
                <meta http-equiv="Content-Language" content="en-gb" />
                <meta name="ROBOTS" content="ALL" />
                <meta name="Copyright" content="Copyright (c) 2011 Duncan Lock" />
                <meta name="MSSmartTagsPreventParsing" content="true" />
            </head>
            <body>
                <div class="topright"> 
                    <a href="/colitis/">Colitis &amp; SCD Resources</a> 
                    | <a href="/">Home</a>
                </div>
                <h1>SCD Foods List</h1>
                <p><span class="yesbtvc">allowed (btvc)</span>
                | <span class="yesother">allowed (other)</span>
                | <span class="occasionally">allowed occasionally</span>
                | <span class="no">not allowed</span>
                | <span class="unknown">unknown</span><br />
                <span class="alt">[alternative names]</span></p>
                
                <p class="highlight">Please note: the official (and much more comprehensive) SCD legal/illegal list is available <a href="http://www.breakingtheviciouscycle.info/legal/legal_illegal_a-c.htm">here, at the official Breaking the Vicious Cycle website</a>. This one is primarily here as a printable, single page quick reference, and for the alternative names; it's not comprehensive. If you have any corrections, please <a href="mailto:dunc@dflock.co.uk">let me know</a>.</p>
                
                <xsl:apply-templates />
                
                <div class="footer">
                    <hr />
                    <a href="http://validator.w3.org/check/referer" title="Validate XHTML"><span class="w3c">W3C</span><span class="spec">XHTML 1.0</span></a>
                    <a href="http://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fwww.dflock.co.uk%2Fstyles%2Fcolitis%2Ffoods%2Ffoods.css&amp;warning=2&amp;profile=none&amp;usermedium=all" title="Validate CSS"><span class="w3c">W3C</span><span class="spec">CSS 1.0</span></a>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="scd" >
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="type" >
        <div class="box">
            <a>
                <xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
            </a>
            <h2><xsl:value-of select="@name" /></h2>
            <ul>
                <xsl:apply-templates />
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template match="food">
        <li>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="@ok[. = 'y']">yesbtvc</xsl:when>
                    <xsl:when test="@ok[. = 'yo']">yesother</xsl:when>
                    <xsl:when test="@ok[. = 'n']">no</xsl:when>
                    <xsl:when test="@ok[. = 'o']">occasionally</xsl:when>
                    <xsl:when test="@ok[. = 'u']">unknown</xsl:when>
                    <xsl:otherwise>no</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="name" />
                <xsl:choose>
                    <xsl:when test="altnames[. != '']"> <br />
                    <span class="alt"> [<xsl:value-of select="altnames" />]</span></xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>
</xsl:transform>

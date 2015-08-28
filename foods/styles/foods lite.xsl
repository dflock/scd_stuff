<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output 
		method = "html" 
		indent = "yes"
		doctype-public = "-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system = "DTD/xhtml1-strict.dtd"/>
	
	<xsl:template match="/" >
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
			<head>
				<title>SCD Foods List</title>
			</head>
			<body>
				<h1>SCD Foods List</h1>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="scd" >
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="type" >
		<div>
			<a>
				<xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
			</a>
			<h2><xsl:value-of select="@name" /></h2>
			<table>
				<xsl:apply-templates />
			</table>
		</div>
	</xsl:template>
	
	<xsl:template match="food">
		<tr>
			<td>
				<xsl:value-of select="name" />
					<xsl:choose>
						<xsl:when test="altnames[. != '']"> <br />
						<span class="alt"> [<xsl:value-of select="altnames" />]</span></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="@ok[. = 'y']">yes</xsl:when>
					<xsl:when test="@ok[. = 'yo']">yes</xsl:when>
					<xsl:when test="@ok[. = 'n']">no</xsl:when>
					<xsl:when test="@ok[. = 'o']">occasionally</xsl:when>
					<xsl:when test="@ok[. = 'u']">unknown</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
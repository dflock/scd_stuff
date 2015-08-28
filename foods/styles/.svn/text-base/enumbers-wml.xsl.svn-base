<?xml version="1.0" encoding="UTF-8"?>	

<xsl:transform
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	version="1.0"
	xmlns:saxon="http://icl.com/saxon"
	exclude-result-prefixes="saxon xlink">
	
	<xsl:output
		method="saxon:xhtml"
		encoding="utf-8"
		omit-xml-declaration="no"
		doctype-public = "-//WAPFORUM//DTD WML 1.1//EN"
		doctype-system = "http://www.wapforum.org/DTD/wml_1.1.xml"
		standalone="yes"
		indent="yes"
		media-type = "xml" />
	
	<xsl:template match="/" >
		<wml>
			<xsl:apply-templates />
		</wml>
	</xsl:template>
	
	<xsl:template match="additives">
		<card id="index" title="Index">
			<p>E-number:<input name="mEnum" size="10"/></p>
			<do type="accept" label="Find">
				<go href="#$(mEnum)"/>
			</do>
		</card>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="additive">
	
		<card>
			<xsl:attribute name="id"><xsl:value-of select="@number" /></xsl:attribute>
			<xsl:attribute name="title"><xsl:value-of select="@number" /></xsl:attribute>
			
			<p><b><xsl:value-of select="@number" /></b></p>
			<p>SCD:<xsl:value-of select="@scd" /> Avoid:<xsl:value-of select="@avoid" /> GM:<xsl:value-of select="@gm" /> Origin:<xsl:value-of select="@origin" /></p>
			<p><xsl:value-of select="@name" /></p>
			<p><xsl:value-of select="@comment" /></p>

			<a href="#index">Index</a>
		</card>
	</xsl:template>
	
<!--
		<tr>
			<td>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@scd[. = 'N']">bad</xsl:when>
					<xsl:when test="@scd[. = 'Y']">good</xsl:when>
					<xsl:otherwise>unknown</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute><xsl:value-of select="@scd" /></td>
			
			<td>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@avoid[. = 'N']">good</xsl:when>
					<xsl:when test="@avoid[. = 'Y']">bad</xsl:when>
					<xsl:otherwise>unknown</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute><xsl:value-of select="@avoid" /></td>
			<td><xsl:value-of select="@number" /></td>
			<td><xsl:value-of select="@name" /></td>
			<td><xsl:value-of select="@comment" /></td>
		</tr>
-->
</xsl:transform>
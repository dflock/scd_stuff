<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output
		indent = "yes"
		doctype-public = "-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		media-type = "text/html" />
	
	<xsl:template match="/" >
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
			<head>
				<title>SCD Legal Remedies</title>
				<link rel="stylesheet" href="../../styles/default.css" type="text/css" />
				<link rel="stylesheet" href="../recipes/styles/recipes.css" type="text/css" />
				
				<link rel="Shortcut Icon" href="../../images/duncs favicon.ico" type="image/x-icon" />
				<link rel="Home" title="About the author" href="../../index.html" />
				<link rel="Author" title="About the author" href="../../about/dunc.html" />

				<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
				<meta http-equiv="Content-Language" content="en-gb" />
				<meta name="ROBOTS" content="ALL" />
				<meta name="Copyright" content="Copyright (c) 2004 Duncan Lock" />
				<meta name="MSSmartTagsPreventParsing" content="true" />
			</head>
			<body>
				<h1><a name="top">Specific Carbohydrate Diet Remedies</a></h1>
				<h2>Contents</h2>
				<ul>
				<xsl:for-each select="/remedies/section">
					<xsl:sort>select="@type"</xsl:sort>
					<li>
						<a>
							<xsl:attribute name="href">#<xsl:value-of select="@type" />
							</xsl:attribute>
							<strong>
								<xsl:value-of select="@type" />
							</strong>
						</a>
						<table class="index">
							<xsl:for-each select="./remedy">
								<xsl:sort>select="@type"</xsl:sort>
								
								<tr>
								<xsl:if test="position() mod 2 = 0"><xsl:attribute name="class">even</xsl:attribute></xsl:if>
									<td style="width: 0.5ex;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="@tested[. = 'yes']">tested</xsl:when>
												<xsl:otherwise>untested</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
									</td>
									<td style="width: 9ex; text-align: right; padding-right: 0.5ex;">
										<xsl:choose>
											<xsl:when test="@rating[. != '']"><xsl:value-of select="@rating" />/10</xsl:when>
											<xsl:otherwise></xsl:otherwise>
										</xsl:choose>									
									</td>
									<td style="width: 35%;">
										<a><xsl:attribute name="href">#<xsl:value-of select="translate(@name, ' ', '_')" /></xsl:attribute><xsl:value-of select="@name" /></a>
									</td>
									<td style="width: 25%;">
										<xsl:if test="@time[. != '']"><xsl:value-of select="@time" /></xsl:if>
									</td>
									<td>
										<xsl:if test="@qty[. != '']"><xsl:value-of select="@qty" /></xsl:if>
										<xsl:if test="@uom_p[. != '']"><xsl:text> </xsl:text><xsl:value-of select="@uom_p" /></xsl:if>
									</td>
									<td class="cost_cell">
										<xsl:if test="sum(.//@cost) != 0">
											<xsl:value-of select="format-number(round((sum(.//@cost) div ./@qty) * 100) div 100, '0.00')" />
											per <xsl:value-of select="./@uom_s" />.
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<br />
					</li>
				</xsl:for-each>
				</ul>
				<br />
				<span>
				<xsl:attribute name="class">tested</xsl:attribute>
					<xsl:text> tested by me</xsl:text>
				</span>
				<span>
				<xsl:attribute name="class">untested</xsl:attribute>
					<xsl:text> un-tested by me</xsl:text>
				</span><br /><br />
				<a href="..\recipes\Dictionary of Units.html">Unit Conversions</a> | 
				<a href="..\recipes\Conversions.html">Temperature Conversions (MathML)</a>

				<xsl:apply-templates select="/remedies/section">
					<xsl:sort>select="@type"</xsl:sort>
				</xsl:apply-templates>
				
				<div class="footer">
					<hr />
					<a href="http://validator.w3.org/check/referer" title="Validate XHTML"><span class="w3c">W3C</span><span class="spec">XHTML 1.0</span></a>
					<a href="http://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fwww.dflock.co.uk%2Fcolitis%2Frecipes%2Fstyles%2Frecipes.css&amp;warning=2&amp;profile=none&amp;usermedium=all" title="Validate CSS"><span class="w3c">W3C</span><span class="spec">CSS 1.0</span></a>
					<a href="http://bobby.watchfire.com/bobby/bobbyServlet?URL=http%3A%2F%2Fwww.dflock.co.uk%2Fcolitis%2Frecipes%2Frecipes.html&amp;output=Submit&amp;gl=sec508&amp;test=" title="Validate for section 508 compliance"><span class="w3c">CAST</span><span class="spec">508</span></a>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="section">
		<div class="section">
			<a>
				<xsl:attribute name="name"><xsl:value-of select="translate(@type, ' ', '_')" /></xsl:attribute>
				<h3><xsl:value-of select="@type" /></h3>
			</a>
		</div>
			<xsl:apply-templates select="remedy" />
	</xsl:template>
	
	<xsl:template match="remedy">
		<div class="item">
			<div style="padding: 1px; padding-left: 8px;">
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="@tested[. = 'yes']">tested</xsl:when>
						<xsl:otherwise>untested</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<a>
					<xsl:attribute name="name"><xsl:value-of select="translate(@name, ' ', '_')" /></xsl:attribute>
					<h4><xsl:value-of select="@name" /></h4>
				</a>
				<div style="display: inline; text-align: right; width: 100%;">
					|<xsl:text> </xsl:text><a href="#top">top</a>
				</div><br />
				<p>
					<xsl:attribute name="class">comment</xsl:attribute>
					
					<xsl:choose>
						<xsl:when test="@rating[. != '']"><xsl:value-of select="@rating" />/10<xsl:text> </xsl:text>|<xsl:text> </xsl:text></xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="@last-modified" /><xsl:text> | </xsl:text>
					<xsl:if test="@time[. != '']">takes <xsl:value-of select="@time" />, </xsl:if>
					<xsl:if test="@qty[. != '']">makes <xsl:value-of select="@qty" /></xsl:if>
					<xsl:if test="@uom_p[. != '']"><xsl:text> </xsl:text><xsl:value-of select="@uom_p" /></xsl:if>
				</p>
			</div>
			<div class="contents">
				<xsl:apply-templates select="ingredients" />
				<p><xsl:value-of select="instructions" /></p>
				<p class="icomment"><xsl:value-of select="comment" /></p>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="ingredients[group]">
		<table border="0" cellspacing="3px">
			<xsl:attribute name="id">ig<xsl:number level="any" from="rootelement"/></xsl:attribute>
			<xsl:if test="sum(.//@cost) != 0">
			<tfoot>
				<tr>
					<td></td>
					<td></td>
					<td class="total_cell"><xsl:value-of select="format-number(round((sum(.//@cost)) * 100) div 100, '#.00')" /></td>
				</tr>
			</tfoot>
			</xsl:if>
			<tbody>
				<xsl:apply-templates />
			</tbody>
		</table>
		
		<xsl:if test="sum(.//@cost) != 0">
			<p class="cost_per"><xsl:value-of select="format-number(round((sum(.//@cost) div ../@qty) * 100) div 100, '0.00')" />
			per <xsl:value-of select="../@uom_s" />.
			</p>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ingredients">
		<table border="0" cellspacing="3px">
			<tbody>
				<xsl:apply-templates />
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="group">
		<tbody class="group" valign="top">
		<tr valign="top">
			<td>
				<xsl:attribute name="class">group_cell</xsl:attribute>
				<xsl:attribute name="rowspan"><xsl:value-of select="count(child::ingredient) + 1" /></xsl:attribute>
				<xsl:value-of select="@id" />
			</td>
		</tr>
		<xsl:apply-templates />
		</tbody>
	</xsl:template>

	<xsl:template match="ingredient[position() mod 2 = 0]">
		<tr class="even">
			<td>
				<xsl:value-of select="@qty" /><xsl:text> </xsl:text>
				<xsl:value-of select="@uom" /><xsl:text> </xsl:text>
				<xsl:value-of select="@name" />
			</td>
			<xsl:if test="@cost">
			<td class="cost_cell">
				<xsl:if test="@cost[. > 0]"><xsl:value-of select="format-number(round((@cost) * 100) div 100, '#.00')" /></xsl:if>
			</td>
			</xsl:if>
		</tr>
	</xsl:template>
	
	<xsl:template match="ingredient[position() mod 2 != 0]">
		<tr>
			<td>
				<xsl:value-of select="@qty" /><xsl:text> </xsl:text>
				<xsl:value-of select="@uom" /><xsl:text> </xsl:text>
				<xsl:value-of select="@name" />
			</td>
			<xsl:if test="@cost">
			<td class="cost_cell">
				<xsl:if test="@cost[. > 0]"><xsl:value-of select="format-number(round((@cost) * 100) div 100, '#.00')" /></xsl:if>
			</td>
			</xsl:if>
		</tr>
	</xsl:template>	

</xsl:stylesheet>
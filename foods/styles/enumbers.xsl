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
		doctype-public = "-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		standalone="yes"
		indent="yes"
		media-type = "text/html" />

	<xsl:template match="/" >
		<html xml:lang="en" lang="en">
			<head>
				<title>E-Numbers &amp; Food Additives</title>
				<link rel="stylesheet" href="./styles/enumbers.css" type="text/css" />
				<meta name="Copyright" content="Copyright (c) 2000-2015 Duncan Lock" />
			</head>
			<body>
				<h1>E-Numbers &amp; Food Additives</h1>

				<p>This is not an authoritative list, in either sense. The SCD information
				comes from personal experience,
				<a href="http://www.breakingtheviciouscycle.info/" title="Breaking the Vicious Cycle, Elaine Gotschall">Breaking the Vicious Cycle</a>
				and common sense. Please do not take it as gospel, if in doubt - don't eat it. If you have any improvements or suggestions,
				please <a href="mailto:&#101;&#110;&#117;&#109;&#98;&#101;&#114;&#115;&#64;&#100;&#102;&#108;&#111;&#99;&#107;&#46;&#99;&#111;&#46;&#117;&#107;">email me [&#101;&#110;&#117;&#109;&#98;&#101;&#114;&#115;&#64;&#100;&#102;&#108;&#111;&#99;&#107;&#46;&#99;&#111;&#46;&#117;&#107;]</a>.
				More comprehensive information (from wikipedia) on e-numbers can be found <a target="_wikipedia" href="http://en.wikipedia.org/wiki/E_number">here.</a></p>

				<p>I have added links from substance names and enumbers to wikipedia. Many of these articles don't exist yet - feel free to create them. The substance links tend to work better than the Enumber ones
				at the moment. I will endevour to (slowly) fix these links by adding to wikipedia.</p>

				<nav class="enumbers well">
					<h3>Navigate by Group</h3>
					<ul>
					<xsl:call-template name="group-nav" />
					</ul>
				</nav>

				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template name="group-nav">
		<xsl:for-each select="//group">
		<li>
			<a>
				<xsl:attribute name="href">#<xsl:value-of select="@slug" /></xsl:attribute>
				<xsl:value-of select="@range" /> - <xsl:value-of select="@desc" />
			</a>
		</li>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="additives">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="group">
		<h2>
			<xsl:attribute name="id"><xsl:value-of select="@slug" /></xsl:attribute>
			<xsl:value-of select="@range" />: <xsl:value-of select="@desc" />
		</h2>
		<table class="enumbers">
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>#</th>
					<th>Generally OK</th>
					<th>SCD OK</th>
					<th>FODMAPs OK</th>
					<th>Origin</th>
					<th>Name</th>
					<th>Comment</th>
				</tr>
			</thead>
			<tfoot>
				<tr><td colspan="7"><xsl:value-of select="count(.//additive)" />&#160;<xsl:value-of select="@desc" />.</td></tr>
			</tfoot>
			<tbody>
				<xsl:apply-templates />
			</tbody>
		</table>
	</xsl:template>


	<xsl:template match="additive">
		<tr>

			<td>
				<a>
					<xsl:attribute name="href">https://en.wikipedia.org/wiki/<xsl:value-of select="@number" /></xsl:attribute>
					<xsl:attribute name="title">Look up <xsl:value-of select="@number" /> in Wikipedia</xsl:attribute>
					<xsl:attribute name="target">_wikipedia_<xsl:value-of select="@number" /></xsl:attribute>
					<xsl:value-of select="@number" />
				</a>
			</td>

			<td>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@ok[. = 'N']">bad</xsl:when>
					<xsl:when test="@ok[. = 'Y']">good</xsl:when>
					<xsl:otherwise>unknown</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute><xsl:value-of select="@ok" />
			</td>

			<td>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@scd[. = 'N']">bad</xsl:when>
					<xsl:when test="@scd[. = 'Y']">good</xsl:when>
					<xsl:otherwise>unknown</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute><xsl:value-of select="@scd" />
			</td>

			<td>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@fodmaps[. = 'N']">bad</xsl:when>
					<xsl:when test="@fodmaps[. = 'Y']">good</xsl:when>
					<xsl:otherwise>unknown</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute><xsl:value-of select="@fodmaps" />
			</td>

			<td>
			<xsl:attribute name="title">
				<xsl:choose>
					<xsl:when test="@origin[. = '']">Unknown</xsl:when>
					<xsl:when test="@origin[. = 'AD']">Animal derived (not acceptable to Vegitarians or Vegans)</xsl:when>
					<xsl:when test="@origin[. = 'PAD']">Possibly Animal derived (not acceptable to Vegitarians or Vegans)</xsl:when>
					<xsl:when test="@origin[. = 'AP']">Animal product (not acceptable to Vegans)</xsl:when>
					<xsl:when test="@origin[. = 'PAP']">Possible Animal product (not acceptable to Vegans)</xsl:when>
					<xsl:when test="@origin[. = 'VD']">Vegetable Derived</xsl:when>
					<xsl:when test="@origin[. = 'PVD']">Possibly Vegetable Derived</xsl:when>
					<xsl:when test="@origin[. = 'VP']">Vegetable Product</xsl:when>
					<xsl:when test="@origin[. = 'PVP']">Possible Vegetable Product</xsl:when>
					<xsl:when test="@origin[. = 'SY']">Synthetic</xsl:when>
					<xsl:when test="@origin[. = 'PSY']">Possibly Synthetic</xsl:when>
					<xsl:when test="@origin[. = 'MD']">Mineral or Mineral Derived</xsl:when>
					<xsl:otherwise>Unknown</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute><xsl:value-of select="@origin" />
			</td>

			<td>
				<a>
					<xsl:attribute name="href">https://en.wikipedia.org/wiki/<xsl:choose><xsl:when test="@wiki"><xsl:value-of select="@wiki" /></xsl:when><xsl:otherwise><xsl:value-of select="@name" /></xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="title">Look up <xsl:value-of select="@name" /> in Wikipedia</xsl:attribute>
					<xsl:attribute name="target">_wikipedia_<xsl:value-of select="@name" /></xsl:attribute>
					<xsl:value-of select="@name" />
				</a>
				<xsl:if test="@altname"><br /><span class="altname"><xsl:value-of select="@altname" /></span></xsl:if>
			</td>
			<td><xsl:value-of select="@comment" /></td>
		</tr>
	</xsl:template>
</xsl:transform>

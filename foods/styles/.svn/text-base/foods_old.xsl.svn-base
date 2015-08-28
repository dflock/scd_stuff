<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
	<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>SCD Foods list</title>
	</head>
	<style>
		body { font-size: 0.8em; background-color: rgb(250, 250, 250);}
		h1 { font-size: 2em; }
		h2 { font-size: 1.5em; }
		ul { list-style-type: none; }
		div { 
				float: left; clear: none; width: 25%; 
				background-color: #fff; padding-left: 2%; padding-top: 2%; 
				margin: 0.25%; border: 1px dotted rgb(225, 225, 225);
			}
		li { text-indent: -1.5em; }
		
		.yesbtvc { color: #390; }
		.yesother { color: #360; }
		.no { color: #c30; }
		.occasionally { color: #993; }
		.maybe { color: #993; }
		.unknown { color: #600; }
		.alt { color: #999; font-size: 0.9em; }
	</style>
	<body>
		<h1>SCD Foods List</h1>
		<p><span class="yesbtvc">allowed (btvc)</span>
		| <span class="yesother">allowed (other)</span>
		| <span class="occasionally">allowed occasionally</span>
		| <span class="no">not allowed</span>
		| <span class="unknown">unknown</span><br />
		<span class="alt">[alternative names]</span></p>
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
		<ul>
			<xsl:apply-templates />
		</ul>
		</div>
	</xsl:template>
	
	<xsl:template match="food">
		<li><xsl:attribute name="class">
			<xsl:choose>
				<xsl:when test="@ok[. $eq$ 'y']">yesbtvc</xsl:when>
				<xsl:when test="@ok[. $eq$ 'yo']">yesother</xsl:when>
				<xsl:when test="@ok[. $eq$ 'n']">no</xsl:when>
				<xsl:when test="@ok[. $eq$ 'o']">occasionally</xsl:when>
				<xsl:when test="@ok[. $eq$ 'u']">unknown</xsl:when>
				<xsl:otherwise>no</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="name" /><xsl:choose>
			<xsl:when test="altnames[. $ine$ '']"> <br /><span class="alt"> [<xsl:value-of select="altnames" />]</span></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose></li>
		<xsl:apply-templates />
	</xsl:template>
</xsl:stylesheet>
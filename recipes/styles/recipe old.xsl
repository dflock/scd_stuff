<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" >

	<xsl:template match="/" >
		<h1><a name="top">Specific Carbohydrate Diet Recipies</a></h1>
		<xsl:for-each select="/recipies/section" order-by="@type">
			<div><a><xsl:attribute name="href">#<xsl:value-of select="@type" /></xsl:attribute><strong><xsl:value-of select="@type" /></strong></a></div>
			<div style="margin-left: 2em;">
				<xsl:for-each select="./recipie" order-by="@name">
					<span><xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="@tested[. $eq$ 'yes']">tested</xsl:when>
							<xsl:otherwise>untested</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute><xsl:entity-ref name="nbsp" /></span>
					<xsl:choose>
						<xsl:when test="@scd-legal[. $eq$ 'no']"><span class="warning" title="Warning">Currently Not SCD Legal</span>&#160;|&#160;</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
					<a><xsl:attribute name="href">#<xsl:value-of select="@name" /></xsl:attribute><xsl:value-of select="@name" /></a>
					<br />
				</xsl:for-each>
			</div>
		</xsl:for-each>
		<br />
		<span>
		<xsl:attribute name="class">tested</xsl:attribute>
			tested by me
		</span>
		<span>
		<xsl:attribute name="class">untested</xsl:attribute>
			un-tested by me
		</span><br /><br />
		<span>Items marked <span class="warning">Currently Not SCD Legal</span> have been copied from a non
		SCD source and haven't been converted yet. Either convert them yourself or avoid.</span><br />
		<a href="conversions.html">Unit Conversions</a>
		
		<xsl:apply-templates select="/recipies/section" order-by="@type" />
	</xsl:template>
	
	<xsl:template match="section">
		<div>
		<xsl:attribute name="class">section</xsl:attribute>
			<a>
				<xsl:attribute name="name"><xsl:value-of select="@type" /></xsl:attribute>
				<h2><xsl:value-of select="@type" /></h2>
			</a>
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="recipie">
		<div class="recipie">
			<div style="padding: 1px; padding-left: 8px;">
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="@tested[. $eq$ 'yes']">tested</xsl:when>
						<xsl:otherwise>untested</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<div style="display: inline; text-align: right; width: 100%;">
					<xsl:choose>
						<xsl:when test="@scd-legal[. $eq$ 'no']"><span class="warning" title="Warning">Currently Not SCD Legal</span>&#160;|&#160;</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="@rating[. $ne$ '']"><span title="Rating"><xsl:value-of select="@rating" />/10&#160;|&#160;</span></xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
					<span title="last modified"><xsl:value-of select="@last-modified" /></span>&#160;|&#160;<a href="#top">top</a>&#160;
				</div>
				<a>
					<xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
					<h3><xsl:value-of select="@name" /></h3>
				</a><br />	
				<p>
					<xsl:attribute name="class">comment</xsl:attribute>
					<xsl:if test="@time[. $ne$ '']">takes <xsl:value-of select="@time" />, </xsl:if>
					<xsl:if test="@qty[. $ne$ '']">makes <xsl:value-of select="@qty" /></xsl:if>
				</p>
			</div>
			<div class="contents">
				<xsl:apply-templates />
				<p><xsl:value-of select="instructions" /><br /><br />
				<span style="color: #999;"><xsl:value-of select="comment" /></span></p>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ingredients">
		<table border="0" cellspacing="3px">
			<!--if child is ingredient, not group then tr td</xsl:comment-->
			<xsl:apply-templates />
		</table>
	</xsl:template>

	<xsl:template match="group">
		<tr valign="top">
			<td width="5%" style="background-color: #eee; text-align: center;"><xsl:value-of select="@id" /></td>
			<td>
				<xsl:apply-templates />
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="ingredient">
		<xsl:value-of select="@qty" /> <xsl:value-of select="@uom" /> <xsl:value-of select="@name" /><br />
	</xsl:template>

</xsl:stylesheet>
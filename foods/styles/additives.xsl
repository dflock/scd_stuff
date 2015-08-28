<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
	<xsl:template match="/">
		<h1>E-Numbers</h1>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="additives">
		<table border="1" style="border-collapse: collapse;">
			<thead>
				<caption>Table of 'e-numbers': European Standard Food Additives</caption>
				<tr>
					<th>Number</th>
					<th>Name</th>
					<th>Comment</th>
				</tr>
			</thead>
			<tfoot>
			</tfoot>
			<tbody>
				<xsl:apply-templates />
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="additive">
		<tr>
			<td><xsl:value-of select="@number" /></td>
			<td><xsl:value-of select="@name" /></td>
			<td><xsl:value-of select="@comment" /></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
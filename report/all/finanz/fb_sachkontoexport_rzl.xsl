<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_sachkontoexport_rzl">
		<xsl:apply-templates select="Kontonummer"/>
		<xsl:apply-templates select="Kontenart"/>
		<xsl:apply-templates select="Waehrung"/>
		<xsl:apply-templates select="Textzeile1"/>
	</xsl:template>
	<xsl:template match="Kontonummer | Kontenart | Waehrung">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="Textzeile1">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>

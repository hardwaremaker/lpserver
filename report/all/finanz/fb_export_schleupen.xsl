<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_schleupen">
		<xsl:apply-templates select="Belegdatum"/>
		<xsl:apply-templates select="Faellig"/>
		<xsl:apply-templates select="Konto"/>
		<xsl:apply-templates select="Gegenkonto"/>
		<xsl:apply-templates select="Beleg"/>
		<xsl:apply-templates select="Kst"/>
		<xsl:apply-templates select="Text"/>
		<xsl:apply-templates select="Soll"/>
		<xsl:apply-templates select="Haben"/>
	</xsl:template>
	<xsl:template match="Belegdatum[text() = 'Belegdatum']">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="Belegdatum">
		<xsl:value-of select="substring(.,1,8)" />;</xsl:template>
	<xsl:template match="Faellig | Konto | Gegenkonto | Beleg | Kst | Text | Soll | Haben">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="Haben">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>

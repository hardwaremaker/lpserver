<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_kontoexport_schleupen">
		<xsl:apply-templates select="Konto"/>
		<xsl:apply-templates select="Anrede"/>
		<xsl:apply-templates select="Name"/>
		<xsl:apply-templates select="Bezeichnung"/>
		<xsl:apply-templates select="Strasse"/>
		<xsl:apply-templates select="Plz"/>
		<xsl:apply-templates select="Ort"/>
		<xsl:apply-templates select="Bankkonto"/>
		<xsl:apply-templates select="Blz"/>
		<xsl:apply-templates select="Bank"/>
		<xsl:apply-templates select="USt-Id-Nummer"/>
	</xsl:template>
	<xsl:template match="Konto | Anrede | Name | Bezeichnung | Strasse | Plz | Ort | Bankkonto | Blz | Bank">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="USt-Id-Nummer">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>

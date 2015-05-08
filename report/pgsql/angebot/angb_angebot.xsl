<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Dies ist die Vorlage ausschließlich für den MAC-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="ISO-8859-1"/>
	<xsl:template match="mail">
		<xsl:apply-templates select="anrede_anprechpartner"/>
		<xsl:apply-templates select="belegnummer"/>
		<xsl:apply-templates select="fusstext"/>
	</xsl:template>
	<xsl:template match="anrede_anprechpartner">
		<xsl:value-of select="."/>
		<xsl:text>
</xsl:text>
	</xsl:template>
	<xsl:template match="belegnummer">
im Anhang finden Sie <xsl:value-of select="/mail/bezeichnung"/>&#160;<xsl:value-of select="."/>.
Projekt: <xsl:value-of select="/mail/projekt"/>&#160;<xsl:value-of select="."/>

</xsl:template>
	<xsl:template match="fusstext">
		<xsl:value-of select="."/>
		<xsl:text>
</xsl:text>
		<xsl:value-of select="/mail/bearbeiter"/>
		
		
HELIUM V Business-Software für den nachhaltigen Unternehmenserfolg.	
	</xsl:template>
</xsl:stylesheet>

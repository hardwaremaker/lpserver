<?xml version="1.0" encoding="UTF-8"?>
<!-- Dies ist die Vorlage ausschließlich für den PC, auch wenn Helium V am Linuxserver läuft-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
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
Im Anhang finden Sie <xsl:value-of select="/mail/bezeichnung"/>&#160;<xsl:value-of select="."/>.
Projekt: <xsl:value-of select="/mail/projekt"/>&#160;<xsl:value-of select="."/>

</xsl:template>
	<xsl:template match="fusstext">
		<xsl:value-of select="."/>
		<xsl:text>
</xsl:text>
		<xsl:value-of select="/mail/bearbeiter"/>
		
		
Zur Anzeige des Dokuments können Sie den Acrobat-Reader auch von www.HeliumV.com herunterladen.
	</xsl:template>
</xsl:stylesheet>

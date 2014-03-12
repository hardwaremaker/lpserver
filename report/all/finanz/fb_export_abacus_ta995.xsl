<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_abacus_ta995">
		<xsl:apply-templates select="TA995_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA995_Zeilennummer"/>
		<xsl:apply-templates select="TA995_Transaktionsart"/>
		<xsl:apply-templates select="TA995_Transaktionssumme"/>
		<xsl:apply-templates select="TA995_Endsequenz"/>
	</xsl:template>
		<xsl:template match="TA995_Uebertragungsnummer | TA995_Zeilennummer | TA995_Transaktionsart | TA995_Transaktionssumme">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="TA995_Endsequenz">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_abacus_ta005">
		<xsl:apply-templates select="TA005_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA005_Zeilennummer"/>
		<xsl:apply-templates select="TA005_Transaktionsart"/>
		<xsl:apply-templates select="TA005_Initsequenz"/>
		<xsl:apply-templates select="TA005_Version"/>
		<xsl:apply-templates select="TA005_Reserve1"/>
		<xsl:apply-templates select="TA005_Reserve2"/>
		<xsl:apply-templates select="TA005_Sequentielle-Nummer"/>
		<xsl:apply-templates select="TA005_Erstellungsdatum"/>
		<xsl:apply-templates select="TA005_Teilnehmer-Nummer"/>
		<xsl:apply-templates select="TA005_Teilnehmer-File"/>
		<xsl:apply-templates select="TA005_Reserve3"/>
		<xsl:apply-templates select="TA005_Reserve4"/>
		<xsl:apply-templates select="TA005_Reserve5"/>
		<xsl:apply-templates select="TA005_Endsequenz"/>
	</xsl:template>
		<xsl:template match="TA005_Uebertragungsnummer | TA005_Zeilennummer | TA005_Transaktionsart | TA005_Initsequenz | TA005_Version | TA005_Reserve1 | TA005_Reserve2 | TA005_Sequentielle-Nummer | TA005_Erstellungsdatum | TA005_Teilnehmer-Nummer | TA005_Teilnehmer-File | TA005_Reserve3 | TA005_Reserve4 | TA005_Reserve5">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="TA005_Endsequenz">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
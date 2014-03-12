<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_abacus_ta920">
		<xsl:apply-templates select="TA920_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA920_Zeilennummer"/>
		<xsl:apply-templates select="TA920_Transaktionsart"/>
		<xsl:apply-templates select="TA920_Kundennummer"/>
		<xsl:apply-templates select="TA920_Name"/>
		<xsl:apply-templates select="TA920_Vorname"/>
		<xsl:apply-templates select="TA920_Kurzname"/>
		<xsl:apply-templates select="TA920_Kurzname-aenderbar"/>
		<xsl:apply-templates select="TA920_Zusatz"/>
		<xsl:apply-templates select="TA920_Adresse1"/>
		<xsl:apply-templates select="TA920_Adresse2"/>
		<xsl:apply-templates select="TA920_Land"/>
		<xsl:apply-templates select="TA920_PLZ"/>
		<xsl:apply-templates select="TA920_Ort"/>
		<xsl:apply-templates select="TA920_Sprachcode"/>
		<xsl:apply-templates select="TA920_Identifikationsnummer"/>
		<xsl:apply-templates select="TA920_Reserve"/>
		<xsl:apply-templates select="TA920_Adressnummer"/>
		<xsl:apply-templates select="TA920_Endsequenz"/>
	</xsl:template>
		<xsl:template match="TA920_Uebertragungsnummer | TA920_Zeilennummer | TA920_Transaktionsart | TA920_Kundennummer | TA920_Name | TA920_Vorname | TA920_Kurzname | TA920_Kurzname-aenderbar | TA920_Zusatz | TA920_Adresse1 | TA920_Adresse2 | TA920_Land | TA920_PLZ | TA920_Ort | TA920_Sprachcode | TA920_Identifikationsnummer | TA920_Reserve | TA920_Adressnummer">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="TA920_Endsequenz">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
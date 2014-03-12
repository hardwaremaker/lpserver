<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_abacus_ta101">
		<xsl:apply-templates select="TA101_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA101_Zeilennummer"/>
		<xsl:apply-templates select="TA101_Transaktionsart"/>
		<xsl:apply-templates select="TA101_Belegnummer"/>
		<xsl:apply-templates select="TA101_ESR-Nummer"/>
		<xsl:apply-templates select="TA101_Bemerkung"/>
		<xsl:apply-templates select="TA101_Adressnummer"/>
		<xsl:apply-templates select="TA101_Kurzname"/>
		<xsl:apply-templates select="TA101_PLZ"/>
		<xsl:apply-templates select="TA101_Zusatz-Kundenart"/>
		<xsl:apply-templates select="TA101_Zusatz-Kundennummer"/>
		<xsl:apply-templates select="TA101_Reserve1"/>
		<xsl:apply-templates select="TA101_Reserve2"/>
		<xsl:apply-templates select="TA101_ISO-Einheit-Belegwaehrung"/>
		<xsl:apply-templates select="TA101_Beleg-Sammelkonto"/>
		<xsl:apply-templates select="TA101_Reserve3"/>
		<xsl:apply-templates select="TA101_TA-Version"/>
		<xsl:apply-templates select="TA101_Beleg-Sammel-KST-1"/>
		<xsl:apply-templates select="TA101_Beleg-Sammel-KST-2"/>
		<xsl:apply-templates select="TA101_Mahndatum"/>
		<xsl:apply-templates select="TA101_Mahnbereich"/>
		<xsl:apply-templates select="TA101_Mahnverfahren"/>
		<xsl:apply-templates select="TA101_Mahn-Adressnummer"/>
		<xsl:apply-templates select="TA101_Mahn-Adresskontaktperson"/>
		<xsl:apply-templates select="TA101_Kunde-Kurzname"/>
		<xsl:apply-templates select="TA101_Kunde-Name"/>
		<xsl:apply-templates select="TA101_Kunde-Vorname"/>
		<xsl:apply-templates select="TA101_Kunde-Zusatz"/>
		<xsl:apply-templates select="TA101_Kunde-Adresse"/>
		<xsl:apply-templates select="TA101_Kunde-Land"/>
		<xsl:apply-templates select="TA101_Kunde-PLZ"/>
		<xsl:apply-templates select="TA101_Kunde-Ort"/>
		<xsl:apply-templates select="TA101_Kunde-Sprachcode"/>
		<xsl:apply-templates select="TA101_Kunde-Adresszeile2"/>
		<xsl:apply-templates select="TA101_Endsequenz"/>
	</xsl:template>
		<xsl:template match="TA101_Uebertragungsnummer | TA101_Zeilennummer | TA101_Transaktionsart | TA101_Belegnummer | TA101_ESR-Nummer | TA101_Bemerkung | TA101_Adressnummer | TA101_Kurzname | TA101_PLZ | TA101_Zusatz-Kundenart | TA101_Zusatz-Kundennummer | TA101_Reserve1 | TA101_Reserve2 | TA101_ISO-Einheit-Belegwaehrung | TA101_Beleg-Sammelkonto | TA101_Reserve3 | TA101_TA-Version | TA101_Beleg-Sammel-KST-1 | TA101_Beleg-Sammel-KST-2 | TA101_Mahndatum | TA101_Mahnbereich | TA101_Mahnverfahren | TA101_Mahn-Adressnummer | TA101_Mahn-Adresskontaktperson | TA101_Kunde-Kurzname | TA101_Kunde-Name | TA101_Kunde-Vorname | TA101_Kunde-Zusatz | TA101_Kunde-Adresse | TA101_Kunde-Land | TA101_Kunde-PLZ | TA101_Kunde-Ort | TA101_Kunde-Sprachcode | TA101_Kunde-Adresszeile2">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="TA101_Endsequenz">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
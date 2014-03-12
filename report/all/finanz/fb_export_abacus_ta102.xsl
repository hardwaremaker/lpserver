<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_abacus_ta102">
		<xsl:apply-templates select="TA102_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA102_Zeilennummer"/>
		<xsl:apply-templates select="TA102_Transaktionsart"/>
		<xsl:apply-templates select="TA102_Belegnummer"/>
		<xsl:apply-templates select="TA102_Haben-Konto"/>
		<xsl:apply-templates select="TA102_Haben-KST1"/>
		<xsl:apply-templates select="TA102_MWST-Code"/>
		<xsl:apply-templates select="TA102_MWST-Satz"/>
		<xsl:apply-templates select="TA102_Positionsbetrag-Leitwaehrung"/>
		<xsl:apply-templates select="TA102_Positionsbetrag-Belegwaehrung"/>
		<xsl:apply-templates select="TA102_MWST-Betrag-Leitwaehrung"/>
		<xsl:apply-templates select="TA102_MWST-Betrag-Belegwaehrung"/>
		<xsl:apply-templates select="TA102_Positionstext"/>
		<xsl:apply-templates select="TA102_Reserve1"/>
		<xsl:apply-templates select="TA102_Reserve2"/>
		<xsl:apply-templates select="TA102_Reserve3"/>
		<xsl:apply-templates select="TA102_Reserve4"/>
		<xsl:apply-templates select="TA102_Reserve5"/>
		<xsl:apply-templates select="TA102_Reserve6"/>
		<xsl:apply-templates select="TA102_Reserve7"/>
		<xsl:apply-templates select="TA102_Reserve8"/>
		<xsl:apply-templates select="TA102_Externe-Referenz"/>
		<xsl:apply-templates select="TA102_Mengen-Code"/>
		<xsl:apply-templates select="TA102_Reserve9"/>
		<xsl:apply-templates select="TA102_Menge"/>
		<xsl:apply-templates select="TA102_Haben-KST2"/>
		<xsl:apply-templates select="TA102_TA-Version"/>
		<xsl:apply-templates select="TA102_Fibu-Code"/>
		<xsl:apply-templates select="TA102_reserviert-fuer-Anlagenart"/>
		<xsl:apply-templates select="TA102_reserviert-fuer-Anlagennummer"/>
		<xsl:apply-templates select="TA102_Lieferdatum"/>
		<xsl:apply-templates select="TA102_Provision-Anweisungs-Flag"/>
		<xsl:apply-templates select="TA102_Satzfindungsflag1"/>
		<xsl:apply-templates select="TA102_Provisionistenfindungsflag1"/>
		<xsl:apply-templates select="TA102_Feldinhaltsflag1"/>
		<xsl:apply-templates select="TA102_Provisionierungsfeld1"/>
		<xsl:apply-templates select="TA102_Satzfindungsflag2"/>
		<xsl:apply-templates select="TA102_Provisionistenfindungsflag2"/>
		<xsl:apply-templates select="TA102_Feldinhaltsflag2"/>
		<xsl:apply-templates select="TA102_Provisionierungsfeld2"/>
		<xsl:apply-templates select="TA102_Positionsnummer"/>
		<xsl:apply-templates select="TA102_GeschaeftsbereichaufPosition"/>
		<xsl:apply-templates select="TA102_Endsequenz"/>
		<xsl:apply-templates select="TA995_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA995_Zeilennummer"/>
		<xsl:apply-templates select="TA995_Transaktionsart"/>
		<xsl:apply-templates select="TA995_Transaktionssumme"/>
		<xsl:apply-templates select="TA995_Endsequenz"/>
	</xsl:template>
		<xsl:template match="TA102_Uebertragungsnummer | TA102_Zeilennummer | TA102_Transaktionsart | TA102_Belegnummer | TA102_Haben-Konto | TA102_Haben-KST1 | TA102_MWST-Code | TA102_MWST-Satz | TA102_Positionsbetrag-Leitwaehrung | TA102_Positionsbetrag-Belegwaehrung | TA102_MWST-Betrag-Leitwaehrung | TA102_MWST-Betrag-Belegwaehrung | TA102_Positionstext | TA102_Reserve1 | TA102_Reserve2 | TA102_Reserve3 | TA102_Reserve4 | TA102_Reserve5 | TA102_Reserve6 | TA102_Reserve7 | TA102_Reserve8 | TA102_Externe-Referenz | TA102_Mengen-Code | TA102_Reserve9 | TA102_Menge | TA102_Haben-KST2 | TA102_TA-Version | TA102_Fibu-Code | TA102_reserviert-fuer-Anlagenart | TA102_reserviert-fuer-Anlagennummer | TA102_Lieferdatum | TA102_Provision-Anweisungs-Flag | TA102_Satzfindungsflag1 | TA102_Provisionistenfindungsflag1 | TA102_Feldinhaltsflag1 | TA102_Provisionierungsfeld1 | TA102_Satzfindungsflag2 | TA102_Provisionistenfindungsflag2 | TA102_Feldinhaltsflag2 | TA102_Provisionierungsfeld2 | TA102_Positionsnummer | TA102_GeschaeftsbereichaufPosition">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="TA102_Endsequenz">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_abacus_ta100">
		<xsl:apply-templates select="TA100_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA100_Zeilennummer"/>
		<xsl:apply-templates select="TA100_Transaktionsart"/>
		<xsl:apply-templates select="TA100_Belegnummer"/>
		<xsl:apply-templates select="TA100_Kundennummer"/>
		<xsl:apply-templates select="TA100_TA-Version"/>
		<xsl:apply-templates select="TA100_ISO-Code-Belegwaehrung"/>
		<xsl:apply-templates select="TA100_Anzahl-Positionen"/>
		<xsl:apply-templates select="TA100_FIBU-Beleg-Datum"/>
		<xsl:apply-templates select="TA100_Beleg-Total-Leitwaehrung"/>
		<xsl:apply-templates select="TA100_Beleg-Total-Belegwaehrung"/>
		<xsl:apply-templates select="TA100_Fremdwaehrungskurs"/>
		<xsl:apply-templates select="TA100_Zahlungskonditionen"/>
		<xsl:apply-templates select="TA100_Frist"/>
		<xsl:apply-templates select="TA100_Skonto-Stufe-1-Tage"/>
		<xsl:apply-templates select="TA100_Skonto-Stufe-1-Prozent"/>
		<xsl:apply-templates select="TA100_Skonto-Stufe-2-Tage"/>
		<xsl:apply-templates select="TA100_Skonto-Stufe-2-Prozent"/>
		<xsl:apply-templates select="TA100_Skonto-Stufe-3-Tage"/>
		<xsl:apply-templates select="TA100_Skonto-Stufe-3-Prozent"/>
		<xsl:apply-templates select="TA100_Reserve1"/>
		<xsl:apply-templates select="TA100_Identifikationsnummer"/>
		<xsl:apply-templates select="TA100_Reserve2"/>
		<xsl:apply-templates select="TA100_Kunde-eroeffnen"/>
		<xsl:apply-templates select="TA100_Kunden-Adress-Nummer"/>
		<xsl:apply-templates select="TA100_Kurzname"/>
		<xsl:apply-templates select="TA100_Vorschlaege-aus-Kundennummer"/>
		<xsl:apply-templates select="TA100_DEBI-Beleg-Datum"/>
		<xsl:apply-templates select="TA100_Reserve3"/>
		<xsl:apply-templates select="TA100_Faelligkeitsdatum"/>
		<xsl:apply-templates select="TA100_Belegart"/>
		<xsl:apply-templates select="TA100_Geschaeftsbereich"/>
		<xsl:apply-templates select="TA100_Geschaeftsfall"/>
		<xsl:apply-templates select="TA100_Kostengruppe"/>
		<xsl:apply-templates select="TA100_Verantwortlicher"/>
		<xsl:apply-templates select="TA100_Belastungsweg"/>
		<xsl:apply-templates select="TA100_Beleggruppen-Nummer-1"/>
		<xsl:apply-templates select="TA100_Beleggruppen-Nummer-2"/>
		<xsl:apply-templates select="TA100_Beleggruppen-Nummer-3"/>
		<xsl:apply-templates select="TA100_Belegcode1"/>
		<xsl:apply-templates select="TA100_Belegcode2"/>
		<xsl:apply-templates select="TA100_Belegcode3"/>
		<xsl:apply-templates select="TA100_Belegreferenz"/>
		<xsl:apply-templates select="TA100_VESR-Verfahren"/>
		<xsl:apply-templates select="TA100_Externe-Belegnummer"/>
		<xsl:apply-templates select="TA100_Endsequenz"/>
	</xsl:template>
		<xsl:template match="TA100_Uebertragungsnummer | TA100_Zeilennummer | TA100_Transaktionsart | TA100_Belegnummer | TA100_Kundennummer | TA100_TA-Version | TA100_ISO-Code-Belegwaehrung | TA100_Anzahl-Positionen | TA100_FIBU-Beleg-Datum | TA100_Beleg-Total-Leitwaehrung | TA100_Beleg-Total-Belegwaehrung | TA100_Fremdwaehrungskurs | TA100_Zahlungskonditionen | TA100_Frist | TA100_Skonto-Stufe-1-Tage | TA100_Skonto-Stufe-1-Prozent | TA100_Skonto-Stufe-2-Tage | TA100_Skonto-Stufe-2-Prozent | TA100_Skonto-Stufe-3-Tage | TA100_Skonto-Stufe-3-Prozent | TA100_Reserve1 | TA100_Identifikationsnummer | TA100_Reserve2 | TA100_Kunde-eroeffnen | TA100_Kunden-Adress-Nummer | TA100_Kurzname | TA100_Vorschlaege-aus-Kundennummer | TA100_DEBI-Beleg-Datum | TA100_Reserve3 | TA100_Faelligkeitsdatum | TA100_Belegart | TA100_Geschaeftsbereich | TA100_Geschaeftsfall | TA100_Kostengruppe | TA100_Verantwortlicher | TA100_Belastungsweg | TA100_Beleggruppen-Nummer-1 | TA100_Beleggruppen-Nummer-2 | TA100_Beleggruppen-Nummer-3 | TA100_Belegcode1 | TA100_Belegcode2 | TA100_Belegcode3 | TA100_Belegreferenz | TA100_VESR-Verfahren | TA100_Externe-Belegnummer">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="TA100_Endsequenz">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_abacus_ta922">
		<xsl:apply-templates select="TA922_Uebertragungsnummer"/>
		<xsl:apply-templates select="TA922_Zeilennummer"/>
		<xsl:apply-templates select="TA922_Transaktionsart"/>
		<xsl:apply-templates select="TA922_Kundennummer"/>
		<xsl:apply-templates select="TA922_Reserve1"/>
		<xsl:apply-templates select="TA922_Vorschlags-ISO-Code"/>
		<xsl:apply-templates select="TA922_Reserve2"/>
		<xsl:apply-templates select="TA922_FIBU-Konto"/>
		<xsl:apply-templates select="TA922_Vorauszahlungskonto"/>
		<xsl:apply-templates select="TA922_Skonto-Konto"/>
		<xsl:apply-templates select="TA922_Kursgewinn-Konto"/>
		<xsl:apply-templates select="TA922_Kursverlust-Konto"/>
		<xsl:apply-templates select="TA922_Ertrags-Konto"/>
		<xsl:apply-templates select="TA922_Reserve3"/>
		<xsl:apply-templates select="TA922_Skonto-KST"/>
		<xsl:apply-templates select="TA922_Zahlungskonditionen"/>
		<xsl:apply-templates select="TA922_Mahncode"/>
		<xsl:apply-templates select="TA922_Reserve4"/>
		<xsl:apply-templates select="TA922_Gruppennummer"/>
		<xsl:apply-templates select="TA922_Reserve5"/>
		<xsl:apply-templates select="TA922_Reserve6"/>
		<xsl:apply-templates select="TA922_Kreditlimite"/>
		<xsl:apply-templates select="TA922_Bemerkung"/>
		<xsl:apply-templates select="TA922_Reserve7"/>
		<xsl:apply-templates select="TA922_aenderungen"/>
		<xsl:apply-templates select="TA922_DEBI-Vorschlaege"/>
		<xsl:apply-templates select="TA922_Kursgewinn-KST"/>
		<xsl:apply-templates select="TA922_Kursverlust-KST"/>
		<xsl:apply-templates select="TA922_Ertrags-KST"/>
		<xsl:apply-templates select="TA922_TA-Version"/>
		<xsl:apply-templates select="TA922_Provisionistvorschlagfeld1"/>
		<xsl:apply-templates select="TA922_Provisionistvorschlagfeld2"/>
		<xsl:apply-templates select="TA922_Reserve8"/>
		<xsl:apply-templates select="TA922_Reserve9"/>
		<xsl:apply-templates select="TA922_Vorschlag-MWST-Code"/>
		<xsl:apply-templates select="TA922_Steuernummer-CH"/>
		<xsl:apply-templates select="TA922_Steuernummer-EU"/>
		<xsl:apply-templates select="TA922_Kontierungsvorschlagnummer"/>
		<xsl:apply-templates select="TA922_Umsatzdebitornummer"/>
		<xsl:apply-templates select="TA922_Vorschlag-Verantwortlicher"/>
		<xsl:apply-templates select="TA922_Check-Kreditlimite-Umsatzdebitor"/>
		<xsl:apply-templates select="TA922_Kennzeichnung-Sammeldebitor"/>
		<xsl:apply-templates select="TA922_Vorschlag-Geschaeftsbereich"/>
		<xsl:apply-templates select="TA922_Vorschlag-Intercompany"/>
		<xsl:apply-templates select="TA922_Vorschlag-KST-Gruppe"/>
		<xsl:apply-templates select="TA922_Waehrungsrisiko-Check"/>
		<xsl:apply-templates select="TA922_Waehrungsrisiko-Betrag"/>
		<xsl:apply-templates select="TA922_freie-Kundenidentifikation"/>
		<xsl:apply-templates select="TA922_mehrere-Waehrungen-pro-Kunde"/>
		<xsl:apply-templates select="TA922_Endsequenz"/>
	</xsl:template>
		<xsl:template match="TA922_Uebertragungsnummer | TA922_Zeilennummer | TA922_Transaktionsart | TA922_Kundennummer | TA922_Reserve1 | TA922_Vorschlags-ISO-Code | TA922_Reserve2 | TA922_FIBU-Konto | TA922_Vorauszahlungskonto | TA922_Skonto-Konto | TA922_Kursgewinn-Konto | TA922_Kursverlust-Konto | TA922_Ertrags-Konto | TA922_Reserve3 | TA922_Skonto-KST | TA922_Zahlungskonditionen | TA922_Mahncode | TA922_Reserve4 | TA922_Gruppennummer | TA922_Reserve5 | TA922_Reserve6 | TA922_Kreditlimite | TA922_Bemerkung | TA922_Reserve7 | TA922_aenderungen | TA922_DEBI-Vorschlaege | TA922_Kursgewinn-KST | TA922_Kursverlust-KST | TA922_Ertrags-KST | TA922_TA-Version | TA922_Provisionistvorschlagfeld1 | TA922_Provisionistvorschlagfeld2 | TA922_Reserve8 | TA922_Reserve9 | TA922_Vorschlag-MWST-Code | TA922_Steuernummer-CH | TA922_Steuernummer-EU | TA922_Kontierungsvorschlagnummer | TA922_Umsatzdebitornummer | TA922_Vorschlag-Verantwortlicher | TA922_Check-Kreditlimite-Umsatzdebitor | TA922_Kennzeichnung-Sammeldebitor | TA922_Vorschlag-Geschaeftsbereich | TA922_Vorschlag-Intercompany | TA922_Vorschlag-KST-Gruppe | TA922_Waehrungsrisiko-Check | TA922_Waehrungsrisiko-Betrag | TA922_freie-Kundenidentifikation | TA922_mehrere-Waehrungen-pro-Kunde">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="TA922_Endsequenz">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
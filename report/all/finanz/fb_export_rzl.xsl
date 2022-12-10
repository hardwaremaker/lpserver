<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_rzl">
		<xsl:apply-templates select="Kontonummer"/>
		<xsl:apply-templates select="Gegenkonto"/>
		<xsl:apply-templates select="OP-Nummer"/>
		<xsl:apply-templates select="Beleg-Datum"/>
		<xsl:apply-templates select="Valuta-Datum"/>
		<xsl:apply-templates select="Waehrung"/>
		<xsl:apply-templates select="Sollbetrag"/>
		<xsl:apply-templates select="Habenbetrag"/>
		<xsl:apply-templates select="Steuerbetrag"/>
		<xsl:apply-templates select="Fremdwaehrung"/>
		<xsl:apply-templates select="Fremdwaehrung-Sollbetrag"/>
		<xsl:apply-templates select="Fremdwaehrung-Habenbetrag"/>
		<xsl:apply-templates select="Kostenstelle"/>
		<xsl:apply-templates select="Belegkreis"/>
		<xsl:apply-templates select="Belegnummer"/>
		<xsl:apply-templates select="Ust-Land"/>
		<xsl:apply-templates select="Ust-Prozentsatz"/>
		<xsl:apply-templates select="Ust-Code"/>
		<xsl:apply-templates select="Sondercode"/>
		<xsl:apply-templates select="Buchungsart"/>
		<xsl:apply-templates select="AbweichendeZahlungsfrist"/>
		<xsl:apply-templates select="AbweichendeSkontofrist"/>	
		<xsl:apply-templates select="AbweichenderSkontoprozentsatz"/>
		<xsl:apply-templates select="Buchungstext"/>
		<xsl:apply-templates select="Buchungstext2"/>
		<xsl:apply-templates select="UID-Nummer"/>
		<xsl:apply-templates select="HV-ReversechargeartId"/>
		<xsl:apply-templates select="HV-ReversechargeartCnr"/>
		<xsl:apply-templates select="HV-FinanzamtKbez"/>
	</xsl:template>
	<xsl:template match="Kontonummer | Gegenkonto | OP-Nummer | Beleg-Datum | Valuta-Datum | Waehrung |  Sollbetrag |  Habenbetrag | Steuerbetrag |  Fremdwaehrung | Fremdwaehrung-Sollbetrag |  Fremdwaehrung-Habenbetrag | Kostenstelle | Belegkreis | Belegnummer | Ust-Land | Ust-Prozentsatz | Ust-Code | Sondercode |  Buchungsart |  AbweichendeZahlungsfrist | AbweichendeSkontofrist | AbweichenderSkontoprozentsatz | Buchungstext | Buchungstext2">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="UID-Nummer">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<!-- Die internen Felder normalerweise nicht ausgeben -->
	<xsl:template match="HV-ReversechargeartId | HV-ReversechargeartCnr | HV-FinanzamtKbez">
	<!-- mittels 
		<xsl:value-of select="."/>;</xsl:template>	
	 ausgeben -->
	</xsl:template>
</xsl:stylesheet>

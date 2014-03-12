<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="ISO-8859-1"/>
	<xsl:template match="zv_export_csv">
		<xsl:apply-templates select="blzempfaenger"/>
		<xsl:apply-templates select="bicempfaenger"/>
		<xsl:apply-templates select="ibanempfaenger"/>
		<xsl:apply-templates select="kontoempfaenger"/>
		<xsl:apply-templates select="empfaengername1"/>
		<xsl:apply-templates select="empfaengername2"/>
		<xsl:apply-templates select="betrag"/>
		<xsl:apply-templates select="waehrung"/>
		<xsl:apply-templates select="blzauftraggeber"/>
		<xsl:apply-templates select="bicauftraggeber"/>
		<xsl:apply-templates select="ibanauftraggeber"/>
		<xsl:apply-templates select="kontoauftraggeber"/>
		<xsl:apply-templates select="waehrungkontoauftraggeber"/>
		<xsl:apply-templates select="auftraggebername1"/>
		<xsl:apply-templates select="auftraggebername2"/>
		<xsl:apply-templates select="kurzverwendung"/>
                <xsl:apply-templates select="kundendaten"/>
	</xsl:template>
	<xsl:template match="blzempfaenger | bicempfaenger | ibanempfaenger | kontoempfaenger | empfaengername1 | empfaengername2 | betrag | waehrung |  blzauftraggeber | bicauftraggeber | ibanauftraggeber | kontoauftraggeber | waehrungkontoauftraggeber | auftraggebername1 | auftraggebername2 |  kurzverwendung">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="kundendaten">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>

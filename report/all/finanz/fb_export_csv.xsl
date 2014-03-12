<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_csv">
		<xsl:apply-templates select="satzart"/>
		<xsl:apply-templates select="konto"/>
		<xsl:apply-templates select="buchdat"/>
		<xsl:apply-templates select="gkto"/>
		<xsl:apply-templates select="belegnr"/>
		<xsl:apply-templates select="belegdat"/>
		<xsl:apply-templates select="kost"/>
		<xsl:apply-templates select="mwst"/>
		<xsl:apply-templates select="steucod"/>
		<xsl:apply-templates select="bucod"/>
		<xsl:apply-templates select="betrag"/>
		<xsl:apply-templates select="steuer"/>
        <xsl:apply-templates select="periode"/>
		<xsl:apply-templates select="kurs"/>
		<xsl:apply-templates select="fwbetrag"/>
		<xsl:apply-templates select="fwsteuer"/>
		<xsl:apply-templates select="text"/>
		<xsl:apply-templates select="symbol"/>
		<xsl:apply-templates select="zziel"/>
		<xsl:apply-templates select="skontopz"/>
		<xsl:apply-templates select="skontotage"/>
		<xsl:apply-templates select="skontopz2"/>
		<xsl:apply-templates select="skontotage2"/>
		<xsl:apply-templates select="vertnr"/>
		<xsl:apply-templates select="auftkz"/>
		<xsl:apply-templates select="auftnr"/>
		<xsl:apply-templates select="zmart"/>
		<xsl:apply-templates select="verbuchkz"/>
	</xsl:template>
</xsl:stylesheet>

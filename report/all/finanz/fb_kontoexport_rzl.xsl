<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_kontoexport_rzl">
		<xsl:apply-templates select="Kontonummer"/>
		<xsl:apply-templates select="Kontenart"/>
		<xsl:apply-templates select="Fremdwaehrung"/>
		<xsl:apply-templates select="UID-Nummer"/>
		<xsl:apply-templates select="Anrede"/>
		<xsl:apply-templates select="Name"/>
		<xsl:apply-templates select="Strasse"/>
		<xsl:apply-templates select="Ort"/>
		<xsl:apply-templates select="Mahnsperre"/>
		<xsl:apply-templates select="Mahnfrist1"/>
		<xsl:apply-templates select="Mahnfrist2"/>
		<xsl:apply-templates select="Mahnfrist3"/>
		<xsl:apply-templates select="Land"/>
		<xsl:apply-templates select="PLZ"/>
		<xsl:apply-templates select="Zusatztext"/>
		<xsl:apply-templates select="Kundennummer"/>
		<xsl:apply-templates select="Mahnschema"/>
		<xsl:apply-templates select="AbwZahlungsfristVerw"/>
		<xsl:apply-templates select="AbwZahlungsfrist"/>
	</xsl:template>
	<xsl:template match="Kontonummer | Kontenart | Fremdwaehrung | UID-Nummer | Anrede | Name |  Strasse |  Ort | Mahnsperre |  Mahnfrist1 | Mahnfrist2 |  Mahnfrist3 | Land | PLZ | Zusatztext | Kundennummer | Mahnschema | AbwZahlungsfristVerw">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="AbwZahlungsfrist">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>

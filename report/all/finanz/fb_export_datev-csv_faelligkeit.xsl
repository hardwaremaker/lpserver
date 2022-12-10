<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- das Stylesheet fb_export_datev-csv.xsl muss mit dieser Vorlage ersetzt werden!
damit beim Datev Export die Fälligkeit im Belegfeld2 eventuell im Format TTMMJJ übergeben wird-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="fb_export_datev-csv">
		<xsl:apply-templates select="umsatz"/>
		<xsl:apply-templates select="bu-schluessel"/>
		<xsl:apply-templates select="gegenkonto"/>
		<xsl:apply-templates select="belegfeld1"/>
		<xsl:apply-templates select="belegfeld2"/>
		<xsl:apply-templates select="datum"/>
		<xsl:apply-templates select="konto"/>
		<xsl:apply-templates select="kostfeld1"/>
		<xsl:apply-templates select="kostfeld2"/>
		<xsl:apply-templates select="kostmenge"/>
		<xsl:apply-templates select="skonto"/>
		<xsl:apply-templates select="buchungstext"/>
        <xsl:apply-templates select="ustid"/>
		<xsl:apply-templates select="eu-steuersatz"/>
		<xsl:apply-templates select="waehrungskennung"/>
		<xsl:apply-templates select="basiswaehrungsbetrag"/>
		<xsl:apply-templates select="basiswaehrungskennung"/>
		<xsl:apply-templates select="kurs"/>
	</xsl:template>
	<xsl:template match="umsatz | bu-schluessel | gegenkonto | datum | konto | kostfeld1 | kostfeld2 | kostmenge | skonto | buchungstext | ustid | eu-steuersatz | waehrungskennung | basiswaehrungsbetrag | basiswaehrungskennung | kurs">
		<xsl:value-of select="."/>;</xsl:template>
	<xsl:template match="belegfeld1">
 		<xsl:choose>
 			<xsl:when test="../belegfeld2='AR'">2<xsl:value-of select="."/>;</xsl:when>
			<xsl:when test="../belegfeld2='GS'">3<xsl:value-of select="."/>;</xsl:when>
			<xsl:otherwise><xsl:value-of select="."/>;</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="belegfeld2">;</xsl:template>
<!--
<xsl:template match="belegfeld2">
<xsl:value-of select="concat(substring(../faelligkeit,1,4),substring(../faelligkeit,7,8))"/>;</xsl:template>
-->
	
</xsl:stylesheet>

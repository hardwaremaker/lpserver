<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:variable name="trennzeichen" select="';'"/>
	<xsl:template match="mail">
		<xsl:apply-templates select="kontonummer"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="name"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="eu-land"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="eu-uid"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="adressart"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="strasse"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="plz"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="ort"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="land"/>
	</xsl:template>
</xsl:stylesheet>

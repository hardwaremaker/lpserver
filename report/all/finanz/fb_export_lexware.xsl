<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- für Lexware Exportformat auf BMD und Überschriften auf 0 einstellen -->
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:variable name="trennzeichen" select="';'"/>
	<xsl:variable name="datumtrenner" select="'.'"/>
	<xsl:variable name="abstand" select="' '"/>
	<xsl:template match="mail">
		<xsl:value-of select="substring(./belegdat, 7, 2)"/>
		<xsl:value-of select="$datumtrenner"/>
		<xsl:value-of select="substring(./belegdat, 5, 2)"/>
		<xsl:value-of select="$datumtrenner"/>
		<xsl:value-of select="substring(./belegdat, 1, 4)"/>
		<!-- <xsl:value-of select="./belegdat"/> -->
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./belegnr"/>
		<xsl:value-of select="$trennzeichen"/>
		<!-- folgende Zeile auskommentieren wenn Partnerkbz verwendet wird 
		<xsl:value-of select="./text"/> -->
		<!-- folgende Zeile auskommentieren wenn Text verwendet wird -->
		<xsl:if test="./symbol = 'ER'">
			<xsl:value-of select="./partkbz"/><xsl:value-of select="$abstand"/><xsl:value-of select="./extbelegnr"/>
		</xsl:if>
		<xsl:if test="./symbol != 'ER'">
			<xsl:value-of select="./partkbz"/>
		</xsl:if>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="substring(./konto, 4)"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="substring(./gkto, 6)"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:if test="substring(./betrag,1,1) != '-'">
			<xsl:value-of select="./betrag"/>
		</xsl:if>	
		<xsl:value-of select="$trennzeichen"/>
		<xsl:if test="substring(./betrag,1,1) = '-'">
			<xsl:value-of select="substring(./betrag,2)"/>
		</xsl:if>	
		<!-- Falls zusätzliche Felder benötigt werden, diese aus der Original BMD Vorlage einkopieren -->
	</xsl:template>

</xsl:stylesheet>

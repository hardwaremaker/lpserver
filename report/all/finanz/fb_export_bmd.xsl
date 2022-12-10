<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:variable name="trennzeichen" select="';'"/>
	<xsl:template match="mail">
		<xsl:value-of select="./satzart"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./konto"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./buchdat"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./gkto"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./belegnr"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./belegdat"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./kost"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./mwst"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./steucod"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./bucod"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./betrag"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./steuer"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./skonto"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./periode"/>
		<xsl:value-of select="$trennzeichen"/>
		<!-- folgende Zeile auskommentieren wenn Partnerkbz oder Partnername1 verwendet wird -->
		<xsl:value-of select="./text"/>
		<!-- folgende Zeile auskommentieren wenn Text oder Partnername1 verwendet wird -->
		<!-- <xsl:value-of select="./partkbz"/> -->
		<!-- folgende Zeile auskommentieren wenn Text oder Partnerkbz verwendet wird -->
		<!-- <xsl:value-of select="./partname1"/> -->
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./symbol"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./extbelegnr"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./zziel"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./skontopz"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./skontotage"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./skontopz2"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./skontotage2"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./verbuchkz"/>
	</xsl:template>
</xsl:stylesheet>

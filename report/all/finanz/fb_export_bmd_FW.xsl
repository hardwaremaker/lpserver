<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- das Stylesheet fb_export_bmd.xsl muss mit dieser Vorlage ersetzt werden!
damit bei den Eingangsrechnungen (symbol=ER) belegnr mit extbelegnr vertauscht wird
sowie Fremdwaehrungsfelder exportiert werden -->
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
		<xsl:apply-templates select="./belegnr"/>
		<!-- <xsl:value-of select="./belegnr"/> -->
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
		<!-- bei ER wird Text, bei AR wird Partnerkbz verwendet -->
		<xsl:apply-templates select="./text"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:value-of select="./symbol"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="./extbelegnr"/>
		<!-- <xsl:value-of select="./extbelegnr"/> -->
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
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="./waehrung"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="./fwkurs"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="./fwfaktor"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="./fwbetrag"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="./fwsteuer"/>
		<xsl:value-of select="$trennzeichen"/>
		<xsl:apply-templates select="./fwskonto"/>
	</xsl:template>
	<xsl:template match="waehrung">
		<xsl:choose>
			<xsl:when test="../waehrung='EUR'">""</xsl:when>
			<xsl:otherwise><xsl:value-of select="../waehrung"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="fwkurs">
		<xsl:choose>
			<xsl:when test="../waehrung='EUR'">""</xsl:when>
			<xsl:otherwise><xsl:value-of select="../fwkurs"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="fwfaktor">
		<xsl:choose>
			<xsl:when test="../waehrung='EUR'">""</xsl:when>
			<xsl:otherwise><xsl:value-of select="../fwfaktor"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="fwbetrag">
		<xsl:choose>
			<xsl:when test="../waehrung='EUR'">""</xsl:when>
			<xsl:otherwise><xsl:value-of select="../fwbetrag"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="fwsteuer">
		<xsl:choose>
			<xsl:when test="../waehrung='EUR'">""</xsl:when>
			<xsl:otherwise><xsl:value-of select="../fwsteuer"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="fwskonto">
		<xsl:choose>
			<xsl:when test="../waehrung='EUR'">""</xsl:when>
			<xsl:otherwise><xsl:value-of select="../fwskonto"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="belegnr">
		<xsl:choose>
			<xsl:when test="../symbol='ER'">
				<xsl:choose>
					<xsl:when test="../belegnr='belegnr'">belegnr</xsl:when>
					<xsl:otherwise><xsl:value-of select="../belegnr"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>	
			<xsl:otherwise><xsl:value-of select="../belegnr"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="extbelegnr">
		<xsl:choose>
			<xsl:when test="../symbol='ER'">
				<xsl:choose>
					<xsl:when test="../extbelegnr='extbelegnr'">extbelegnr</xsl:when>
					<xsl:otherwise><xsl:value-of select="../extbelegnr"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>	
			<xsl:when test="../symbol='GS'">
				<xsl:choose>
					<xsl:when test="../extbelegnr='extbelegnr'">extbelegnr</xsl:when>
					<xsl:otherwise><xsl:value-of select="../extbelegnr"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>	
			<xsl:when test="../symbol='AR'">
				<xsl:choose>
					<xsl:when test="../extbelegnr='extbelegnr'">extbelegnr</xsl:when>
					<xsl:otherwise><xsl:value-of select="../extbelegnr"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>	
			<xsl:otherwise><xsl:value-of select="../extbelegnr"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text">
		<xsl:choose>
			<xsl:when test="../symbol='AR'">
				<xsl:choose>
					<xsl:when test="../text='text'">text</xsl:when>
					<xsl:otherwise><xsl:value-of select="../partkbz"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>	
			<xsl:when test="../symbol='GS'">
				<xsl:choose>
					<xsl:when test="../text='text'">text</xsl:when>
					<xsl:otherwise><xsl:value-of select="../partkbz"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>	
			<xsl:otherwise><xsl:value-of select="../text"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>

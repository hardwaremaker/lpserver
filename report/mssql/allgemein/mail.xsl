<?xml version="1.0" encoding="UTF-8"?>
<!-- Dies ist die Vorlage ausschließlich für den PC, auch wenn Helium V am Linuxserver läuft-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="text" encoding="UTF-8"/>
	<xsl:template match="mail">
		<xsl:apply-templates select="anrede_anprechpartner"/>
		<xsl:apply-templates select="belegnummer"/>
		<xsl:apply-templates select="fusstext"/>
	</xsl:template>
	<xsl:template match="anrede_anprechpartner">
		<xsl:value-of select="."/>
		<xsl:text>
</xsl:text>
	</xsl:template>
	<xsl:template match="belegnummer">
Im Anhang befindet sich <xsl:value-of select="/mail/bezeichnung"/>&#160;<xsl:value-of select="."/>.

</xsl:template>
	<xsl:template match="fusstext">
		<xsl:value-of select="."/>
		<xsl:text>
</xsl:text>
		<xsl:value-of select="/mail/bearbeiter"/>
		

Zur Anzeige des Dokuments können Sie den Acrobat-Reader auch von www.HeliumV.com herunterladen.	
	</xsl:template>
</xsl:stylesheet>


<!-- kurze Beschreibung
Info zu Zeilenumbrüchen siehe unten:

Variable welche von Helium V befüllt werden:

anrede_anprechpartner
belegnummer
bezeichnung
belegdatum
projekt
bearbeiter ... der eingetragene Vertreter ev. mit Unterschrifts Funktion
fusstext
text
bearbeiter_vorname ... der das EMail echt versendet.
bearbeiter_nachname
bearbeiter_titel
bearbeiter_telefonfirma
bearbeiter_telefondwfirma
bearbeiter_email
bearbeiter_mobil
bearbeiter_telefonfirmamitdw
bearbeiter_direktfax
bearbeiter_faxdwfirma
bearbeiter_faxfirmamitdw
bearbeiter_unterschriftsfunktion
bearbeiter_unterschriftstext
vertreter_vorname ... der Vertreter aus dem Beleg, wenn nicht vorhanden, dann der Bearbeiter.
vertreter_nachname
vertreter_titel
vertreter_telefonfirma
vertreter_telefondwfirma
vertreter_email
vertreter_mobil
vertreter_telefonfirmamitdw
vertreter_direktfax
vertreter_faxdwfirma
vertreter_faxfirmamitdw
vertreter_unterschriftsfunktion
vertreter_unterschriftstext
firma_name1
firma_name2
firma_name3
firma_lkz
firma_plz
firma_ort
firma_strasse
kundenbestellnummer
abnummer

vertreter_vorname ... das ist der hinterlegte Vertreter also gleichlautend mit bearbeiter
vertreter_nachname
vertreter_titel
vertreter_telefonfirma
vertreter_telefondwfirma
vertreter_email
vertreter_mobil
vertreter_telefonfirmamitdw
vertreter_direktfax
vertreter_faxdwfirma
vertreter_faxfirmamitdw
vertreter_unterschriftsfunktion
vertreter_unterschriftstext

Die Templates (apply-templates) werden der Reihe nach abgearbeitet
Die Inhalte werden durch das template match konstrukt definiert.
value-of select="." bedeutet hier an dieser Stelle den Inhalt des match anführen
value-of select="/mail/bearbeiter"/ den Inhalt dieses Wertes an der Stelle anführen.

Das erste Template wird immer ausgeführt.
Eigentlich ist das von Helium erzeugte XML File nur ein Datensatz
(genauer es gibt nur einen Knoten = mail) mit vielen Spalten.
Darstellung von Sonderzeichen wie kaufmännischem Und &  etc. siehe http://de.wikipedia.org/wiki/Sonderzeichen

Hinweis: da das Ergebnis quasi in einen String mündet, sind auch die Zeilenumbrüche von Bedeutung.
Daher ist der Bereich von <xsl:text> bis </xsl:text> schwer lesbar.

Damit die Zeilenumbrüche usw. so wie im Editor sichtbar funktionieren müssen echte Zeichen ausgegeben werden.
Nur Spaces hilft nichts. Was hilft ist ein Phantom-Space mit &#160;
Dieses z.B. einfach am Ende von 		<xsl:value-of select="/mail/bearbeiter"/>
anfügen und ab sofort haben die Zeilenumbrüche Wirkung.

-->
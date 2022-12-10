<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
	<xsl:preserve-space elements="*"/>
	<xsl:output method="html"
	            encoding="UTF-8"/>
	<xsl:template match="mail">
	
		<html>
			<body>
				<p>
					<xsl:value-of select="/mail/anrede_anprechpartner"/>
				</p>
				<p>
					please find attached 
					<xsl:choose>
						<!-- Gutschrift wird nicht übersetzt -->
						<xsl:when test="/mail/bezeichnung != 'die Gutschrift'">
							<xsl:value-of select="/mail/bezeichnung"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'credit note'"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="/mail/bezeichnung != ''">&#160;
							<xsl:value-of select="/mail/belegnummer"/>
						</xsl:when>
					</xsl:choose>
					dated
					<xsl:value-of select="/mail/belegdatum"/>
					.
				</p>
				<p>
					<xsl:value-of select="/mail/fusstext"/>
				</p>
				<p>
					<xsl:value-of select="concat(/mail/bearbeiter_unterschriftsfunktion, ' ', /mail/bearbeiter_vorname, ' ', /mail/bearbeiter_nachname)"/>
					<br/>
					<xsl:value-of select="/mail/bearbeiter_unterschriftstext"/>
				</p>
				<p>
					<xsl:choose>
						<xsl:when test="/mail/bearbeiter_email != ''">Mail:
							<xsl:value-of select="/mail/bearbeiter_email"/>
							<br/>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="/mail/bearbeiter_telefonfirmamitdw != ''">Phone:
							<xsl:value-of select="/mail/bearbeiter_telefonfirmamitdw"/>
							<br/>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="/mail/bearbeiter_mobil != ''">Cell:
							<xsl:value-of select="/mail/bearbeiter_mobil"/>
							<br/>
						</xsl:when>
					</xsl:choose>
					<br/>
				</p>
				
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="/mail/mandant_homepage"/>
					</xsl:attribute>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="/mail/html_signatur"/>
						</xsl:attribute>
					</img>
				</a>
				
				<p>
					<small>
						<b>
							<xsl:value-of select="/mail/firma_name1"/>
						</b>
						|
						<xsl:value-of select="/mail/firma_strasse"/>
						|
						<xsl:value-of select="/mail/firma_lkz"/>
						-
						<xsl:value-of select="/mail/firma_plz"/>
						&#160;
						<xsl:value-of select="/mail/firma_ort"/>
						| Phone:
						<xsl:value-of select="/mail/bearbeiter_telefonfirma"/>
						|
						<xsl:value-of select="/mail/mandant_homepage"/>
						<br/>
						<xsl:value-of select="/mail/mandant_firmenbuchnr"/>
						&#160;
						<xsl:value-of select="/mail/mandant_gerichtsstand"/>
						| CEO: <xsl:value-of select="/mail/mandant_geschaeftsfuehrer"/> | VAT No.:
						<xsl:value-of select="/mail/mandant_uid"/>
						<br/>
					</small>
				</p>
				<p>
					<small>This e-Mail was created by the ERP System HELIUM5 and contains confidential and/or privileged information. If you are not the intended
						<br/>
						recipient or have received this e-mail in error, please notify the sender immediately and destroy this e-mail.
						<br/>
						Any unauthorized copying, disclosure or distribution of the material in this e-mail is strictly forbidden.
					</small>
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

<!--      -->
<!-- DOKU -->
<!--      -->
<!--
Variablen, die vom HELIUM5-Server zur Verfügung gestellt werden:


<HeliumV_Taglist>
Variablen									| Beschreibung
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -						|
anrede_anprechpartner						|
belegnummer									|
bezeichnung									| mit Artikel, also "der Lieferschein", "die Rechnung", ...
belegdatum									|
belegdatumYYMMDD							|
projekt										| Projektbeschreibung. Projektnummer ist projektnummer
projekt1									| Projektbeschreibung bis zum ersten Leerzeichen 
fusstext									|
text										|
kundenbestellnummer							|
abnummer									|

bearbeiter									| der eingetragene Vertreter mit Unterschriftsfunktion
bearbeiter_vorname							| Nicht der eingetragene Vertreter, sondern die Person, die tatsächlich schickt 
bearbeiter_nachname							| vorangestellter Titel 
bearbeiter_titel							| nachgestellter Titel
bearbeiter_ntitel							|
bearbeiter_telefonfirma						|
bearbeiter_telefondwfirma					| Durchwahl
bearbeiter_email							|
bearbeiter_mobil							|
bearbeiter_telefonfirmamitdw				| Firmennummer incl. Durchwahl 
bearbeiter_direktfax						|
bearbeiter_faxdwfirma						|
bearbeiter_faxfirmamitdw					|
bearbeiter_unterschriftsfunktion			| Personal -> 3 Daten -> Unterschriftsfunktion. Zum Beispiel i.A., i.V., ppa. 
bearbeiter_unterschriftstext				| Personal -> 3 Daten -> Unterschriftstext. Zum Beispiel Einkäufer, Vertrieb, Gerschäftsführer
bearbeiter_signatur							| Personal -> 3 Daten -> Signatur

vertreter_vorname							| Vertreter aus dem Beleg, wenn nicht vorhanden, dann der Bearbeiter.
vertreter_nachname							|
vertreter_titel								|
vertreter_ntitel							|
vertreter_telefonfirma						|
vertreter_telefondwfirma					|
vertreter_email								|
vertreter_mobil								|
vertreter_telefonfirmamitdw					|
vertreter_direktfax							|
vertreter_faxdwfirma						|
vertreter_faxfirmamitdw						|
vertreter_unterschriftsfunktion				|
vertreter_unterschriftstext					|
vertreter_signatur							|
	
person_anrede								|
person_personalnummer						|
person_titel								|
person_vorname1								|
person_vorname2								|
person_nachname								|
person_ntitel								|

ls_versandnummer							|
ls_versandnummer2							|
ls_spediteur_name							|
ls_spediteur_website						|
	
rekla_lieferschein							|
rekla_rechung								|
rekla_kndreklanr							|
rekla_kndlsnr								|
rekla_we_lsnr								|
rekla_we_wedatum							|
rekla_we_lsdatum							|

firma_name1									| Personal (des Bearbeiters) -> 3 Daten -> Firmenzugehörigkeit 
firma_name2									|
firma_name3									|

firma_lkz									|
firma_plz									|
firma_ort									|
firma_strasse								|

projektnummer								|
angebot_anfragenummer						|

anwesenheit_lfdnr							|

partner_name1								| Kunde oder Lieferant des Belegs

Erweiterungen / Beschreibung für pers_monatsabrechnung gilt auch für Betreff, Anhang etc.
partner_name2								|
partner_name3								|
partner_lkz									|
partner_plz									|
partner_ort									|
partner_strasse								|
partner_kbez								|

bis_datum									|

Erweiterungen für EinkaufsAngebotsStückliste, der fiktiven Datei as_egakmail
xlsmailversand_projekt						|
xlsmailversand_endkunde						|
xlsmailversand_abgabetermin					|
xlsmailversand_geplanterfertigungstermin	|

beleg_version								|
rechnungsart								|
kopftext									|

mandant_homepage							| System -> Mandant -> Kopfdaten -> Homepage 
mandant_gerichtsstand						|
mandant_firmenbuchnr						|
mandant_uid									|
mandant_fax									|
mandant_geschaeftsfuehrer					|

html_signatur								| Wert aus Mandantenparameter HTML_SIGNATUR_MAILVERSAND, Bild / Logo 



HINWEISE: 
- Die Templates (apply-templates) werden der Reihe nach abgearbeitet. value-of select="." bedeutet hier an dieser Stelle den Inhalt 
des match anführen value-of select="/mail/bearbeiter"/ den Inhalt dieses Wertes an der Stelle anführen.
- Darstellung von Sonderzeichen http://de.wikipedia.org/wiki/Sonderzeichen
- Das Ergebnis wird ein String, deshalb sind auch Zeilenumbrüche von Bedeutung und der Bereich von <xsl:text> bis </xsl:text> schwer lesbar. Bei HTML Ausgabe sind Zeilenumbrüche egal.
- Spaces: &#160;
- Zeilenumbrüche <xsl:text>
</xsl:text>
- Zeichen austauschen / ersetzen: <xsl:value-of select="translate(.,',','')"/>

Anpassung des Betreff siehe betreff_vorlage.xsl
Anpassung des Anhangs siehe anhang_vorlage.xsl
Anpassung des Absenders siehe absender_vorlage.xsl


</HeliumV_Taglist>

-->
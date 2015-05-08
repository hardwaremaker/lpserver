require 'java'

java_import com.lp.server.stueckliste.service.StuecklisteDto
java_import com.lp.server.stueckliste.service.StuecklistepositionDto
java_import com.lp.client.frame.component.WrapperNumberField
java_import com.lp.client.frame.component.WrapperButton
java_import com.lp.client.frame.delegate.DelegateFactory
java_import javax.swing.JDialog
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import java.awt.BorderLayout
java_import java.awt.event.KeyListener
java_import com.lp.client.pc.LPMain 


erfFaktor = stuecklisteDto.getIErfassungsfaktor
if erfFaktor.nil?
	erfFaktor = 1.0
end

vpeKopf = stuecklisteDto.getArtikelDto.getFVerpackungsmenge
if(vpeKopf.nil?) 
then
	vpeKopf = 1.0
end


amount = WrapperNumberField.new
amount.setBigDecimal(java.math.BigDecimal.new("1.00"))
amount.setMandatoryField(true)

dialog = JDialog.new(nil, "Verpackungseinheit", true)

inputPanel = JPanel.new
inputPanel.add(JLabel.new("Menge pro VPE:"))
inputPanel.add(amount)

panel = JPanel.new
panel.setLayout(BorderLayout.new)
panel.add(inputPanel, BorderLayout::CENTER)
dialog.add(panel)

buttonOkClicked = false
buttonOk = WrapperButton.new("Ok")
buttonOk.addActionListener do | e |
	if amount.hasContent
	then	
		buttonOkClicked = true
		dialog.setVisible(false)	
	end
end

amount.addKeyListener KeyListener.impl { | name, event |
#	puts "addKeyListener called"
#	puts name
	case name 
		when :keyPressed
#			puts "--> keypressed" 
#			puts event.getKeyChar
			if event.getKeyChar == 10
			then
				buttonOkClicked = true
				dialog.setVisible(false)
			end
		when :keyReleased
		end
	}
#	puts "addKeyListener called"
#	puts e.getKeyChar
#	if e.getKeyChar == 13
#	then
#		if amount.hasContent
#		then
#			buttonOkClicked = true
#			dialog.setVisible(false)
#		end
#	end
#end

buttonPanel = JPanel.new
buttonPanel.setLayout(BorderLayout.new)
buttonPanel.add(buttonOk)
panel.add(buttonPanel, BorderLayout::SOUTH)

dialog.pack
dialog.setDefaultCloseOperation(JDialog::DISPOSE_ON_CLOSE)
LPMain.getInstance().getDesktop().platziereDialogInDerMitteDesFensters(dialog)
dialog.setVisible(true)


if buttonOkClicked == true
then
#	puts "dialog stopped "
	b = amount.getBigDecimal	
	bErfFaktor = java.math.BigDecimal.new(erfFaktor.to_s)
	bVpeKopf = java.math.BigDecimal.new(vpeKopf.to_s)

	result = java.math.BigDecimal.new("5.0").multiply(b).multiply(bErfFaktor).divide(bVpeKopf)
#	puts result
	return result 
else
	return nil
end

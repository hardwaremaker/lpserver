# encoding: utf-8

require 'java'

java_import javax.swing.JDialog
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import java.awt.BorderLayout
java_import java.awt.event.KeyListener
java_import java.util.EventObject
java_import java.lang.Float

java_import com.lp.server.system.service.LocaleFac
java_import com.lp.server.stueckliste.service.StuecklisteDto
java_import com.lp.server.stueckliste.service.StuecklistepositionDto

java_import com.lp.client.frame.component.WrapperLabel
java_import com.lp.client.frame.component.WrapperNumberField
java_import com.lp.client.frame.component.WrapperTextField
java_import com.lp.client.frame.component.WrapperIdentField
java_import com.lp.client.frame.component.WrapperButton
java_import com.lp.client.frame.delegate.DelegateFactory
java_import com.lp.client.pc.LPMain 
java_import com.lp.client.frame.component.InternalFrame
java_import com.lp.client.stueckliste.ScriptStuecklisteServiceDto
java_import com.lp.client.frame.component.WrapperIdentField
java_import com.lp.client.frame.component.PanelBasis
java_import com.lp.client.stueckliste.PanelStuecklistepositionenScript  
java_import com.lp.client.frame.HvLayout 
java_import com.lp.client.frame.HvLayoutFactory

# Ein Stuecklisten-Eintrag
class PartlistPositionEntry
    attr_accessor :tagName, :apEntries

    def initialize
      apEntries = []
    end        
    
    def layout(layoutManager)
    end
    
    def getId()
    end

    def eventItemChanged(eventObject)
    end
    
    def hasContent
    end
    
    def dto2Component(stuecklisteDtoIn, arbeitsplanDtosIn)
    end
    
    ##
    # Liefert ein StuecklistepositionDto
    #
    def component2Dto()
    end
    
    def createStuecklistepositionDto()
      positionDto = StuecklistepositionDto.new()
      positionDto.setCPosition(tagName())
      return positionDto
    end
end


class PartlistPositionIdent < PartlistPositionEntry   
    def initialize(serviceDto, panelBasis, label)
      @wifEntry = WrapperIdentField.new(serviceDto.getInternalFrame(), panelBasis)
      @wifEntry.getWbuArtikel().setText(label)      
    end
    
    def layout(layoutManager)
      layoutManager.add(@wifEntry.getWbuArtikel(), 90)
      layoutManager.add(@wifEntry.getWtfIdent(), 90) 
      layoutManager.add(@wifEntry.getWtfBezeichnung, 320)
   end
    
   def getId()
     return @wifEntry.getArtikelDto().getIId()
   end
   
   def eventItemChanged(eventObject)
   end 
   
   def hasContent
     return true
   end

   def dto2Component(stuecklisteDtoIn, arbeitsplanDtosIn)
     itemId = stuecklisteDtoIn.getArtikelDto().getIId()
     puts "itemId #{itemId} for tagname @tagName."
     @wifEntry.setArtikelDto(stuecklisteDtoIn.getArtikelDto())
     
     apEntries = arbeitsplanDtosIn
   end

  def component2Dto()
    positionDto = createStuecklistepositionDto()
    positionDto.setArtikelIId(getId())
    positionDto.setPositionsartCNr(LocaleFac::POSITIONSART_IDENT)
    positionDto.setNMenge(java.math.BigDecimal.new("1"))
    positionDto.setEinheitCNr(@wifEntry.getArtikelDto().getEinheitCNr())    
    positionDto.setBMitdrucken(java.lang.Short.new(0))
    return positionDto
  end
end

class PartlistPositionLitze < PartlistPositionIdent
  def initialize(serviceDto, panelBasis, label)
    super(serviceDto, panelBasis, label)
    
    @wnfLaenge = WrapperNumberField.new()
    @wnfLaenge.setMandatoryField(true)
    @wlaLaenge = WrapperLabel.new
    @wlaLaenge.setText("Länge:")    
  end
    
  def layout(layoutManager)
      super
      layoutManager.add(@wlaLaenge, 45)
      layoutManager.add(@wnfLaenge)
  end

  def hasContent
    return @wnfLaenge.hasContent
  end

  def dto2Component(stuecklisteDtoIn, arbeitsplanDtosIn)
    super
    laenge = stuecklisteDtoIn.getNMenge()
    @wnfLaenge.setBigDecimal(laenge)
  end

  def component2Dto()
    positionDto = super 
    positionDto.setNMenge(@wnfLaenge.getBigDecimal())
    positionDto.setEinheitCNr("mm")
    return positionDto
  end
end

class PartlistPositionCreator
  def initialize
    @entries = []
  end

  def creatorName
    return "Y-Litze"
  end
  
  def actionEventCallback
    return self
  end
  
  def eventItemChanged(eventObject)
  end
  
  def registerEntry(positionEntry)
    @entries << positionEntry
  end
  
  def hasContent
    @entries.each do | entry |
      if !entry.hasContent()
        return false
      end
    end
    
    return true
  end
  
  ##
  # Die StuecklistenpositionDtos in die einzelnen Komponenten stellen
  #
  # @param stuecklisteDtoIn ist eine Liste aller StuecklistenpositionDto
  #
  def dto2Components(stuecklisteDtoIn, arbeitsplanDtoIn)
    @entries.each do | entry |

      stuecklisteDtoIn.each do | posDtoIn |
        if entry.tagName.casecmp(posDtoIn.getCPosition())  == 0
          puts "Found tagname #{entry.tagName}."

          apEntries = []
          arbeitsplanDtoIn.each do | apEntry |
            unless apEntry.getCKommentar().nil? || !entry.tagName.start_with?(apEntry.getCKommentar()) 
              puts "  Found apEntry #{apEntry.getCKommentar()}."
              apEntries << apEntry
            end
          end

          entry.dto2Component(posDtoIn, apEntries)
        end
      end
    end
  end
  
  ##
  # Aus den Komponenten StuecklistenpositionDtos erzeugen
  # @return Liste der StuecklistenpositionDtos
  #
  def components2Dto()
    positionDtos = []

    @entries.each do | entry |
      if entry.hasContent()
        positionDtos << entry.component2Dto()
      end
    end
    
    return positionDtos 
  end
end


def eventItemChanged(eventObject)
  puts "eventItemChanged called!"
#  if eventObject.getSource() == $wifKontakt1
#     
#     itemId = $wifKontakt1.getArtikelDto().getIId()
#     puts "wifKontakt1 changed to id (#{itemId})."
#     return
#  end
#  
#  if eventObject.getSource() == $wifLitze1
#     
#     itemId = $wifLitze1.getArtikelDto().getIId()
#     puts "wifLitze1 changed to id (#{itemId})."
#  end  
end


def doAction
  puts "doAction called"
  $creator = PartlistPositionCreator.new
  
  panelBasis = @serviceDto.getPanelBasisScript()  

  # Definition der Felder  
  $kontakt1 = PartlistPositionIdent.new(@serviceDto, panelBasis, "Kontakt 1")
  $kontakt1.tagName = "L1+Links"
  
  $litze1 = PartlistPositionLitze.new(@serviceDto, panelBasis, "Litze 1")
  $litze1.tagName = "L1"
  
  $kontaktMitte = PartlistPositionIdent.new(@serviceDto, panelBasis, "Kontakt Mitte")
  $kontaktMitte.tagName = "L1+Mitte"

  $kontakt2 = PartlistPositionIdent.new(@serviceDto, panelBasis, "Kontakt 2")
  $kontakt2.tagName = "L2+Rechts"

  $litze2 = PartlistPositionLitze.new(@serviceDto, panelBasis, "Litze 2")
  $litze2.tagName = "L2"
  
  # Darstellung der Felder im Dialog/Panel    
  hvLayout = HvLayoutFactory.create(panelBasis);
  $kontakt1.layout(hvLayout)
  hvLayout.wrap() 
  $litze1.layout(hvLayout)
  hvLayout.wrap() 

  $kontaktMitte.layout(hvLayout)
  hvLayout.wrap() 

  $litze2.layout(hvLayout)
  hvLayout.wrap() 
  $kontakt2.layout(hvLayout)
  hvLayout.wrap() 

  # Registrierung der Felder fuer die Datenzuordnung
  $creator.registerEntry($kontakt1)
  $creator.registerEntry($litze1)
  $creator.registerEntry($kontaktMitte)
  $creator.registerEntry($kontakt2)
  $creator.registerEntry($litze2)

  # Datenzuordnung durchfuehren  
  $creator.dto2Components(
    @serviceDto.getStuecklistepositionenIn(), 
    @serviceDto.getStuecklistearbeitsplanIn())
  
  panel = JPanel.new
  panel.setLayout(BorderLayout.new)
  panel.add(panelBasis, BorderLayout::CENTER)
  
  buttonOkClicked = false
  buttonOk = WrapperButton.new("Ok")
  
  buttonPanel = JPanel.new
  buttonPanel.setLayout(BorderLayout.new)
  buttonPanel.add(buttonOk)
  panel.add(buttonPanel, BorderLayout::SOUTH)
  
  dialog = JDialog.new(nil, $creator.creatorName(), true)
  dialog.add(panel)
 
  buttonOk.addActionListener do | e |
    if $creator.hasContent()
    then  
      buttonOkClicked = true
      dialog.setVisible(false)  
    end
  end

  dialog.pack
  dialog.setDefaultCloseOperation(JDialog::DISPOSE_ON_CLOSE)
  LPMain.getInstance().getDesktop().platziereDialogInDerMitteDesFensters(dialog)
  dialog.setVisible(true)
  
  @serviceDto.setStore(false)
  if buttonOkClicked == true
  then
    kontaktId = $kontakt1.getId()
    litzeId = $litze1.getId()
    puts "Kontakt1 id #{kontaktId} Litze1 id #{litzeId}."

    dtos = $creator.components2Dto()
    javaDtos = java.util.ArrayList.new()
    dtos.each do | entry |
      javaDtos.add(entry)
    end

    @serviceDto.setStuecklistepositionenOut(javaDtos)    
    @serviceDto.setStore(true)
    return javaDtos
  else
    return nil
  end
end
  
# encoding: utf-8

require 'java'

java_import java.awt.Canvas
java_import java.awt.Color
java_import java.awt.Component
java_import java.awt.Panel
java_import java.awt.Graphics
java_import java.awt.image.BufferedImage
java_import com.lp.server.system.service.LocaleFac
java_import com.lp.server.stueckliste.service.StuecklisteDto
java_import com.lp.server.stueckliste.service.StuecklistepositionDto

java_import com.lp.server.fertigung.service.ScriptStuecklisteGraphicServiceDto

# Ein Stuecklisten-Eintrag
class PartlistPositionEntry
    attr_accessor :tagName, :apEntries, :xPos, :yPos, :width, :height
    attr_reader :artikelDto
    
    def initialize
      @apEntries = []
      @connectToEntry = nil
    end        
    
    def getId()
    end

    def eventItemChanged(eventObject)
    end
    
    def hasContent
    end
 
    def dto2Component(stuecklisteDtoIn, arbeitsplanDtosIn)
        @artikelDto = stuecklisteDtoIn.getArtikelDto()
    end
    
    ##
    # Liefert ein StuecklistepositionDto
    #
    def component2Dto()
    end

    def drawSvgConnector()
      if @connectToEntry.nil? 
        return "" 
      end

      startX = xPos() + width() / 2 
      startY = yPos() + height() 
      endX = @connectToEntry.xPos() + @connectToEntry.width() / 2
      endY = @connectToEntry.yPos() 
      
      return "<line x1=\"#{startX}\" y1=\"#{startY}\" x2=\"#{endX}\" y2=\"#{endY}\" stroke=\"black\" stroke-width=\"1px\"/>"      
    end
    
    def createStuecklistepositionDto()
      positionDto = StuecklistepositionDto.new()
      positionDto.setCPosition(tagName())
      return positionDto
    end
    
    ##
    # Ich bin die Quelle und verbinde mich zum angegebenen otherEntry
    # @param otherEntry ist jener Entry zu dem ich mich verbinde
    def connectTo(otherEntry)
      @connectToEntry = otherEntry
    end
end


class PartlistPositionIdent < PartlistPositionEntry  
    def initialize(serviceDto, label)
      @width = 80
      @height = 20
    end

   def eventItemChanged(eventObject)
   end 
   
   def hasContent
     return true
   end

   def dto2Component(stuecklisteDtoIn, arbeitsplanDtosIn)
     super
     itemId = stuecklisteDtoIn.getArtikelDto().getIId()
     puts "itemId #{itemId} for tagname @tagName."
#     @wifEntry.setArtikelDto(stuecklisteDtoIn.getArtikelDto())
     
     @apEntries = arbeitsplanDtosIn
   end

  def component2Dto()
    positionDto = createStuecklistepositionDto()
    positionDto.setArtikelIId(getId())
    positionDto.setPositionsartCNr(LocaleFac::POSITIONSART_IDENT)
    positionDto.setNMenge(java.math.BigDecimal.new("1"))
 #   positionDto.setEinheitCNr(@wifEntry.getArtikelDto().getEinheitCNr())    
    positionDto.setBMitdrucken(java.lang.Short.new(0))
    return positionDto
  end

  def drawSvg()   
    theRect = "<rect x=\"#{xPos()}\" y=\"#{yPos()}\" width=\"#{width()}\" height=\"#{height()}\" fill=\"orange\" stroke=\"black\" stroke-width=\"2px\"/>"
    theText = "<text x=\"#{xPos()+10}\" y=\"#{yPos()+15}\">#{artikelDto().getCNr()}</text>"
    
    return theRect + theText + drawSvgConnector()
  end
end


class PartlistPositionLitze < PartlistPositionIdent
  attr_accessor :left  
  
  def initialize(serviceDto, label)
     super(serviceDto, label)
     @width = 80 + 40
     @height = 20
     @litzeLen = 0  
     @litzeEinheit = ""
     left = false
   end
  
   def dto2Component(stuecklisteDtoIn, arbeitsplanDtosIn)
     super
     @litzeLen = stuecklisteDtoIn.getNMenge()
     @litzeEinheit = stuecklisteDtoIn.getEinheitCNr()
   end
   
    def drawSvg() 
      startXPos = xPos() + (left() ? 40 : 0)
      startYPos = yPos()
      rectWidth = width() - 40 
      
      theRect = "<rect x=\"#{startXPos}\" y=\"#{startYPos}\" width=\"#{rectWidth}\" height=\"#{height()}\" fill=\"lightgray\" stroke=\"black\" stroke-width=\"2px\"/>"
      theText = "<text x=\"#{startXPos+10}\" y=\"#{startYPos+15}\">#{artikelDto().getCNr()}</text>"
      
      litzePos = left() ? xPos() : (xPos() + width() - 40 + 1)
      theLen = "<text x=\"#{litzePos}\" y=\"#{startYPos+15}\">#{@litzeLen} #{@litzeEinheit}</text>"     
      return theLen + theRect + theText + drawSvgConnector()
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

  def createSvg(width, height) 
    svg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
          "<svg xmlns=\"http://www.w3.org/2000/svg\" " +                
          "version=\"1.1\" baseProfile=\"full\" " +
          "width=\"#{width}px\" height=\"#{height}px\" viewBox=\"0 0 #{width}  #{height}\">"

      @entries.each do | entry |
        svg = svg + " " + entry.drawSvg()
      end
      
    return svg + "</svg>"  
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

def printAction
  puts "printAction called"
  $creator = PartlistPositionCreator.new
   
  # Definition der Felder/Elemente
  $kontakt1 = PartlistPositionIdent.new(@serviceDto, "Kontakt 1")
  $kontakt1.tagName = "L1+Links"
  $kontakt1.xPos = 10  
  $kontakt1.yPos = 30
  
  $litze1 = PartlistPositionLitze.new(@serviceDto, "Litze 1")
  $litze1.tagName = "L1"
  $litze1.xPos = 50  
  $litze1.yPos = 80
  $litze1.left = true
  
  $kontakt2 = PartlistPositionIdent.new(@serviceDto, "Kontakt 2")
  $kontakt2.tagName = "L2+Rechts"
  $kontakt2.xPos = 250  
  $kontakt2.yPos = 30

  $litze2 = PartlistPositionLitze.new(@serviceDto, "Litze 2")
  $litze2.tagName = "L2"
  $litze2.xPos = 200  
  $litze2.yPos = 80

  $kontaktMitte = PartlistPositionIdent.new(@serviceDto, "Kontakt Mitte")
  $kontaktMitte.tagName = "L1+Mitte"
  $kontaktMitte.xPos = 150  
  $kontaktMitte.yPos = 130
  
  $kontakt1.connectTo($litze1)
  $litze1.connectTo($kontaktMitte)
  $kontakt2.connectTo($litze2)
  $litze2.connectTo($kontaktMitte)

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

  # Zeichnen   
  return $creator.createSvg(350, 350)
end
  
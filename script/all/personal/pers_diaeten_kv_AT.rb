#############################################################################################
                          ###  Reisekosten/Diaeten lt. KV für AT   ###
						  ###  Codierung muss UTF-8 ohne BOM sein  ###					  
#############################################################################################

require 'bigdecimal'

class CalcTagessaetze
  def initialize(personalart, jahr, vollerSatz, halberSatz, drittelSatz, minStdVollerSatz, minStdHalberSatz, minStdDrittelSatz)
    @personalart = personalart
    @jahr = jahr
    @vollerSatz = vollerSatz
    @halberSatz = halberSatz
    @drittelSatz = drittelSatz
    @minStdVollerSatz = minStdVollerSatz
    @minStdHalberSatz = minStdHalberSatz
    @minStdDrittelSatz = minStdDrittelSatz
  end

  def returnPersonalart
    return @personalart
  end

  def returnJahr
    return @jahr
  end

  def returnVollerSatz
    return @vollerSatz
  end

  def returnHalberSatz
    return @halberSatz
  end

  def returnDrittelSatz
    return @drittelSatz
  end

  def returnMinStdVollerSatz
    return @minStdVollerSatz
  end

  def returnMinStdHalberSatz
    return @minStdHalberSatz
  end

  def returnMinStdDrittelSatz
    return @minStdDrittelSatz
  end
end

dKv = []

#############################################################################################
                          ###  Wartung KV-CalcTagessaetze Beginn  ###
#############################################################################################

# dKv.push(CalcTagessaetze.new("Personalart", "Jahr", "VollerSatz", "HalberSatz", "DrittelSatz",
#                          "MinStdVollerSatz", "MinStdHalberSatz", "MinStdDrittelSatz"))
# 2015-10-14wh Lehrlinge werden gleich wie Arbeiter/Angestellte behandelt
dKv.push(CalcTagessaetze.new("Arbeiter", "2013", "42.05", "21.02", "8.01", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Arbeiter", "2014", "42.93", "21.46", "8.18", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Arbeiter", "2015", "43.66", "21.82", "8.32", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Arbeiter", "2016", "44.31", "22.15", "8.44", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Arbeiter", "2017", "44.94", "22.47", "8.56", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Arbeiter", "2018", "45.79", "22.90", "8.72", "11", "", "3")) # 2018-12-22wh war bisher 6Std, bei allen vier Personalarten, auf 3Std korrigiert
dKv.push(CalcTagessaetze.new("Arbeiter", "2019", "47.30", "23.66", "9.01", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Arbeiter", "2020", "47.30", "23.66", "9.01", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2013", "36.73", "21.16", "8.33", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2014", "37.57", "21.65", "8.52", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2015", "38.17", "22.00", "8.66", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2016", "38.74", "22.33", "8.79", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2017", "39.29", "22.65", "8.92", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2018", "40.04", "23.08", "9.09", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2019", "41.36", "23.84", "9.39", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Angestellter", "2020", "41.36", "23.84", "9.39", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2013", "42.05", "21.02", "8.01", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2014", "42.93", "21.46", "8.18", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2015", "43.66", "21.82", "8.32", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2016", "44.31", "22.15", "8.44", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2017", "44.94", "22.47", "8.56", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2018", "45.79", "22.90", "8.72", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2019", "47.30", "23.66", "9.01", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Arbeit", "2020", "47.30", "23.66", "9.01", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2013", "36.73", "21.16", "8.33", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2014", "37.57", "21.65", "8.52", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2015", "38.17", "22.00", "8.66", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2016", "38.74", "22.33", "8.79", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2017", "39.29", "22.65", "8.92", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2018", "40.04", "23.08", "9.09", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2019", "41.36", "23.84", "9.39", "11", "", "3"))
dKv.push(CalcTagessaetze.new("Lehrling Angest", "2020", "41.36", "23.84", "9.39", "11", "", "3"))

#############################################################################################
                          ###  Wartung KV-CalcTagessaetze Ende   ###
#############################################################################################

REISEKOSTENDTO = reisekostenDto
def getReisekostenDto
  REISEKOSTENDTO
end

BEGINNDAY = getReisekostenDto.getBeginnMilliSeconds
def getBeginnDay
  BEGINNDAY
end

ENDDAY = getReisekostenDto.getEndeMilliSeconds
def getEndDay
  ENDDAY
end

BEGINNYEAR = getReisekostenDto.getBeginnYear
def getBeginnYear
  BEGINNYEAR
end

ENDYEAR = getReisekostenDto.getEndYear
def getEndYear
  ENDYEAR
end

BEGINN = getReisekostenDto.getBeginnHour + (getReisekostenDto.getBeginnMin / 60.00 ) + (getReisekostenDto.getBeginnSec / 3600.00 )
def getBeginn
  BEGINN
end

ENDE = getReisekostenDto.getEndeHour + (getReisekostenDto.getEndeMin / 60.00 ) + (getReisekostenDto.getEndeSec / 3600.00 )
def getEnde
  ENDE
end

def CalcStunden(beginDuration, endDuration)
  stunden = (endDuration - beginDuration) / 1000.00 / 60.00 / 60.00 # convert milliseconds to hours
  return stunden
end

def CalcTage(stunden)
  tage = (stunden / 24).ceil # always round up to next higher number
  return tage
end

def CalcDiaetenKv(tagessatz, stunden, tage)
    if tage > 1
      then
      value01 = BigDecimal.new((tage-2).to_s) * BigDecimal.new(tagessatz.returnVollerSatz)
      value02 = getBeginn < 12.00 ? BigDecimal.new(tagessatz.returnVollerSatz) : BigDecimal.new(tagessatz.returnHalberSatz)
      value03 = getEnde > 17.00 ? BigDecimal.new(tagessatz.returnVollerSatz) : BigDecimal.new(tagessatz.returnHalberSatz)
      result = value01 + value02 + value03
      return result
    else # tage == 1
	  if stunden > 6 # 2015-06-04 wh Diaeten werden in AT erst wenn mehr als 6 Std bezahlt
        result = stunden > (tagessatz.returnMinStdVollerSatz).to_i ? BigDecimal.new(tagessatz.returnHalberSatz) :
                 stunden > (tagessatz.returnMinStdDrittelSatz).to_i ? BigDecimal.new(tagessatz.returnDrittelSatz) : BigDecimal.new("0.00")
        return result
	  else
	    result = BigDecimal.new("0.00")
	    return result
	  end
    end
end

$values = []

def DiaetenKv(tagessatz)
  # Dienstreise mit Jahressprung
  if getBeginnYear == (getEndYear - 1)
    if getBeginnYear.to_s == tagessatz.returnJahr
      stunden = CalcStunden(getBeginnDay, getReisekostenDto.getLastDayOfBeginnYearMilliSeconds(getBeginnYear))
      tage = CalcTage(stunden)
      result = CalcDiaetenKv(tagessatz, stunden, tage)
      $values.push(result)
    end
    if getEndYear.to_s == tagessatz.returnJahr
      stunden = CalcStunden(getReisekostenDto.getFirstDayOfEndYearMilliSeconds(getEndYear), getEndDay)
      tage = CalcTage(stunden)
      result = CalcDiaetenKv(tagessatz, stunden, tage)
      $values.push(result)
    end
  end
  # Dienstreise innerhalb eines Jahres
    if getBeginnYear == getEndYear
      if getBeginnYear.to_s == tagessatz.returnJahr
        stunden = CalcStunden(getBeginnDay, getEndDay)
        tage = CalcTage(stunden)
        result = CalcDiaetenKv(tagessatz, stunden, tage)
        $values.push(result)
      end
    end
end

for i in 0..(dKv.length-1)
  if dKv[i].returnPersonalart == getReisekostenDto.getPersonalArt
    DiaetenKv(dKv[i])
  end
end

return  $values.inject{|sum,x| sum + x}

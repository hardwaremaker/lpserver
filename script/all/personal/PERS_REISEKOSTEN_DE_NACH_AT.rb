#############################################################################################
                          ###  Reisekosten/Diaeten lt. KV für DE   ###
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

dPauschalen = []

#############################################################################################
                          ###  Wartung KV-CalcTagessaetze Beginn  ###
#############################################################################################

# dPauschalen.push(CalcTagessaetze.new("Personalart", "Jahr", "VollerSatz", "HalberSatz", "DrittelSatz",
#                          "MinStdVollerSatz", "MinStdHalberSatz", "MinStdDrittelSatz"))

dPauschalen.push(CalcTagessaetze.new("Angestellter", "2021", "64", "43", "0", "24", "8", "0"))
dPauschalen.push(CalcTagessaetze.new("Angestellter", "2022", "64", "43", "0", "24", "8", "0"))

dPauschalen.push(CalcTagessaetze.new("Lehrling Angest", "2021", "64", "43", "0", "24", "8", "0"))
dPauschalen.push(CalcTagessaetze.new("Lehrling Angest", "2022", "64", "43", "0", "24", "8", "0"))

#############################################################################################
                          ###  Wartung KV-CalcTagessaetze Ende   ###
#############################################################################################

REISEKOSTENDTO = reisekostenDto
def getReisekostenDto
  REISEKOSTENDTO
end

BEGINNTIME = Time.at(getReisekostenDto.getBeginnMilliSeconds / 1000)
def getBeginnTime
  BEGINNTIME
end

ENDTIME = Time.at(getReisekostenDto.getEndeMilliSeconds / 1000)
def getEndTime
  ENDTIME
end

BEGINNYEAR = getReisekostenDto.getBeginnYear
def getBeginnYear
	BEGINNYEAR
end

ENDYEAR = getReisekostenDto.getEndYear
def getEndYear
	ENDYEAR
end




def VerpflegungsmehraufwandZeitbereich (tagessatz, von, bis)
	ganztage = 0
	halbtage = 0
	
	# Tagesreise > 8h
	if bis.day == von.day and bis - von >= 8 *60*60
		halbtage = 1
	
	# Reise für mehrere Tage 
	elsif bis.day != von.day # GRÖSSER > geht nicht, denn 30. bis 1. wäre FALSE
		# Anreise 
		if von.hour <= 16
			halbtage += 1
		end
		# Rückreise 
		if bis.hour >= 8
			halbtage += 1
		end 
	
		# Volle Tage 
		von = Time.new(von.year, von.month, von.day, 0, 0, 0)
		bis = Time.new(bis.year, bis.month, bis.day, 0, 0, 0)
		
		ganztage = ((bis - von) /60/60/24) - 1
	end 
	
	print "\nGanztage: "
	print ganztage 
	print "\Halbtage: "
	print halbtage 
	print "\n"
	
	return (BigDecimal.new(tagessatz.returnVollerSatz) * ganztage) + (BigDecimal.new(tagessatz.returnHalberSatz) * halbtage)
end

$values = []

def Verpflegungsmehraufwand (tagessatz)
  	result = BigDecimal.new(0)
	print "\nBerechne Pauschalen fuer "
	print tagessatz.returnJahr
	print ", "
	print getBeginnTime
	print " bis "
	print getEndTime
	print "\n"
	
	print "\ngetBeginnYear == getEndYear: "
	print getBeginnYear == getEndYear
	print "\ntagessatz.returnJahr == getBeginnYear: "
	print tagessatz.returnJahr 
	print " == "
	print getBeginnYear
	print "?: "
	print tagessatz.returnJahr.to_i == getBeginnYear 
	print "\ntagessatz.returnJahr == getEndYear: "
	print tagessatz.returnJahr.to_i == getEndYear 
	
	if getBeginnYear == getEndYear and tagessatz.returnJahr.to_i == getBeginnYear and tagessatz.returnJahr.to_i == getEndYear 
		result = VerpflegungsmehraufwandZeitbereich(tagessatz, getBeginnTime, getEndTime)
	elsif getBeginnYear != getEndYear and tagessatz.returnJahr.to_i == getBeginnYear 
		result = VerpflegungsmehraufwandZeitbereich(tagessatz, getBeginnTime, Time.at(getReisekostenDto.getLastDayOfBeginnYearMilliSeconds(getBeginnYear)))
	elsif getBeginnYear != getEndYear and tagessatz.returnJahr.to_i == getEndYear
		result = VerpflegungsmehraufwandZeitbereich(tagessatz, Time.at(getReisekostenDto.getFirstDayOfEndYearMilliSeconds(getEndYear)), getEndTime)
	end 
	
	print "\nErgebnis fuer "
	print tagessatz.returnJahr
	print ": "
	print result 
	print "\n\n"
	
	$values.push(result)
end

for i in 0..(dPauschalen.length-1)
	if dPauschalen[i].returnPersonalart == getReisekostenDto.getPersonalArt and (dPauschalen[i].returnJahr.to_i == getBeginnYear or dPauschalen[i].returnJahr.to_i == getEndYear)
		Verpflegungsmehraufwand(dPauschalen[i])
	end
end

return  $values.inject{|sum,x| sum + x}

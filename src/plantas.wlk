import parcelas.*

// 1.- Plantas
class Planta {
	var property anioSemilla // año de la semilla -> numerico
	var property altura  // altura de la planta en metros -> numerico

	method esFuerte() { return self.horasSol() > 9 }
	
	method horasSol() { return 7 }
	
	method daSemillas() { return self.esFuerte() }
	
	method espacioQueOcupa()
	
	method parcelaIdeal(parcela)
	
	method bienAsociada(parcela) { return parcela.seAsociaBien(self) }
}

class Menta inherits Planta {
	
	override method daSemillas() { return super() or altura > 0.4 }
	
	override method espacioQueOcupa() { return  altura * 3}
	
	override method parcelaIdeal(parcela) { // 4.-Parcela ideal
		return parcela.superficie() > 6
	}
}

class Soja inherits Planta { 
	
	override method horasSol() { 
		var horasSol = 12
		if (altura.between(0.5, 1)) {
			horasSol = horasSol - 4
		} else if (altura < 0.5) { horasSol = horasSol - 6 }
		return horasSol
	}
	
	override method daSemillas() { return super() or (anioSemilla > 2007 and altura.between(0.75, 0.9)) }
	
	override method espacioQueOcupa() { return altura / 2 }
	
	override method parcelaIdeal(parcela) { // 4.-Parcela ideal
		return self.horasSol() == parcela.horasSol()
	}
}

class Quinoa inherits Planta {
	var property espacioQueOcupa
	
	override method espacioQueOcupa() { return espacioQueOcupa }
	
	override method horasSol() { return super() + (if (espacioQueOcupa < 0.3) {3} else {0} ) }
	
	override method daSemillas() { return super() or anioSemilla.between(2001,2008) }
	
	override method parcelaIdeal(parcela) { // 4.-Parcela ideal
		return parcela.ningunaPlantaTenga(1.5)
	}
}

// 2.- Variedades

class SojaTransgenica inherits Soja { 
	
	override method daSemillas() { return false }	
	
	override method parcelaIdeal(parcela) {  // 4.-Parcela ideal
		return parcela.cantidadMaximaPlantas() == 1
	}
}

class Peperina inherits Menta {
	
	override method espacioQueOcupa() { return super() * 2 }	
}
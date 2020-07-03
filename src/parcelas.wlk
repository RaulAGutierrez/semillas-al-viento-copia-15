import plantas.*

//3.- Parcelas
class Parcela {
	var property ancho
	var property largo
	var property horasSol
	const property plantas = []
	
	method superficie() { return ancho * largo }
	
	method cantidadMaximaPlantas() { return self.superficie() / (if (ancho > largo) {5} else {3} ) }
	
	method tieneComplicaciones() { 
		return plantas.any( { planta => planta.horasSol() < self.horasSol() } )
	}
	
	method ningunaPlantaTenga(altura) { // 4.-Parcela ideal
		return plantas.all( { planta=> planta.altura() < altura } )
	}
	method cantidadPlantas() { return plantas.size() }
	
	method plantar(planta) { 
		if ((self.cantidadMaximaPlantas() == self.cantidadPlantas()) or ( not planta.horasSol().between(self.horasSol(),self.horasSol() + 2)) ) {
			self.error("No se puede plantar la planta")
		} else { 
			plantas.add(planta)
		}
	}
	method cantidadPlantasBienAsociadas() { // 6.- Estadisticas del INTA
		return plantas.count( { planta => planta.bienAsociada(self) } )
	}
	method seAsociaBien(planta)	 
}

// 5.- Asociacion de plantas

class Ecologica inherits Parcela { 
	
	override method seAsociaBien(planta) { 
		return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	}
}

class Industrial inherits Parcela { 
	
	override method seAsociaBien(planta) { 
		return self.cantidadMaximaPlantas() <= 2 and planta.esFuerte()
		
	}
}
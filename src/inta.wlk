import parcelas.*
import plantas.*

// 6.- Estadisticas INTA

object inta {
	const property parcelas = #{}
	
	method agregar(parcela) { parcelas.add(parcela) }
	
	method cantidadParcelas() { return parcelas.size() }
	
	method promedioDePlantas() { 
		return parcelas.sum( { parcela => parcela.cantidadPlantas() } ) / self.cantidadParcelas()
	}
	method masAutosustentable() { 
		return parcelas.filter( { parcela => parcela.cantidadPlantas() > 4 } ).max( { parcela => parcela.cantidadPlantasBienAsociadas() } )
	}
}

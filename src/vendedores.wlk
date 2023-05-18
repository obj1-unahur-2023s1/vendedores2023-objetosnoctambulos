import certificacion.*

class VendedorFijo{
	const property certificaciones = []
	const property ciudad
	
	
	method esInfluyente() = false
	
	method esVersatil() = 	certificaciones.size() >= 3 && 
							certificaciones.any{c => c.esProducto()}  && 
							certificaciones.any{c => !c.esProducto()} 
							
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	method puedeTrabajar(unaCiudad) = ciudad == unaCiudad
}

class VendedorViajante{
	const property certificaciones = []
	const property provinciasHabilitadas = []
	
	method esInfluyente() = provinciasHabilitadas.sum{p => p.poblacion()} > 10000000
	method esVersatil() = 	certificaciones.size() >= 3 && 
							certificaciones.any{c => c.esProducto()}  && 
							certificaciones.any{c => !(c.esProducto())}
							 
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	method puedeTrabajar(unaCiudad) =  provinciasHabilitadas.contains(unaCiudad.provincia())
}

class ComercioCorresponsal{
	const property certificaciones = []
	const property ciudadesConSucursal = []
	
	method esInfluyente() = ciudadesConSucursal.size() >= 5 || 
							ciudadesConSucursal.map{c => c.provincia()}.asSet().size() >= 3
							
	method esVersatil() = 	certificaciones.size() >= 3 && 
							certificaciones.any{c => c.esProducto()} && 
							certificaciones.any{c => !(c.esProducto())} 
							
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	method puedeTrabajar(unaCiudad) = ciudadesConSucursal.contains(unaCiudad)
}
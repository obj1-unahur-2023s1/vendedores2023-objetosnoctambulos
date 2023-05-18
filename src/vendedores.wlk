import certificacion.*

class VendedorFijo{
	const property certificaciones = []
	var property ciudad
	
	method esInfluyente() = false
	method esVersatil() = certificaciones.size() >= 3 && certificaciones.any{c => c.tipo() == "productos"}  && certificaciones.any{c => !(c.tipo() == "productos")} 
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	method puedeTrabajar(unaCiudad) = ciudad == unaCiudad
}

class VendedorViajante{
	const property certificaciones = []
	var property provinciasHabilitadas = []
	
	method esInfluyente() = provinciasHabilitadas.sum{p => p.poblacion()} > 10000000
	method esVersatil() = certificaciones.size() >= 3 && certificaciones.any{c => c.tipo() == "productos"}  && certificaciones.any{c => !(c.tipo() == "productos")} 
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	method puedeTrabajar(unaCiudad) =  provinciasHabilitadas.any{p => p == unaCiudad.provincia()}
}

class ComercioCorresponsal{
	const property certificaciones = []
	var property ciudadesConSucursal = []
	
	method esInfluyente() = ciudadesConSucursal.size() >= 5 || ciudadesConSucursal.map{c => c.provincia()}.asSet().size() >= 3
	method esVersatil() = certificaciones.size() >= 3 && certificaciones.any{c => c.tipo() == "productos"}  && certificaciones.any{c => !(c.tipo() == "productos")} 
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	method puedeTrabajar(unaCiudad) = ciudadesConSucursal.any{c => c == unaCiudad}
}
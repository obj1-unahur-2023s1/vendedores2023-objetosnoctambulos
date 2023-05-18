import certificacion.*

class VendedorFijo{
	const property certificaciones = []
	const property ciudad
	
	method esPersonaFisica() = true
	
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	
	method esInfluyente() = false
	
	method esVersatil() = 	certificaciones.size() >= 3 && 
							certificaciones.any{c => c.esProducto()}  && 
							certificaciones.any{c => !c.esProducto()} 
							
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	method puedeTrabajar(unaCiudad) = ciudad == unaCiudad
	
	method totalDePuntosEnCertificaciones() = certificaciones.sum{c => c.puntos()}
	
	method tieneAfinidad(unCentro) = self.puedeTrabajar(unCentro.ciudad())
	
	method esCandidato(unCentro) = self.esVersatil() && self.tieneAfinidad(unCentro)
}

class VendedorViajante{
	const property certificaciones = []
	const property provinciasHabilitadas = []
	
	method esPersonaFisica() = true
	
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	
	method esInfluyente() = provinciasHabilitadas.sum{p => p.poblacion()} > 10000000
	method esVersatil() = 	certificaciones.size() >= 3 && 
							certificaciones.any{c => c.esProducto()}  && 
							certificaciones.any{c => !(c.esProducto())}
							 
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	method puedeTrabajar(unaCiudad) =  provinciasHabilitadas.contains(unaCiudad.provincia())
	
	method totalDePuntosEnCertificaciones() = certificaciones.sum{c => c.puntos()}
	
	method tieneAfinidad(unCentro) = self.puedeTrabajar(unCentro.ciudad())
	
	method esCandidato(unCentro) = self.esVersatil() && self.tieneAfinidad(unCentro)
}

class ComercioCorresponsal{
	const property certificaciones = []
	const property ciudadesConSucursal = []
	
	method esPersonaFisica() = false
	
	
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	
	method esInfluyente() = ciudadesConSucursal.size() >= 5 || 
							ciudadesConSucursal.map{c => c.provincia()}.asSet().size() >= 3
							
	method esVersatil() = 	certificaciones.size() >= 3 && 
							certificaciones.any{c => c.esProducto()} && 
							certificaciones.any{c => !(c.esProducto())} 
							
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	method puedeTrabajar(unaCiudad) = ciudadesConSucursal.contains(unaCiudad)
	
	method totalDePuntosEnCertificaciones() = certificaciones.sum{c => c.puntos()}
	
	method tieneAfinidad(unCentro) = 	self.puedeTrabajar(unCentro.ciudad()) &&  
										ciudadesConSucursal.any{c => !unCentro.puedeCubrir(c)} 
										
	method esCandidato(unCentro) = self.esVersatil() && self.tieneAfinidad(unCentro)
}
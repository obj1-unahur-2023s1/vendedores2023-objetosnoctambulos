import vendedores.*

class ClienteInseguro {
	
	method puedeSerAtendido(unVendedor) = unVendedor.esVersatil() && unVendedor.esFirme()
	
}

class ClienteDetallista {
	
	method puedeSerAtendido(unVendedor) = unVendedor.certificaciones().count{c => c.esProducto()} >= 3
	
}

class ClienteHumanista {
	
	method puedeSerAtendido(unVendedor) = unVendedor.esPersonaFisica()
	
}
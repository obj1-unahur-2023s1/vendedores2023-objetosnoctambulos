import vendedores.*
import certificacion.*
import locacion.*

class CentroDeDistribucion {
	const property ciudad
	const property vendedores = []
	
	method agregarVendedor(unVendedor){
		if(!vendedores.contains(unVendedor)){
			vendedores.add(unVendedor)
		}
		else{
		 throw new Exception(message = "El vendedor ya se encuentra registrado")
		}
	}  
	
	method vendedorEstrella() = vendedores.max{v => v.totalDePuntosEnCertificaciones()}
	
	method puedeCubrir(unaCiudad) = vendedores.any{v => v.puedeTrabajar(unaCiudad)}
	
	method vendedoresGenericos() = vendedores.filter{v => !(v.esProducto())}
	
	method esRobusto() = vendedores.count{v => v.esFirme()} >= 3
	
	method repartirCertficacion(unaCertificacion) =  vendedores.forEach{v => v.agregarCertificacion(unaCertificacion)}
	
	
}

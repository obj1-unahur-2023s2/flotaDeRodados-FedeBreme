import rodadosYDependencias.*

class PedidosDeTraslado {
	var property distanciaARecorrer
	var property tiempoMaximo
	var property cantidadDePasajeros
	const coloresIncompatibles = #{}
	
	method velocidadRequerida() {
		return distanciaARecorrer / tiempoMaximo
	}
	
	method puedeSatisfacerUnPedido(unAuto) {
		return (unAuto.velocidadMaxima() - self.velocidadRequerida()) >= 10 && 
		unAuto.capacidad() == cantidadDePasajeros && 
		!coloresIncompatibles.any({a => a.color() == unAuto.color()})
	}
	
	method acelerar() {
		tiempoMaximo -= 1
	}
	
	method relajar() {
		tiempoMaximo += 1
	}
	
	method coloresIncompatibles() {
		return coloresIncompatibles
	}
}
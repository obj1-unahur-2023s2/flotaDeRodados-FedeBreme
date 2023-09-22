import pedidosDeTraslado.*
import wollok.game.*

//Etapa 1 - Rodados y dependencias

class Corsa {
    const color
    var property position
    
    method velocidadMaxima() = 150
    
    method color() = color
    
    method capacidad() = 4
    
    method peso() = 1300
    
   
}


class RenaultKwid {
    var property tanqueAdicional
    
    method velocidadMaxima() = if(tanqueAdicional){return 120} else {return 110}
    
    method color() = "azul"
    
    method capacidad() = if(tanqueAdicional){return 3} else {return 4}
    
    method peso() = if(tanqueAdicional){return 1200 + 150} else {return 1200}
}

//trafic

object trafic {
    var property interior
    var property motor
    
    method capacidad() = interior.capacidad()
    
    method velocidadMaxima() = motor.velocidadMaxima()
    
    method peso() = 4000 + motor.peso() + interior.peso()
}


//interiores


object comodo {
    
    method capacidad() = 5
    
    method peso() = 700
}


object popular {
    
    method capacidad() = 12
    
    method peso() = 1000
}


//motores


object pulenta {
    
    method peso() = 800
    
    method velocidadMaxima() = 130
}


object bataton {
    
    method peso() = 500
    
    method velocidadMaxima() = 80
}


class AutoEspecial {
    var property capacidad
    var property velocidadMaxima
    var property peso
    var property color
}


class Dependencia {
    const rodados = []
    var property empleados
    const pedidos = #{}
    
    method capacidadTotalEnColor(color) = rodados.filter({r => r.color() == color})
    
    method agregarAFlota(rodado) {
   	 rodados.add(rodado)
    }
    
    method quitarDeFlota(rodado) {
   	 rodados.remove(rodado)
    }
    
    method estaBienEquipada() {
   	 return rodados.size() > 3 && rodados.all({r=>r.velocidadMaxima() >= 100})
    }
    
    method colorDelRodadoMasRapido() {
   	 return rodados.max({r => r.velocidadMaxima()}).color()
    }
    
    method capacidadFaltante() {
   	 return empleados - rodados.sum({r => r.capacidad()})
    }
    
    method esGrande() {
   	 return empleados >= 40 && rodados.size() >= 5
    }
    
    method agregarPedido(unPedido) {
    	pedidos.add(unPedido)
    }
    
    method quitarPedido(unPedido) {
    	pedidos.remove(unPedido)
    }
    
    method totalDePasajerosEnElPedido() {
    	pedidos.size()
    }
    
    method pedidosQueNoPuedenSatisfacerse() {
    	pedidos.filter({p => !p.puedeSatisfacerUnPedido()})
    }
    
    method esIncompatibleElColor(unColor) {
    	//no se
    }
    
    method relajarATodosLosPedidos() {
    	//no se
    }
}

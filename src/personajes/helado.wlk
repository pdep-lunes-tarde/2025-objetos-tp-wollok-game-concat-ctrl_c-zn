import wollok.game.*
import badIceCream.*
import objetos.hielo.*
import objetos.condicionesPartida.*
import src.utils.direcciones.*

class Helado {
    var posicion = game.center()
    var direccion = abajo
    var perdio = false

    method perdio(){
        return perdio
    }
    
    method perdio(estado){
        perdio = estado
    }

    method position() {
        return posicion
    }

    method direccion(){
        return direccion
    }

    method direccion(nuevaDireccion){
        direccion = nuevaDireccion
    }

    method position(nuevaPosicion) {
        posicion = nuevaPosicion
    }

    method init(position){
        self.position(position)
        self.perdio(false)
    }

    method move(nuevaDireccion) {
        const nuevaPosicion = nuevaDireccion.siguientePosicion(posicion)
        if(!self.perdio()){
            if (badIceCream.dentroDeLosLimites(nuevaPosicion) && !badIceCream.hayHielo(nuevaPosicion)) {
                posicion = self.posicionCorregida(nuevaPosicion)
                self.direccion(nuevaDireccion)
                self.cambiarImagenPorDireccion(nuevaDireccion)
            }
        }
        
    }

    method cambiarImagenPorDireccion(nuevaDireccion) 

    method posicionCorregida(posicionACorregir) {
        const nuevaY = wraparound.aplicarA(posicionACorregir.y(), 0, badIceCream.alto())
        const nuevaX = wraparound.aplicarA(posicionACorregir.x(), 0, badIceCream.ancho())

        return new Position(x = nuevaX, y = nuevaY)
    }

    method accionHielo() {
        const siguientePosicion = direccion.siguientePosicion(posicion)
        const hielo = new Hielo()

        if (!self.perdio() && badIceCream.dentroDeLosLimites(siguientePosicion)) {            
            if (!badIceCream.hayHielo(siguientePosicion)) {
                hielo.crearHielosDesde(siguientePosicion, direccion)
            } 
            else {
                hielo.romperFilaDesde(siguientePosicion, direccion)
            }
        }
    }

    method comerFruta() {
      const fruta = badIceCream.frutas().findOne{ unaFruta => unaFruta.position().equals(posicion)}

      if(fruta != null){
        game.removeVisual(fruta)
        badIceCream.eliminarFruta(fruta)
      }
    }

    
}

object vainilla inherits Helado{
    var imagen = "Helado_Vainilla.png"

    method image(){
        return imagen
    }
    
    method setImage(nuevaImagen){
        imagen = nuevaImagen
    }

    method chocasteConMonstruo(monstruo){
        self.perdio(true)
        self.setImage("Helado_Vainilla_Derretido.png")
        game.addVisual(restart)
    }

    override method init(posicionNueva){
        self.position(posicionNueva)
        self.setImage("Helado_Vainilla.png")
        self.perdio(false)
        self.direccion(abajo)
    }

    override method cambiarImagenPorDireccion(direccionNueva){
        if(direccionNueva == derecha){
            self.setImage("Vainilla derecha.png")
        }
        else if(direccionNueva == izquierda){
            self.setImage("Vainilla izquierda.png")
        }
        else if(direccionNueva == arriba){
            self.setImage("Vainilla arriba.png")
        }
        else {
            self.setImage("Helado_Vainilla.png")
        }
    }

}
class Personaje{
  const fuerza
  const inteligencia
  var rol //guerrero, cazador o brujo 
  
  method potencialOfensivo() = fuerza*10+rol.potencialOfensivo()
  method esGroso() = self.esInteligente() or rol.esGroso(self)
  method esInteligente() //abstractto 
  method fuerza() = fuerza 

  method rol(unRol){
    rol = unRol
  }


}

//ERSONAJES :cada instancia uede elegir su rol (objeto)
class Humano inherits Personaje{
  override method esInteligente() = inteligencia>50
}

class Orco inherits Personaje{
  override method potencialOfensivo() = fuerza*11+rol.potencialOfensivo()
  override method esInteligente() = false 
}

//ROLES:
object guerrero {
  method extra() = 100 
  method esGroso(unPersonaje) = unPersonaje.fuerza() > 50 
}

class Cazador { //clase porque al cambiar la mascota cambia el objeto
  var mascota = null
  method extra() = mascota.potencialOfensivo() 
  method esGroso(unPersonaje) = mascota.esLongeva() 

  method mascota(unaMascota){
    mascota = unaMascota
  }
}

object brujo {
  method extra() {}
  method esGroso(unPersonaje) = true 
}

//MASCOTA
class Mascota{
  const fuerza 
  const edad
  const tieneGarras

  method potencialOfensivo() = if (tieneGarras){fuerza*2} else {fuerza}
  method esLongeva() = edad>10 
}



//{}
class Localidad{
  var habitantes = new List()

  method potencialOfensivoEjercito() = habitantes.forEach({h=>h.potencialOfensivo()}).sum() 

  method agregarHabitante(unHabitante) {
    habitantes.add(unHabitante)
  }
}

class Aldea inherits Localidad{
  const tamaño
  method cantidadMaximaDeHabitantes() = tamaño 
  
}

class Ciudad inherits Localidad{}



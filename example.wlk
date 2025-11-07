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

//cada instancia uede elegir su rol (objeto)
class Humano inherits Personaje{
  override method esGroso() = inteligencia>50 or rol.esGroso()
  override method esInteligente() = inteligencia>50
}
//cada instancia uede elegir su rol (objeto)
class Orco inherits Personaje{
  override method potencialOfensivo() = fuerza*11+rol.potencialOfensivo()
  override method esGroso() =  rol.esGroso()
  override method esInteligente() = false 
}

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
  const cantMaxDeHabitantes
  const tamaño
  
}

class Ciudad inherits Localidad{}

object guerrero {
  method extra() = 100 
  method esGroso(unPersonaje) = unPersonaje.fuerza() > 50 
}

object cazador { //deberia ser una clase, orque al oner una mascota distitn a el objeto cambia
  var mascota = null
  method extra() = mascota.potencialOfensivo() 
  method esGroso() = mascota.esLongeva() 

  method mascota(unaMascota){
    mascota = unaMascota
  }
}

object brujo {
  method extra() {}
  method esGroso() = true 
}



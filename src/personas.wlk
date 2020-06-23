import marcas.*
import jarras.*
import carpas.*

class Persona
{
	var property peso = 0
	var property leGustaMusicaTradicional = true
	var property nivelDeAguante = 0
	var property jarrasCompradas = []
	
	method nacionalidad()
	
	method comprarJarra(unaJarra)
	{
		jarrasCompradas.add(unaJarra)
	}
	
	method alcoholConsumido()
	{
		return jarrasCompradas.sum({jarra => jarra.contenidoDeAlcohol()})
	}
	
	method estaEbrio()
	{
		return (self.alcoholConsumido() * self.peso()) > self.nivelDeAguante()
	}
	
	method leGusta(unaBirra)
	{
		return true
	}
	method quiereEntrar(unaCarpa)
	{
		return self.leGusta(unaCarpa.marcaAVender()) and 
		(self.leGustaMusicaTradicional() == unaCarpa.hayBanda())
	}
	
	method puedeEntrar(unaCarpa)
	{
		return self.quiereEntrar(unaCarpa) and unaCarpa.dejaIngresar(self)	
	}
	
	method esEbrioEmpedernido()
	{
		return jarrasCompradas.all({jarra => jarra.capacidad() >= 1})
	}
	
	method esPatriota() 
	{
		return jarrasCompradas.all({jarra => jarra.paisDeOrigen() == self.nacionalidad() } )
	}
}

class Belga inherits Persona
{
	override method nacionalidad()
	{
		return "Belgica"
	}
	override method leGusta(unaBirra)
	{
		return unaBirra.lupulo() > 4
	}
}

class Checo inherits Persona
{
	override method nacionalidad()
	{
		return "Republica Checa"
	}
	override method leGusta(unaBirra)
	{
		return unaBirra.graduacionAlcoholica() > 0.08
	}
}

class Aleman inherits Persona
{
	override method nacionalidad()
	{
		return "Alemania"
	}
	override method quiereEntrar(unaCarpa)
	{
		return super(unaCarpa) and unaCarpa.cantidadDePersonasDentro().even()
	}
}

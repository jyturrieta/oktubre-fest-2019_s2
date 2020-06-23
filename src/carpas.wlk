import marcas.*
import jarras.*
import personas.*

class Carpa
{
	var property personasDentro = #{}
	var property limite = 0
	var property hayBanda = false
	var property marcaAVender
	
	method cantidadDePersonasDentro()
	{
		return personasDentro.size()
	}
	
	method dejaIngresar(unaPersona)
	{
		return self.cantidadDePersonasDentro() < self.limite() and not unaPersona.estaEbrio()
	}
	
	method hacerQueIngrese(unaPersona)
	{
		if (unaPersona.puedeEntrar(self))
		{
			personasDentro.add(unaPersona)	
		}
		else
        {
            self.error("Esta persona no puede ingresar")
        }
	}
		
	method cantidadDeEbriosEmpedernidos()
	{
		return personasDentro.count({persona => persona.esEbrioEmpedernido()})
	}
	
	method servirBirraA(unaPersona, unaCapacidad)
	{
		const jarra = new Jarra(capacidad = unaCapacidad, marca = self.marcaAVender())
		if (personasDentro.contains(unaPersona)) 
		{
			unaPersona.comprarJarra(jarra)
		}
		else 
		{ 
			self.error("La persona no se encuentra dentro de la carpa")
		} 
	}
}

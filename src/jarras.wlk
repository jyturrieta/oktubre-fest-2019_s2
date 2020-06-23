import marcas.*

class Jarra
{
	var property capacidad = 0
	var property marca
	
	method contenidoDeAlcohol()
	{
		return self.capacidad() * marca.graduacionAlcoholica() 
	}
	
	method paisDeOrigen()
	{
		return marca.pais()
	}
}

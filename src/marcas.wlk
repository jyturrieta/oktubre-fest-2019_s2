class Cerveza 
{ 
	var property lupulo = 0
	var property pais 
	
}

class Rubia inherits Cerveza
{
	var property graduacionAlcoholica = 0
}

object graduacionReglamentaria
{
	var property graduacion = 0
}

class Negra inherits Cerveza
{
	
	method graduacionAlcoholica()
	{
		return graduacionReglamentaria.graduacion().min(self.lupulo() * 2)
	}
}

class Roja inherits Negra
{
	override method graduacionAlcoholica()
	{
		return super() * 1.25
	}
}

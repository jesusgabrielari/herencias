module Habilidades
    module Volador
        def volar
            'Estoy volandooooo!'
        end
        def aterrizar
            'Estoy cansado de volar, voy a aterrizar'
        end
    end

    module Nadador
        def nadar
            'Estoy nadando!'
        end
        def sumergir
            'glu glub glub glu'
        end
    end

    module Caminante
        def caminar
            'Puedo caminar!'
        end
    end
    
end
    
module Alimentacion
    module Herbivoro
        def comer
            'Puedo comer plantas!'
        end
    end
    
    module Carnivoro
        def comer
            'Puedo comer carne!'
        end
    end

    module Omnivoro
        def comer
            'Puedo comer de tooooo!'
        end
    end

end

class Animal
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

class Bird < Animal
end

class Mammal < Animal
end

class Insect < Animal
end

class Penguin < Bird
    include Habilidades::Nadador, Habilidades::Caminante, Alimentacion::Carnivoro
end

class Pidgeon < Bird
    include Habilidades::Volador, Alimentacion::Omnivoro
end

class Duck < Bird
    include Habilidades::Volador, Alimentacion::Herbivoro
end

class Dog < Mammal
    include Habilidades::Caminante, Alimentacion::Carnivoro
end

class Cat < Mammal
    include Habilidades::Caminante, Alimentacion::Carnivoro
end

class Cow < Mammal
    include Habilidades::Caminante, Alimentacion::Herbivoro
end

class Fly < Insect
    include Habilidades::Volador, Alimentacion::Omnivoro
end

class Butterfly < Insect
    include Habilidades::Volador, Alimentacion::Herbivoro
end

class Bee < Insect
    include Habilidades::Volador, Alimentacion::Herbivoro
end

moscardon = Pidgeon.new("Yakuza")
puts moscardon.comer
--Variável global. (Deve ser evitado)
 vidas = 6
 vidas = 8
 print (vidas) 
 print ("O valor de vidas:" .. vidas)
---------------------------
-- Variáveis locais (só é lida dentro do script)
local pontos = 10
print (pontos)
print ("O valor de pontos:" .. pontos)


-- Soma
local laranjas = 10

laranjas = laranjas + 5
print (laranjas)

local bananas = 5

-- Soma entre variáveis
local cesta = 0
cesta = laranjas + bananas
print ("A soma entre as variáveis laranjas e bananas é:" .. cesta)



-- Subtração

cesta = laranjas - bananas
bananas = bananas - 1


-- Multiplicação

local carro = 8
carro= carro * 2
print ("Quantidade de carros: " .. carro)

-- Dividindo 

local carro = 9
carro = carro - 6
print ("A subtraçao entre as variáveis carro é: " .. carro)

-- Divisão
local gato = 6
gato = gato / 2
print("A divisao final é:" .. gato)

local arvore = 97.5
arvore = arvore / 4
print ("Divisao final é:" .. arvore)

// Nome dos participantes: 

programa 
{ 
	inclua biblioteca Util        --> u
	inclua biblioteca Matematica  --> mat
	
	funcao inicio () 
	{ 
		const real TAM_JANELA     = 1.50
		const real TAM_PORTA      = 2.10
		const real PRECO_PISCINA  = 25000.00
		
    	cadeia nome_usuario       = "Usuario desconhecido"
		inteiro un_janelas        = 0
		inteiro un_portas         = 0
		real area_janelas         = 0.00
		real area_portas          = 0.00 
		real area_vaos            = 0.00
		real area_paredes         = 0.00  
		real preco_tinta          = 0.00  
		real area_piso            = 0.00  
		real preco_piso           = 0.00   
		real litros_tinta         = 0.00   
		real orcamento_tinta      = 0.00       
		real orcamento_piso       = 0.00    
		real orcamento_piscina    = 0.00         
		real orcamento_total      = 0.00
		caracter tem_piscina      = 'N'
		
		
	//Temporizador
		inteiro tempo_inicial = 0
		inteiro tempo_atual   = 0
		inteiro tempo_total   = 0
		
		logico mensagem1 = falso
		logico mensagem2 = falso
		logico mensagem3 = falso
		
        //Coleta de informações--------------------------------------------------------------------------

		escreva("Olá, qual o seu nome? ")
		leia(nome_usuario)
	    limpa()
		
		escreva(nome_usuario,", boas-vindas ao sistema de obras. Para melhor lhe auxiliar, precisaremos das seguintes informações:")
		
		escreva("\n", nome_usuario,", quantas janelas existem no projeto? ")
		leia(un_janelas)
		
		escreva("\n", nome_usuario,", quantas portas existem no projeto? ")
		leia(un_portas)
		
		escreva("\n", nome_usuario,", qual o tamanho total das paredes existentes no projeto (m²)? ")
		leia(area_paredes)
		
		escreva("\n", nome_usuario,", qual o preço do litro da tinta que será utilizada para pintar as paredes? R$")
		leia(preco_tinta)
		
		escreva("\n", nome_usuario,", qual o tamanho da área em m² que será colocada de piso? ")
		leia(area_piso)
		
		escreva("\n", nome_usuario,", qual o preço do m² do piso? R$")
		leia(preco_piso)
		
		escreva("\n",nome_usuario, ", deseja adicionar piscina ao projeto? (S/N) ")
		leia(tem_piscina)
		
		limpa()
		
		//Testando timer do portugol-----------------------------------------------------------------------
		
		tempo_inicial = u.tempo_decorrido()		

		faca
		{
			tempo_atual = u.tempo_decorrido()

			tempo_total = tempo_atual - tempo_inicial

			se (tempo_total >= 1000 e mensagem1 == falso) // Exibe uma mensagem após 1 segundo
			{
				escreva("Calculando as áreas.\n")
				mensagem1 = verdadeiro
			}
			senao se (tempo_total >= 5000 e mensagem2 == falso) // Exibe uma mensagem após 5 segundos
			{   
			    limpa()
				escreva("Aplicando produtos..\n")
				mensagem2 = verdadeiro
			}
			senao se (tempo_total >= 7000 e mensagem3 == falso) // Exibe uma mensagem após 7 segundos
			{
			    limpa()
				escreva("Verificando valores...\n")
				mensagem3 = verdadeiro
			}			
		}	
		enquanto (tempo_total < 10000) // 	Finaliza o programa após 10 segundos

		limpa()
		
		/*
		 * Cálculo dos valores a serem pagos. O cálculo é feito multiplicando
		 * as áreas informadas, pelo preço de cada produto--------------------------------------------------------
		 */	
		 
		orcamento_piso = (area_piso * preco_piso) * 1.1
		
		area_janelas = TAM_JANELA * un_janelas
		area_portas = TAM_PORTA * un_portas
		area_vaos = area_janelas + area_portas
		
		se(tem_piscina == 'S' ou tem_piscina == 's')
		    {
		        orcamento_piscina = PRECO_PISCINA
		    }
		
	    // Apresentando resultados -------------------------------------------------------------------------------
	    
		se (area_vaos < area_paredes)
		{
		    litros_tinta = area_paredes - (area_janelas + area_portas)
		    orcamento_tinta = litros_tinta * preco_tinta
		    
    		escreva("====================Orçamento==================\n")
		    escreva("Piso (+10% peças extras) : R$", mat.arredondar(orcamento_piso, 2), "\n")
		    escreva("Litros de tinta : ", litros_tinta, "\n")
		    escreva("Tinta : R$", mat.arredondar(orcamento_tinta, 2), "\n")
		    se(tem_piscina == 'S' ou tem_piscina == 's')
		    {
		        escreva("Piscina: R$", mat.arredondar(orcamento_piscina, 2), "\n")
		    }
		    escreva("===============================================\n")
		    
		    orcamento_total = orcamento_piso + orcamento_tinta + orcamento_piscina
		    
		    escreva("Total gasto na obra:  R$ ", mat.arredondar(orcamento_total, 2), "\n")
		}
		senao
		{
	    	escreva("O espaço ocupado pelas portas e janelas não pode ser maior ou igual ao tamanho total das paredes.")
		}
	} 
}
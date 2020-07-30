      $set sourceformat"free"
      *>----Divisão de identificação do programa
       identification Division.
       program-id. "desafioloteria2".
       author. "Julia Krüger".
       installation. "PC".
       date-written. 21/07/2020.
       date-compiled. 21/07/2020.

      *>----Divisão para configuração do ambiente
       environment division.
       configuration section.
       special-names. decimal-point is comma.

      *>----Declaração dos recursos externos
       input-output section.
       file-control.
       i-o-control.


      *>----Declaração de variáveis
       data division.

      *>----Variáveis de arquivos
       file section.

      *>----Variáveis de trabalho
       working-storage section.

       77 ws-fim-programa                          pic x(01).
       77 ws-semente                               pic 9(08).
       77 ws-semente2                              pic 9(10).
       77 ws-sorteio                               pic x(04).
       77 ws-ind                                   pic 9(10).
       77 ws-num-aleatorio                         pic 9(10) value 0.
       77 ws-num_random                            pic 9(02).
       77 ws-num-sorteado-1                        pic 9(02).
       77 ws-num-sorteado-2                        pic 9(02).
       77 ws-num-sorteado-3                        pic 9(02).
       77 ws-num-sorteado-4                        pic 9(02).
       77 ws-num-sorteado-5                        pic 9(02).
       77 ws-num-sorteado-6                        pic 9(02).
       77 ws-num-sorteado-7                        pic 9(02).
       77 ws-num-sorteado-8                        pic 9(02).
       77 ws-num-sorteado-9                        pic 9(02).
       77 ws-num-sorteado-10                       pic 9(02).
       77 ws-condicao                              pic x(01) value "S".


      *>----Variáveis para comunicação entre programas
       linkage section.

       77 lk-quantidade                            pic 9(02).
       77 lk-num-1                                 pic 9(02).
       77 lk-num-2                                 pic 9(02).
       77 lk-num-3                                 pic 9(02).
       77 lk-num-4                                 pic 9(02).
       77 lk-num-5                                 pic 9(02).
       77 lk-num-6                                 pic 9(02).
       77 lk-num-7                                 pic 9(02).
       77 lk-num-8                                 pic 9(02).
       77 lk-num-9                                 pic 9(02).
       77 lk-num-10                                pic 9(02).
       77 lk-msn                                   pic x(25).
       77 lk-ind-acerto                            pic 9(01).
       77 lk-ind-erro                              pic 9(01).
       77 lk-ind-sorteio                           pic 9(10).

      *>----Declaração de tela
       screen section.

      *>Declaração do corpo do programa
       procedure division using lk-quantidade
                                lk-num-1
                                lk-num-2
                                lk-num-3
                                lk-num-4
                                lk-num-5
                                lk-num-6
                                lk-num-7
                                lk-num-8
                                lk-num-9
                                lk-num-10
                                lk-msn
                                lk-ind-acerto
                                lk-ind-erro
                                lk-ind-sorteio.


           perform processamento.
           perform finaliza.

       processamento section.
      *> sorteando 6 números
           perform sorteio-6-numeros
      *> mostrando na tela os números sorteados
           display "Numeros sorteados: "
           display ws-num-sorteado-1 " - " ws-num-sorteado-2 " - " ws-num-sorteado-3 " - " ws-num-sorteado-4
                   " - " ws-num-sorteado-5 " - " ws-num-sorteado-6
      *> comparando os números sorteados com os números apostados pelo usuário
           perform comparar
           .
       processamento-exit.
           exit.

      *>------------------------------------------------------------------------
      *> Sorteio de um número
      *>------------------------------------------------------------------------
       sorteio section.
           move spaces to ws-sorteio
           perform until ws-sorteio = "sair"
      *> esquema para tentar pegar números que não sejam seguidos (não da muito certo), mas faz sortear mais rápido
               accept ws-semente from time
               accept ws-ind from time
               add 76 to ws-ind
               add ws-ind to ws-num-aleatorio
               compute ws-semente2 = ws-semente * ws-num-aleatorio
               compute ws-num_random = function random(ws-semente2) * 60
      *> condição para o número sorteado não ser 0
               if ws-num_random = 0 then
                   move space to ws-sorteio
               else
                   move "sair" to ws-sorteio
               end-if
           end-perform
           .
       sorteio-exit.
           exit.

      *>------------------------------------------------------------------------
      *> Sorteio dos 6 números (comparação com o anterior)
      *>------------------------------------------------------------------------
       sorteio-6-numeros section.
      *> 1° número
           perform sorteio
           move ws-num_random to ws-num-sorteado-1
      *> 2° número
           perform sorteio
           move ws-num_random to ws-num-sorteado-2
           move "S" to ws-condicao
           perform until ws-condicao = "N"
      *> comparando se o número sorteado é igual ao anterior
               if ws-num-sorteado-2 = ws-num-sorteado-1 then
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-2
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 3° número
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-3
           perform until ws-condicao = "N"
               if ws-num-sorteado-3 = ws-num-sorteado-1 or
               ws-num-sorteado-3 = ws-num-sorteado-2 then
      *> comparando se o número sorteado é igual aos anteriores
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-3
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 4° número
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-4
           perform until ws-condicao = "N"
               if ws-num-sorteado-4 = ws-num-sorteado-1 or
               ws-num-sorteado-4 = ws-num-sorteado-2 or
               ws-num-sorteado-4 = ws-num-sorteado-3 then
      *> comparando se o número sorteado é igual aos anteriores
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-4
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 5° número
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-5
           perform until ws-condicao = "N"
               if ws-num-sorteado-5 = ws-num-sorteado-1 or
               ws-num-sorteado-5 = ws-num-sorteado-2 or
               ws-num-sorteado-5 = ws-num-sorteado-3 or
               ws-num-sorteado-5 = ws-num-sorteado-4 then
      *> comparando se o número sorteado é igual aos anteriores
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-5
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 6° número
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-6
           perform until ws-condicao = "N"
               if ws-num-sorteado-6 = ws-num-sorteado-1 or
               ws-num-sorteado-6 = ws-num-sorteado-2 or
               ws-num-sorteado-6 = ws-num-sorteado-3 or
               ws-num-sorteado-6 = ws-num-sorteado-4 or
               ws-num-sorteado-6 = ws-num-sorteado-5 then
      *> comparando se o número sorteado é igual aos anteriores
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-6
               else
                   move "N" to ws-condicao
               end-if
           end-perform
           .
       sorteio-6-numeros-exit.
           exit.

      *>------------------------------------------------------------------------
      *> Comparando os números sorteados com os números apostados pelo usuário
      *>------------------------------------------------------------------------
       comparar section.
      *> 1° número
           if lk-num-1 = ws-num-sorteado-1 or
           lk-num-1 = ws-num-sorteado-2 or
           lk-num-1 = ws-num-sorteado-3 or
           lk-num-1 = ws-num-sorteado-4 or
           lk-num-1 = ws-num-sorteado-5 or
           lk-num-1 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if
      *> 2° número
           if lk-num-2 = ws-num-sorteado-1 or
           lk-num-2 = ws-num-sorteado-2 or
           lk-num-2 = ws-num-sorteado-3 or
           lk-num-2 = ws-num-sorteado-4 or
           lk-num-2 = ws-num-sorteado-5 or
           lk-num-2 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if
      *> 3° número
           if lk-num-3 = ws-num-sorteado-1 or
           lk-num-3 = ws-num-sorteado-2 or
           lk-num-3 = ws-num-sorteado-3 or
           lk-num-3 = ws-num-sorteado-4 or
           lk-num-3 = ws-num-sorteado-5 or
           lk-num-3 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if
      *> 4° número
           if lk-num-4 = ws-num-sorteado-1 or
           lk-num-4 = ws-num-sorteado-2 or
           lk-num-4 = ws-num-sorteado-3 or
           lk-num-4 = ws-num-sorteado-4 or
           lk-num-4 = ws-num-sorteado-5 or
           lk-num-4 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if
      *> 5° número
           if lk-num-5 = ws-num-sorteado-1 or
           lk-num-5 = ws-num-sorteado-2 or
           lk-num-5 = ws-num-sorteado-3 or
           lk-num-5 = ws-num-sorteado-4 or
           lk-num-5 = ws-num-sorteado-5 or
           lk-num-5 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if

      *>        if lk-ind-erro > 4 then
      *>            exit program
      *>        end-if
      *> 6° número
           if lk-num-6 = ws-num-sorteado-1 or
           lk-num-6 = ws-num-sorteado-2 or
           lk-num-6 = ws-num-sorteado-3 or
           lk-num-6 = ws-num-sorteado-4 or
           lk-num-6 = ws-num-sorteado-5 or
           lk-num-6 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if

      *>        if lk-ind-erro > 4 then
      *>            exit program
      *>        end-if

      *>        if lk-ind-acerto = 6 then
      *>            exit program
      *>        end-if

      *> se a quantidade de números apostados pelo usuário for 7
           if lk-quantidade >= 7 then
      *> 7° número
               if lk-num-7 = ws-num-sorteado-1 or
               lk-num-7 = ws-num-sorteado-2 or
               lk-num-7 = ws-num-sorteado-3 or
               lk-num-7 = ws-num-sorteado-4 or
               lk-num-7 = ws-num-sorteado-5 or
               lk-num-7 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if

      *>        if lk-ind-erro > 4 then
      *>            exit program
      *>        end-if

      *>        if lk-ind-acerto = 6 then
      *>            exit program
      *>        end-if

      *> se a quantidade de números apostados pelo usuário for 8
           if lk-quantidade >= 8 then
      *> 8° número
               if lk-num-8 = ws-num-sorteado-1 or
               lk-num-8 = ws-num-sorteado-2 or
               lk-num-8 = ws-num-sorteado-3 or
               lk-num-8 = ws-num-sorteado-4 or
               lk-num-8 = ws-num-sorteado-5 or
               lk-num-8 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if

      *>        if lk-ind-erro > 4 then
      *>            exit program
      *>        end-if

      *>        if lk-ind-acerto = 6 then
      *>            exit program
      *>        end-if

      *> se a quantidade de números apostados pelo usuário for 9
           if lk-quantidade >= 9 then
      *> 9° número
               if lk-num-9 = ws-num-sorteado-1 or
               lk-num-9 = ws-num-sorteado-2 or
               lk-num-9 = ws-num-sorteado-3 or
               lk-num-9 = ws-num-sorteado-4 or
               lk-num-9 = ws-num-sorteado-5 or
               lk-num-9 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if

      *>        if lk-ind-erro > 4 then
      *>            exit program
      *>        end-if

      *>        if lk-ind-acerto = 6 then
      *>            exit program
      *>        end-if

      *> se a quantidade de números apostados pelo usuário for 10
           if lk-quantidade >= 10 then
      *> 10° número
               if lk-num-10 = ws-num-sorteado-1 or
               lk-num-10 = ws-num-sorteado-2 or
               lk-num-10 = ws-num-sorteado-3 or
               lk-num-10 = ws-num-sorteado-4 or
               lk-num-10 = ws-num-sorteado-5 or
               lk-num-10 = ws-num-sorteado-6 then
               add 1 to lk-ind-acerto
           else
               add 1 to lk-ind-erro
           end-if
           .
       comparar-exit.
           exit.

      *>------------------------------------------------------------------------
      *> Saindo do programa 2 e voltando para o programa 1
      *>------------------------------------------------------------------------
       finaliza section.
           exit program
           .
       finaliza-exit.
           exit.





      $set sourceformat"free"
      *>----Divis�o de identifica��o do programa
       identification Division.
       program-id. "desafioloteria2".
       author. "Julia Kr�ger".
       installation. "PC".
       date-written. 21/07/2020.
       date-compiled. 21/07/2020.

      *>----Divis�o para configura��o do ambiente
       environment division.
       configuration section.
       special-names. decimal-point is comma.

      *>----Declara��o dos recursos externos
       input-output section.
       file-control.
       i-o-control.


      *>----Declara��o de vari�veis
       data division.

      *>----Vari�veis de arquivos
       file section.

      *>----Vari�veis de trabalho
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


      *>----Vari�veis para comunica��o entre programas
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

      *>----Declara��o de tela
       screen section.

      *>Declara��o do corpo do programa
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
      *> sorteando 6 n�meros
           perform sorteio-6-numeros
      *> mostrando na tela os n�meros sorteados
           display "Numeros sorteados: "
           display ws-num-sorteado-1 " - " ws-num-sorteado-2 " - " ws-num-sorteado-3 " - " ws-num-sorteado-4
                   " - " ws-num-sorteado-5 " - " ws-num-sorteado-6
      *> comparando os n�meros sorteados com os n�meros apostados pelo usu�rio
           perform comparar
           .
       processamento-exit.
           exit.

      *>------------------------------------------------------------------------
      *> Sorteio de um n�mero
      *>------------------------------------------------------------------------
       sorteio section.
           move spaces to ws-sorteio
           perform until ws-sorteio = "sair"
      *> esquema para tentar pegar n�meros que n�o sejam seguidos (n�o da muito certo), mas faz sortear mais r�pido
               accept ws-semente from time
               accept ws-ind from time
               add 76 to ws-ind
               add ws-ind to ws-num-aleatorio
               compute ws-semente2 = ws-semente * ws-num-aleatorio
               compute ws-num_random = function random(ws-semente2) * 60
      *> condi��o para o n�mero sorteado n�o ser 0
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
      *> Sorteio dos 6 n�meros (compara��o com o anterior)
      *>------------------------------------------------------------------------
       sorteio-6-numeros section.
      *> 1� n�mero
           perform sorteio
           move ws-num_random to ws-num-sorteado-1
      *> 2� n�mero
           perform sorteio
           move ws-num_random to ws-num-sorteado-2
           move "S" to ws-condicao
           perform until ws-condicao = "N"
      *> comparando se o n�mero sorteado � igual ao anterior
               if ws-num-sorteado-2 = ws-num-sorteado-1 then
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-2
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 3� n�mero
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-3
           perform until ws-condicao = "N"
               if ws-num-sorteado-3 = ws-num-sorteado-1 or
               ws-num-sorteado-3 = ws-num-sorteado-2 then
      *> comparando se o n�mero sorteado � igual aos anteriores
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-3
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 4� n�mero
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-4
           perform until ws-condicao = "N"
               if ws-num-sorteado-4 = ws-num-sorteado-1 or
               ws-num-sorteado-4 = ws-num-sorteado-2 or
               ws-num-sorteado-4 = ws-num-sorteado-3 then
      *> comparando se o n�mero sorteado � igual aos anteriores
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-4
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 5� n�mero
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-5
           perform until ws-condicao = "N"
               if ws-num-sorteado-5 = ws-num-sorteado-1 or
               ws-num-sorteado-5 = ws-num-sorteado-2 or
               ws-num-sorteado-5 = ws-num-sorteado-3 or
               ws-num-sorteado-5 = ws-num-sorteado-4 then
      *> comparando se o n�mero sorteado � igual aos anteriores
                   perform sorteio
                   move ws-num_random to ws-num-sorteado-5
               else
                   move "N" to ws-condicao
               end-if
           end-perform
      *> 6� n�mero
           move "S" to ws-condicao
           perform sorteio
           move ws-num_random to ws-num-sorteado-6
           perform until ws-condicao = "N"
               if ws-num-sorteado-6 = ws-num-sorteado-1 or
               ws-num-sorteado-6 = ws-num-sorteado-2 or
               ws-num-sorteado-6 = ws-num-sorteado-3 or
               ws-num-sorteado-6 = ws-num-sorteado-4 or
               ws-num-sorteado-6 = ws-num-sorteado-5 then
      *> comparando se o n�mero sorteado � igual aos anteriores
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
      *> Comparando os n�meros sorteados com os n�meros apostados pelo usu�rio
      *>------------------------------------------------------------------------
       comparar section.
      *> 1� n�mero
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
      *> 2� n�mero
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
      *> 3� n�mero
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
      *> 4� n�mero
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
      *> 5� n�mero
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
      *> 6� n�mero
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

      *> se a quantidade de n�meros apostados pelo usu�rio for 7
           if lk-quantidade >= 7 then
      *> 7� n�mero
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

      *> se a quantidade de n�meros apostados pelo usu�rio for 8
           if lk-quantidade >= 8 then
      *> 8� n�mero
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

      *> se a quantidade de n�meros apostados pelo usu�rio for 9
           if lk-quantidade >= 9 then
      *> 9� n�mero
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

      *> se a quantidade de n�meros apostados pelo usu�rio for 10
           if lk-quantidade >= 10 then
      *> 10� n�mero
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





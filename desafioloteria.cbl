      $set sourceformat"free"
      *>----Divis�o de identifica��o do programa
       identification Division.
       program-id. "desafioloteria".
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
       77 ws-quantidade                            pic 9(02).
       77 ws-fim_programa                          pic x(01).
       77 ws-aux                                   pic x(01).
       01 ws-numeros.
           05 ws-num-1                             pic 9(02).
           05 ws-num-2                             pic 9(02).
           05 ws-num-3                             pic 9(02).
           05 ws-num-4                             pic 9(02).
           05 ws-num-5                             pic 9(02).
           05 ws-num-6                             pic 9(02).
           05 ws-num-7                             pic 9(02).
           05 ws-num-8                             pic 9(02).
           05 ws-num-9                             pic 9(02).
           05 ws-num-10                            pic 9(02).
       77 ws-msn                                   pic x(25).
       77 ws-msn-2                                 pic x(80).
       77 ws-ind-acerto                            pic 9(01).
       77 ws-ind-erro                              pic 9(01).
       77 ws-ind-sorteio                           pic 9(10).
       77 ws-num-repetido                          pic x(01).
       01 ws-tempo1.
           05 ws-hora1                             pic 9(02).
           05 ws-minuto1                           pic 9(02).
           05 ws-segundo1                          pic 9(02).
           05 ws-centesimo1                        pic 9(02).
       01 ws-tempo2.
           05 ws-hora2                             pic 9(02).
           05 ws-minuto2                           pic 9(02).
           05 ws-segundo2                          pic 9(02).
           05 ws-centesimo2                        pic 9(02).
       01 ws-tempofinal.
           05 ws-hora                              pic 9(02).
           05 ws-minuto                            pic 9(02).
           05 ws-segundo                           pic 9(02).
           05 ws-centesimo                         pic 9(02).




      *>----Vari�veis para comunica��o entre prograpic 9(02).mas
       linkage section.


      *>----Declara��o de tela
       screen section.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
      *> tela para saber quantos n�meros o usu�rio quer apostar
       01 sc-tela.
           05 blank screen.
           05 line 01 col 01 value "            Sorteio de Loteria                                                  "
           foreground-color 12.
           05 line 03 col 01 value "===========================================[ ]=                                 ".
           05 line 04 col 01 value "=                                             =                                 ".
           05 line 05 col 01 value "= Quantos numeros voce deseja apostar (6-10)? =                                 ".
           05 line 06 col 01 value "=   [  ]                                      =                                 ".
           05 line 07 col 01 value "=                                             =                                 ".
           05 line 08 col 01 value "===============================================                                 ".

           05 sc-fim-programa   line 03 col 45 pic x(01)
           using ws-fim_programa foreground-color 12.
           05 sc-quantidade     line 06 col 06 pic 9(2)
           using ws-quantidade foreground-color 12.
           05 sc-msn            line 02 col 03 pic x(80)
           from ws-msn foreground-color 11.

      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
      *> tela para aposta de 6 n�meros
       01 sc-tela-6.
           05 blank screen.
           05 line 01 col 01 value "            Sorteio de Loteria                                                  "
           foreground-color 12.
           05 line 03 col 01 value "===============================================                                 ".
           05 line 04 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 05 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 06 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 07 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 08 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 09 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 10 col 01 value "=                                             =                                 ".
           05 line 11 col 01 value "===============================================                                 ".

           05 sc-num-1          line 04 col 32 pic 9(2)
           using ws-num-1 foreground-color 12.
           05 sc-num-2          line 05 col 32 pic 9(2)
           using ws-num-2 foreground-color 12.
           05 sc-num-3          line 06 col 32 pic 9(2)
           using ws-num-3 foreground-color 12.
           05 sc-num-4          line 07 col 32 pic 9(2)
           using ws-num-4 foreground-color 12.
           05 sc-num-5          line 08 col 32 pic 9(2)
           using ws-num-5 foreground-color 12.
           05 sc-num-6          line 09 col 32 pic 9(2)
           using ws-num-6 foreground-color 12.
           05 sc-msn-2          line 02 col 03 pic x(80)
           from ws-msn-2 foreground-color 11.
           05 sc-aux            line 02 col 01 pic x(01)
           using ws-aux.

      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
      *> tela para aposta de 7 n�meros
       01 sc-tela-7.
           05 blank screen.
           05 line 01 col 01 value "            Sorteio de Loteria                                                  "
           foreground-color 12.
           05 line 03 col 01 value "===============================================                                 ".
           05 line 04 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 05 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 06 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 07 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 08 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 09 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 10 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 11 col 01 value "=                                             =                                 ".
           05 line 12 col 01 value "===============================================                                 ".

           05 sc-num-1          line 04 col 32 pic 9(2)
           using ws-num-1 foreground-color 12.
           05 sc-num-2          line 05 col 32 pic 9(2)
           using ws-num-2 foreground-color 12.
           05 sc-num-3          line 06 col 32 pic 9(2)
           using ws-num-3 foreground-color 12.
           05 sc-num-4          line 07 col 32 pic 9(2)
           using ws-num-4 foreground-color 12.
           05 sc-num-5          line 08 col 32 pic 9(2)
           using ws-num-5 foreground-color 12.
           05 sc-num-6          line 09 col 32 pic 9(2)
           using ws-num-6 foreground-color 12.
           05 sc-num-7          line 10 col 32 pic 9(2)
           using ws-num-7 foreground-color 12.
           05 sc-msn-2          line 02 col 03 pic x(80)
           from ws-msn-2 foreground-color 11.
           05 sc-aux            line 02 col 01 pic x(01)
           using ws-aux.


      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
      *> tela para aposta de 8 n�meros
       01 sc-tela-8.
           05 blank screen.
           05 line 01 col 01 value "            Sorteio de Loteria                                                  "
           foreground-color 12.
           05 line 03 col 01 value "===============================================                                 ".
           05 line 04 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 05 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 06 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 07 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 08 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 09 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 10 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 11 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 12 col 01 value "=                                             =                                 ".
           05 line 13 col 01 value "===============================================                                 ".

           05 sc-num-1          line 04 col 32 pic 9(2)
           using ws-num-1 foreground-color 12.
           05 sc-num-2          line 05 col 32 pic 9(2)
           using ws-num-2 foreground-color 12.
           05 sc-num-3          line 06 col 32 pic 9(2)
           using ws-num-3 foreground-color 12.
           05 sc-num-4          line 07 col 32 pic 9(2)
           using ws-num-4 foreground-color 12.
           05 sc-num-5          line 08 col 32 pic 9(2)
           using ws-num-5 foreground-color 12.
           05 sc-num-6          line 09 col 32 pic 9(2)
           using ws-num-6 foreground-color 12.
           05 sc-num-7          line 10 col 32 pic 9(2)
           using ws-num-7 foreground-color 12.
           05 sc-num-8          line 11 col 32 pic 9(2)
           using ws-num-8 foreground-color 12.
           05 sc-msn-2          line 02 col 03 pic x(80)
           from ws-msn-2 foreground-color 11.
           05 sc-aux            line 02 col 01 pic x(01)
           using ws-aux.


      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
      *> tela para aposta de 9 n�meros
       01 sc-tela-9.
           05 blank screen.
           05 line 01 col 01 value "            Sorteio de Loteria                                                  "
           foreground-color 12.
           05 line 03 col 01 value "===============================================                                 ".
           05 line 04 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 05 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 06 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 07 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 08 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 09 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 10 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 11 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 12 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 13 col 01 value "=                                             =                                 ".
           05 line 14 col 01 value "===============================================                                 ".

           05 sc-num-1          line 04 col 32 pic 9(2)
           using ws-num-1 foreground-color 12.
           05 sc-num-2          line 05 col 32 pic 9(2)
           using ws-num-2 foreground-color 12.
           05 sc-num-3          line 06 col 32 pic 9(2)
           using ws-num-3 foreground-color 12.
           05 sc-num-4          line 07 col 32 pic 9(2)
           using ws-num-4 foreground-color 12.
           05 sc-num-5          line 08 col 32 pic 9(2)
           using ws-num-5 foreground-color 12.
           05 sc-num-6          line 09 col 32 pic 9(2)
           using ws-num-6 foreground-color 12.
           05 sc-num-7          line 10 col 32 pic 9(2)
           using ws-num-7 foreground-color 12.
           05 sc-num-8          line 11 col 32 pic 9(2)
           using ws-num-8 foreground-color 12.
           05 sc-num-9          line 12 col 32 pic 9(2)
           using ws-num-9 foreground-color 12.
           05 sc-msn-2          line 02 col 03 pic x(80)
           from ws-msn-2 foreground-color 11.
           05 sc-aux            line 02 col 01 pic x(01)
           using ws-aux.


      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
      *> tela para aposta de 10 n�meros
       01 sc-tela-10.
           05 blank screen.
           05 line 01 col 01 value "            Sorteio de Loteria                                                  "
           foreground-color 12.
           05 line 03 col 01 value "===============================================                                 ".
           05 line 04 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 05 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 06 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 07 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 08 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 09 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 10 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 11 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 12 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 13 col 01 value "=   Insira o primeiro numero: [  ]            =                                 ".
           05 line 14 col 01 value "=                                             =                                 ".
           05 line 15 col 01 value "===============================================                                 ".

           05 sc-num-1          line 04 col 32 pic 9(2)
           using ws-num-1 foreground-color 12.
           05 sc-num-2          line 05 col 32 pic 9(2)
           using ws-num-2 foreground-color 12.
           05 sc-num-3          line 06 col 32 pic 9(2)
           using ws-num-3 foreground-color 12.
           05 sc-num-4          line 07 col 32 pic 9(2)
           using ws-num-4 foreground-color 12.
           05 sc-num-5          line 08 col 32 pic 9(2)
           using ws-num-5 foreground-color 12.
           05 sc-num-6          line 09 col 32 pic 9(2)
           using ws-num-6 foreground-color 12.
           05 sc-num-7          line 10 col 32 pic 9(2)
           using ws-num-7 foreground-color 12.
           05 sc-num-8          line 11 col 32 pic 9(2)
           using ws-num-8 foreground-color 12.
           05 sc-num-9          line 12 col 32 pic 9(2)
           using ws-num-9 foreground-color 12.
           05 sc-num-10         line 13 col 32 pic 9(2)
           using ws-num-10 foreground-color 12.
           05 sc-msn-2          line 02 col 03 pic x(80)
           from ws-msn-2 foreground-color 11.
           05 sc-aux            line 02 col 01 pic x(01)
           using ws-aux.


      *>Declara��o do corpo do programa
       procedure division.

           perform inicializa.
           perform processamento.
           perform finaliza.

      *>------------------------------------------------------------------------
      *> Zerando as vari�veis
      *>------------------------------------------------------------------------
       inicializa section.
           move space to ws-fim_programa
           move zero to ws-quantidade
           move zero to ws-num-1
           move zero to ws-num-2
           move zero to ws-num-3
           move zero to ws-num-4
           move zero to ws-num-5
           move zero to ws-num-6
           move zero to ws-num-7
           move zero to ws-num-8
           move zero to ws-num-9
           move zero to ws-num-10
           move spaces to ws-msn
           move zero to ws-ind-acerto
           move zero to ws-ind-erro
           move zero to ws-ind-sorteio
           .
       inicializa-exit.
           exit.

      *>------------------------------------------------------------------------
      *> Processamento do programa
      *>------------------------------------------------------------------------
       processamento section.
      *> aceitando quantos n�meros o usu�rio quer apostar
           display sc-tela
           accept sc-tela
           perform until ws-fim_programa = "x" or ws-fim_programa = "X"
               if ws-quantidade < 6 or ws-quantidade > 10 then
                   move "Quantidade invalida." to ws-msn
                   display sc-tela
                   accept sc-tela
               end-if

               perform testes

               display erase
               move 1 to ws-ind-sorteio
      *> aceitando o tempo do rel�gio
               accept ws-tempo1 from time
               perform until ws-ind-acerto = 6

                   move zero to ws-ind-acerto
                   move zero to ws-ind-erro
      *> mostrando o n�mero do sorteio que foi feito
                   display "Sorteio: " ws-ind-sorteio
      *> chamando o programa 2
                   call "desafioloteria2" using ws-quantidade, ws-num-1, ws-num-2, ws-num-3,
                                               ws-num-4, ws-num-5, ws-num-6, ws-num-7, ws-num-8,
                                               ws-num-9, ws-num-10, ws-msn, ws-ind-acerto, ws-ind-erro,
                                               ws-ind-sorteio
                   add 1 to ws-ind-sorteio
               end-perform
      *> aceitando o tempo do el�gio
               accept ws-tempo2 from time
      *> calculando quanto tempo levou para sortear os n�meros corretos
               compute ws-hora = ws-hora2 - ws-hora1
               compute ws-minuto = ws-minuto2 - ws-minuto1
               compute ws-segundo = ws-segundo2 - ws-segundo1
               compute ws-centesimo = ws-centesimo2 - ws-centesimo1
      *> mostrando na tela que o usu�rio ganhou
               display "Parabens, voce acertou com " ws-ind-sorteio " sorteios!"
      *> mostrando na tela o tempo gasto nos sorteios
               display "Tempo gasto nos sorteios: " ws-hora " horas, " ws-minuto " minutos, " ws-segundo " segundos, e " ws-centesimo " centesimos."
               accept ws-aux
      *> zerando as vari�veis
               move zero to ws-quantidade
               move space to ws-fim_programa
               initialize ws-numeros
               move zero to ws-ind-acerto
               move zero to ws-ind-erro
               move zero to ws-ind-sorteio
      *> mostrando a tela de ecolha de quantos n�meros o usu�rio quer apostar novamente
               display sc-tela
               accept sc-tela
           end-perform
           .
       processamento-exit.
           exit.

      *>-------------------------------------------------------------------------------------------------------
      *> Section para testes (se algum n�mero apostado � igual a algum anterior e se algum n�mero � inv�lido)
      *>-------------------------------------------------------------------------------------------------------
       testes section.
           move "S" to ws-num-repetido
           perform until ws-num-repetido = "N"
               if ws-quantidade = 6 then
                   initialize ws-numeros
                   move spaces to ws-msn-2
      *> mostrando a tela de aposta de 6 n�meros
                   display sc-tela-6
                   accept sc-tela-6
      *> comparando se o n�mero apostado � igual ao anterior
                   if ws-num-2 = ws-num-1 or
                   ws-num-3 = ws-num-1 or
                   ws-num-3 = ws-num-2 or
                   ws-num-4 = ws-num-1 or
                   ws-num-4 = ws-num-2 or
                   ws-num-4 = ws-num-3 or
                   ws-num-5 = ws-num-1 or
                   ws-num-5 = ws-num-2 or
                   ws-num-5 = ws-num-3 or
                   ws-num-5 = ws-num-4 or
                   ws-num-6 = ws-num-1 or
                   ws-num-6 = ws-num-2 or
                   ws-num-6 = ws-num-3 or
                   ws-num-6 = ws-num-4 or
                   ws-num-6 = ws-num-5 or
      *> testes para ver se os n�meros inseridos s�o v�lidos
                   ws-num-1 < 1 or ws-num-1 > 60 or
                   ws-num-2 < 1 or ws-num-2 > 60 or
                   ws-num-3 < 1 or ws-num-3 > 60 or
                   ws-num-4 < 1 or ws-num-4 > 60 or
                   ws-num-5 < 1 or ws-num-5 > 60 or
                   ws-num-6 < 1 or ws-num-6 > 60 then
                       move "Existe numero repetido ou invalido, aperte enter para tentar novamente." to ws-msn-2
                       display sc-tela-6
                       accept ws-aux
                       move "S" to ws-num-repetido
                   else
                       move "N" to ws-num-repetido
                   end-if
               end-if

               if ws-quantidade = 7 then
                   initialize ws-numeros
                   move spaces to ws-msn-2
      *> mostrando a tela de aposta de 7 n�meros
                   display sc-tela-7
                   accept sc-tela-7
      *> comparando se o n�mero apostado � igual ao anterior
                   if ws-num-2 = ws-num-1 or
                   ws-num-3 = ws-num-1 or
                   ws-num-3 = ws-num-2 or
                   ws-num-4 = ws-num-1 or
                   ws-num-4 = ws-num-2 or
                   ws-num-4 = ws-num-3 or
                   ws-num-5 = ws-num-1 or
                   ws-num-5 = ws-num-2 or
                   ws-num-5 = ws-num-3 or
                   ws-num-5 = ws-num-4 or
                   ws-num-6 = ws-num-1 or
                   ws-num-6 = ws-num-2 or
                   ws-num-6 = ws-num-3 or
                   ws-num-6 = ws-num-4 or
                   ws-num-6 = ws-num-5 or
                   ws-num-7 = ws-num-1 or
                   ws-num-7 = ws-num-2 or
                   ws-num-7 = ws-num-3 or
                   ws-num-7 = ws-num-4 or
                   ws-num-7 = ws-num-5 or
                   ws-num-7 = ws-num-6 or
      *> testes para ver se os n�meros inseridos s�o v�lidos
                   ws-num-1 < 1 or ws-num-1 > 60 or
                   ws-num-2 < 1 or ws-num-2 > 60 or
                   ws-num-3 < 1 or ws-num-3 > 60 or
                   ws-num-4 < 1 or ws-num-4 > 60 or
                   ws-num-5 < 1 or ws-num-5 > 60 or
                   ws-num-6 < 1 or ws-num-6 > 60 or
                   ws-num-7 < 1 or ws-num-7 > 60 then
                       move "Existe numero repetido ou invalido, aperte enter para tentar novamente." to ws-msn-2
                       display sc-tela-7
                       accept ws-aux
                       move "S" to ws-num-repetido
                   else
                       move "N" to ws-num-repetido
                   end-if
               end-if

               if ws-quantidade = 8 then
                   initialize ws-numeros
                   move spaces to ws-msn-2
      *> mostrando a tela de aposta de 8 n�meros
                   display sc-tela-8
                   accept sc-tela-8
      *> comparando se o n�mero apostado � igual ao anterior
                   if ws-num-2 = ws-num-1 or
                   ws-num-3 = ws-num-1 or
                   ws-num-3 = ws-num-2 or
                   ws-num-4 = ws-num-1 or
                   ws-num-4 = ws-num-2 or
                   ws-num-4 = ws-num-3 or
                   ws-num-5 = ws-num-1 or
                   ws-num-5 = ws-num-2 or
                   ws-num-5 = ws-num-3 or
                   ws-num-5 = ws-num-4 or
                   ws-num-6 = ws-num-1 or
                   ws-num-6 = ws-num-2 or
                   ws-num-6 = ws-num-3 or
                   ws-num-6 = ws-num-4 or
                   ws-num-6 = ws-num-5 or
                   ws-num-7 = ws-num-1 or
                   ws-num-7 = ws-num-2 or
                   ws-num-7 = ws-num-3 or
                   ws-num-7 = ws-num-4 or
                   ws-num-7 = ws-num-5 or
                   ws-num-7 = ws-num-6 or
                   ws-num-8 = ws-num-1 or
                   ws-num-8 = ws-num-2 or
                   ws-num-8 = ws-num-3 or
                   ws-num-8 = ws-num-4 or
                   ws-num-8 = ws-num-5 or
                   ws-num-8 = ws-num-6 or
                   ws-num-8 = ws-num-7 or
      *> testes para ver se os n�meros inseridos s�o v�lidos
                   ws-num-1 < 1 or ws-num-1 > 60 or
                   ws-num-2 < 1 or ws-num-2 > 60 or
                   ws-num-3 < 1 or ws-num-3 > 60 or
                   ws-num-4 < 1 or ws-num-4 > 60 or
                   ws-num-5 < 1 or ws-num-5 > 60 or
                   ws-num-6 < 1 or ws-num-6 > 60 or
                   ws-num-7 < 1 or ws-num-7 > 60 or
                   ws-num-8 < 1 or ws-num-8 > 60 then
                       move "Existe numero repetido ou invalido, aperte enter para tentar novamente." to ws-msn-2
                       display sc-tela-8
                       accept ws-aux
                       move "S" to ws-num-repetido
                   else
                       move "N" to ws-num-repetido
                   end-if
               end-if

               if ws-quantidade = 9 then
                   initialize ws-numeros
                   move spaces to ws-msn-2
      *> mostrando a tela de aposta de 9 n�meros
                   display sc-tela-9
                   accept sc-tela-9
      *> comparando se o n�mero apostado � igual ao anterior
                   if ws-num-2 = ws-num-1 or
                   ws-num-3 = ws-num-1 or
                   ws-num-3 = ws-num-2 or
                   ws-num-4 = ws-num-1 or
                   ws-num-4 = ws-num-2 or
                   ws-num-4 = ws-num-3 or
                   ws-num-5 = ws-num-1 or
                   ws-num-5 = ws-num-2 or
                   ws-num-5 = ws-num-3 or
                   ws-num-5 = ws-num-4 or
                   ws-num-6 = ws-num-1 or
                   ws-num-6 = ws-num-2 or
                   ws-num-6 = ws-num-3 or
                   ws-num-6 = ws-num-4 or
                   ws-num-6 = ws-num-5 or
                   ws-num-7 = ws-num-1 or
                   ws-num-7 = ws-num-2 or
                   ws-num-7 = ws-num-3 or
                   ws-num-7 = ws-num-4 or
                   ws-num-7 = ws-num-5 or
                   ws-num-7 = ws-num-6 or
                   ws-num-8 = ws-num-1 or
                   ws-num-8 = ws-num-2 or
                   ws-num-8 = ws-num-3 or
                   ws-num-8 = ws-num-4 or
                   ws-num-8 = ws-num-5 or
                   ws-num-8 = ws-num-6 or
                   ws-num-8 = ws-num-7 or
                   ws-num-9 = ws-num-1 or
                   ws-num-9 = ws-num-2 or
                   ws-num-9 = ws-num-3 or
                   ws-num-9 = ws-num-4 or
                   ws-num-9 = ws-num-5 or
                   ws-num-9 = ws-num-6 or
                   ws-num-9 = ws-num-7 or
                   ws-num-9 = ws-num-8 or
      *> testes para ver se os n�meros inseridos s�o v�lidos
                   ws-num-1 < 1 or ws-num-1 > 60 or
                   ws-num-2 < 1 or ws-num-2 > 60 or
                   ws-num-3 < 1 or ws-num-3 > 60 or
                   ws-num-4 < 1 or ws-num-4 > 60 or
                   ws-num-5 < 1 or ws-num-5 > 60 or
                   ws-num-6 < 1 or ws-num-6 > 60 or
                   ws-num-7 < 1 or ws-num-7 > 60 or
                   ws-num-8 < 1 or ws-num-8 > 60 or
                   ws-num-9 < 1 or ws-num-9 > 60 then
                       move "Existe numero repetido ou invalido, aperte enter para tentar novamente." to ws-msn-2
                       display sc-tela-9
                       accept ws-aux
                       move "S" to ws-num-repetido
                   else
                       move "N" to ws-num-repetido
                   end-if
               end-if

               if ws-quantidade = 10 then
                   initialize ws-numeros
                   move spaces to ws-msn-2
      *> mostrando a tela de aposta de 10 n�meros
                   display sc-tela-10
                   accept sc-tela-10
      *> comparando se o n�mero apostado � igual ao anterior
                   if ws-num-2 = ws-num-1 or
                   ws-num-3 = ws-num-1 or
                   ws-num-3 = ws-num-2 or
                   ws-num-4 = ws-num-1 or
                   ws-num-4 = ws-num-2 or
                   ws-num-4 = ws-num-3 or
                   ws-num-5 = ws-num-1 or
                   ws-num-5 = ws-num-2 or
                   ws-num-5 = ws-num-3 or
                   ws-num-5 = ws-num-4 or
                   ws-num-6 = ws-num-1 or
                   ws-num-6 = ws-num-2 or
                   ws-num-6 = ws-num-3 or
                   ws-num-6 = ws-num-4 or
                   ws-num-6 = ws-num-5 or
                   ws-num-7 = ws-num-1 or
                   ws-num-7 = ws-num-2 or
                   ws-num-7 = ws-num-3 or
                   ws-num-7 = ws-num-4 or
                   ws-num-7 = ws-num-5 or
                   ws-num-7 = ws-num-6 or
                   ws-num-8 = ws-num-1 or
                   ws-num-8 = ws-num-2 or
                   ws-num-8 = ws-num-3 or
                   ws-num-8 = ws-num-4 or
                   ws-num-8 = ws-num-5 or
                   ws-num-8 = ws-num-6 or
                   ws-num-8 = ws-num-7 or
                   ws-num-9 = ws-num-1 or
                   ws-num-9 = ws-num-2 or
                   ws-num-9 = ws-num-3 or
                   ws-num-9 = ws-num-4 or
                   ws-num-9 = ws-num-5 or
                   ws-num-9 = ws-num-6 or
                   ws-num-9 = ws-num-7 or
                   ws-num-9 = ws-num-8 or
                   ws-num-10 = ws-num-1 or
                   ws-num-10 = ws-num-2 or
                   ws-num-10 = ws-num-3 or
                   ws-num-10 = ws-num-4 or
                   ws-num-10 = ws-num-5 or
                   ws-num-10 = ws-num-6 or
                   ws-num-10 = ws-num-7 or
                   ws-num-10 = ws-num-8 or
                   ws-num-10 = ws-num-9 or
      *> testes para ver se os n�meros inseridos s�o v�lidos
                   ws-num-1 < 1 or ws-num-1 > 60 or
                   ws-num-2 < 1 or ws-num-2 > 60 or
                   ws-num-3 < 1 or ws-num-3 > 60 or
                   ws-num-4 < 1 or ws-num-4 > 60 or
                   ws-num-5 < 1 or ws-num-5 > 60 or
                   ws-num-6 < 1 or ws-num-6 > 60 or
                   ws-num-7 < 1 or ws-num-7 > 60 or
                   ws-num-8 < 1 or ws-num-8 > 60 or
                   ws-num-9 < 1 or ws-num-9 > 60 or
                   ws-num-10 < 1 or ws-num-10 > 60 then
                       move "Existe numero repetido ou invalido, aperte enter para tentar novamente." to ws-msn-2
                       display sc-tela-10
                       accept ws-aux
                       move "S" to ws-num-repetido
                   else
                       move "N" to ws-num-repetido
                   end-if
               end-if
           end-perform
           .
       testes-exit.
           exit.

      *>------------------------------------------------------------------------
      *> Finaliza��o Normal
      *>------------------------------------------------------------------------
       finaliza section.
           stop run
           .
       finaliza-exit.
           exit.




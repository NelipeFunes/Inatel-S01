; Cenário: Em Puella Magi Madoka Magica, garotas comuns fazem um contrato com o Kyubey:
; ele realiza um desejo de cada uma e, em troca, elas viram garotas mágicas e lutam contra
; bruxas. A alma de cada garota fica guardada em uma Joia da Alma, que escurece conforme
; ela usa magia; para limpá-la, ela usa uma Semente da Aflição, deixada pelas bruxas
; derrotadas. O grupo quer acompanhar o quanto as joias já escureceram.
; Tarefa:
; 1. Com defstruct, crie a estrutura garota-magica, com os campos nome, escuridao (de 0, joia
;    limpa, a 100) e bruxas (quantas bruxas ela já derrotou).
; 2. Crie a função (escuridao-total grupo) com recursão (null, car e cdr), sem reduce nem
;    mapcar: o grupo vazio vale 0, e cada garota soma a escuridão da joia dela ao total
;    do resto.
; 3. Crie a função (total-de-bruxas grupo), que soma as bruxas derrotadas por todas as
;    garotas com reduce e mapcar (#'garota-magica-bruxas).
; 4. Crie a função (purifica g quantidade), que retorna uma garota nova (com
;    make-garota-magica), igual à recebida, mas com a escuridão diminuída pela quantidade.
;    Use if: se a quantidade for maior ou igual à escuridão, a joia nova fica limpa (0). A
;    original não muda.
; 5. Na main:
;    crie um grupo com pelo menos três garotas à sua escolha e exiba a escuridão total e o
;    total de bruxas derrotadas;
;    uma nova garota faz o contrato: com cons, crie um grupo novo com ela na frente e
;    exiba a escuridão total dos dois grupos.
; 6. Ainda na main, purifique uma das garotas com purifica e exiba a escuridão da original e
;    a da nova.

(defstruct garota-magica
  nome
  escuridao
  bruxas)


(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))


(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))


(defun purifica (g quantidade)
  (make-garota-magica :nome      (garota-magica-nome g)
                      :escuridao (if (>= quantidade (garota-magica-escuridao g))
                                     0
                                     (- (garota-magica-escuridao g) quantidade))
                      :bruxas    (garota-magica-bruxas g)))


(defun main ()
  (let* ((madoka (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 3))
         (mami   (make-garota-magica :nome "Mami" :escuridao 35 :bruxas 18))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 85 :bruxas 6))
         (grupo  (list madoka mami sayaka)))
    (format t "--- Grupo ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (let ((grupo-novo
            (cons (make-garota-magica :nome "Kyoko" :escuridao 40 :bruxas 12)
                  grupo)))
      (format t "--- Kyoko faz o contrato ---~%")
      (format t "Escuridao total do grupo novo: ~a~%" (escuridao-total grupo-novo))
      (format t "Escuridao total do grupo anterior: ~a~%" (escuridao-total grupo)))

    (let ((sayaka-purificada (purifica sayaka 30)))
      (format t "--- Semente da Aflicao em ~a ---~%" (garota-magica-nome sayaka))
      (format t "Escuridao da original: ~a~%" (garota-magica-escuridao sayaka))
      (format t "Escuridao da nova: ~a~%" (garota-magica-escuridao sayaka-purificada)))))


(main)

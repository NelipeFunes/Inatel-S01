; Cenário: Em Os Diários da Apotecária, Maomao é uma jovem farmacêutica que prepara
; remédios com ervas no palácio imperial e, por curiosidade, costuma testar venenos em si
; mesma. Cada erva do seu estoque tem um nome, um preço por grama e uma toxicidade, de
; 0 (inofensiva) a 10 (veneno mortal). Ela quer um programa que classifique as ervas e
; calcule o preço de cada dose.
; Tarefa:
; 1. Com defstruct, crie a estrutura erva, com os campos nome, preco-por-grama e
;    toxicidade.
; 2. Crie a função (classifica-erva erva) com cond, que retorna:
;    "veneno" para toxicidade 7 ou mais;
;    "use com cuidado" de 4 a 6;
;    "segura" nos demais casos (t).
; 3. Crie a função (preco-da-dose erva gramas), que retorna o preço por grama multiplicado
;    pela quantidade de gramas.
; 4. Crie a função (descreve-erva erva), que retorna (com format nil) um texto com o nome,
;    o preço por grama (com 2 casas decimais) e a classificação.
; 5. Crie a função (aviso erva) com if: se a toxicidade for 7 ou mais, retorna um aviso de
;    que Maomao vai testar a erva em si mesma antes; senão, retorna que ela está liberada
;    para o paciente.
; 6. Na main:
;    crie três ervas à sua escolha, uma em cada classificação, e guarde-as em uma lista;
;    com dolist, exiba a descrição e o aviso de cada uma;
;    exiba o preço de uma dose de uma delas, com a quantidade de gramas à sua escolha.

(defstruct erva
  nome
  preco-por-grama
  toxicidade)


(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))


(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))


(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva) (erva-preco-por-grama erva) (classifica-erva erva)))


(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar esta erva em si mesma antes."
      "Liberada para o paciente."))


(defun main ()
  (let* ((aconito  (make-erva :nome "Aconito" :preco-por-grama 15.0 :toxicidade 9))
         (efedra   (make-erva :nome "Efedra" :preco-por-grama 4.25 :toxicidade 5))
         (gengibre (make-erva :nome "Gengibre" :preco-por-grama 1.5 :toxicidade 1))
         (ervas    (list aconito efedra gengibre)))
    (format t "--- Estoque da Maomao ---~%")
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%" (aviso e)))
    (format t "--- Dose ---~%")
    (format t "3 gramas de ~a: R$~,2f~%"
            (erva-nome efedra) (preco-da-dose efedra 3))))


(main)

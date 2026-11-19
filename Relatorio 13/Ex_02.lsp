; Cenário: Em Subnautica, jogo de sobrevivência, uma nave cai em 4546B, um planeta coberto
; por oceano. Com um scanner de mão, o sobrevivente registra cada criatura marinha que
; encontra: o nome, o bioma (a região do oceano onde ela vive), a profundidade em metros
; e o perigo que ela representa. As maiores e mais perigosas são os leviatãs, monstros
; marinhos gigantes.
; Tarefa:
; 1. Com defstruct, crie a estrutura criatura, com os campos nome, bioma, profundidade e
;    perigo. O perigo é sempre uma das keywords :inofensiva, :agressiva ou :leviata.
; 2. Crie a função (texto-do-perigo perigo) com case, que retorna "Inofensiva",
;    "Agressiva" ou "Leviata: mantenha distancia", e "Desconhecido" para qualquer outra
;    keyword (otherwise).
; 3. Crie a função (descreve-criatura c), que retorna, com format nil, o nome, o bioma, a
;    profundidade e o texto do perigo.
; 4. Crie a função (abaixo-de metros catalogo), que usa remove-if-not com uma lambda para
;    devolver só as criaturas com profundidade maior que metros.
; 5. Fora da main, defina com defparameter o *catalogo*: uma lista com pelo menos quatro
;    criaturas à sua escolha, com pelo menos uma de cada perigo.
; 6. Na main:
;    gere os textos do catálogo inteiro com mapcar e #'descreve-criatura, e exiba-os
;    com dolist;
;    exiba do mesmo jeito só as criaturas abaixo de uma profundidade à sua escolha;
;    exiba quantas são (length).

(defstruct criatura
  nome
  bioma
  profundidade
  perigo)


(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviata: mantenha distancia")
    (otherwise   "Desconhecido")))


(defun descreve-criatura (c)
  (format nil "~a (~a, ~am) - ~a"
          (criatura-nome c) (criatura-bioma c) (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))


(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))


(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Zona Rasa Segura"
                  :profundidade 15 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de Algas"
                  :profundidade 60 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Zona do Desastre"
                  :profundidade 180 :perigo :leviata)
   (make-criatura :nome "Crabsquid" :bioma "Algas Sangrentas"
                  :profundidade 350 :perigo :agressiva)
   (make-criatura :nome "Ghost Leviathan" :bioma "Rio Perdido"
                  :profundidade 600 :perigo :leviata)))


(defun main ()
  (format t "--- Catalogo do Scanner ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (let ((fundas (abaixo-de 100 *catalogo*)))
    (format t "--- Abaixo de 100m ---~%")
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Criaturas abaixo de 100m: ~a~%" (length fundas))))


(main)

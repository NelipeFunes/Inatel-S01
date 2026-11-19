; Cenário: Em Genshin Impact, o Viajante explora o mundo de Teyvat, em que cada lugar está
; ligado a um elemento, como Pyro (fogo), Hydro (água), Cryo (gelo), Electro (eletricidade) e
; Anemo (vento). Os domínios são masmorras que dão recompensas em mora, a moeda do
; jogo, e cada um tem uma dificuldade de 1 a 5. O Viajante quer montar uma rota com os
; domínios que consegue enfrentar e saber quanta mora vai ganhar.
; Tarefa:
; 1. Com defstruct, crie a estrutura dominio, com os campos nome, elemento (uma keyword,
;    como :pyro ou :cryo), dificuldade e mora.
; 2. Crie a função (bonus-elemental elemento) com case, que retorna o multiplicador da
;    recompensa: 1.5 para :electro, 1.2 para :hydro e 1 para os demais (otherwise).
; 3. Crie a função (recompensa-final d), que retorna a mora do domínio multiplicada pelo
;    bônus do seu elemento.
; 4. Crie a função (rota lista dificuldade-maxima), que usa let* para, em sequência, filtrar
;    com remove-if-not os domínios com dificuldade menor ou igual à máxima e transformar
;    os que sobraram em textos com mapcar (nome e recompensa final, com format nil).
;    Retorna a lista de textos.
; 5. Na main:
;    crie uma lista com pelo menos cinco domínios à sua escolha, com elementos e
;    dificuldades variados;
;    exiba com dolist a rota para uma dificuldade máxima à sua escolha;
;    exiba o total de mora da lista inteira, com reduce e mapcar (#'recompensa-final).
; 6. Ainda na main, o Lisp permite alterar valores: crie uma cópia de um domínio com
;    copy-dominio, altere a mora da cópia com setf e exiba a mora da cópia e a do original,
;    que continua igual.

(defstruct dominio
  nome
  elemento
  dificuldade
  mora)


(defun bonus-elemental (elemento)
  (case elemento
    (:electro  1.5)
    (:hydro    1.2)
    (otherwise 1)))


(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))


(defun rota (lista dificuldade-maxima)
  (let* ((possiveis (remove-if-not
                      (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                      lista))
         (textos    (mapcar
                      (lambda (d)
                        (format nil "~a - ~,1f mora" (dominio-nome d) (recompensa-final d)))
                      possiveis)))
    textos))


(defun main ()
  (let ((dominios
          (list
           (make-dominio :nome "Patio do Solsticio" :elemento :electro
                         :dificuldade 3 :mora 2000)
           (make-dominio :nome "Palacio Oculto de Zhou" :elemento :pyro
                         :dificuldade 4 :mora 2500)
           (make-dominio :nome "Pico de Vindagnyr" :elemento :cryo
                         :dificuldade 5 :mora 3000)
           (make-dominio :nome "Vale da Lembranca" :elemento :anemo
                         :dificuldade 1 :mora 1200)
           (make-dominio :nome "Lago Cristalino" :elemento :hydro
                         :dificuldade 2 :mora 1500))))
    (format t "--- Rota ate a dificuldade 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))
    (format t "Total de mora da lista inteira: ~,1f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    (format t "--- O Lisp permite alterar (setf) ---~%")
    (let ((copia (copy-dominio (car dominios))))
      (setf (dominio-mora copia) 5000)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (car dominios))))))


(main)

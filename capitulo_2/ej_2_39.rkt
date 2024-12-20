#lang racket


(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

;Se añade el valor de x a y siendo y una lista vacia
(define (reverse sequence)
  (fold-right
   (lambda (x y) (append y (list x))) '() sequence))

(define (reverse2 sequence)
  (fold-left 
   (lambda (x y) (cons y x)) '() sequence))


(reverse '(1 2 3 4))


(reverse2 '(1 2 3 4))
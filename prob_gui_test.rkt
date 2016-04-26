#lang racket
(require racket/gui/base)
(require "hockey_stats.rkt")




(define frame (new frame%
                   [label "Hockey Stats"]
                   [width 600]
                   [height 720]))

(define team1msg (new message% [parent frame]
                 [label "NULL"]))

(define team2msg (new message% [parent frame]
                    [label "NULL"]))

(define output (new message% [parent frame]
                    [label "NAN"]))

(new button% [parent frame]
     [label "Boston"]
     ; Callback procedure for a button click:
     [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Boston")]
                       [else  (send team2msg set-label "Boston")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Boston"))) ]) )])

;(send output set-label (pick_teams (send team1msg get-label) (send team2msg get-label)))

(new button% [parent frame]
     [label "Montreal"]
     ; Callback procedure for a button click:
     [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Montreal")]
                       [else  (send team2msg set-label "Montreal")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Montreal"))) ]))])


(new button% [parent frame]
     [label "Reset"]
     ; Callback procedure for a button click:
     [callback (lambda (button event)
                 (send team1msg set-label "NULL")
                 (send team2msg set-label "NULL")
                 (send output   set-label "NAN"))])
                
               
(send frame show #t)
#lang racket

(require racket/gui/base)
(require "hockey_stats.rkt")

(define frame (new frame%
                   [label "Hockey Stats"]
                   [width 1000]
                   [height 720]))

#|*********************************************************|#
#|**************ATLANTIC/CENTRAL PANEL*********************|#
#|*********************************************************|#

(define atlantic/central (new horizontal-panel% [parent frame]
                                     [alignment '(left top)]
                                     [style '(border)]
                                     [stretchable-width #t]
                                     ))

#|*********************************************************|#
#|********************ATLANTIC PANE************************|#
#|*********************************************************|#


(define atlantic (new vertical-pane% [parent atlantic/central]
                                     [alignment '(left top)]
                                     
                                     [stretchable-width #t]
                                     ))
(new button% [parent atlantic]
             
             [label "Florida Panthers"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Florida")]
                       [else  (send team2msg set-label "Florida")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Florida"))) ]) )]
             [min-width 150]
             )

(new button% [parent atlantic]
             [label "Tampa Bay Lightning"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Tampa Bay")]
                       [else  (send team2msg set-label "Tampa Bay")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Tampa Bay"))) ]) )]
             [min-width 150])

(new button% [parent atlantic]
             [label "Detroit Red Wings"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Detroit")]
                       [else  (send team2msg set-label "Detroit")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Detroit"))) ]) )]
             [min-width 150])

(new button% [parent atlantic]
             [label "Boston Bruins"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Boston")]
                       [else  (send team2msg set-label "Boston")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Boston"))) ]) )]
             [min-width 150])

(new button% [parent atlantic]
             [label "Ottawa Senetors"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Ottawa")]
                       [else  (send team2msg set-label "Ottawa")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Ottawa"))) ]) )]
             [min-width 150])

(new button% [parent atlantic]
             [label "Montreal Canadiens"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Montreal")]
                       [else  (send team2msg set-label "Montreal")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Montreal"))) ]) )]
             [min-width 150])

(new button% [parent atlantic]
             [label "Buffalo Sabres"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Buffalo")]
                       [else  (send team2msg set-label "Buffalo")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Buffalo"))) ]) )]
             [min-width 150])

(new button% [parent atlantic]
             [label "Toronto Maple Leafs"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Toronto")]
                       [else  (send team2msg set-label "Toronto")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Toronto"))) ]) )]
             [min-width 150])



#|*********************************************************|#
#|********************CENTRAL PANE*************************|#
#|*********************************************************|#


(define central (new vertical-pane% [parent atlantic/central]
                                     [alignment '(right top)]
                                     
                                     [stretchable-width #t]))

(new button% [parent central]
             
             [label "Dallas Stars"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Dallas")]
                       [else  (send team2msg set-label "Dallas")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Dallas")))
                              ]) )]
             [min-width 150])

;(* 350 (string->number(send output get-label)))

(new button% [parent central]
             
             [label "St. Louis Blues"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "St. Louis")]
                       [else  (send team2msg set-label "St. Louis")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "St. Louis"))) ]) )]
             [min-width 150])

(new button% [parent central]
             
             [label "Chicago Blackhawks"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Chicago")]
                       [else  (send team2msg set-label "Chicago")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Chicago"))) ]) )]
             [min-width 150])

(new button% [parent central]
             
             [label "Nashville Predators"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Nashville")]
                       [else  (send team2msg set-label "Nashville")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Nashville"))) ]) )]
             [min-width 150])

(new button% [parent central]
             
             [label "Minnesota Wild"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Minnesota")]
                       [else  (send team2msg set-label "Minnesota")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Minnesota"))) ]) )]
             [min-width 150])

(new button% [parent central]
             
             [label "Colorado Avalanch"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Colorado")]
                       [else  (send team2msg set-label "Colorado")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Colorado"))) ]) )]
             [min-width 150])

(new button% [parent central]
             
             [label "Winnipeg Jets"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Winnipeg")]
                       [else  (send team2msg set-label "Winnipeg")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Winnipeg"))) ]) )]
             [min-width 150])

#|*********************************************************|#
#|********************OUTPUT PANEL*************************|#
#|*********************************************************|#


(define blue-brush (new brush% [color "blue"]))
(define yellow-brush (new brush% [color "yellow"]))

(define output_panel (new horizontal-panel% [parent frame]
                                     [alignment '(center center)]
                                     [style '(border)]
                                     [stretchable-width #t]
                                     ))



(define output_left (new vertical-pane% [parent output_panel]
                                     [alignment '(center center)]
                                     
                                     [stretchable-width #t]))

(define output_center (new vertical-pane% [parent output_panel]
                                     [alignment '(center center)]
                                     
                                     [stretchable-width #t]))

(define output_right (new vertical-pane% [parent output_panel]
                                     [alignment '(center center)]
                                     
                                     
                                     [stretchable-width #t]))

(define canvas (new canvas% 
                    [parent output_center]
                    
                    [paint-callback 
                     (λ(can dc) (send dc set-brush blue-brush)(send dc draw-rectangle 0 0 300 100))]))



(new button% [parent output_center]
     [label "Draw Graph"]
     ; Callback procedure for a button click:
     [callback (lambda (button event)
                 (cond [(equal? "NAN" (send output get-label)) (send output set-label "Pick Two Teams")]
                       [else (send (send canvas get-dc) set-brush yellow-brush)
                              (send (send canvas get-dc) draw-rectangle 0 0 (* 300 (string->number(send output get-label)))  100)]))])
                              

(new button% [parent output_center]
     [label "Reset"]
     ; Callback procedure for a button click:
     [callback (lambda (button event)
                 (send (send canvas get-dc) set-brush blue-brush)
                 (send (send canvas get-dc) draw-rectangle 0 0 300  100)
                 (send team1msg set-label "NULL")
                 (send team2msg set-label "NULL")
                 (send output   set-label "NAN"))])

(define output (new message% [parent output_center]
                             [label "NAN"]
                             [auto-resize #f]))

(define team1msg (new message% [parent output_left]
                               [label "NULL"]
                               [min-width 150]
                               [auto-resize #f]))

(define team2msg (new message% [parent output_right]
                               [label "NULL"]
                               [min-width 150]
                               [auto-resize #f]))


                             
                             


;(define msg (new message% [parent frame]
 ;                         [label "Pick Teams"]))

#|*********************************************************|#
#|****************PACIFIC/METRO PANEL**********************|#
#|*********************************************************|#

(define pacific/metro (new horizontal-panel% [parent frame]
                                     [alignment '(center bottom)]
                                     [style '(border)]
                                     [stretchable-width #t]
                                     ))


#|*********************************************************|#
#|***********************METRO PANE************************|#
#|*********************************************************|#

(define metro (new vertical-pane% [parent pacific/metro]
                                     [alignment '(left bottom)]
                                     [stretchable-width #t]))

(new button% [parent metro]
             
             [label "Washington Capitals"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Washington")]
                       [else  (send team2msg set-label "Washington")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Washington"))) ]) )]
             [min-width 150])

(new button% [parent metro]
             
             [label "Pittsburgh Penguins"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Pittsburgh")]
                       [else  (send team2msg set-label "Pittsburgh")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Pittsburgh"))) ]) )]
             [min-width 150])

(new button% [parent metro]
             
             [label "New York Rangers"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "NY Rangers")]
                       [else  (send team2msg set-label "NY Rangers")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "NY Rangers"))) ]) )]
             [min-width 150])

(new button% [parent metro]
             
             [label "New York Islanders"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "NY Islanders")]
                       [else  (send team2msg set-label "NY Islanders")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "NY Islanders"))) ]) )]
             [min-width 150])

(new button% [parent metro]
             
             [label "Philadelphia Flyers"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Philadelphia")]
                       [else  (send team2msg set-label "Philadelphia")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Philadelphia"))) ]) )]
             [min-width 150])

(new button% [parent metro]
             
             [label "Carolina Huricanes"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Carolina")]
                       [else  (send team2msg set-label "Carolina")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Carolina"))) ]) )]
             [min-width 150])

(new button% [parent metro]
             
             [label "New Jersey Devils"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "New Jersey")]
                       [else  (send team2msg set-label "New Jersey")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "New Jersey"))) ]) )]
             [min-width 150])

(new button% [parent metro]
             
             [label "Columbus Blue Jackets"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Columbus")]
                       [else  (send team2msg set-label "Columbus")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Columbus"))) ]) )]
             [min-width 150])


#|*********************************************************|#
#|***********************PACIFIC PANE**********************|#
#|*********************************************************|#


(define pacific (new vertical-pane% [parent pacific/metro]
                                     [alignment '(right bottom)]
                                     [stretchable-width #t]))

(new button% [parent pacific]
             
             [label "Anaheim Ducks"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Anaheim")]
                       [else  (send team2msg set-label "Anaheim")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Anaheim"))) ]) )]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Los Angeles Kings"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Los Angeles")]
                       [else  (send team2msg set-label "Los Angeles")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Los Angeles"))) ]) )]
             [min-width 150])

(new button% [parent pacific]
             
             [label "San Jose Sharks"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "San Jose")]
                       [else  (send team2msg set-label "San Jose")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "San Jose"))) ]) )]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Arizona Coyotes"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Arizona")]
                       [else  (send team2msg set-label "Arizona")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Arizona"))) ]) )]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Calgary Flames"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Calgary")]
                       [else  (send team2msg set-label "Calgary")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Calgary"))) ]) )]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Vancouver Cannucks"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Vancouver")]
                       [else  (send team2msg set-label "Vancouver")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Vancouver"))) ]) )]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Edmonton Oilers"]
             [callback (lambda (button event)
                 (cond [(equal? "NULL" (send team1msg get-label)) (send team1msg set-label "Edmonton")]
                       [else  (send team2msg set-label "Edmonton")
                              (send output set-label (number->string(pick_teams (send team1msg get-label) "Edmonton"))) ]) )]
             [min-width 150])







 #|
; Make a button in the frame
(new button% [parent frame]
             [label "Boston"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (send msg set-label "Team 1 is Boston"))])

(new button% [parent frame]
             [label "Montreal"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (send msg set-label "Team 2 is Montreal"))])
 |#
; Show the frame by calling its show method
(send frame show #t)

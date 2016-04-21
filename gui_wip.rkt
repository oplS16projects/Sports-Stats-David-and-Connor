#lang racket
(require racket/gui/base)

(define frame (new frame%
                   [label "Hockey Stats"]
                   [width 600]
                   [height 720]))

(define atlantic (new vertical-panel% [parent frame]
                                     [alignment '(left top)]
                                     [min-width 200]
                                     [stretchable-width #t]
                                     ))
(new button% [parent atlantic]
             
             [label "Florida Panthers"]
             [callback (lambda (button event)
                         (send msg set-label "Florida"))]
             [min-width 150]
             )

(new button% [parent atlantic]
             [label "Tampa Bay Lightning"]
             [callback (lambda (button event)
                         (send msg set-label "Tampa Bay"))]
             [min-width 150])

(new button% [parent atlantic]
             [label "Detroit Red Wings"]
             [callback (lambda (button event)
                         (send msg set-label "Detroit"))]
             [min-width 150])

(new button% [parent atlantic]
             [label "Boston Bruins"]
             [callback (lambda (button event)
                         (send msg set-label "Boston"))]
             [min-width 150])

(new button% [parent atlantic]
             [label "Ottawa Senetors"]
             [callback (lambda (button event)
                         (send msg set-label "Ottawa"))]
             [min-width 150])

(new button% [parent atlantic]
             [label "Montreal Canadiens"]
             [callback (lambda (button event)
                         (send msg set-label "Montreal"))]
             [min-width 150])

(new button% [parent atlantic]
             [label "Buffalo Sabres"]
             [callback (lambda (button event)
                         (send msg set-label "Buffalo"))]
             [min-width 150])

(new button% [parent atlantic]
             [label "Toronto Maple Leafs"]
             [callback (lambda (button event)
                         (send msg set-label "Toronto"))]
             [min-width 150])

(define central (new vertical-panel% [parent frame]
                                     [alignment '(right top)]
                                     [min-width 200]
                                     [stretchable-width #t]))

(new button% [parent central]
             
             [label "Dallas Stars"]
             [callback (lambda (button event)
                         (send msg set-label "Dallas"))]
             [min-width 150])

(new button% [parent central]
             
             [label "St. Louis Blues"]
             [callback (lambda (button event)
                         (send msg set-label "St. Louis"))]
             [min-width 150])

(new button% [parent central]
             
             [label "Chicago Blackhawks"]
             [callback (lambda (button event)
                         (send msg set-label "Chicago"))]
             [min-width 150])

(new button% [parent central]
             
             [label "Nashville Predators"]
             [callback (lambda (button event)
                         (send msg set-label "Nashville"))]
             [min-width 150])

(new button% [parent central]
             
             [label "Minnesota Wild"]
             [callback (lambda (button event)
                         (send msg set-label "Minnesota"))]
             [min-width 150])

(new button% [parent central]
             
             [label "Colorado Avalanch"]
             [callback (lambda (button event)
                         (send msg set-label "Colorado"))]
             [min-width 150])

(new button% [parent central]
             
             [label "Winnipeg Jets"]
             [callback (lambda (button event)
                         (send msg set-label "Winnipeg"))]
             [min-width 150])

(define pacific (new vertical-panel% [parent frame]
                                     [alignment '(right bottom)]
                                     [stretchable-width #t]))

(new button% [parent pacific]
             
             [label "Anaheim Ducks"]
             [callback (lambda (button event)
                         (send msg set-label "Anaheim"))]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Los Angeles Kings"]
             [callback (lambda (button event)
                         (send msg set-label "Los Angeles"))]
             [min-width 150])

(new button% [parent pacific]
             
             [label "San Jose Sharks"]
             [callback (lambda (button event)
                         (send msg set-label "San Jose"))]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Arizona Coyotes"]
             [callback (lambda (button event)
                         (send msg set-label "Arizona"))]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Calgary Flames"]
             [callback (lambda (button event)
                         (send msg set-label "Calgary"))]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Vancouver Cannucks"]
             [callback (lambda (button event)
                         (send msg set-label "Vancouver"))]
             [min-width 150])

(new button% [parent pacific]
             
             [label "Edmonton Oilers"]
             [callback (lambda (button event)
                         (send msg set-label "Edmonton"))]
             [min-width 150])




(define metro (new vertical-panel% [parent frame]
                                     [alignment '(left bottom)]
                                     [stretchable-width #t]))

(new button% [parent metro]
             
             [label "Washington Capitals"]
             [callback (lambda (button event)
                         (send msg set-label "Washington"))]
             [min-width 150])

(new button% [parent metro]
             
             [label "Pittsburgh Penguins"]
             [callback (lambda (button event)
                         (send msg set-label "Pittsburgh"))]
             [min-width 150])

(new button% [parent metro]
             
             [label "New York Rangers"]
             [callback (lambda (button event)
                         (send msg set-label "NY Rangers"))]
             [min-width 150])

(new button% [parent metro]
             
             [label "New York Islanders"]
             [callback (lambda (button event)
                         (send msg set-label "NY Islanders"))]
             [min-width 150])

(new button% [parent metro]
             
             [label "Philadelphia Flyers"]
             [callback (lambda (button event)
                         (send msg set-label "Philadelphia"))]
             [min-width 150])

(new button% [parent metro]
             
             [label "Carolina Huricanes"]
             [callback (lambda (button event)
                         (send msg set-label "Carolina"))]
             [min-width 150])

(new button% [parent metro]
             
             [label "New Jersey Devils"]
             [callback (lambda (button event)
                         (send msg set-label "New Jersey"))]
             [min-width 150])

(new button% [parent metro]
             
             [label "Columbus Blue Jackets"]
             [callback (lambda (button event)
                         (send msg set-label "Columbus"))]
             [min-width 150])


(define msg (new message% [parent frame]
                          [label "Pick Teams"]))


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
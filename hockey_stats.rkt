#lang racket

(require net/url)

(define myurl (string->url "http://stats.hockeyanalysis.com/teamstats.php?db=201516&sit=5v5&disp=1&sortdir=DESC&sort=GFPCT"))
(define myport (get-pure-port myurl))
(define site_source (port->string myport))


#| A list of possible cities for the use of searching tables for valid results     |#
(define cities  '("Florida" "Washington"  "NY Rangers" "Pittsburgh" "Tampa Bay"
                  "Los Angeles"  "St. Louis" "San Jose"   "Minnesota"
                  "NY Islanders" "Dallas"    "Boston"     "Philadelphia"
                  "Nashville"    "Winnipeg"  "Ottawa"     "Anaheim" "Montreal" "Chicago" "Arizona"
                  "Detroit"      "Columbus"     "Colorado"  "Calgary"    "Carolina"
                  "New Jersey"   "Buffalo"      "Vancouver" "Edmonton" "Toronto"))
#| A list of possible stats for the use of searching tables for valid results      |#
(define stat_reference '("Name""GP" "TOI" "GF"	"GA" "GF60" "GA60"
                               "GF%" "SF" "SA" "SF60" "SA60" "SF%" "FF" "FA"
                               "FF60" "FA60" "FF%" "CF" "CA" "CF60" "CA60" "CF%"
                               "Sh%" "Sv%" "PDO" "OZFO%" "DZFO%" "NZFO%" "DNU"))

#| Generates a league based on a list of cities given |#
(define (generate_league_table city_list)
  (cond [(null? city_list) '()]
        [else (cons (generate_table (car city_list)) (generate_league_table (cdr city_list)))]))

#| Generates a team containing stats based on the name given |#
(define (generate_table city_name)
  (cond [(not(inList? city_name cities))(error "Given city does not have a team, please consult the list")])
  (build_stats_list (car (regexp-match* (build_regex city_name cities) site_source)) city_name)
  )
#| A Boolean procedure that returns true if the city is valid |#
(define (inList? city_name city_list)
  (cond [(null? city_list) #f]
        [(eqv? city_name (car city_list)) #t]
        [else (inList? city_name (cdr city_list))]))
#| Builds a regular expression string based on the city given |#
(define (build_regex city_name city_list)
  (cond [(null? (cdr city_list)) (string-append city_name ".*" "Legend")]
        [(eqv? city_name (car city_list)) (string-append city_name ".*" (cadr city_list))]
        [else (build_regex city_name (cdr city_list))]))

#| Builds a numerical list of statistics and links it with the name of the city assoicated with the team |#
(define (build_stats_list stats_line city_name)
  (cons city_name (string_list->number_list (regexp-match* #rx"[0-9]+\\.?:?[0-9]*" stats_line))))

#| Converts a list of strings into a list of numbers for arithmetic |#
(define (string_list->number_list string_list)
  (cond [(null? string_list)'()]
        [else (cons (string->number (car string_list)) (string_list->number_list (cdr string_list)))]))
#| NOTE: THIS FUNCTION BREAKS THE TOI STAT IF YOU WANT TO USE IT AVOID THIS FUNCTION |#


#| An object representing the NHL's 30 teams |#
(define NHL (generate_league_table cities))



#| Table Accessors |#

#| Takes a league and the string of a city ex: "Boston" and returns the team objet |#
(define (search_team league_table city_name)
  (cond [(null? league_table)(error "Error in search_table that city could not be found, please consult the cites list")]
        [(equal? city_name (caar league_table)) (car league_table)]
        [else (search_team (cdr league_table) city_name)]))



;NOTE: Time on Ice (TOI) is going to be set to #f by string->number because it is a time. We don't really need it for this poject
; but if you really want it you'd have to work around the build_stats_list procedure


#| Takes a stastic , a team object (LIST OF STATS) and the reference table and returns the number for that stat |#
(define (search_stats stat team reference)
  (cond [(null? team)(error "That is not a valid stat")]
        [(equal? stat (car reference))(car team)]
        [else (search_stats stat (cdr team) (cdr reference))]))
#| In this product we use the stat_reference table at the top |#

#| Accessors Example: Remove comments to see results 
(define Bruins (search_team NHL "Boston"))
Bruins
(search_stats "GF%" Bruins stat_reference)
|#

#| This should display the Bruins team then |#



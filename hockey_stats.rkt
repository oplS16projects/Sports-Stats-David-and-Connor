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
(define stat_reference '("Name" "GP"   "TOI"  "GF"  "GA"    "GF60"  "GA60"
                                "GF%"  "SF"   "SA"  "SF60"  "SA60"  "SF%"   "FF"   "FA"
                                "FF60" "FA60" "FF%" "CF"    "CA"    "CF60"  "CA60" "CF%"
                                "Sh%"  "Sv%"  "PDO" "OZFO%" "DZFO%" "NZFO%" "DNU"))


#| Generates a probability of victory based on two given teams |#
(define (pick_teams team1 team2)
  (generate_chances (search_team NHL team1) (search_team NHL team2)))

#| Finds the ratio between points earned and possible points   |#
(define (generate_chances team1 team2)
  (/ (generate_probability team1 team2)
     (total_possible_points)))

#| Find sthe probability and assigns points earned for a team  |#
(define (generate_probability team1 team2)
  (+ (generate_goals_against team1 team2)
     (generate_goals_for team1 team2)
     (generate_shots_for team1 team2)
     (generate_save_percentage team1 team2)
     (generate_corsi team1 team2)
     ))

#| Finds the total number of points possible based on given stats |#
(define (total_possible_points)
 (+ goals_against
    goals_for
    shots_for
    save_percentage
    corsi)
  )


#|                                                          |#
#|            STATISTICAL EVALUATION FUNCTIONS              |#
#|      NOTE ABOUT THESE ON WEIGHTED FUNCTIONS SECTION      |#





#| Generates a number for team1 based on 1- (GA1/(GA1+GA2)) |#

(define (generate_goals_against team1 team2)
  (*  (- 1 (/ (- (search_stats "GA" team1 stat_reference) ga_offset)
  (+  (- (search_stats "GA" team1 stat_reference) ga_offset)
      (- (search_stats "GA" team2 stat_reference) ga_offset))))
   goals_against))

#| Generates a number for team1 based on (GF1/(GF1+GF2)     |#
(define (generate_goals_for team1 team2)
  (*  (/ (- (search_stats "GF" team1 stat_reference) gf_offset)
  (+  (- (search_stats "GF" team1 stat_reference) gf_offset)
      (- (search_stats "GF" team2 stat_reference) gf_offset)))
   goals_for))


#| Generates a number for team1 based on (SF1/(SF2+SF1)     |#
(define (generate_shots_for team1 team2)
  (*  (/ (- (search_stats "SF" team1 stat_reference) sf_offset)
  (+  (- (search_stats "SF" team1 stat_reference) sf_offset)
      (- (search_stats "SF" team2 stat_reference) sf_offset)))
   shots_for))
#| Generates a number for team1 based on (Sv%1/(Sv%2+Sv%1)  |#
(define (generate_save_percentage team1 team2)
  (*  (/ (- (search_stats "Sv%" team1 stat_reference) s%_offset)
  (+  (- (search_stats "Sv%" team1 stat_reference) s%_offset)
      (- (search_stats "Sv%" team2 stat_reference) s%_offset)))
   save_percentage))
#| Generates a number for team1 based on (CF%1/(CF%2+CF%1)  |#
(define (generate_corsi team1 team2)
  (*  (/ (- (search_stats "CF%" team1 stat_reference) c_offset)
  (+ (- (search_stats "CF%" team1 stat_reference) c_offset)
     (- (search_stats "CF%" team2 stat_reference) c_offset)))
   corsi))


#|                                                          |#
#|            STATISTICAL GENERATION FUNCTIONS              |#
#|                                                          |#



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



#|                                                          |#
#|                  TABLE ACCESSORS                         |#
#|                                                          |#

#| Takes a league and the string of a city ex: "Boston" and returns the team objet |#
(define (search_team league_table city_name)
  (cond [(null? league_table)(error "Error in search_table that city could not be found, please consult the cites list")]
        [(equal? city_name (caar league_table)) (car league_table)]
        [else (search_team (cdr league_table) city_name)]))


#| NOTE: Time on Ice (TOI) is going to be set to #f by string->number because it is a time. We don't really need it for this poject
   but if you really want it you'd have to work around the build_stats_list procedure |#


#| Takes a stastic , a team object (LIST OF STATS) and the reference table and returns the number for that stat |#
(define (search_stats stat team reference)
  (cond [(null? team)(error "That is not a valid stat")]
        [(equal? stat (car reference))(car team)]
        [else (search_stats stat (cdr team) (cdr reference))]))
#| In this procdure we use the stat_reference table at the top |#

#| Finds the lowest number of a stat i nthe league             |#
(define (lowest_stat stat)
  (lowest_element (create_stat_sheet stat NHL)))

#| Creates a list on a single stat for the entire league       |#
(define (create_stat_sheet stat league_table)
  (cond [(null? league_table) '() ]
        [else  (cons (search_stats stat (search_team NHL (caar league_table)) stat_reference)
                    (create_stat_sheet stat (cdr league_table)))]))

#| Finds the lowest element in a given list                    |#
(define (lowest_element lst)
  (lowest-help lst (car lst)))
(define(lowest-help lst smallest)
    (cond [(null? lst) smallest]
          [(<= (car lst) smallest)(lowest-help (cdr lst) (car lst))]
          [else (lowest-help (cdr lst) smallest)])
    )

(define (calculate_wins_table cities_table)
  (define (calculate_wins city league)
    (define (calculate_wins_help city league wins)
      (cond [(null? league) wins]
            [(equal? city (car league))(calculate_wins_help city (cdr league) wins)]
            [(win? (pick_teams city (car league)))(calculate_wins_help city (cdr league) (+ 1 wins))]
            [(loss?(pick_teams city (car league)))(calculate_wins_help city (cdr league) wins)]
            ))
    (calculate_wins_help city league 0))
  (cond [(null? cities_table) '() ]
        [else (cons (calculate_wins (car cities_table) cities) (calculate_wins_table (cdr cities_table)))]))

#|
(define (find_best_team wins_table cities_table)
  (define (find_best_help wins_table cities_table current)
    (cond [(null? wins_table) '()]
          [(null? cities_table)(error "oop")]
          [(= (car wins_table) current) (cons (car cities_table) (find_best_help (calculate_wins_table cities) cities (- current 1)))]
          [else (find_best_help (cdr wins_table) (cdr cities_table) current)]
          ))
  (find_best_help wins_table cities_table 29))
|#

(define (win? prob)
  (cond [(> prob .5) #t]
        [else #f]))

(define (loss? prob)
  (cond [(< prob .5) #t]
        [else #f]))



#| Accessors Example: Remove comments to see results 
(define Bruins (search_team NHL "Boston"))
Bruins
(search_stats "GF%" Bruins stat_reference)
|#

#| This should display the Bruins team then |#



#|                                                          |#
#|                  WEIGHTED FUNCTIONS                      |#
#|                                                          |#



#| NOTE ON STATISTICAL FUNCTIONS                            |#
#| All of the statistics used in this program have been altered
   to subtract 95% of the lowest stat from each catagory. This
   increases the difference between the best and worst teams and
   provides more meaningful results                         |#
(define goals_against 115)
(define ga_offset (* .99 (lowest_stat "GA")))

(define goals_for 120)
(define gf_offset (* .99 (lowest_stat "GF")))

(define goals_differential 0)

(define shots_for 50)
(define sf_offset (* .99 (lowest_stat "SF")))

(define save_percentage 30)
(define s%_offset (* .99(lowest_stat "Sv%")))

(define corsi 100)
(define c_offset (* .99 (lowest_stat "CF%")))






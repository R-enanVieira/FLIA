(define (domain lights-out)
  (:requirements :strips :typing :equality :negative-preconditions :disjunctive-preconditions)
  (:types position)

  (:predicates
    (same-row ?x1 ?y1 ?x2 ?y2 - position) 
    (same-column ?x1 ?y1 ?x2 ?y2 - position) 
    (is-off ?x ?y - position)
    (is-red ?x ?y - position)
    (is-green ?x ?y - position)
    (is-blue ?x ?y - position)
    (is-static ?x ?y - position)
    (is-static-hv ?x ?y - position)
    (is-static-v ?x ?y - position)
    (is-static-h ?x ?y - position)
  )
  
  (:action onclick
    :parameters (?x ?y - position)
    :precondition (or
                      (not(is-off ?x ?y))
                      (is-static ?x ?y)
                   )

    :effect 
    (and
      (forall
        (?w - position) 
        (and
	        (when
            (and
              (same-row ?x ?y ?w ?y)
              (not(= ?w ?x))
              (not (is-static-v ?w ?y))
              (not (is-static-hv ?w ?y))
            ) 
            (and
              (when
                (is-off ?w ?y)
                (and
                  (not(is-off ?w ?y))
                  (is-red ?w ?y)
                )
              )
              (when
                (is-red ?w ?y)
                (and
                  (not(is-red ?w ?y))
                  (is-green ?w ?y)
                )
              )
              (when
                (is-green ?w ?y)
                (and
                  (not(is-green ?w ?y))
                  (is-blue ?w ?y)
                )
              )
              (when
                (is-blue ?w ?y)
                (and
                  (not(is-blue ?w ?y))
                  (is-off ?w ?y)
                )
              )
            )
          )
          (when
            (and
              (same-row ?x ?y ?w ?y)
              (not(is_static ?w ?y))
            )
            (and
              (when
                (is-off ?w ?y)
                (and
                  (not(is-off ?w ?y))
                  (is-red ?w ?y)
                )
              )
              (when
                (is-red ?w ?y)
                (and
                  (not(is-red ?w ?y))
                  (is-green ?w ?y)
                )
              )
              (when
                (is-green ?w ?y)
                (and
                  (not(is-green ?w ?y))
                  (is-blue ?w ?y)
                )
              )
              (when
                (is-blue ?w ?y)
                (and
                  (not(is-blue ?w ?y))
                  (is-off ?w ?y)
                )
              )
            )
          )
        )
      )
      (forall
        (?w - position) 
        (and
          (when
            (and
              (same-column ?x ?y ?x ?w)
              (not (= ?w ?y))
              (not (is-static-v ?x ?w))
              (not (is-static-hv ?x ?w))
            ) 
            (and
              (when
                (is-off ?x ?w)
                (and
                  (not(is-off ?x ?w))
                  (is-red ?x ?w)
                )
              )
              (when
                (is-red ?x ?w)
                (and
                  (not(is-red ?x ?w))
                  (is-green ?x ?w)
                )
              )
              (when
                (is-green ?x ?w)
                (and
                  (not(is-green ?x ?w))
                  (is-blue ?x ?w)
                )
              )
              (when
                (is-blue ?x ?w)
                (and
                  (not(is-blue ?x ?w))
                  (is-off ?x ?w)
                )
              )
            )
          )
          (when
            (and
              (same-column ?x ?y ?x ?w)
              (not(is_static ?x ?w))
            )
            (and
              (when
                (is-off ?x ?w)
                (and
                  (not(is-off ?x ?w))
                  (is-red ?x ?w)
                )
              )
              (when
                (is-red ?x ?w)
                (and
                  (not(is-red ?x ?w))
                  (is-green ?x ?w)
                )
              )
              (when
                (is-green ?x ?w)
                (and
                  (not(is-green ?x ?w))
                  (is-blue ?x ?w)
                )
              )
              (when
                (is-blue ?x ?w)
                (and
                  (not(is-blue ?x ?w))
                  (is-off ?x ?w)
                )
              )
            )
          )
        )
      )
    )
  )
)

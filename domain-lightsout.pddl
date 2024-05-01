(define (domain lights-out)
  (:requirements :strips :typing :equality :negative-preconditions :disjunctive-preconditions)
  (:types position)

  (:predicates
    (same-row ?xy1 ?xy2 - position) 
    (same-column ?xy1 ?xy2 - position) 
    (is-off ?xy - position)
    (is-red ?xy - position)
    (is-green ?xy - position)
    (is-blue ?xy - position)
    (is-static ?xy - position)
    (is-static-hv ?xy - position)
    (is-static-v ?xy - position)
    (is-static-h ?xy - position)
  )
  
  (:action onclick
    :parameters (?xy - position)
    :precondition (and
                   )

    :effect(and
      (when
        (not(is-static ?xy))
        (and
         (when
            (is-off ?xy)
            (and
              (not(is-off ?xy))
              (is-red ?xy)
            )
          )
          (when
            (is-red ?xy)
            (and
              (not(is-red ?xy))
              (is-green ?xy)
            )
          )
          (when
            (is-green ?xy)
            (and
              (not(is-green ?xy))
              (is-blue ?xy)
            )
          )
          (when
            (is-blue ?xy)
            (and
              (not(is-blue ?xy))
              (is-off ?xy)
            )
          )
        )
      )
      (forall
        (?vw - position) 
        (and
	      (when
            (and
              (same-row ?xy ?vw)
              (not(= ?xy ?vw))
              (not (is-static-h ?vw))
              (not (is-static-hv ?vw))
            ) 
            (and
              (when
                (is-off ?vw)
                (and
                  (not(is-off ?vw))
                  (is-red ?vw)
                )
              )
              (when
                (is-red ?vw)
                (and
                  (not(is-red ?vw))
                  (is-green ?vw)
                )
              )
              (when
                (is-green ?vw)
                (and
                  (not(is-green ?vw))
                  (is-blue ?vw)
                )
              )
              (when
                (is-blue ?vw)
                (and
                  (not(is-blue ?vw))
                  (is-off ?vw)
                )
              )
            )
          )
          (when
            (and
              (same-column ?vw ?xy)
              (not(= ?xy ?vw))
              (not (is-static-v ?vw))
              (not (is-static-hv ?vw))
            ) 
            (and
              (when
                (is-off ?vw)
                (and
                  (not(is-off ?vw))
                  (is-red ?vw)
                )
              )
              (when
                (is-red ?vw)
                (and
                  (not(is-red ?vw))
                  (is-green ?vw)
                )
              )
              (when
                (is-green ?vw)
                (and
                  (not(is-green ?vw))
                  (is-blue ?vw)
                )
              )
              (when
                (is-blue ?vw)
                (and
                  (not(is-blue ?vw))
                  (is-off ?vw)
                )
              )
            )
          )
        )
      )
    )
  )
)

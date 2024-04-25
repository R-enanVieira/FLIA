(:define (domain lights-out)
  (:requirements :strips :typing :universal-preconditions :existential-preconditions :conditional-effects)
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
    (ok)
  )
  
  (:action onclick
    :parameters (?x ?y - position)
    :preconditions (or
                      not(is_off ?x ?y)
                      (is_static ?x ?y)
                   )

    :effects (
      (forall
        (?w - position) 
        (when
          (and
            (same-row ?x ?y ?w ?y)
            (!= ?w ?x)
            (not (is-static-v ?w ?y))
            (not (is-static-hv ?w ?y))
          ) 
          (
            (when
              (
                (is-off ?w ?y)
                (ok)
              )
              (and
                (not(is-off ?w ?y))
                (is-red ?w ?y)
                (not(ok))
              )
            )
            (when
              (
                (is-red ?w ?y)
                (ok)
              )
              (and
                (not(is-red ?w ?y))
                (is-green ?w ?y)
                (not(ok))
              )
            )
            (when
              (
                (is-green ?w ?y)
                (ok)
              )
              (and
                (not(is-green ?w ?y))
                (is-blue ?w ?y)
                (not(ok))
              )
            )
            (when
              (
                (is-blue ?w ?y)
                (ok)
              )
              (and
                (not(is-blue ?w ?y))
                (is-off ?w ?y)
                (not(ok))
              )
            )
            (ok)
          )
        )
        (when
          (and
            (same-row ?x ?y ?w ?y)
            (not(is_static ?w ?y))
          )
          (
            (when
              (
                (is-off ?w ?y)
                (ok)
              )
              (and
                (not(is-off ?w ?y))
                (is-red ?w ?y)
                (not(ok))
              )
            )
            (when
              (
                (is-red ?w ?y)
                (ok)
              )
              (and
                (not(is-red ?w ?y))
                (is-green ?w ?y)
                (not(ok))
              )
            )
            (when
              (
                (is-green ?w ?y)
                (ok)
              )
              (and
                (not(is-green ?w ?y))
                (is-blue ?w ?y)
                (not(ok))
              )
            )
            (when
              (
                (is-blue ?w ?y)
                (ok)
              )
              (and
                (not(is-blue ?w ?y))
                (is-off ?w ?y)
                (not(ok))
              )
            )
            (ok)
          )
        )
    )
    (forall
        (?w - position) 
        (when
          (and
            (same-column ?x ?y ?x ?w)
            (!= ?w ?y)
            (not (is-static-v ?x ?w))
            (not (is-static-hv ?x ?w))
          ) 
          (
            (when
              (
                (is-off ?x ?w)
                (ok)
              )
              (and
                (not(is-off ?x ?w))
                (is-red ?x ?w)
                (not(ok))
              )
            )
            (when
              (
                (is-red ?x ?w)
                (ok)
              )
              (and
                (not(is-red ?x ?w))
                (is-green ?x ?w)
                (not(ok))
              )
            )
            (when
              (
                (is-green ?x ?w)
                (ok)
              )
              (and
                (not(is-green ?x ?w))
                (is-blue ?x ?w)
                (not(ok))
              )
            )
            (when
              (
                (is-blue ?x ?w)
                (ok)
              )
              (and
                (not(is-blue ?x ?w))
                (is-off ?x ?w)
                (not(ok))
              )
            )
            (ok)
          )
        )
        (when
          (and
            (same-column ?x ?y ?x ?w)
            (not(is_static ?x ?w))
          )
          (
            (when
              (
                (is-off ?x ?w)
                (ok)
              )
              (and
                (not(is-off ?x ?w))
                (is-red ?x ?w)
                (not(ok))
              )
            )
            (when
              (
                (is-red ?x ?w)
                (ok)
              )
              (and
                (not(is-red ?x ?w))
                (is-green ?x ?w)
                (not(ok))
              )
            )
            (when
              (
                (is-green ?x ?w)
                (ok)
              )
              (and
                (not(is-green ?x ?w))
                (is-blue ?x ?w)
                (not(ok))
              )
            )
            (when
              (
                (is-blue ?x ?w)
                (ok)
              )
              (and
                (not(is-blue ?x ?w))
                (is-off ?x ?w)
                (not(ok))
              )
            )
            (ok)
          )
        )
    )
  )
)

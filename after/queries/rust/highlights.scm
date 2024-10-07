;; extends

(
    "::"
    @DoubleColon
    (#set! "priority" 105)
)

(
    ":"
    @Colon
    (#set! "priority" 105)
)

(
    "->"
    @Arrow
    (#set! "priority" 105)
)

(
    "=>"
    @BigArrow
    (#set! "priority" 105)
)

(
    ">"
    @GreaterThan
    (#set! "priority" 105)
)

(
    "<"
    @SmallerThan
    (#set! "priority" 105)
)

(
    ["todo!"]
    @TodoMacro.test
    (#set! "priority" 105)
)

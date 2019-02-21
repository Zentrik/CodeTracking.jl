function isfuncexpr(ex)
    ex.head == :function && return true
    if ex.head == :(=)
        a = ex.args[1]
        if isa(a, Expr)
            while a.head == :where
                a = a.args[1]
                isa(a, Expr) || return false
            end
            a.head == :call && return true
        end
    end
    return false
end

fileline(lin::LineInfoNode) = String(lin.file), lin.line

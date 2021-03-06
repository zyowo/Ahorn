macro catchall(expr)
    quote 
        try
            $(expr |> esc)

        catch e
            println(Base.stderr, e)
            
            for (exc, bt) in Base.catch_stack()
                showerror(Base.stderr, exc, bt)
                println()
            end
        end
    end
end
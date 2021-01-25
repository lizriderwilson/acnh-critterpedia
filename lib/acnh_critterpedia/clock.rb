class Clock

    def time
        Time.now.strftime("%l:%M%p - %A, %B %e %Y")
    end

end
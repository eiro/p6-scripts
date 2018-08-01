# STDIN contains a set of slides.vim
# those slides would be duplicated bullet by bullet

lines =
    STDIN
    .gets_to_end
    .split("\n")
    .tap(&.pop)

def render(it)
    it.each { |l| puts l}
end

parts = [] of String

lines.each { |l|
    if /›/.match(l)
        render parts unless parts.empty?
        parts = [l]
    else
        render parts if //.match(l)
        parts << l
    end
}

render parts


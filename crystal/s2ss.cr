# s2ss: slide to slides

# this is program split some slides in slides.vim format
# into new ones to make bullets appear one by one.

# s2ss < foo.slides > hidden.slides
#
# › slides 2 slides
#
#      a tool
#         (written in crystal)
#      a vim companion

# becomes

# › slides 2 slides
#
#      a tool
#         (written in crystal)
# › slides 2 slides
#
#      a tool
#         (written in crystal)
#      a vim companion

puts typeof(STDIN)

# lines = STDIN.read_lines
# 
# def render(it)
#     it.each { |l| puts l}
# end
# 
# parts = [] of String
# 
# lines.each { |l|
#     if /›/.match(l)
#         render parts unless parts.empty?
#         parts = [l]
#     else
#         render parts if //.match(l)
#         parts << l
#     end
# }
# 
# render parts
# 

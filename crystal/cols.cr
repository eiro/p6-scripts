STDIN
.gets_to_end
.split("\n")
.map( &.split(ARGV[0]) )
.tap( &.pop )
.transpose
.map { |col|
    fmt = "%-#{ col.map(&.size).max }s"
    col.map! { |cell| fmt % cell } }
.transpose
.each { |line| STDOUT << line.join(';') << '\n' }

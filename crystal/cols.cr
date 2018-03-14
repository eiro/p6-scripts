ss =
    STDIN
    .gets_to_end
    .split("\n")
    .map( &.split(':') )
    .tap( &.pop )
    .transpose

ss.each { |col|
    fmt = "%-#{
        col.reduce(0) { |max,cell|
            l = cell.size
            l > max ? l : max
        } }s"
    col.map! { |cell| fmt % cell }
}

ss
.transpose
.each { |line| STDOUT << line.join(';') << '\n' }



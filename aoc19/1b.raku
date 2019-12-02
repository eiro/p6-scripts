sub fuel ($x) { ($x / 3 ).Int - 2 }
sub all-fuel( $x ) { [+] $x.&fuel, *.&fuel ...^ * < 0 }
lines.map(*.&all-fuel).sum.say;

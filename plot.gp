folders = "ibm5 ibm6 ibm7 ecj java5 java6 java7"
titles(n) = (n eq "ibm5") ? "IBM JDK5" : \
           (n eq "ibm6") ? "IBM JDK6" : \
           (n eq "ibm7") ? "IBM JDK7" : \
           (n eq "ecj") ? "ECJ+Oracle Java7" : \
           (n eq "java5") ? "Oracle JDK5" : \
           (n eq "java6") ? "Oracle JDK6" : \
           (n eq "java7") ? "Oracle JDK7" : "";

set term png
set key font "Times,9" spacing .5

# CatPlus
set title "Concatenation with plus"
set yrange [0:220]
set ylabel "ms (less is better)"
set output "catplus.png"
plot "ibm5/catplus.log" title titles("ibm5") with lines, \
     "ibm6/catplus.log" title titles("ibm6") with lines, \
     "ibm7/catplus.log" title titles("ibm7") with lines, \
     "ecj/catplus.log" title titles("ecj") with lines, \
     "java5/catplus.log" title titles("java5") with lines, \
     "java6/catplus.log" title titles("java6") with lines, \
     "java7/catplus.log" title titles("java7") with lines

# CatSB
set title "Concatenation with new StringBuffer()"
set yrange [0:220]
set ylabel "ms (less is better)"
set output "catsb.png"
plot "ibm5/catsb.log" title titles("ibm5") with lines, \
     "ibm6/catsb.log" title titles("ibm6") with lines, \
     "ibm7/catsb.log" title titles("ibm7") with lines, \
     "ecj/catsb.log" title titles("ecj") with lines, \
     "java5/catsb.log" title titles("java5") with lines, \
     "java6/catsb.log" title titles("java6") with lines, \
     "java7/catsb.log" title titles("java7") with lines

# CatSB2
set title "Concatenation with new StringBuffer(base)"
set yrange [0:220]
set ylabel "ms (less is better)"
set output "catsb2.png"
plot "ibm5/catsb2.log" title titles("ibm5") with lines, \
     "ibm6/catsb2.log" title titles("ibm6") with lines, \
     "ibm7/catsb2.log" title titles("ibm7") with lines, \
     "ecj/catsb2.log" title titles("ecj") with lines, \
     "java5/catsb2.log" title titles("java5") with lines, \
     "java6/catsb2.log" title titles("java6") with lines, \
     "java7/catsb2.log" title titles("java7") with lines

# Together
set output "catmulti.png"
set multiplot layout 1,3 title "Concatenation tests results"
set yrange [0:220]
set ylabel "ms (less is better)"

plot "ibm5/catplus.log" title titles("ibm5") with lines, \
     "ibm6/catplus.log" title titles("ibm6") with lines, \
     "ibm7/catplus.log" title titles("ibm7") with lines, \
     "ecj/catplus.log" title titles("ecj") with lines, \
     "java5/catplus.log" title titles("java5") with lines, \
     "java6/catplus.log" title titles("java6") with lines, \
     "java7/catplus.log" title titles("java7") with lines

plot "ibm5/catsb.log" title titles("ibm5") with lines, \
     "ibm6/catsb.log" title titles("ibm6") with lines, \
     "ibm7/catsb.log" title titles("ibm7") with lines, \
     "ecj/catsb.log" title titles("ecj") with lines, \
     "java5/catsb.log" title titles("java5") with lines, \
     "java6/catsb.log" title titles("java6") with lines, \
     "java7/catsb.log" title titles("java7") with lines

plot "ibm5/catsb2.log" title titles("ibm5") with lines, \
     "ibm6/catsb2.log" title titles("ibm6") with lines, \
     "ibm7/catsb2.log" title titles("ibm7") with lines, \
     "ecj/catsb2.log" title titles("ecj") with lines, \
     "java5/catsb2.log" title titles("java5") with lines, \
     "java6/catsb2.log" title titles("java6") with lines, \
     "java7/catsb2.log" title titles("java7") with lines

unset multiplot
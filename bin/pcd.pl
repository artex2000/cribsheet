#!/usr/bin/perl

while (<>) {
    if (/^[ \t]*(.*Guid)\.(.*)\|(.*)$/) {
        print "PcdMapping\n";
        print "\tName = \"$2\"\n";
        print "\tGuidSpace = \"$1\"\n";
        print "\tPcdType = \"PcdsFixedAtBuild\"\n";
        print "\tValue = \"$3\"\n";
        print "\tOffset = 00h\n";
        print "\tLength = 00h\n";
        print "\tTargetDSC = Yes\n";
        print "End\n\n";
    }
}

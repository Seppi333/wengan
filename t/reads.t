use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../perl";
use Wengan::Reads;

# create temporary directory for data
my $tmpdir = "$FindBin::Bin/tmp";
mkdir $tmpdir unless -d $tmpdir;

# create two small FASTQ files and gzip them
my $fq1 = "$tmpdir/s1.fq";
my $fq2 = "$tmpdir/s2.fq";
open my $fh, '>', $fq1 or die $!;
print $fh "\@r1\nACGT\n+\n!!!!\n";
close $fh;
open $fh, '>', $fq2 or die $!;
print $fh "\@r2\nTGCA\n+\n!!!!\n";
close $fh;

system('gzip','-f',$fq1) == 0 or die "gzip failed";
system('gzip','-f',$fq2) == 0 or die "gzip failed";

$fq1 .= '.gz';
$fq2 .= '.gz';

my $reads = Wengan::Reads->new();
ok(!$reads->is_short, 'new object has no short reads');

$reads->add_short_reads("$fq1,$fq2");

ok($reads->is_short, 'short reads detected after add_short_reads');

is($reads->get_read_length, 5, 'read length detected correctly');

unlink $fq1;
unlink $fq2;
rmdir $tmpdir;

done_testing();

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../perl";
use Wengan::Mapper::FML;

my $fml = Wengan::Mapper::FML->new(x => 'pacraw');
my $sizes = $fml->_get_inserts_sizes('');
my $expected = [qw(500 1000 2000 3000 4000 5000 6000 7000 8000 10000 15000 20000)];
is_deeply($sizes, $expected, 'default pacraw insert sizes');

done_testing();

use strict; use warnings;
use FindBin qw/ $RealBin /;
use Test::More;
use Path::Tiny;
use Dancer2;
use Dancer2::Plugin::SyntaxHighlight::Perl;

my $code_filename = "$RealBin/code.perl.out";
chomp( my $wanted = do { local $/; <DATA> } );

{
    note 'Testing with ref to scalar';

    my $perl = path( $code_filename )->slurp;
    ok my $html = highlight_perl( \$perl ),              'Got output from plugin';

    is $html, $wanted,                                   'Output is correct';
}

{
    note 'Testing with file';

    ok my $html = highlight_perl( $code_filename ),      'Got output from plugin';

    is $html, $wanted,                                   'Output is correct';
}

done_testing;

__DATA__
<span class="cast">$</span> <span class="word">perl</span> <span class="word">inc</span><span class="operator">/</span><span class="word">fork</span><span class="octal">-01</span><span class="operator">.</span><span class="word">pl</span> 
<span class="number">25470</span> <span class="number">0</span>
<span class="number">25470</span> <span class="number">1</span>
<span class="number">25470</span> <span class="number">2</span>
<span class="number">25470</span> <span class="number">3</span>
<span class="number">25470</span> <span class="number">4</span>
<span class="number">25470</span> <span class="number">5</span>
<span class="number">25470</span> <span class="word">a</span>
<span class="number">25470</span> <span class="word">b</span>
<span class="number">25470</span> <span class="word">c</span>
<span class="number">25470</span> <span class="word">d</span>
<span class="number">25470</span> <span class="word">e</span>
<span class="number">25470</span> <span class="word">done</span> <span class="word">in</span> <span class="float">7.003</span><span class="substitute">s
</span>

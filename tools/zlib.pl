#!/usr/bin/perl
# Perl script (zlib.pl) to inflate and deflate AppleHDA resource files in Mountain Lion DP3 and greater.
#
# Version 0.1 - Copyright (c) 2012 by RevoGirl <DutchHockeyGoalie@yahoo.com>
#

use strict;
use warnings;

use Compress::Zlib;

my $data = '';
my ($output, $status);

binmode STDOUT;

sub inflate
{
  my $file = shift;
  my $fout = shift;
  my $x = inflateInit() or die "Cannot create a inflation stream\n";

  if (open(FILE, $file) && open(FOUT, ">".$fout))
  {
    binmode FILE;
    binmode FOUT;

    while (read(FILE, $data, 4096))
    {
      ($output, $status) = $x->inflate(\$data);

      print FOUT $output if $status == Z_OK or $status == Z_STREAM_END;

      last if $status != Z_OK;
    }

    close (FILE);

    die "inflation failed\n" unless $status == Z_STREAM_END;
  }
}

sub deflate
{
  my $file = shift;
  my $fout = shift;
  my $x = deflateInit() or die "Cannot create a deflation stream\n";

  if (open(FILE, $file) && open(FOUT, ">".$fout))
  {
    binmode FILE;
    binmode FOUT;

    while (read(FILE, $data, 4096))
    {
      ($output, $status) = $x->deflate(\$data);

      $status == Z_OK or die "deflation failed\n";

      print FOUT $output;
    }
  
    ($output, $status) = $x->flush();
  
    $status == Z_OK or die "deflation failed\n";

    print FOUT $output;
  }
}

sub filename()
{
    my $file = shift;
    if ($file =~ /(^.*)\.([a-zA-Z]+)$/) {
	return ($1, $2);
    }
    return ("", "");
}

sub main()
{
  my $file = $ARGV[0];
  if (!$file)
  {
    die "Specify a .zlib file to inflate it\n\nSpecify a .xml file to deflate it\n";   
  }
  my @tmp = &filename($file);
  
  if ($tmp[1] eq "zlib")
  {
    inflate ($file, $tmp[0]);
    print "inflation done to ".$tmp[0]."\n"
  }

  if ($tmp[1] eq "xml")
  {
    deflate ($file, $file.".zlib");
    print "deflation done to ".$file.".zlib\n";
  }
}

main();
exit(0);

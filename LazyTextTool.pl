#!/usr/bin/perl -sw
use Term::ANSIColor;
use warnings;
use strict;
my $os = $^O;
###################################################################################################################
sub what (){
print color('red'),"  1- Back    \n  2- Exit\n\n";
print color('red'),"      Select What You Want : ";
print color('reset');
my $what1 = <STDIN>;
chomp $what1;
if($what1 eq '1')
{
menu();
}
if($what1 eq '2')
{
system $^O eq 'MSWin32' ? 'cls' : 'clear';
print color('green'),"******             ******\n\n         THX ^_^\n\n******             ******";
print color('reset');
exit;
}

}
#------------------------------------here is the banner-----------------------#
sub menu(){
system $^O eq 'MSWin32' ? 'cls' : 'clear';
print color('green'),   ".....................................................................................\n";
print color('bold red'),"*************************************************************************************\n";
print color('bold yellow'),"                          <..Text Tool By Khaled Elborey..>                   \n";
print color("bold cyan"),"                                | Just Lazy Script |                       \n";
print color('green'),   ".....................................................................................\n";
print color('bold red'),"*************************************************************************************\n";
print color('bold yellow'),"                               facebook.com/rx.0.0.rx  \n                         \n";
print color('green'),   ".....................................................................................\n";
print color('bold red'),"*************************************************************************************\n";


##################################################################################################################

#------------------------ Reset color  -----------------------------#
print color('reset');
print color('bold white'),"[";
print color('green'),"1";
print color('bold white'),"]";
print color('cyan')," Remove Dublicates\n";

print color('bold white'),"[";
print color('green'),"2";
print color('bold white'),"]";
print color('cyan')," Get Email:pass Combo From Text\n";

print color('bold white'),"[";
print color('green'),"3";
print color('bold white'),"]";
print color('cyan')," Get emails from combo\n";

print color('bold white'),"[";
print color('green'),"4";
print color('bold white'),"]";
print color('cyan')," Email:pass to User:pass\n";

print color('bold white'),"[";
print color('green'),"5";
print color('bold white'),"]";
print color('cyan')," Add Domain To user:pass combo\n";

print color('bold white'),"[";
print color('green'),"6";
print color('bold white'),"]";
print color('cyan')," Add prefix/suffix into line\n";

print color('bold white'),"[";
print color('green'),"7";
print color('bold white'),"]";
print color('cyan')," Filter Mail List\n";

print color('bold white'),"[";
print color('green'),"8";
print color('bold white'),"]";
print color('cyan')," Generate Ip list From Ip Range\n";

print color('bold white'),"[";
print color('green'),"9";
print color('bold white'),"]";
print color('red')," Exit\n";

print color('white'),"      Select What You Want : ";
print color('reset');
my $select1 = <STDIN>;
chomp $select1;
if($select1 eq '1')
{
dub();
}
if($select1 eq '2')
{
comboftext();
}


if($select1 eq '3')
{
emailfcombo();
}

if($select1 eq '4')
{
 userpassfcombo();
}

if($select1 eq '5')
{
 userpasswithdomain();
}
if($select1 eq '6')
{
 addpresufix();
}
if($select1 eq '7')
{
 filter();
}

if($select1 eq '8')
{
iplfromr();
}
if($select1 eq '9')
{
system $^O eq 'MSWin32' ? 'cls' : 'clear';
print color('green'),"******             ******\n\n         THX ^_^\n\n******             ******";
print color('reset');
exit;
}

}
menu();
##################################################################################################################

#######################################Remove Duplicates##############################################################
sub dub(){
 print color('yellow'),"Input Text File name : ";
 my $dumname = <STDIN>;
 chomp $dumname;
 open DATA, $dumname or die "Couldn't open $dumname: $!\n";
 my %lines;
 print "Please Wait..\n";
 while (<DATA>) {
    open (TEXT, '>>undublicated.txt') ;
    print TEXT if not $lines{$_}++;
}
print "Done.. Check File 'undublicated.txt'\n";
what ();

}
####################################################################################################
sub comboftext() {
my @TARGETS;
my $comboline;
my $link;
print color('yellow'),"Input File name : ";
my $list=<STDIN>;
chomp($list);


chomp($list);
        open (THETARGET, "<$list") || die "[-] Can't open the file -_- are u drinking ?!";
        print color('white'),"Please Wait... : \n";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

OUTER: foreach $comboline(@TARGETS){
chomp($comboline);
if($comboline =~ /[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}:(?:[a-zA-Z0-9]{5,})/){
open (TEXT,">>leechedcombo.txt");
        print TEXT "$comboline\n";
        close (TEXT);
}
}
print color('green'),"Done. Check File 'leechedcombo.txt'... \n ";
what ();


}
######################################################################################################
sub emailfcombo(){
my @email;
my @TARGETS;
my $comboline;
my $link;
print color('yellow'),"Input File name : ";
my $list=<STDIN>;
chomp($list);

        open (THETARGET, "<$list") || die "[-] Can't open the file -_- are u drinking ?!";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;
OUTER: foreach $comboline(@TARGETS){
chomp($comboline);
if($comboline =~ /[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}:(?:[a-zA-Z0-9]{5,})/){
@email = split(/\:/,$comboline);

open (TEXT, ">>emailfromcombo.txt");
print TEXT "$email[0]\n";
        close (TEXT);
}
}
print color('green'),"Done. Check File 'emailfromcombo.txt'... \n ";
what ();

}
######################################userpassfromcombo###########################
sub userpassfcombo(){
my @email;
my $email;
my @TARGETS;
my $comboline;
my @comboline;
my $link;
my @user;

print color('yellow'),"Input Text File name : ";
my $list=<STDIN>;

chomp($list);

        open (THETARGET, "<$list") || die "[-] Can't open the file -_- are u drinking ?!";

@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;
OUTER: foreach $comboline(@TARGETS){
chomp($comboline);
@email = split(/\:/,$comboline);
foreach $email(@email){
@user = split (/\@/,$email);
open (TEXT, ">>userpass.txt");
print TEXT "$user[0]".":"."$email[1]\n";
      close (TEXT);
      }

}
print color('green'),"Done. Check File 'userpass.txt'... \n ";
what ();
}
#################################Add Domain...##############################
sub userpasswithdomain(){
my @email;
my @TARGETS;
my $comboline;
my $link;
print color('yellow'),"Input File name : ";
my $list=<STDIN>;
chomp($list);
print color('yellow'),"Input Domain (gmail.com or yahoo.com or aol.com etc...) : ";
my $domain=<STDIN>;
chomp($domain);

        open (THETARGET, "<$list") || die "[-] Can't open the file -_- are u drinking ?!";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;
OUTER: foreach $comboline(@TARGETS){
chomp($comboline);
@email = split(/\:/,$comboline);

open (TEXT, ">>userpasswithdomain.txt");
print TEXT "$email[0]"."@"."$domain".":"."$email[1]\n";
        close (TEXT);

}
print color('green'),"Done. Check File 'userpasswithdomain.txt.txt'... \n ";
what ();

}

######################################ADD PREFIX AND SUFIX#################################
sub addpresufix(){
my @email;
my @TARGETS;
my $comboline;
my $link;
print color('yellow'),"Input File name : ";
my $list=<STDIN>;
chomp($list);
print color('yellow'),"Input Prefix (ex for dorks add inurl:) press enter if no : ";
my $pre=<STDIN>;
chomp($pre);
print color('yellow'),"Input Prefix (ex for dorks add site:fr ) press enter if no : ";
my $su=<STDIN>;
chomp($su);

        open (THETARGET, "<$list") || die "[-] Can't open the file -_- are u drinking ?!";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;
OUTER: foreach $comboline(@TARGETS){
chomp($comboline);
open (TEXT, ">>listwithspresufix.txt");
print TEXT "$pre"."$comboline"."$su\n";
        close (TEXT);

}
print color('green'),"Done. Check File 'listwithspresufixtxt'... \n ";
what ();

}
#################
#################################Filter mail list#################################################################
sub filter(){
print "Input File name : ";
my $list=<STDIN>;
chomp($list);
my @TARGETS;
my $line;
my $link;
my $yahooc = 0;
my $gmailc = 0;
my $hotmailc = 0;
my $aolc = 0;
my $comcastc = 0;
my $gmxc = 0;
my $outlookc = 0;
my $otherc = 0;

        open (THETARGET, "<$list") || die "[-] Can't open the file -_- are u drinking ?!";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;
OUTER: foreach $line(@TARGETS){
chomp($line);

if($line =~ /gmail./){
$gmailc++;
open (TEXT,'>>filtered/gmail.txt');
        print TEXT "$line\n";
        close (TEXT);
}
elsif ($line =~ /yahoo./){
$yahooc++;
open (TEXT,'>>filtered/yahoo.txt');
        print TEXT "$line\n";
        close (TEXT);
}
elsif ($line =~ /hotmail./){
$hotmailc++;
open (TEXT,'>>filtered/hotmail.txt');
        print TEXT "$line\n";
        close (TEXT);
}
elsif ($line =~ /aol./){
$aolc++;
open (TEXT,'>>filtered/aol.txt');
        print TEXT "$line\n";
        close (TEXT);
}
elsif ($line =~ /comcast./){
$comcastc++;
open (TEXT,'>>filtered/comcast.txt');
        print TEXT "$line\n";
        close (TEXT);
}

elsif ($line =~ /gmx./){
$gmxc++;
open (TEXT,'>>filtered/gmx.txt');
        print TEXT "$line\n";
        close (TEXT);
}
elsif ($line =~ /outlook./){
$outlookc++;
open (TEXT,'>>filtered/outlook.txt');
        print TEXT "$line\n";
        close (TEXT);
}
else {
$otherc++;
open (TEXT,'>>filtered/other.txt');
        print TEXT "$line\n";
        close (TEXT)

}
}
print color('green'),"Done.\n ";
print color('cyan'),"$gmailc   "."gmail emails\n";
print color('cyan'),"$yahooc   "."yahoo emails\n ";
print color('cyan'),"$hotmailc   "."hotmail emails\n ";
print color('cyan'),"$aolc   "."aol emails\n ";
print color('cyan'),"$comcastc   "."comcast emails\n ";
print color('cyan'),"$gmxc   "."gmx emails\n ";
print color('cyan'),"$outlookc   "."outlook emails\n ";
print color('cyan'),"$otherc   "."other emails\n ";
what ();

}
####################################################################################################################
########################################################
sub iplfromr(){
print "Input Start Ip : ";
my $startIp = <STDIN>;
print "Input End Ip : ";
my $endIp = <STDIN>;
chomp($endIp);
chomp($startIp);
sub range {
my (@ip,@newIp,$i,$newIp,$j,$k,$l,$fh);
my ($j1,$k1,$l1);
open($fh,">","ipsFromRange.txt") or die "could not open the file $!";
@ip = split(/\./,$startIp);
for($i=$ip[0];$i<=255;$i++) {
  for($j=$ip[1];$j<=255;$j++) {
    $ip[1]=0 if($j == 255);
     for($k=$ip[2];$k<=255;$k++) {
        $ip[2]=0 if($k == 255);
        for($l=$ip[3];$l<=255;$l++) {
            $ip[3]=0 if($l == 255);
            @newIp = $newIp = join('.',$i,$j,$k,$l);
            print "$newIp\n";
            print $fh "$newIp \n";
            exit if ($newIp eq $endIp);
        }
      }
    }
  }
}
range ($startIp, $endIp);

}



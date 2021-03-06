#!/bin/bash - 
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

if ! hash uudecode &>/dev/null; then
    echo 'Error: Please install uudecode.' >&2
    exit -1
fi

if [ "$1" == "-f" ] || [ "$1" == "--force" ];then
    echo "Ignoring last update date." >&2
else 
    [ "$(date +%Y%m%d -r /opt/firefox-nightly)" -ge "$(date +%Y%m%d -d yesterday)" ] && exit 0
fi

if [ "$UID" -ne 0 ]; then
    if hash sudo && groups | egrep -q "\<(sudo|wheel)\>"; then
        sudo "$0" "$@"
        exit
    else
        >&2 echo 'Root login:'
        su -c "$0" "$@"
        exit 
    fi
fi

TMPDIR=$(mktemp -d /tmp/firefox.XXXX) 
cd "$TMPDIR"

wget 'https://download.mozilla.org/?product=firefox-nightly-latest&os=linux64&lang=en-US' -O ff-nightly.tar.bz2

cd /opt
mv firefox-nightly firefox-nightly.old 2>/dev/null || true # avoid setting off set -e
tar jxf "$TMPDIR/ff-nightly.tar.bz2" \
    && (mv firefox firefox-nightly \
        && rm -rf firefox-nightly.old \
        && find -type d -print0 | xargs -0 chmod o+rx) \
    || mv firefox-nightly.old firefox-nightly

if ! [ -f /usr/local/bin/firefox-nightly ]; then
    ln -s /opt/firefox-nightly/firefox /usr/local/bin/firefox-nightly
fi

if ! [ -f /usr/share/applications/firefox-nightly.desktop ]; then
    uudecode "$0"
fi

#
# Update is now done manually
#
#if ! [ -r /etc/systemd/system/upd8-ff-nightly.timer ] ||
#   ! [ -r /etc/systemd/system/upd8-ff-nightly.service ]; then
#    while true; do
#        echo "Install cron job to update daily? (Y/N)"
#        read answer
#        if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
#            cat << 'EOF' > '/etc/systemd/system/upd8-ff-nightly.service'
#[Unit]
#Description=Update firefox nightly
#
#[Service]
#Type=oneshot
#ExecStart=/usr/local/bin/upd8-ff-nightly.sh
#EOF
#
#            cat << 'EOF' > '/etc/systemd/system/upd8-ff-nightly.timer'
#[Unit]
#Description=Update firefox nightly daily
#After=network.target
#
#[Timer]
#OnCalendar=daily
#AccuracySec=1h
#Persistent=true
#RandomizedDelaySec=60m
#
#[Install]
#WantedBy=timers.target
#EOF
#            cp "$0" '/usr/local/bin/upd8-ff-nightly.sh'
#            chmod +x '/usr/local/bin/upd8-ff-nightly.sh'
#            systemctl enable upd8-ff-nightly.timer
#            break
#        elif [ "$answer" = "n" ] || [ "$answer" = "N" ]; then
#            break
#        fi
#    done
#fi

rm $TMPDIR/ff-nightly.tar.bz2

exit 0

begin 644 /usr/share/applications/firefox-nightly.desktop
M6T1E<VMT;W`@16YT<GE="E9E<G-I;VX],2XP"DYA;64]3FEG:'1L>2!796(@
M0G)O=W-E<@I.86UE6V%S=%T]4F5S=&]L861O<B!W96(@3FEG:'1L>0I.86UE
M6V-A73U.879E9V%D;W(@=V5B($YI9VAT;'D*3F%M95MC<UT]3FEG:'1L>2!7
M96)O=L.]('!R;VALPZW%OF7$C0I.86UE6V1A73U.:6=H=&QY("T@:6YT97)N
M971B<F]W<V5R"DYA;65;96Q=/<Z@SK7/@<ZYSK?.L\ZWSX3.KL^"($YI9VAT
M;'D*3F%M95ME<UT]3F%V96=A9&]R('=E8B!.:6=H=&QY"DYA;65;971=/4YI
M9VAT;'EI('9E96)I8G)A=7-E<@I.86UE6V9A73W9A=BQV8C8L=JOV+$@V*?;
MC-F&V*K8L=F&V*K;C"!.:6=H=&QY"DYA;65;9FE=/4YI9VAT;'DM<V5L86EN
M"DYA;65;9G)=/4YA=FEG871E=7(@5V5B($YI9VAT;'D*3F%M95MG;%T]3F%V
M96=A9&]R('=E8B!.:6=H=&QY"DYA;65;:&5=/=>3UZ37D]>DUY\@UY37D->9
MUZ#7F->HUZ#7F"!.:6=H=&QY"DYA;65;:')=/4YI9VAT;'D@=V5B('!R96=L
M961N:6L*3F%M95MH=5T]3FEG:'1L>2!W96)BP[9N9\.I<WK%D0I.86UE6VET
M73U.:6=H=&QY($)R;W=S97(@5V5B"DYA;65;:F%=/4YI9VAT;'D@XX*FXX*G
MXX.6XX.[XX.6XX.IXX*FXX*V"DYA;65;:V]=/4YI9VAT;'D@[)NY(.NXC.N=
MO.R:L.R@@`I.86UE6VMU73U'97)O:V$@=&]RPZH@3FEG:'1L>0I.86UE6VQT
M73U.:6=H=&QY(&EN=&5R;F5T;R!N87+%H7EK;,27"DYA;65;;F)=/4YI9VAT
M;'D@3F5T=&QE<V5R"DYA;65;;FQ=/4YI9VAT;'D@=V5B8G)O=W-E<@I.86UE
M6VYN73U.:6=H=&QY($YE='1L97-A<@I.86UE6VYO73U.:6=H=&QY($YE='1L
M97-E<@I.86UE6W!L73U0<GIE9VS$A61A<FMA(%=75R!.:6=H=&QY"DYA;65;
M<'1=/4YI9VAT;'D@3F%V96=A9&]R(%=E8@I.86UE6W!T7T)273U.879E9V%D
M;W(@5V5B($YI9VAT;'D*3F%M95MR;UT]3FEG:'1L>2#B@),@3F%V:6=A=&]R
M($EN=&5R;F5T"DYA;65;<G5=/="2T+70L2W0L=&`T+#1@]"WT+71@"!.:6=H
M=&QY"DYA;65;<VM=/4YI9VAT;'D@+2!I;G1E<FYE=&]VP[T@<')E:&QI861A
MQ(T*3F%M95MS;%T]3FEG:'1L>2!S<&QE=&YI(&)R<VMA;&YI:PI.86UE6W-V
M73U.:6=H=&QY('=E8F)LPZ1S87)E"DYA;65;=')=/4YI9VAT;'D@5V5B(%1A
M<F%YQ+%CQ+%SQ+$*3F%M95MU9UT]3FEG:'1L>2#8JMF(V+'9@]N&V+':K]N(
M"DYA;65;=6M=/="2T+70L2W0L=&`T+#1@]"WT+71@"!.:6=H=&QY"DYA;65;
M=FE=/51RPZQN:"!D=7GANX=T('=E8B!.:6=H=&QY"DYA;65;>FA?0TY=/4YI
M9VAT;'D@Y[V1Y[N<YK6/Z*>(Y9FH"DYA;65;>FA?5%==/4YI9VAT;'D@Y[:R
MZ+>OYX"/Z*:]Y9FH"D-O;6UE;G0]0G)O=W-E('1H92!7;W)L9"!7:61E(%=E
M8@I#;VUM96YT6V%R73W8JMBUV8'8K2#8I]F$V+38J-F#V*D@V*?9A-BYV8;9
M@]BHV8C8JMF*V*D@V*?9A-BYV*?9A-F%V8K8J0I#;VUM96YT6V%S=%T]4F5S
M=&]L82!P96QA(%)E9&4*0V]M;65N=%MB;ET]X*:'X*:HX*>-X*:?X*:^X*:P
MX*:HX*>'X*:?(."FK."GC>"FL."FON"FB>"FG"#@II7@IK#@IX'@IJ@*0V]M
M;65N=%MC85T]3F%V96=U974@<&5R(&QA('=E8@I#;VUM96YT6V-S73U0<F]H
M;,.MQ;YE;L.M('-T<L.A;F5K(%=O<FQD(%=I9&4@5V5B=0I#;VUM96YT6V1A
M73U3=7)F('##I2!I;G1E<FYE='1E=`I#;VUM96YT6V1E73U);2!);G1E<FYE
M="!S=7)F96X*0V]M;65N=%ME;%T]SIS/@,Z_SX'.M<ZOSX3.M2#.O<ZQ(,^`
MSK7/@<ZYSK?.L\ZWSKC.M<ZOSX3.M2#/@\^$SK\@SK3.N<ZQSK3.K\ZZSX3/
MA<Z_("A796(I"D-O;6UE;G1;97-=/4YA=F5G=64@<&]R(&QA('=E8@I#;VUM
M96YT6V5T73U,96AI='-E('9E96)I"D-O;6UE;G1;9F%=/=BUV8'8K=BGV*H@
MV+38J-JIV8<@V*S9A]BGV8;;C"#8I]N,V8;8JMBQV8;8JB#8L=BG(-F%V+'9
MB-BQ(-F&V878I]N,VXS8KPI#;VUM96YT6V9I73U396QA82!);G1E<FYE=&EN
M(%=75RUS:79U:F$*0V]M;65N=%MF<ET]3F%V:6=U97(@<W5R(&QE(%=E8@I#
M;VUM96YT6V=L73U.879E9V%R('!O;&$@<F5D90I#;VUM96YT6VAE73W7DM><
MUYG7J=>4(->1UZC7E]>1UYD@UY37D->9UZ#7F->HUZ#7F`I#;VUM96YT6VAR
M73U0<F5T<F'%OFET92!W96(*0V]M;65N=%MH=5T]02!V:6S#H6=HPZ%LP[,@
M8L.V;F?#J7-ZPZES90I#;VUM96YT6VET73U%<W!L;W)A(&EL('=E8@I#;VUM
M96YT6VIA73WC@J;C@J?C@Y;C@I+IEK+HIJ?C@9?C@;[C@9D*0V]M;65N=%MK
M;UT][)NY[)V$(.N/C.R5A"#KBZ3KBYGKBXCKBZ0*0V]M;65N=%MK=5T]3&D@
M=&]RPZH@8FEG97)E"D-O;6UE;G1;;'1=/4YA<L6A>6MI=&4@:6YT97)N971E
M"D-O;6UE;G1;;F)=/5-U<F8@<,.E(&YE='1E=`I#;VUM96YT6VYL73U697)K
M96X@:&5T(&EN=&5R;F5T"D-O;6UE;G1;;FY=/5-U<F8@<,.E(&YE='1E=`I#
M;VUM96YT6VYO73U3=7)F('##I2!N971T970*0V]M;65N=%MP;%T]4')Z96=L
MQ(5D86YI92!S=')O;B!75U<@"D-O;6UE;G1;<'1=/4YA=F5G=64@;F$@26YT
M97)N970*0V]M;65N=%MP=%]"4ET]3F%V96=U92!N82!);G1E<FYE=`I#;VUM
M96YT6W)O73U.879I9V'(FVD@<&4@26YT97)N970*0V]M;65N=%MR=5T]T)30
MOM&!T8+1@]"_(-"R(-"8T+W1@M"UT8#0O="UT8(*0V]M;65N=%MS:UT]4')E
M:&QI861A;FEE(&EN=&5R;F5T=0I#;VUM96YT6W-L73U"<G-K86IT92!P;R!S
M<&QE='4*0V]M;65N=%MS=ET]4W5R9F$@<,.E('=E8F)E;@I#;VUM96YT6W1R
M73W$L&YT97)N970G=&4@1V5Z:6YI;@I#;VUM96YT6W5G73W8K]N'V8;9BMBG
MV*_9B=F#V8D@V*K9B-BQV*C;E=BJV83;E=BQV8;9B2#9@]N&V+':K]F)V839
MB2#8J-F(V839B=BOVX<*0V]M;65N=%MU:UT]T)_0M=&`T+70L]"[T8_0M"#1
M@=&"T+[1@-&6T+W0OM"Z(-"&T+W1@M"UT8#0O="UT8+1@PI#;VUM96YT6W9I
M73W$D.&[@R!D=7GANX=T(&/#H6,@=')A;F<@=V5B"D-O;6UE;G1;>FA?0TY=
M/>:UC^BGB.2ZDNB!E.>]D0I#;VUM96YT6WIH7U1773WG@(_HIKWGMK+IFIOG
MMK+HMZ\*1V5N97)I8TYA;64]5V5B($)R;W=S97(*1V5N97)I8TYA;65;87)=
M/=F%V*K8M=F!V*T@V8C9BMBH"D=E;F5R:6-.86UE6V%S=%T]4F5S=&]L861O
M<B!796(*1V5N97)I8TYA;65;8FY=/>"FD^"FK^"FO."GA^"FK"#@IJS@IXW@
MIK#@IK[@IHG@IIS@IK[@IK`*1V5N97)I8TYA;65;8V%=/4YA=F5G861O<B!W
M96(*1V5N97)I8TYA;65;8W-=/5=E8F]VP[T@<')O:&S#K<6^9<2-"D=E;F5R
M:6-.86UE6V1A73U796)B<F]W<V5R"D=E;F5R:6-.86UE6V5L73W.H,ZUSX'.
MN<ZWSK/.M\^$SJ[/@B#.M,ZYSK'.M,ZYSKK/A,^-SK_/A0I'96YE<FEC3F%M
M95ME<UT]3F%V96=A9&]R('=E8@I'96YE<FEC3F%M95ME=%T]5F5E8FEB<F%U
M<V5R"D=E;F5R:6-.86UE6V9A73W9A=BQV8C8L=JOV+$@V*?;C-F&V*K8L=F&
MV*K;C`I'96YE<FEC3F%M95MF:5T]5U=7+7-E;&%I;@I'96YE<FEC3F%M95MF
M<ET]3F%V:6=A=&5U<B!796(*1V5N97)I8TYA;65;9VQ=/4YA=F5G861O<B!7
M96(*1V5N97)I8TYA;65;:&5=/=>3UZ37D]>DUY\@UY#7F=>@UYC7J->@UY@*
M1V5N97)I8TYA;65;:')=/5=E8B!P<F5G;&5D;FEK"D=E;F5R:6-.86UE6VAU
M73U796)BP[9N9\.I<WK%D0I'96YE<FEC3F%M95MI=%T]0G)O=W-E<B!W96(*
M1V5N97)I8TYA;65;:F%=/>."IN."I^.#EN.#N^.#EN.#J>."IN."M@I'96YE
M<FEC3F%M95MK;UT][)NY(.NXC.N=O.R:L.R@@`I'96YE<FEC3F%M95MK=5T]
M1V5R;VMA('1O<L.J"D=E;F5R:6-.86UE6VQT73U);G1E<FYE=&\@;F%RQ:%Y
M:VS$EPI'96YE<FEC3F%M95MN8ET]3F5T=&QE<V5R"D=E;F5R:6-.86UE6VYL
M73U796)B<F]W<V5R"D=E;F5R:6-.86UE6VYN73U.971T;&5S87(*1V5N97)I
M8TYA;65;;F]=/4YE='1L97-E<@I'96YE<FEC3F%M95MP;%T]4')Z96=LQ(5D
M87)K82!75U<*1V5N97)I8TYA;65;<'1=/4YA=F5G861O<B!796(*1V5N97)I
M8TYA;65;<'1?0E)=/4YA=F5G861O<B!796(*1V5N97)I8TYA;65;<F]=/4YA
M=FEG871O<B!);G1E<FYE=`I'96YE<FEC3F%M95MR=5T]T)+0M="Q+="QT8#0
ML-&#T+?0M=&`"D=E;F5R:6-.86UE6W-K73U);G1E<FYE=&]VP[T@<')E:&QI
M861AQ(T*1V5N97)I8TYA;65;<VQ=/5-P;&5T;FD@8G)S:V%L;FEK"D=E;F5R
M:6-.86UE6W-V73U796)B;,.D<V%R90I'96YE<FEC3F%M95MT<ET]5V5B(%1A
M<F%YQ+%CQ+$*1V5N97)I8TYA;65;=6==/=BJV8C8L=F#VX;8L=JOVX@*1V5N
M97)I8TYA;65;=6M=/="2T+70L2W0L=&`T+#1@]"WT+71@`I'96YE<FEC3F%M
M95MV:5T]5'+#K&YH(&1U>>&[AW0@5V5B"D=E;F5R:6-.86UE6WIH7T-.73WG
MO9'GNYSFM8_HIXCEF:@*1V5N97)I8TYA;65;>FA?5%==/>>VLNBWK^>`C^BF
MO>69J`I+97EW;W)D<SU);G1E<FYE=#M75U<[0G)O=W-E<CM796([17AP;&]R
M97(*2V5Y=V]R9'-;87)=/=BGV8;8JMBQV8;8JCO8I=F&V*K8L=F&V*H[V878
MJMBUV8'8K3O9B-F*V*@[V8C8J`I+97EW;W)D<UMA<W1=/4EN=&5R;F5T.U=7
M5SM297-T;VQA9&]R.U=E8CM%<W!L;W)A9&]R"DME>7=O<F1S6V-A73U);G1E
M<FYE=#M75U<[3F%V96=A9&]R.U=E8CM%>'!L;W)A9&]R.T5X<&QO<F5R"DME
M>7=O<F1S6V-S73U);G1E<FYE=#M75U<[4')O:&S#K<6^9<2-.U=E8CM%>'!L
M;W)E<@I+97EW;W)D<UMD85T]26YT97)N970[26YT97)N971T970[5U=7.T)R
M;W=S97([0G)O=W-E.U=E8CM3=7)F.TYE='1E=`I+97EW;W)D<UMD95T]26YT
M97)N970[5U=7.T)R;W=S97([5V5B.T5X<&QO<F5R.U=E8G-E:71E.U-I=&4[
M<W5R9F5N.V]N;&EN93MB<F]W<V5N"DME>7=O<F1S6V5L73U);G1E<FYE=#M7
M5U<[0G)O=W-E<CM796([17AP;&]R97([SI3.N<ZQSK3.K\ZZSX3/A<Z_.\Z@
MSK7/@<ZYSK?.L\ZWSX3.KL^".T9I<F5F;W@[SJ;.N<^!SK7/ALZ_SX<[SIG.
MO<^$SK7/@<Z]SK7/A`I+97EW;W)D<UME<UT]17AP;&]R861O<CM);G1E<FYE
M=#M75U<*2V5Y=V]R9'-;9FE=/4EN=&5R;F5T.U=75SM"<F]W<V5R.U=E8CM%
M>'!L;W)E<CMS96QA:6X[26YT97)N970M<V5L86EN.VEN=&5R;F5T<V5L86EN
M.W9E<FMK;W-E;&%I;CMN971T:3MS=7)F9F%A"DME>7=O<F1S6V9R73U);G1E
M<FYE=#M75U<[0G)O=W-E<CM796([17AP;&]R97([1G5R971E=7([4W5R9F5R
M.TYA=FEG871E=7(*2V5Y=V]R9'-;:&5=/=>3UZ37D]>DUY\[UY#7F=>@UYC7
MJ->@UY@[UZC7J=>J.]>0UZK7J->9UYT[UY#7JM>H.]>DUYG7F=>HUZ37E=>G
MUZ$[UY[7E=>6UYG7G->4.PI+97EW;W)D<UMH<ET]26YT97)N970[5U=7.W!R
M96=L961N:6L[5V5B"DME>7=O<F1S6VAU73U);G1E<FYE=#M75U<[0L.V;F?#
MJ7-ZQ9$[5V5B.TC#H6S#LSM.970[17AP;&]R97(*2V5Y=V]R9'-;:71=/4EN
M=&5R;F5T.U=75SM"<F]W<V5R.U=E8CM.879I9V%T;W)E"DME>7=O<F1S6VES
M73U);G1E<FYE=#M75U<[5F%F<FD[5F5F=7([3F5T=F%F<FD[1FQA:VL*2V5Y
M=V]R9'-;:F%=/4EN=&5R;F5T.U=75SM796([XX*DXX.SXX*_XX.\XX.-XX.#
MXX.(.^.#EN.#J>."IN."MCOC@J;C@J?C@Y8[XX*HXX*OXX*YXX.7XX.MXX.\
MXX.I"DME>7=O<F1S6VYB73U);G1E<FYE='0[5U=7.TYE='1L97-E<CM%>'!L
M;W)E<CM796([0G)O=W-E<CM.971T<VED90I+97EW;W)D<UMN;%T]26YT97)N
M970[5U=7.T)R;W=S97([5V5B.T5X<&QO<F5R.U9E<FME;FYE<CM796)S:71E
M.U-U<F9E;CM/;FQI;F4@"DME>7=O<F1S6W!T73U);G1E<FYE=#M75U<[0G)O
M=W-E<CM796([17AP;&]R861O<CM.879E9V%D;W(*2V5Y=V]R9'-;<'1?0E)=
M/4EN=&5R;F5T.U=75SM"<F]W<V5R.U=E8CM%>'!L;W)A9&]R.TYA=F5G861O
M<@I+97EW;W)D<UMR=5T]26YT97)N970[5U=7.T)R;W=S97([5V5B.T5X<&QO
M<F5R.]"XT+W1@M"UT8#0O="UT8([T+'1@-"PT8/0M]"UT8`[T++0M="Q.]&$
MT+#0N=&`T830OM"ZT8$[T+[0L]"]T+70N]"XT8$*2V5Y=V]R9'-;<VM=/4EN
M=&5R;F5T.U=75SM0<F5H;&EA9&'$C3M796([17AP;&]R97(*2V5Y=V]R9'-;
M<VQ=/4EN=&5R;F5T.U=75SM"<F]W<V5R.U=E8CM%>'!L;W)E<CM"<G-K86QN
M:6L[4W!L970*2V5Y=V]R9'-;=')=/<2P;G1E<FYE=#M75U<[5&%R87G$L6/$
ML3M796([1V5Z9VEN.U=E8B!S:71E<VD[4VET93MSP[9R9CO#IV5V<FEM:<.G
M:3MT87)A"DME>7=O<F1S6W5K73U);G1E<FYE=#M75U<[0G)O=W-E<CM796([
M17AP;&]R97([T(;0O=&"T+71@-"]T+71@CO0O-"UT8#0M="VT+`[T+_0M=&`
MT+70L]"[T8_0M-"PT8<[T+[0L]"[T8_0M-"PT8<[T+'1@-"PT8/0M]"UT8`[
MT++0M="Q.]&$T+#0N=&`T830OM"ZT8$[T++0OM"ST+W0M="[T+C1@3O0O]"U
MT8#0M="ST+O1C]"T"DME>7=O<F1S6W9I73U);G1E<FYE=#M75U<[0G)O=W-E
M<CM796([17AP;&]R97([5'+#K&YH(&1U>>&[AW0[5')A;F<@=V5B"DME>7=O
M<F1S6WIH7T-.73U);G1E<FYE=#M75U<[0G)O=W-E<CM796([17AP;&]R97([
MY[V1Z:&U.^:UC^BGB#ODN(KGO9$[YX&KYXN0.T9I<F5F;W@[9F8[Y+J2Z(&4
MY[V1.^>]D>>KF3L*2V5Y=V]R9'-;>FA?5%==/4EN=&5R;F5T.U=75SM"<F]W
M<V5R.U=E8CM%>'!L;W)E<COGMK+IFIOGMK+HMZ\[Y[:RZ+>O.^>`C^BFO>69
MJ#ODN(KGMK([Y[:RZ:"!.^>!J^>+D`I%>&5C/69I<F5F;W@M;FEG:'1L>2`E
M=0I497)M:6YA;#UF86QS90I8+4UU;'1I<&QE07)G<SUF86QS90I4>7!E/4%P
M<&QI8V%T:6]N"DEC;VX]+V]P="]F:7)E9F]X+6YI9VAT;'DO8G)O=W-E<B]C
M:')O;64O:6-O;G,O9&5F875L="]D969A=6QT,3(X+G!N9PI#871E9V]R:65S
M/4=.3TU%.T=42SM.971W;W)K.U=E8D)R;W=S97(["DUI;654>7!E/71E>'0O
M:'1M;#MT97AT+WAM;#MA<'!L:6-A=&EO;B]X:'1M;"MX;6P[87!P;&EC871I
M;VXO>&UL.V%P<&QI8V%T:6]N+W)S<RMX;6P[87!P;&EC871I;VXO<F1F*WAM
M;#MI;6%G92]G:68[:6UA9V4O:G!E9SMI;6%G92]P;F<[>"US8VAE;64M:&%N
M9&QE<B]H='1P.W@M<V-H96UE+6AA;F1L97(O:'1T<',[>"US8VAE;64M:&%N
M9&QE<B]F='`[>"US8VAE;64M:&%N9&QE<B]C:')O;64[=FED96\O=V5B;3MA
M<'!L:6-A=&EO;B]X+7AP:6YS=&%L;#L*4W1A<G1U<$YO=&EF>3UT<G5E"D%C
M=&EO;G,]3F5W5VEN9&]W.TYE=U!R:79A=&57:6YD;W<["@I;1&5S:W1O<"!!
M8W1I;VX@3F5W5VEN9&]W70I.86UE/4]P96X@82!.97<@5VEN9&]W"DYA;65;
M87)=/=BGV8'8JMBM(-F&V*?9@=BPV*D@V*S8K]F*V*_8J0I.86UE6V%S=%T]
M06)R:7(@=6YA('9E;G1A;F$@;G5E=F$*3F%M95MB;ET]06)R:7(@=6YA('9E
M;G1A;F$@;G5E=F$*3F%M95MC85T]3V)R92!U;F$@9FEN97-T<F$@;F]V80I.
M86UE6V-S73U/=&5VQ9G#K70@;F]VPZD@;VMN;PI.86UE6V1A73W#A6)N(&5T
M(&YY="!V:6YD=64*3F%M95MD95T]16EN(&YE=65S($9E;G-T97(@P[9F9FYE
M;@I.86UE6V5L73W.ALZ]SK_.N<ZSSKS.L2#.O<ZMSK_/A2#/@,ZQSX'.L<ZX
MSXW/@<Z_SX4*3F%M95ME<UT]06)R:7(@=6YA('9E;G1A;F$@;G5E=F$*3F%M
M95MF:5T]079A82!U=7-I(&EK:W5N80I.86UE6V9R73U/=79R:7(@=6YE(&YO
M=79E;&QE(&9E;L.J=')E"DYA;65;9VQ=/4%B<FER('5N:&$@;F]V82!X86YE
M;&$*3F%M95MH95T]UZ37JM>9UY?7JB#7E]><UY77GR#7E]>3UZD*3F%M95MH
M<ET]3W1V;W)I(&YO=FD@<')O>F]R"DYA;65;:'5=/<.::B!A8FQA:R!N>6ET
MPZ%S80I.86UE6VET73U!<')I('5N82!N=6]V82!F:6YE<W1R80I.86UE6VIA
M73WFEK#C@9?C@83C@J;C@J/C@[/C@XGC@J;C@I+IEHOC@8\*3F%M95MK;UT]
M[(.((.RPO2#LE[3JN+`*3F%M95MK=5T]4&%C97EE:V4@;L.[('9E:V4*3F%M
M95ML=%T]071V97)T:2!N875JQ(4@;&%N9\2%"DYA;65;;F)=/<.%<&YE(&5T
M(&YY='0@=FEN9'4*3F%M95MN;%T]3FEE=7<@=F5N<W1E<B!O<&5N96X*3F%M
M95MP=%T]06)R:7(@;F]V82!J86YE;&$*3F%M95MP=%]"4ET]06)R:7(@;F]V
M82!J86YE;&$*3F%M95MR;UT]1&5S8VAI9&4@;R!F97)E87-T<L2#(&YO=<2#
M"DYA;65;<G5=/="=T+[0LM"^T+4@T+[0NM"]T+X*3F%M95MS:UT]3W1V;W)I
MQ:4@;F]VPZD@;VMN;PI.86UE6W-L73U/9'!R:2!N;W9O(&]K;F\*3F%M95MS
M=ET]PY9P<&YA(&5T="!N>71T(&;#MFYS=&5R"DYA;65;=')=/5EE;FD@<&5N
M8V5R92!APZ<@"DYA;65;=6==/=F*VY#:K=F)(-F#VX;8LMF&VY79@R#8IMN0
MVH;9B=BT"DYA;65;=6M=/="2T9;0M-"ZT8#0N-&"T+@@T+W0OM"RT+4@T++1
MEM"ZT+W0O@I.86UE6W9I73U-X;N?(&/ANZUA('/ANY4@;>&[FVD*3F%M95MZ
M:%]#3ET]YI:PY;NZYZJ7Y8^C"DYA;65;>FA?5%==/>F6B^65G^:6L.BFEN>J
MEPI%>&5C/69I<F5F;W@M;FEG:'1L>2`M;F5W+7=I;F1O=PH*6T1E<VMT;W`@
M06-T:6]N($YE=U!R:79A=&57:6YD;W=="DYA;64]3W!E;B!A($YE=R!0<FEV
M871E(%=I;F1O=PI.86UE6V%R73W8I]F!V*K8K2#9AMBGV8'8L-BI(-BLV*_9
MBMBOV*D@V839A-BJV+79@=BM(-BGV838KMBGV+4*3F%M95MC85T]3V)R92!U
M;F$@9FEN97-T<F$@;F]V82!E;B!M;V1E(&0G:6YCP[)G;FET"DYA;65;9&5=
M/45I;B!N975E<R!P<FEV871E<R!&96YS=&5R(,.V9F9N96X*3F%M95ME<UT]
M06)R:7(@=6YA('9E;G1A;F$@<')I=F%D82!N=65V80I.86UE6V9I73U!=F%A
M('5U<VD@>6MS:71Y:6YE;B!I:VMU;F$*3F%M95MF<ET]3W5V<FER('5N92!N
M;W5V96QL92!F96[#JG1R92!D92!N879I9V%T:6]N('!R:7;#J64*3F%M95MH
M95T]UZ37JM>9UY?7JB#7E]><UY77GR#7DM><UYG7J=>4(->DUZC7F->9UZH@
MUY?7D]>I"DYA;65;:'5=/<.::B!P<FEVPZ%T(&%B;&%K(&YY:73#H7-A"DYA
M;65;:71=/4%P<FD@=6YA(&YU;W9A(&9I;F5S=')A(&%N;VYI;6$*3F%M95MN
M8ET]PX5P;F4@970@;GET="!P<FEV870@=FEN9'4*3F%M95MR=5T]T)W0OM"R
MT+[0M2#0O]&`T+C0LM"PT8+0O="^T+4@T+[0NM"]T+X*3F%M95MS;%T]3V1P
M<FD@;F]V;R!O:VYO('IA<V5B;F5G82!B<G-K86YJ80I.86UE6W1R73U996YI
M(&)I<B!P96YC97)E(&'#IPI.86UE6W5K73W0DM&6T+30NM&`T+C1@M"X(-"]
MT+[0LM"U(-"RT9;0NM"]T+X@T8,@T+_0OM&"T+#0N="[T+C0LM"^T+S1@R#1
M@-"UT+;0N-"\T98*3F%M95MZ:%]45UT]Z9:+Y96?YI:PZ9JQYZ>!YX"/Z*:]
LZ*:6YZJ7"D5X96,]9FER969O>"UN:6=H=&QY("UP<FEV871E+7=I;F1O=PH`
`
end

000100191120     **
000200191120     **  Program . . : CBX277
000300191120     **  Description : Calculate Hash Value - CPP
000400191120     **  Author  . . : Carsten Flensburg
000500191120     **
000600191120     **
000700191120     **
000800191120     **  Compile options required:
000900191120     **    CrtRpgMod   Module( CBX277 )
001000191120     **                DbgView( *LIST )
001100191120     **
001200191120     **    CrtPgm      Pgm( CBX277 )
001300191120     **                Module( CBX277 )
001400191120     **                BndSrvPgm( CBX277S )
001500191120     **                ActGrp( *NEW )
001600191120     **
001700191120     **
001800191120     **-- Header specifications:  --------------------------------------------**
001900191120     H Option( *SrcStmt )  BndDir( 'QC2LE' )
002000191120
002100191120     **-- API error data structure:
002200191120     D ERRC0100        Ds                  Qualified
002300191120     D  BytPrv                       10i 0 Inz( %Size( ERRC0100 ))
002400191120     D  BytAvl                       10i 0
002500191120     D  MsgId                         7a
002600191120     D                                1a
002700191120     D  MsgDta                      512a
002800191120
002900191120     **-- Global variables:
003000191120     D HashVal         s           1024a   Varying
003100191120     D OutStr          s           1024a   Varying
003200191120     D Blanks          s             52a
003300191120
003400191120     **-- Calculate hash value:
003500191120     D ClcHashVal      Pr           256a   Varying
003600191120     D  PxCalcStr                 65535a   Varying  Const
003700191120     D  PxHashAlg                    10i 0          Const
003800191120     **-- Convert hex nibbles to character:
003900191120     D CvtHexChr       Pr           128a   Varying
004000191120     D  PxHexStr                    256a   Varying  Const
004100191120     **-- Convert character to hex nibbles:
004200191120     D CvtChrHex       Pr           256a   Varying
004300191120     D  PxHexStr                    128a   Varying  Const
004400191120
004500191120     **-- Display long text:
004600191120     D DspLngTxt       Pr                  ExtPgm( 'QUILNGTX' )
004700191120     D  LngTxt                    32767a   Const  Options( *VarSize )
004800191120     D  LngTxtLen                    10i 0 Const
004900191120     D  MsgId                         7a   Const
005000191120     D  MsgF                         20a   Const
005100191120     D  Error                     32767a   Const  Options( *VarSize )
005200191120     **-- Send program message:
005300191120     D SndPgmMsg       Pr                  ExtPgm( 'QMHSNDPM' )
005400191120     D  MsgId                         7a   Const
005500191120     D  MsgFq                        20a   Const
005600191120     D  MsgDta                      512a   Const  Options( *VarSize )
005700191120     D  MsgDtaLen                    10i 0 Const
005800191120     D  MsgTyp                       10a   Const
005900191120     D  CalStkE                      10a   Const  Options( *VarSize )
006000191120     D  CalStkCtr                    10i 0 Const
006100191120     D  MsgKey                        4a
006200191120     D  Error                       512a          Options( *VarSize )
006300191120     D  CalStkElen                   10i 0 Const  Options( *NoPass )
006400191120     D  CalStkEq                     20a   Const  Options( *NoPass )
006500191120     D  DspWait                      10i 0 Const  Options( *NoPass )
006600191120     D  CalStkEtyp                   20a   Const  Options( *NoPass )
006700191120     D  CcsId                        10i 0 Const  Options( *NoPass )
006800191120     **-- Display message window:
006900191120     D DspMsgWdw       Pr
007000191120     D  PxMsgStr                   1024a   Const  Varying
007100191120     **-- Send completion message:
007200191120     D SndCmpMsg       Pr            10i 0
007300191120     D  PxMsgDta                    512a   Const  Varying
007400191120
007500191120     **-- Parameters:
007600191120     D CBX277          Pr
007700191120     D  PxCalcStr                  5000a   Varying
007800191120     D  PxHashAlg                    10i 0
007900191120     **
008000191120     D CBX277          Pi
008100191120     D  PxCalcStr                  5000a   Varying
008200191120     D  PxHashAlg                    10i 0
008300191120
008400191120      /Free
008500191120
008600191120        HashVal = ClcHashVal( PxCalcStr: PxHashAlg );
008700191120
008800191120        OutStr  = CvtChrHex( HashVal );
008900191120
009000191120        DspMsgWdw ( 'Input  . . . : ' + PxCalcStr + Blanks +
009100191120                    'Hash value . : ' + OutStr );
009200191120
009300191120        SndCmpMsg( 'Hash value calculation completed.' );
009400191120
009500191120        *InLr = *On;
009600191120        Return;
009700191120
009800191120      /End-Free
009900191120
010000191120     **-- Display message window:
010100191120     P DspMsgWdw       B
010200191120     D                 Pi
010300191120     D  PxMsgStr                   1024a   Const  Varying
010400191120
010500191120      /Free
010600191120
010700191120        DspLngTxt( PxMsgStr: %Len( PxMsgStr ): *Blanks: *Blanks: ERRC0100 );
010800191120
010900191120      /End-Free
011000191120
011100191120     P DspMsgWdw       E
011200191120     **-- Send completion message:
011300191120     P SndCmpMsg       B
011400191120     D                 Pi            10i 0
011500191120     D  PxMsgDta                    512a   Const  Varying
011600191120
011700191120     D MsgKey          s              4a
011800191120
011900191120      /Free
012000191120
012100191120        SndPgmMsg( 'CPF9897'
012200191120                 : 'QCPFMSG   *LIBL'
012300191120                 : PxMsgDta
012400191120                 : %Len( PxMsgDta )
012500191120                 : '*COMP'
012600191120                 : '*PGMBDY'
012700191120                 : 1
012800191120                 : MsgKey
012900191120                 : ERRC0100
013000191120                 );
013100191120
013200191120        If  ERRC0100.BytAvl > *Zero;
013300191120          Return  -1;
013400191120
013500191120        Else;
013600191120          Return  0;
013700191120
013800191120        EndIf;
013900191120
014000191120      /End-Free
014100191120
014200191120     P SndCmpMsg       E

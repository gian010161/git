000100191120     **
000200191120     **  Program . . : CBX2772
000300191120     **  Description : Calculate File Hash Value - CPP
000400191120     **  Author  . . : Carsten Flensburg
000500191120     **
000600191120     **
000700191120     **
000800191120     **  Compile options required:
000900191120     **    CrtRpgMod   Module( CBX2772 )
001000191120     **                DbgView( *LIST )
001100191120     **
001200191120     **    CrtPgm      Pgm( CBX2772 )
001300191120     **                Module( CBX2772 )
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
002900191120     **-- Global constants:
003000191120     D OFS_MSGDTA      c                   16
003100191120     D NULL            c                   ''
003200191120     **-- Global variables:
003300191120     D rc              s             10i 0
003400191120     D fd1             s             10i 0 Inz( -2 )
003500191120     D HashVal         s           1024a   Varying
003600191120     D RtnDtaStr       s           1024a
003700191120     D OutStr          s           1024a   Varying
003800191120     D Blanks          s             52a
003900191120     **
004000191120     D HshBlkSiz       s             10i 0
004100191120     D HshLenRem       s             10i 0
004200191120     D HshDta          s          65535a   Based( pHshDta )
004300191120     D HshDtaLen       s             10i 0
004400191120     D HshStr          s           2048a
004500191120     D HshStrLen       s             10i 0
004600191120     **-- IFS I/O constants:
004700191120     D O_WRONLY        c                   2
004800191120     D O_RDONLY        c                   1
004900191120     D O_CREAT         c                   8
005000191120     D O_EXCL          c                   16
005100191120     D O_SHARE_NONE    c                   524288
005200191120     D O_INHERITMODE   c                   134217728
005300191120     D O_IGN_MODE      c                   0
005400191120     **
005500191120     D SEEK_SET        c                   0
005600191120     D SEEK_CUR        c                   1
005700191120     D SEEK_END        c                   2
005800191120     D SEEK_NO_OFS     c                   0
005900191120     **
006000191120     D TYP_MD5         c                   1
006100191120     D TYP_SHA_1       c                   2
006200191120     D TYP_SHA_256     c                   3
006300191120     D TYP_SHA_384     c                   4
006400191120     D TYP_SHA_512     c                   5
006500191120     **-- Cryptographic API constants:
006600191120     D CSP_ANY         c                   '0'
006700191120     D CSP_SFW         c                   '1'
006800191120     D CSP_HDW         c                   '2'
006900191120
007000191120     **-- Display long text:
007100191120     D DspLngTxt       Pr                  ExtPgm( 'QUILNGTX' )
007200191120     D  LngTxt                    32767a   Const  Options( *VarSize )
007300191120     D  LngTxtLen                    10i 0 Const
007400191120     D  MsgId                         7a   Const
007500191120     D  MsgF                         20a   Const
007600191120     D  Error                     32767a   Const  Options( *VarSize )
007700191120     **-- Send program message:
007800191120     D SndPgmMsg       Pr                  ExtPgm( 'QMHSNDPM' )
007900191120     D  MsgId                         7a   Const
008000191120     D  MsgFq                        20a   Const
008100191120     D  MsgDta                      512a   Const  Options( *VarSize )
008200191120     D  MsgDtaLen                    10i 0 Const
008300191120     D  MsgTyp                       10a   Const
008400191120     D  CalStkE                      10a   Const  Options( *VarSize )
008500191120     D  CalStkCtr                    10i 0 Const
008600191120     D  MsgKey                        4a
008700191120     D  Error                       512a          Options( *VarSize )
008800191120     D  CalStkElen                   10i 0 Const  Options( *NoPass )
008900191120     D  CalStkEq                     20a   Const  Options( *NoPass )
009000191120     D  DspWait                      10i 0 Const  Options( *NoPass )
009100191120     D  CalStkEtyp                   20a   Const  Options( *NoPass )
009200191120     D  CcsId                        10i 0 Const  Options( *NoPass )
009300191120     **-- Create algorithm context API:
009400191120     D CrtAlgCtx       Pr                  ExtProc( 'Qc3CreateAlgorithm-
009500191120     D                                     Context')
009600191120     D  AlgDsc                     1024a   Const  Options( *VarSize )
009700191120     D  AlgDscFmt                     8a   Const
009800191120     D  AlgCtxTkn                     8a
009900191120     D  Error                     32767a          Options( *VarSize )
010000191120     **-- Calculate hash API:
010100191120     D CalculateHash   Pr                  ExtProc( 'Qc3CalculateHash' )
010200191120     D  ClcDtaInp                 65535a   Const  Options( *VarSize )
010300191120     D  ClcDtaInpLen                 10i 0 Const
010400191120     D  ClcDtaFmt                     8a   Const
010500191120     D  AlgDsc                      256a   Const  Options( *VarSize )
010600191120     D  AlgDscFmt                     8a   Const
010700191120     D  CrpSrvPrv                     1a   Const
010800191120     D  CrpDevNam                    10a   Const
010900191120     D  ClcDtaOut                   256a          Options( *VarSize )
011000191120     D  Error                     32767a          Options( *VarSize )
011100191120     **-- Open file API:
011200191120     D open            Pr            10i 0 ExtProc( 'open' )
011300191120     D  path                           *   Value  Options( *String )
011400191120     D  oflag                        10i 0 Value
011500191120     D  mode                         10u 0 Value  Options( *NoPass )
011600191120     D  cnvid                        10u 0 Value  Options( *NoPass )
011700191120     D/If Defined( *V5R2M0 )
011800191120     D  txtcrtcnvid                  10u 0 Value  Options( *NoPass )
011900191120     D/Endif
012000191120     **-- Close file or socket descriptor:
012100191120     D close           Pr            10i 0 ExtProc( 'close' )
012200191120     D  fd                           10i 0 Value
012300191120     **-- Read from descriptor:
012400191120     D read            Pr            10i 0 ExtProc( 'read' )
012500191120     D  fd                           10i 0 Value
012600191120     D  buf                            *   Value
012700191120     D  nbyte                        10u 0 Value
012800191120     **-- Set file offset:
012900191120     D lseek           Pr            10i 0 ExtProc( 'lseek' )
013000191120     D  fd                           10i 0 Value
013100191120     D  offset                       10i 0 Value
013200191120     D  whence                       10u 0 Value
013300191120     **-- Get file system information by descriptor:
013400191120     D fstatvfs        Pr            10i 0 ExtProc( 'fstatvfs64' )
013500191120     D  fd                           10i 0 Value
013600191120     D  buf                                Like( statvfs )
013700191120     **-- Register termination exit:
013800191120     D CeeRtx          Pr                    ExtProc( 'CEERTX' )
013900191120     D  procedure                      *     ProcPtr   Const
014000191120     D  token                          *     Options( *Omit )
014100191120     D  fb                           12a     Options( *Omit )
014200191120     **-- Unregister termination exit:
014300191120     D CeeUtx          Pr                    ExtProc( 'CEEUTX' )
014400191120     D  procedure                      *     ProcPtr   Const
014500191120     D  fb                           12a     Options( *Omit )
014600191120     **-- Error number:
014700191120     D sys_errno       Pr              *    ExtProc( '__errno' )
014800191120     **-- Error string:
014900191120     D sys_strerror    Pr              *    ExtProc( 'strerror' )
015000191120     D  errno                        10i 0  Value
015100191120
015200191120     **-- Algorithm description:
015300191120     D ALGD0100        Ds                  Qualified
015400191120     D  AlgCtxTkn                     8a   Inz( *Blanks )
015500191120     D  FinOprFlg                     1a
015600191120     **-- File system information (large files):
015700191120     D statvfs         Ds                  Qualified
015800191120     D  f_bsize                      10u 0
015900191120     D  f_frsize                     10u 0
016000191120     D  f_blocks                     20u 0
016100191120     D  f_bfree                      20u 0
016200191120     D  f_bavail                     20u 0
016300191120     D  f_files                      10u 0
016400191120     D  f_ffree                      10u 0
016500191120     D  f_favail                     10u 0
016600191120     D  f_fsid                       10u 0
016700191120     D  f_flag                       10u 0
016800191120     D  f_namemax                    10u 0
016900191120     D  f_pathmax                    10u 0
017000191120     D  f_objlinkmax                 10i 0
017100191120     D  f_dirlinkmax                 10i 0
017200191120     D  f_reserved1                   4a
017300191120     D  f_fsid64                     20u 0
017400191120     D  f_basetype                   80a
017500191120
017600191120     **-- Remove algorithm context:
017700191120     D RmvAlgCtx       Pr            10i 0
017800191120     D  PxAlgCtx                      8a
017900191120
018000191120     **-- Clean up:
018100191120     D CleanUp         Pr
018200191120     D  pToken                         *   Options( *Omit )
018300191120     **-- Get algorithm context - Hash:
018400191120     D GetAlgCtxH      Pr             8a
018500191120     D  PxHashAlg                    10i 0          Const
018600191120     **-- Get block size:
018700191120     D GetBlkSiz       Pr            10i 0
018800191120     D  PxFd                         10i 0 Const
018900191120     D  PxMaxBlkSiz                  10i 0 Const
019000191120     **-- Get hash value:
019100191120     D GetHashVal      Pr           512a   Varying
019200191120     D  PxHashAlg                    10i 0 Const
019300191120     D  PxHashStr                   512a   Const
019400191120     **-- Convert hex nibbles to character:
019500191120     D CvtHexChr       Pr           128a   Varying
019600191120     D  PxHexStr                    256a   Varying  Const
019700191120     **-- Convert character to hex nibbles:
019800191120     D CvtChrHex       Pr           256a   Varying
019900191120     D  PxHexStr                    128a   Varying  Const
020000191120
020100191120     **-- Display message window:
020200191120     D DspMsgWdw       Pr
020300191120     D  PxMsgStr                   1024a   Const  Varying
020400191120     **-- Send completion message:
020500191120     D SndCmpMsg       Pr            10i 0
020600191120     D  PxMsgDta                    512a   Const  Varying
020700191120     **-- Send diagnostic message:
020800191120     D SndDiagMsg      Pr            10i 0
020900191120     D  PxMsgDta                    512a   Const  Varying
021000191120     **-- Send escape message:
021100191120     D SndEscMsg       Pr            10i 0
021200191120     D  PxMsgId                       7a   Const
021300191120     D  PxMsgF                       10a   Const
021400191120     D  PxMsgDta                    512a   Const  Varying
021500191120     **-- Runtime error ID:
021600191120     D errno           Pr            10i 0
021700191120     **-- Runtime error message:
021800191120     D strerror        Pr           128a   Varying
021900191120
022000191120     **-- Parameters:
022100191120     D CBX2772         Pr
022200191120     D  PxInpFil                   3000a   Varying
022300191120     D  PxHashAlg                    10i 0
022400191120     **
022500191120     D CBX2772         Pi
022600191120     D  PxInpFil                   3000a   Varying
022700191120     D  PxHashAlg                    10i 0
022800191120
022900191120      /Free
023000191120
023100191120        CeeRtx( %Paddr( CleanUp ): *Omit: *Omit );
023200191120
023300191120        fd1 = open( PxInpFil: O_RDONLY: O_IGN_MODE );
023400191120
023500191120        If  fd1 = -1;
023600191120          SndDiagMsg( %Char( errno() ) + ': ' + strerror() );
023700191120
023800191120          SndEscMsg( 'CPF9898': 'QCPFMSG': 'Command ended in error' );
023900191120        Else;
024000191120
024100191120          HshLenRem = lseek( fd1: SEEK_NO_OFS: SEEK_END );
024200191120          rc = lseek( fd1: SEEK_NO_OFS: SEEK_SET );
024300191120
024400191120          HshBlkSiz = GetBlkSiz( fd1: 655350 );
024500191120          pHshDta = %Alloc( HshBlkSiz );
024600191120
024700191120          ALGD0100.AlgCtxTkn = GetAlgCtxH( PxHashAlg );
024800191120
024900191120          DoW  HshLenRem > 0;
025000191120
025100191120            HshDtaLen = read( fd1: pHshDta: HshBlkSiz );
025200191120
025300191120            If  HshLenRem <= HshBlkSiz;
025400191120              ALGD0100.FinOprFlg = '1';
025500191120            Else;
025600191120              ALGD0100.FinOprFlg = '0';
025700191120            EndIf;
025800191120
025900191120            CalculateHash( HshDta
026000191120                         : HshDtaLen
026100191120                         : 'DATA0100'
026200191120                         : ALGD0100
026300191120                         : 'ALGD0100'
026400191120                         : CSP_SFW
026500191120                         : *Blanks
026600191120                         : RtnDtaStr
026700191120                         : ERRC0100
026800191120                         );
026900191120
027000191120            If  ERRC0100.BytAvl > *Zero;
027100191120              ExSr  EscApiErr;
027200191120            EndIf;
027300191120
027400191120            HshLenRem -= HshDtaLen;
027500191120          EndDo;
027600191120
027700191120          OutStr  = CvtChrHex( GetHashVal( PxHashAlg: RtnDtaStr ));
027800191120
027900191120          DspMsgWdw ( 'Input  . . . : ' + PxInpFil + Blanks +
028000191120                      'Hash value . : ' + OutStr );
028100191120
028200191120          SndCmpMsg( 'Hash value calculation completed.' );
028300191120        EndIf;
028400191120
028500191120        CeeUtx( %Paddr( CleanUp ): *Omit );
028600191120
028700191120        CleanUp( *Omit );
028800191120
028900191120        Return;
029000191120
029100191120
029200191120        BegSr  EscApiErr;
029300191120
029400191120          If  ERRC0100.BytAvl < OFS_MSGDTA;
029500191120            ERRC0100.BytAvl = OFS_MSGDTA;
029600191120          EndIf;
029700191120
029800191120          SndEscMsg( ERRC0100.MsgId
029900191120                   : 'QCPFMSG'
030000191120                   : %Subst( ERRC0100.MsgDta: 1: ERRC0100.BytAvl - OFS_MSGDTA )
030100191120                   );
030200191120
030300191120        EndSr;
030400191120
030500191120      /End-Free
030600191120
030700191120     **-- Clean up:
030800191120     P CleanUp         B
030900191120     D                 Pi
031000191120     D  pToken                         *   Options( *Omit )
031100191120
031200191120      /Free
031300191120
031400191120        If  fd1 > -1;
031500191120          rc = close( fd1 );
031600191120        EndIf;
031700191120
031800191120        If  ALGD0100.AlgCtxTkn <> *Blanks;
031900191120          RmvAlgCtx( ALGD0100.AlgCtxTkn );
032000191120        EndIf;
032100191120
032200191120        If  pHshDta <> *Null;
032300191120          DeAlloc(n)  pHshDta;
032400191120        EndIf;
032500191120
032600191120        *InLr = *On;
032700191120
032800191120        Return;
032900191120
033000191120      /End-Free
033100191120
033200191120     P CleanUp         E
033300191120     **-- Get algorithm context - Hash:
033400191120     P GetAlgCtxH      B                   Export
033500191120     D                 Pi             8a
033600191120     D  PxHashAlg                    10i 0          Const
033700191120
033800191120     **-- Hash algorithm description:
033900191120     D ALGD0500        Ds                  Qualified
034000191120     D  HashAlg                      10i 0
034100191120     **-- Local declarations
034200191120     D AlgCtxTkn       s              8a
034300191120
034400191120      /Free
034500191120
034600191120        ALGD0500.HashAlg = PxHashAlg;
034700191120
034800191120        CrtAlgCtx( ALGD0500
034900191120                 : 'ALGD0500'
035000191120                 : AlgCtxTkn
035100191120                 : ERRC0100
035200191120                 );
035300191120
035400191120        If  ERRC0100.BytAvl > *Zero;
035500191120          Return  *Blanks;
035600191120
035700191120        Else;
035800191120          Return  AlgCtxTkn;
035900191120        EndIf;
036000191120
036100191120      /End-Free
036200191120
036300191120     P GetAlgCtxH      E
036400191120     **-- Get block size:
036500191120     P GetBlkSiz       B
036600191120     D                 Pi            10i 0
036700191120     D  PxFd                         10i 0 Const
036800191120     D  PxMaxBlkSiz                  10i 0 Const
036900191120
037000191120      /Free
037100191120
037200191120        Select;
037300191120        When  fstatvfs( PxFd: statvfs ) = -1;
037400191120          Return  PxMaxBlkSiz;
037500191120
037600191120        When  statvfs.f_bsize < 256  Or  statvfs.f_bsize > 16776704;
037700191120          Return  PxMaxBlkSiz;
037800191120
037900191120        When  statvfs.f_bsize > PxMaxBlkSiz;
038000191120          Return  PxMaxBlkSiz;
038100191120
038200191120        When  statvfs.f_bsize * 2 > PxMaxBlkSiz;
038300191120          Return  statvfs.f_bsize;
038400191120
038500191120        Other;
038600191120          Return  %Int( PxMaxBlkSiz / statvfs.f_bsize ) * statvfs.f_bsize;
038700191120        EndSl;
038800191120
038900191120      /End-Free
039000191120
039100191120     P GetBlkSiz       E
039200191120     **-- Get hash value:
039300191120     P GetHashVal      B
039400191120     D                 Pi           512a   Varying
039500191120     D  PxHashAlg                    10i 0 Const
039600191120     D  PxHashStr                   512a   Const
039700191120
039800191120        Select;
039900191120        When  PxHashAlg = TYP_MD5;
040000191120          Return  %Subst( PxHashStr: 1: 16 );
040100191120
040200191120        When  PxHashAlg = TYP_SHA_1;
040300191120          Return  %Subst( PxHashStr: 1: 20 );
040400191120
040500191120        When  PxHashAlg = TYP_SHA_256;
040600191120          Return  %Subst( PxHashStr: 1: 32 );
040700191120
040800191120        When  PxHashAlg = TYP_SHA_384;
040900191120          Return  %Subst( PxHashStr: 1: 48 );
041000191120
041100191120        When  PxHashAlg = TYP_SHA_512;
041200191120          Return  %Subst( PxHashStr: 1: 64 );
041300191120
041400191120        Other;
041500191120          Return  NULL;
041600191120        EndSl;
041700191120
041800191120     P GetHashVal      E
041900191120     **-- Display message window:
042000191120     P DspMsgWdw       B
042100191120     D                 Pi
042200191120     D  PxMsgStr                   1024a   Const  Varying
042300191120
042400191120      /Free
042500191120
042600191120        DspLngTxt( PxMsgStr: %Len( PxMsgStr ): *Blanks: *Blanks: ERRC0100 );
042700191120
042800191120      /End-Free
042900191120
043000191120     P DspMsgWdw       E
043100191120     **-- Send completion message:
043200191120     P SndCmpMsg       B
043300191120     D                 Pi            10i 0
043400191120     D  PxMsgDta                    512a   Const  Varying
043500191120
043600191120     D MsgKey          s              4a
043700191120
043800191120      /Free
043900191120
044000191120        SndPgmMsg( 'CPF9897'
044100191120                 : 'QCPFMSG   *LIBL'
044200191120                 : PxMsgDta
044300191120                 : %Len( PxMsgDta )
044400191120                 : '*COMP'
044500191120                 : '*PGMBDY'
044600191120                 : 1
044700191120                 : MsgKey
044800191120                 : ERRC0100
044900191120                 );
045000191120
045100191120        If  ERRC0100.BytAvl > *Zero;
045200191120          Return  -1;
045300191120
045400191120        Else;
045500191120          Return  0;
045600191120
045700191120        EndIf;
045800191120
045900191120      /End-Free
046000191120
046100191120     P SndCmpMsg       E
046200191120     **-- Send diagnostic message:
046300191120     P SndDiagMsg      B
046400191120     D                 Pi            10i 0
046500191120     D  PxMsgDta                    512a   Const  Varying
046600191120     **
046700191120     D MsgKey          s              4a
046800191120
046900191120      /Free
047000191120
047100191120        SndPgmMsg( 'CPF9897'
047200191120                 : 'QCPFMSG   *LIBL'
047300191120                 : PxMsgDta
047400191120                 : %Len( PxMsgDta )
047500191120                 : '*DIAG'
047600191120                 : '*PGMBDY'
047700191120                 : 1
047800191120                 : MsgKey
047900191120                 : ERRC0100
048000191120                 );
048100191120
048200191120        If  ERRC0100.BytAvl > *Zero;
048300191120          Return  -1;
048400191120
048500191120        Else;
048600191120          Return   0;
048700191120        EndIf;
048800191120
048900191120      /End-Free
049000191120
049100191120     P SndDiagMsg      E
049200191120     **-- Send escape message:
049300191120     P SndEscMsg       B
049400191120     D                 Pi            10i 0
049500191120     D  PxMsgId                       7a   Const
049600191120     D  PxMsgF                       10a   Const
049700191120     D  PxMsgDta                    512a   Const  Varying
049800191120     **
049900191120     D MsgKey          s              4a
050000191120
050100191120      /Free
050200191120
050300191120        SndPgmMsg( PxMsgId
050400191120                 : PxMsgF + '*LIBL'
050500191120                 : PxMsgDta
050600191120                 : %Len( PxMsgDta )
050700191120                 : '*ESCAPE'
050800191120                 : '*PGMBDY'
050900191120                 : 1
051000191120                 : MsgKey
051100191120                 : ERRC0100
051200191120                 );
051300191120
051400191120        If  ERRC0100.BytAvl > *Zero;
051500191120          Return  -1;
051600191120
051700191120        Else;
051800191120          Return   0;
051900191120        EndIf;
052000191120
052100191120      /End-Free
052200191120
052300191120     P SndEscMsg       E
052400191120     **-- Get runtime error number:
052500191120     P errno           B
052600191120     D                 Pi            10i 0
052700191120     **
052800191120     D Error           s             10i 0  Based( pError )  NoOpt
052900191120
053000191120      /Free
053100191120
053200191120        pError = sys_errno;
053300191120
053400191120        Return  Error;
053500191120
053600191120      /End-Free
053700191120
053800191120     P Errno           E
053900191120     **-- Get runtime error text:
054000191120     P strerror        B
054100191120     D                 Pi           128a    Varying
054200191120
054300191120      /Free
054400191120
054500191120        Return  %Str( sys_strerror( Errno ));
054600191120
054700191120      /End-Free
054800191120
054900191120     P strerror        E

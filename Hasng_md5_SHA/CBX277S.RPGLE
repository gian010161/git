000100191120     **
000200191120     **  Program . . : CBX277S
000300191120     **  Description : Cryptographic Services APIs
000400191120     **  Author  . . : Carsten Flensburg
000500191120     **
000600191120     **
000700191120     **
000800191120     **  Programmer's notes:
000900191120     **    Release V5R4 is required to succesfully create this service
001000191120     **    program as some of the APIs used are not available on earlier
001100191120     **    releases.
001200191120     **
001300191120     **
001400191120     **  Compile options:
001500191120     **
001600191120     **    CrtRpgMod  Module( CBX277S )
001700191120     **               DbgView( *NONE )
001800191120     **               Aut( *USE )
001900191120     **
002000191120     **    CrtSrvPgm  SrvPgm( CBX277S )
002100191120     **               Module( CBX277S )
002200191120     **               Export( *SRCFILE )
002300191120     **               SrcFile( QSRVSRC )
002400191120     **               SrcMbr( CBX277B )
002500191120     **               ActGrp( *CALLER )
002600191120     **               UsrPrf( *OWNER )
002700191120     **               Aut( *USE )
002800191120     **
002900191120     **
003000191120     **-- Control specification:  --------------------------------------------**
003100191120     H NoMain  Option( *SrcStmt )  BndDir( 'QC2LE' )
003200191120
003300191120     **-- API error data structure:
003400191120     D ERRC0100        Ds                  Qualified
003500191120     D  BytPrv                       10i 0 Inz( %Size( ERRC0100 ))
003600191120     D  BytAvl                       10i 0
003700191120     D  MsgId                         7a
003800191120     D                                1a
003900191120     D  MsgDta                     1024a
004000191120
004100191120     **-- Global constants:
004200191120     D PRN_REAL        c                   '0'
004300191120     D PRN_TEST        c                   '1'
004400191120     **
004500191120     D PAR_NOT         c                   '0'
004600191120     D PAR_ODD         c                   '1'
004700191120     D PAR_EVEN        c                   '2'
004800191120     **
004900191120     D CSP_ANY         c                   '0'
005000191120     D CSP_SFW         c                   '1'
005100191120     D CSP_HDW         c                   '2'
005200191120     **
005300191120     D DES             c                   20
005400191120     D TDES            c                   21
005500191120     D AES             c                   22
005600191120     D RC2             c                   23
005700191120     **
005800191120     D ECB             c                   '0'
005900191120     D CBC             c                   '1'
006000191120     D OFB             c                   '2'
006100191120     D OFB_1B          c                   '3'
006200191120     D OFB_8B          c                   '4'
006300191120     D OFB_64B         c                   '5'
006400191120     **
006500191120     D PAD_NO          c                   '0'
006600191120     D PAD_CHR         c                   '1'
006700191120     D PAD_CNT         c                   '2'
006800191120     **
006900191120     D KEY_DES         c                   20
007000191120     D KEY_TDES        c                   21
007100191120     D KEY_AES         c                   22
007200191120     D KEY_RC2         c                   23
007300191120     D KEY_RC4_C       c                   30
007400191120     D KEY_RSA_PUB     c                   50
007500191120     D KEY_RSA_PRI     c                   51
007600191120     **
007700191120     D FMT_BIN         c                   '0'
007800191120     D FMT_BER         c                   '1'
007900191120     **
008000191120     D TYP_DES         c                   20
008100191120     D TYP_TDES        c                   21
008200191120     D TYP_AES         c                   22
008300191120     D TYP_RC2         c                   23
008400191120     D TYP_RC4_C       c                   30
008500191120     D TYP_RSA_PUB     c                   50
008600191120     D TYP_RSA_PRI     c                   51
008700191120     **
008800191120     D TYP_MD5         c                   1
008900191120     D TYP_SHA_1       c                   2
009000191120     D TYP_SHA_256     c                   3
009100191120     D TYP_SHA_384     c                   4
009200191120     D TYP_SHA_512     c                   5
009300191120     **
009400191120     D KEY_CLR         c                   '0'
009500191120     D KEY_ENC         c                   '1'
009600191120     **
009700191120     D KEY_CTX_NONE    c                   ' '
009800191120     D ALG_CTX_NONE    c                   ' '
009900191120     D CRP_DEV_NONE    c                   ' '
010000191120     **
010100191120     D FOF_CON         c                   '0'
010200191120     D FOF_FIN         c                   '1'
010300191120     **
010400191120     D NULL            c                   ''
010500191120     D DFT_BLK_LEN     c                   16
010600191120     D DFT_PAD_CHR     c                   x'00'
010700191120
010800191120     **-- Encrypt data API:
010900191120     D EncryptData     Pr                  ExtProc( 'Qc3EncryptData' )
011000191120     D  ClrDta                    65535a   Const  Options( *VarSize )
011100191120     D  ClrDtaLen                    10i 0 Const
011200191120     D  ClrDtaFmt                     8a   Const
011300191120     D  AlgDsc                     1024a   Const  Options( *VarSize )
011400191120     D  AlgDscFmt                     8a   Const
011500191120     D  KeyDsc                     1024a   Const  Options( *VarSize )
011600191120     D  KeyDscFmt                     8a   Const
011700191120     D  CrpSrvPrv                     1a   Const
011800191120     D  CrpDevNam                    10a   Const
011900191120     D  EncDta                    65535a          Options( *VarSize )
012000191120     D  EncDtaLen                    10i 0 Const
012100191120     D  EncRtnLen                    10i 0
012200191120     D  Error                     32767a          Options( *VarSize )
012300191120     **-- Decrypt data API:
012400191120     D DecryptData     Pr                  ExtProc( 'Qc3DecryptData' )
012500191120     D  EncDta                    65535a   Const  Options( *VarSize )
012600191120     D  EncDtaLen                    10i 0 Const
012700191120     D  AlgDsc                     1024a   Const  Options( *VarSize )
012800191120     D  AlgDscFmt                     8a   Const
012900191120     D  KeyDsc                     1024a   Const  Options( *VarSize )
013000191120     D  KeyDscFmt                     8a   Const
013100191120     D  CrpSrvPrv                     1a   Const
013200191120     D  CrpDevNam                    10a   Const
013300191120     D  ClrDta                    65535a          Options( *VarSize )
013400191120     D  ClrDtaLen                    10i 0 Const
013500191120     D  ClrRtnLen                    10i 0
013600191120     D  Error                     32767a          Options( *VarSize )
013700191120     **-- Translate data API:
013800191120     D TranslateData   Pr                  ExtProc( 'Qc3TranslateData' )
013900191120     D  TrnDtaInp                 65535a   Const  Options( *VarSize )
014000191120     D  TrnDtaInpLen                 10i 0 Const
014100191120     D  DecAlgCtxTkn                  8a   Const
014200191120     D  DecKeyCtxTkn                  8a   Const
014300191120     D  EncAlgCtxTkn                  8a   Const
014400191120     D  EncKeyCtxTkn                  8a   Const
014500191120     D  CrpSrvPrv                     1a   Const
014600191120     D  CrpDevNam                    10a   Const
014700191120     D  TrnDtaOut                 65535a          Options( *VarSize )
014800191120     D  TrnDtaOutLen                 10i 0 Const
014900191120     D  TrnDtaRtnLen                 10i 0
015000191120     D  Error                     32767a          Options( *VarSize )
015100191120     **-- Calculate hash API:
015200191120     D CalculateHash   Pr                  ExtProc( 'Qc3CalculateHash' )
015300191120     D  ClcDtaInp                 65535a   Const  Options( *VarSize )
015400191120     D  ClcDtaInpLen                 10i 0 Const
015500191120     D  ClcDtaFmt                     8a   Const
015600191120     D  AlgDsc                      256a   Const  Options( *VarSize )
015700191120     D  AlgDscFmt                     8a   Const
015800191120     D  CrpSrvPrv                     1a   Const
015900191120     D  CrpDevNam                    10a   Const
016000191120     D  ClcDtaOut                   256a          Options( *VarSize )
016100191120     D  Error                     32767a          Options( *VarSize )
016200191120     **-- Generate pseudorandom numbers:
016300191120     D GenRndNbr       Pr                  ExtProc( 'Qc3GenPRNs' )
016400191120     D  PrnDta                     1024a          Options( *VarSize )
016500191120     D  PrnDtaLen                    10i 0 Const
016600191120     D  PrnTyp                        1a   Const
016700191120     D  PrnPar                        1a   Const
016800191120     D  Error                     32767a          Options( *VarSize )
016900191120     **-- Generate symmetric key API:
017000191120     D GenSymKey       Pr                  ExtProc( 'Qc3GenSymmetricKey' )
017100191120     D  KeyTyp                       10i 0 Const
017200191120     D  KeySiz                       10i 0 Const
017300191120     D  KeyFmt                        1a   Const
017400191120     D  KeyFrm                        1a   Const
017500191120     D  KekKeyCtxTkn                  8a   Const
017600191120     D  KekAlgCtxTkn                  8a   Const
017700191120     D  CrpSrvPrv                     1a   Const
017800191120     D  CrpDevNam                    10a   Const
017900191120     D  KeyStr                      256a          Options( *VarSize )
018000191120     D  KeyStrLen                    10i 0 Const
018100191120     D  KeyLenRtn                    10i 0
018200191120     D  Error                     32767a          Options( *VarSize )
018300191120     **-- Create algorithm context API:
018400191120     D CrtAlgCtx       Pr                  ExtProc( 'Qc3CreateAlgorithm-
018500191120     D                                     Context')
018600191120     D  AlgDsc                     1024a   Const  Options( *VarSize )
018700191120     D  AlgDscFmt                     8a   Const
018800191120     D  AlgCtxTkn                     8a
018900191120     D  Error                     32767a          Options( *VarSize )
019000191120     **-- Create key context API:
019100191120     D CrtKeyCtx       Pr                  ExtProc( 'Qc3CreateKeyContext' )
019200191120     D  KeyStr                      256a   Const  Options( *VarSize )
019300191120     D  KeyStrLen                    10i 0 Const
019400191120     D  KeyFmt                        1a   Const
019500191120     D  KeyTyp                       10i 0 Const
019600191120     D  KeyFrm                        1a   Const
019700191120     D  KekKeyCtxTkn                  8a   Const
019800191120     D  KekAlgCtxTkn                  8a   Const
019900191120     D  KeyCtxTkn                     8a
020000191120     D  Error                     32767a          Options( *VarSize )
020100191120     **-- Destroy algorithm context API:
020200191120     D DstAlgCtx       Pr                  ExtProc( 'Qc3DestroyAlgorithm-
020300191120     D                                     Context' )
020400191120     D  AlgCtxTkn                     8a   Const
020500191120     D  Error                     32767a          Options( *VarSize )
020600191120     **-- Destroy key context API:
020700191120     D DstKeyCtx       Pr                  ExtProc( 'Qc3DestroyKeyContext' )
020800191120     D  KeyCtxTkn                     8a   Const
020900191120     D  Error                     32767a          Options( *VarSize )
021000191120     **-- Retrieve key record attributes:
021100191120     D RtvKeyRcdA      Pr                  ExtProc( 'Qc3RetrieveKeyRecordAtr' )
021200191120     D  KeyStore_q                   20a   Const
021300191120     D  RcdLbl                       32a   Const
021400191120     D  KeyTyp                       10i 0
021500191120     D  KeySiz                       10i 0
021600191120     D  MstKeyID                     10i 0
021700191120     D  KeyVfyVal                    20a
021800191120     D  DisAlwFnc                    10i 0
021900191120     D  Error                     32767a          Options( *VarSize )
022000191120     **-- Convert character to hex:
022100191120     D cvtch           Pr                  ExtProc( 'cvtch' )
022200191120     D  RcvChr                         *   Value
022300191120     D  SrcHex                         *   Value
022400191120     D  SrcLen                       10i 0 Value
022500191120     **-- Convert hex to character:
022600191120     D cvthc           Pr                  ExtProc( 'cvthc' )
022700191120     D  RcvHex                         *   Value
022800191120     D  SrcChr                         *   Value
022900191120     D  RcvLen                       10i 0 Value
023000191120
023100191120     **-- Get cipher key:
023200191120     D GetCphKey       Pr            48a   Varying
023300191120     D  PxKeyStore_q                 20a   Const
023400191120     D  PxKeyLbl                     32a   Const  Varying
023500191120
023600191120     **-- Generate initialization vector:
023700191120     D GenInzVct       Pr           128a   Varying
023800191120     D  PxIzvLen                     10i 0 Const
023900191120     **-- Generate AES cipher key:
024000191120     D GenAesKey       Pr            48a   Varying
024100191120     D  PxKeyLen                     10i 0 Const
024200191120     D  PxKekKeyCtxTk                 8a   Const  Options( *NoPass )
024300191120     D  PxKekAlgCtxTk                 8a   Const  Options( *NoPass )
024400191120     **-- Get algorithm context:
024500191120     D GetAlgCtx       Pr             8a
024600191120     D  PxBlkCphAlg                  10i 0 Const
024700191120     D  PxBlkLen                     10i 0 Const
024800191120     D  PxMode                        1a   Const
024900191120     D  PxPadOpt                      1a   Const
025000191120     D  PxPadChr                      1a   Const
025100191120     D  PxInzVct                     32a   Const  Options( *NoPass )
025200191120     **-- Get key context:
025300191120     D GetKeyCtx       Pr             8a
025400191120     D  PxKeyStr                     64a   Varying  Const
025500191120     D  PxKeyTyp                     10i 0 Const
025600191120     D  PxKeyFmt                      1a   Const
025700191120     D  PxKekKeyCtxTk                 8a   Const  Options( *NoPass )
025800191120     D  PxKekAlgCtxTk                 8a   Const  Options( *NoPass )
025900191120     **-- Remove algorithm context:
026000191120     D RmvAlgCtx       Pr            10i 0
026100191120     D  PxAlgCtx                      8a
026200191120     **-- Remove key context:
026300191120     D RmvKeyCtx       Pr            10i 0
026400191120     D  PxKeyCtX                      8a
026500191120     **-- Encrypt data string:
026600191120     D EncDtaStr       Pr          1024a   Varying
026700191120     D  PxDtaStr                   1024a   Varying  Const
026800191120     D  PxAlgCtxTkn                   8a
026900191120     D  PxKeyCtxTkn                   8a
027000191120     **-- Decrypt cipher string:
027100191120     D DecCphStr       Pr          1024a   Varying
027200191120     D  PxCphStr                   1024a   Varying  Const
027300191120     D  PxAlgCtxTkn                   8a
027400191120     D  PxKeyCtxTkn                   8a
027500191120     **-- Calculate hash value:
027600191120     D ClcHashVal      Pr           256a   Varying
027700191120     D  PxCalcStr                 65535a   Varying  Const
027800191120     D  PxHashAlg                    10i 0          Const
027900191120     **-- Get key management algorithm context:
028000191120     D GetMgtAlg       Pr             8a
028100191120     **-- Translate data string:
028200191120     D TrnDtaStr       Pr          1024a   Varying
028300191120     D  PxTrnDtaStr                1024a   Varying  Const
028400191120     D  PxDecAlgCtxTk                 8a
028500191120     D  PxDecKeyCtxTk                 8a
028600191120     D  PxEncAlgCtxTk                 8a
028700191120     D  PxEncKeyCtxTk                 8a
028800191120     **-- Verify key store record:
028900191120     D VfyKeyRcd       Pr            10i 0
029000191120     D  PxKeyStore_q                 20a   Const
029100191120     D  PxRcdLbl                     32a   Const
029200191120     **-- Convert hex nibbles to character:
029300191120     D CvtHexChr       Pr           512a   Varying
029400191120     D  PxHexStr                   1024a   Varying  Const
029500191120     **-- Convert character to hex nibbles:
029600191120     D CvtChrHex       Pr          1024a   Varying
029700191120     D  PxHexStr                    512a   Varying  Const
029800191120
029900191120     **-- Generate initialization vector:
030000191120     P GenInzVct       B                   Export
030100191120     D                 Pi           128a   Varying
030200191120     D  PxIzvLen                     10i 0 Const
030300191120
030400191120     **-- Local declarations
030500191120     D InzVct          s            128a
030600191120
030700191120      /Free
030800191120
030900191120        GenRndNbr( InzVct
031000191120                 : PxIzvLen
031100191120                 : PRN_REAL
031200191120                 : PAR_NOT
031300191120                 : ERRC0100
031400191120                 );
031500191120
031600191120        If  ERRC0100.BytAvl > *Zero;
031700191120          Return  NULL;
031800191120
031900191120        Else;
032000191120          Return  %Subst( InzVct: 1: PxIzvLen );
032100191120        EndIf;
032200191120
032300191120      /End-Free
032400191120
032500191120     P GenInzVct       E
032600191120     **-- Generate AES cipher key:
032700191120     P GenAesKey       B                   Export
032800191120     D                 Pi            48a   Varying
032900191120     D  PxKeyLen                     10i 0 Const
033000191120     D  PxKekKeyCtxTk                 8a   Const  Options( *NoPass )
033100191120     D  PxKekAlgCtxTk                 8a   Const  Options( *NoPass )
033200191120
033300191120     **-- Local declarations
033400191120     D KeyLenRtn       s             10i 0
033500191120     D KeyStr          s             48a
033600191120
033700191120      /Free
033800191120
033900191120        If  %Parms >= 3;
034000191120
034100191120          GenSymKey( TYP_AES
034200191120                   : PxKeyLen
034300191120                   : FMT_BIN
034400191120                   : KEY_ENC
034500191120                   : PxKekKeyCtxTk
034600191120                   : PxKekAlgCtxTk
034700191120                   : CSP_SFW
034800191120                   : CRP_DEV_NONE
034900191120                   : KeyStr
035000191120                   : %Size( KeyStr )
035100191120                   : KeyLenRtn
035200191120                   : ERRC0100
035300191120                   );
035400191120        Else;
035500191120
035600191120          GenSymKey( TYP_AES
035700191120                   : PxKeyLen
035800191120                   : FMT_BIN
035900191120                   : KEY_CLR
036000191120                   : KEY_CTX_NONE
036100191120                   : ALG_CTX_NONE
036200191120                   : CSP_SFW
036300191120                   : CRP_DEV_NONE
036400191120                   : KeyStr
036500191120                   : %Size( KeyStr )
036600191120                   : KeyLenRtn
036700191120                   : ERRC0100
036800191120                   );
036900191120        EndIf;
037000191120
037100191120        If  ERRC0100.BytAvl > *Zero;
037200191120          Return  NULL;
037300191120
037400191120        Else;
037500191120          Return  %Subst( KeyStr: 1: KeyLenRtn );
037600191120        EndIf;
037700191120
037800191120      /End-Free
037900191120
038000191120     P GenAesKey       E
038100191120     **-- Get algorithm context:
038200191120     P GetAlgCtx       B                   Export
038300191120     D                 Pi             8a
038400191120     D  PxBlkCphAlg                  10i 0 Const
038500191120     D  PxBlkLen                     10i 0 Const
038600191120     D  PxMode                        1a   Const
038700191120     D  PxPadOpt                      1a   Const
038800191120     D  PxPadChr                      1a   Const
038900191120     D  PxInzVct                     32a   Const  Options( *NoPass )
039000191120
039100191120     **-- Block cipher algorithm description:
039200191120     D ALGD0200        Ds                  Qualified
039300191120     D  BlkCphAlg                    10i 0
039400191120     D  BlkLen                       10i 0
039500191120     D  Mode                          1a
039600191120     D  PadOpt                        1a
039700191120     D  PadChr                        1a
039800191120     D  Rsv                           1a
039900191120     D  MacLen                       10i 0
040000191120     D  EfcKeySiz                    10i 0
040100191120     D  InzVct_IV                    32a
040200191120     **-- Local declarations
040300191120     D AlgCtxTkn       s              8a
040400191120
040500191120      /Free
040600191120
040700191120        ALGD0200.BlkCphAlg = PxBlkCphAlg;
040800191120        ALGD0200.BlkLen    = PxBlkLen;
040900191120        ALGD0200.Mode      = PxMode;
041000191120        ALGD0200.PadOpt    = PxPadOpt;
041100191120        ALGD0200.PadChr    = PxPadChr;
041200191120        ALGD0200.Rsv       = x'00';
041300191120        ALGD0200.MacLen    = *Zero;
041400191120        ALGD0200.EfcKeySiz = *Zero;
041500191120
041600191120        If  %Parms >= 6;
041700191120          ALGD0200.InzVct_IV = PxInzVct;
041800191120        Else;
041900191120          ALGD0200.InzVct_IV = *Allx'00';
042000191120        EndIf;
042100191120
042200191120        CrtAlgCtx( ALGD0200
042300191120                 : 'ALGD0200'
042400191120                 : AlgCtxTkn
042500191120                 : ERRC0100
042600191120                 );
042700191120
042800191120        If  ERRC0100.BytAvl > *Zero;
042900191120          Return  *Blanks;
043000191120
043100191120        Else;
043200191120          Return  AlgCtxTkn;
043300191120        EndIf;
043400191120
043500191120      /End-Free
043600191120
043700191120     P GetAlgCtx       E
043800191120     **-- Get key context:
043900191120     P GetKeyCtx       B                   Export
044000191120     D                 Pi             8a
044100191120     D  PxKeyStr                     64a   Varying  Const
044200191120     D  PxKeyTyp                     10i 0 Const
044300191120     D  PxKeyFmt                      1a   Const
044400191120     D  PxKekKeyCtxTk                 8a   Const  Options( *NoPass )
044500191120     D  PxKekAlgCtxTk                 8a   Const  Options( *NoPass )
044600191120
044700191120     **-- Local declarations
044800191120     D KeyCtxTkn       s              8a
044900191120
045000191120      /Free
045100191120
045200191120        If  %Parms >= 5;
045300191120
045400191120          CrtKeyCtx( PxKeyStr
045500191120                   : %Len( PxKeyStr )
045600191120                   : PxKeyFmt
045700191120                   : PxKeyTyp
045800191120                   : KEY_ENC
045900191120                   : PxKekKeyCtxTk
046000191120                   : PxKekAlgCtxTk
046100191120                   : KeyCtxTkn
046200191120                   : ERRC0100
046300191120                   );
046400191120        Else;
046500191120
046600191120          CrtKeyCtx( PxKeyStr
046700191120                   : %Len( PxKeyStr )
046800191120                   : PxKeyFmt
046900191120                   : PxKeyTyp
047000191120                   : KEY_CLR
047100191120                   : KEY_CTX_NONE
047200191120                   : ALG_CTX_NONE
047300191120                   : KeyCtxTkn
047400191120                   : ERRC0100
047500191120                   );
047600191120        EndIf;
047700191120
047800191120        If  ERRC0100.BytAvl > *Zero;
047900191120          Return  *Blanks;
048000191120
048100191120        Else;
048200191120          Return  KeyCtxTkn;
048300191120        EndIf;
048400191120
048500191120      /End-Free
048600191120
048700191120     P GetKeyCtx       E
048800191120     **-- Remove algorithm context:
048900191120     P RmvAlgCtx       B                   Export
049000191120     D                 Pi            10i 0
049100191120     D  PxAlgCtxTkn                   8a
049200191120
049300191120      /Free
049400191120
049500191120        DstAlgCtx( PxAlgCtxTkn
049600191120                 : ERRC0100
049700191120                 );
049800191120
049900191120        If  ERRC0100.BytAvl > *Zero;
050000191120          Return  -1;
050100191120
050200191120        Else;
050300191120          Return  0;
050400191120        EndIf;
050500191120
050600191120      /End-Free
050700191120
050800191120     P RmvAlgCtx       E
050900191120     **-- Remove key context:
051000191120     P RmvKeyCtx       B                   Export
051100191120     D                 Pi            10i 0
051200191120     D  PxKeyCtxTkn                   8a
051300191120
051400191120      /Free
051500191120
051600191120        DstKeyCtx( PxKeyCtxTkn
051700191120                 : ERRC0100
051800191120                 );
051900191120
052000191120        If  ERRC0100.BytAvl > *Zero;
052100191120          Return  -1;
052200191120
052300191120        Else;
052400191120          Return  0;
052500191120        EndIf;
052600191120
052700191120      /End-Free
052800191120
052900191120     P RmvKeyCtx       E
053000191120     **-- Encrypt data string:
053100191120     P EncDtaStr       B                   Export
053200191120     D                 Pi          1024a   Varying
053300191120     D  PxDtaStr                   1024a   Varying  Const
053400191120     D  PxAlgCtxTkn                   8a
053500191120     D  PxKeyCtxTkn                   8a
053600191120
053700191120     **-- Algorithm context token structure:
053800191120     D ALGD0100        Ds                  Qualified
053900191120     D  AlgCtxTkn                     8a
054000191120     D  FinOprFlg                     1a
054100191120     **-- Local declarations
054200191120     D EncDtaStr       s           1024a
054300191120     D EncRtnLen       s             10i 0
054400191120
054500191120      /Free
054600191120
054700191120        ALGD0100.AlgCtxTkn = PxAlgCtxTkn;
054800191120        ALGD0100.FinOprFlg = FOF_FIN;
054900191120
055000191120        EncryptData( PxDtaStr
055100191120                   : %Len( PxDtaStr )
055200191120                   : 'DATA0100'
055300191120                   : ALGD0100
055400191120                   : 'ALGD0100'
055500191120                   : PxKeyCtxTkn
055600191120                   : 'KEYD0100'
055700191120                   : CSP_SFW
055800191120                   : *Blanks
055900191120                   : EncDtaStr
056000191120                   : %Size( EncDtaStr )
056100191120                   : EncRtnLen
056200191120                   : ERRC0100
056300191120                   );
056400191120
056500191120        If  ERRC0100.BytAvl > *Zero;
056600191120          Return  NULL;
056700191120
056800191120        Else;
056900191120          Return  %Subst( EncDtaStr: 1: EncRtnLen );
057000191120        EndIf;
057100191120
057200191120      /End-Free
057300191120
057400191120     P EncDtaStr       E
057500191120     **-- Decrypt cipher string:
057600191120     P DecCphStr       B                   Export
057700191120     D                 Pi          1024a   Varying
057800191120     D  PxCphStr                   1024a   Varying  Const
057900191120     D  PxAlgCtxTkn                   8a
058000191120     D  PxKeyCtxTkn                   8a
058100191120
058200191120     **-- Algorithm context token structure:
058300191120     D ALGD0100        Ds                  Qualified
058400191120     D  AlgCtxTkn                     8a
058500191120     D  FinOprFlg                     1a
058600191120     **-- Local declarations
058700191120     D RtnDtaStr       s           1024a
058800191120     D RtnDtaLen       s             10i 0
058900191120
059000191120      /Free
059100191120
059200191120        ALGD0100.AlgCtxTkn = PxAlgCtxTkn;
059300191120        ALGD0100.FinOprFlg = FOF_FIN;
059400191120
059500191120        DecryptData( PxCphStr
059600191120                   : %Len( PxCphStr )
059700191120                   : ALGD0100
059800191120                   : 'ALGD0100'
059900191120                   : PxKeyCtxTkn
060000191120                   : 'KEYD0100'
060100191120                   : CSP_SFW
060200191120                   : *Blanks
060300191120                   : RtnDtaStr
060400191120                   : %Size( RtnDtaStr )
060500191120                   : RtnDtaLen
060600191120                   : ERRC0100
060700191120                   );
060800191120
060900191120        If  ERRC0100.BytAvl > *Zero;
061000191120          Return  NULL;
061100191120
061200191120        Else;
061300191120          Return  %Subst( RtnDtaStr: 1: RtnDtaLen );
061400191120        EndIf;
061500191120
061600191120      /End-Free
061700191120
061800191120     P DecCphStr       E
061900191120     **-- Calculate hash value:
062000191120     P ClcHashVal      B                   Export
062100191120     D                 Pi           256a   Varying
062200191120     D  PxCalcStr                 65535a   Varying  Const
062300191120     D  PxHashAlg                    10i 0          Const
062400191120
062500191120     **-- Algorithm context token structure:
062600191120     D ALGD0100        Ds                  Qualified
062700191120     D  AlgCtxTkn                     8a
062800191120     D  FinOprFlg                     1a
062900191120     **
063000191120     D ALGD0500        Ds                  Qualified
063100191120     D  HashAlg                      10i 0
063200191120     **-- Local declarations
063300191120     D RtnDtaStr       s           1024a
063400191120
063500191120      /Free
063600191120
063700191120        ALGD0500.HashAlg = PxHashAlg;
063800191120
063900191120        CalculateHash( PxCalcStr
064000191120                     : %Len( PxCalcStr )
064100191120                     : 'DATA0100'
064200191120                     : ALGD0500
064300191120                     : 'ALGD0500'
064400191120                     : CSP_SFW
064500191120                     : *Blanks
064600191120                     : RtnDtaStr
064700191120                     : ERRC0100
064800191120                     );
064900191120
065000191120        Select;
065100191120        When  ERRC0100.BytAvl > *Zero;
065200191120          Return  NULL;
065300191120
065400191120        When  ALGD0500.HashAlg = TYP_MD5;
065500191120          Return  %Subst( RtnDtaStr: 1: 16 );
065600191120
065700191120        When  ALGD0500.HashAlg = TYP_SHA_1;
065800191120          Return  %Subst( RtnDtaStr: 1: 20 );
065900191120
066000191120        When  ALGD0500.HashAlg = TYP_SHA_256;
066100191120          Return  %Subst( RtnDtaStr: 1: 32 );
066200191120
066300191120        When  ALGD0500.HashAlg = TYP_SHA_384;
066400191120          Return  %Subst( RtnDtaStr: 1: 48 );
066500191120
066600191120        When  ALGD0500.HashAlg = TYP_SHA_512;
066700191120          Return  %Subst( RtnDtaStr: 1: 64 );
066800191120
066900191120        Other;
067000191120          Return  NULL;
067100191120        EndSl;
067200191120
067300191120      /End-Free
067400191120
067500191120     P ClcHashVal      E
067600191120     **-- Get key management algorithm context:
067700191120     P GetMgtAlg       B                   Export
067800191120     D                 Pi             8a
067900191120
068000191120     **-- Local declarations
068100191120     D AlgCtxTkn       s              8a
068200191120
068300191120      /Free
068400191120
068500191120        AlgCtxTkn = GetAlgCtx( AES: DFT_BLK_LEN: ECB: PAD_CHR: DFT_PAD_CHR );
068600191120
068700191120        Return  AlgCtxTkn;
068800191120
068900191120      /End-Free
069000191120
069100191120     P GetMgtAlg       E
069200191120     **-- Translate data string:
069300191120     P TrnDtaStr       B                   Export
069400191120     D                 Pi          1024a   Varying
069500191120     D  PxTrnDtaStr                1024a   Varying  Const
069600191120     D  PxDecAlgCtxTk                 8a
069700191120     D  PxDecKeyCtxTk                 8a
069800191120     D  PxEncAlgCtxTk                 8a
069900191120     D  PxEncKeyCtxTk                 8a
070000191120
070100191120     **-- Local declarations
070200191120     D TrnRtnDtaStr    s           1024a
070300191120     D TrnRtnDtaLen    s             10i 0
070400191120
070500191120      /Free
070600191120
070700191120        TranslateData( PxTrnDtaStr
070800191120                     : %Len( PxTrnDtaStr )
070900191120                     : PxDecAlgCtxTk
071000191120                     : PxDecKeyCtxTk
071100191120                     : PxEncAlgCtxTk
071200191120                     : PxEncKeyCtxTk
071300191120                     : CSP_SFW
071400191120                     : *Blanks
071500191120                     : TrnRtnDtaStr
071600191120                     : %Size( TrnRtnDtaStr )
071700191120                     : TrnRtnDtaLen
071800191120                     : ERRC0100
071900191120                     );
072000191120
072100191120        If  ERRC0100.BytAvl > *Zero;
072200191120          Return  NULL;
072300191120
072400191120        Else;
072500191120          Return  %Subst( TrnRtnDtaStr: 1: TrnRtnDtaLen );
072600191120        EndIf;
072700191120
072800191120      /End-Free
072900191120
073000191120     P TrnDtaStr       E
073100191120     **-- Verify key store record:
073200191120     P VfyKeyRcd       B                   Export
073300191120     D                 Pi            10i 0
073400191120     D  PxKeyStore_q                 20a   Const
073500191120     D  PxRcdLbl                     32a   Const
073600191120
073700191120     **-- Local declarations
073800191120     D KeyTyp          s             10i 0
073900191120     D KeySiz          s             10i 0
074000191120     D MstKeyID        s             10i 0
074100191120     D KeyVfyVal       s             20a
074200191120     D DisAlwFnc       s             10i 0
074300191120
074400191120      /Free
074500191120
074600191120        RtvKeyRcdA( PxKeyStore_q
074700191120                  : PxRcdLbl
074800191120                  : KeyTyp
074900191120                  : KeySiz
075000191120                  : MstKeyID
075100191120                  : KeyVfyVal
075200191120                  : DisAlwFnc
075300191120                  : ERRC0100
075400191120                  );
075500191120
075600191120        If  ERRC0100.BytAvl > *Zero;
075700191120          Return  -1;
075800191120
075900191120        Else;
076000191120          Return  *Zero;
076100191120        EndIf;
076200191120
076300191120      /End-Free
076400191120
076500191120     P VfyKeyRcd       E
076600191120     **-- Convert hex nibbles to character:
076700191120     P CvtHexChr       B                   Export
076800191120     D                 Pi           512a   Varying
076900191120     D  PxHexStr                   1024a   Varying  Const
077000191120
077100191120     **-- Local declarations
077200191120     D ChrStr          s            512a
077300191120     D HexStr          s           1024a
077400191120
077500191120      /Free
077600191120
077700191120        HexStr = PxHexStr;
077800191120
077900191120        cvtch( %Addr( ChrStr ): %Addr( HexStr ): %Len( PxHexStr ));
078000191120
078100191120        Return  %Subst( ChrStr: 1: %Int( %Len( PxHexStr ) / 2 ));
078200191120
078300191120      /End-Free
078400191120
078500191120     P CvtHexChr       E
078600191120     **-- Convert character to hex nibbles:
078700191120     P CvtChrHex       B                   Export
078800191120     D                 Pi          1024a   Varying
078900191120     D  PxChrStr                    512a   Varying  Const
079000191120
079100191120     **-- Local declarations
079200191120     D HexStr          s           1024a
079300191120     D ChrStr          s            512a
079400191120
079500191120      /Free
079600191120
079700191120        ChrStr = PxChrStr;
079800191120
079900191120        cvthc( %Addr( HexStr ): %Addr( ChrStr ): %Len( PxChrStr ) * 2 );
080000191120
080100191120        Return  %Subst( HexStr: 1: %Int( %Len( PxChrStr ) * 2 ));
080200191120
080300191120      /End-Free
080400191120
080500191120     P CvtChrHex       E

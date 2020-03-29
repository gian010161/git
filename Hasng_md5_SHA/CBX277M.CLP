000001191120/*-------------------------------------------------------------------*/
000002191120/*                                                                   */
000003191120/*  Program . . : CBX277M                                            */
000004191120/*  Description : Calculate Hash Value - Build command               */
000005191120/*  Author  . . : Carsten Flensburg                                  */
000006191120/*                                                                   */
000007191120/*                                                                   */
000008191120/*  Program function:  Compiles, creates and configures all the      */
000009191120/*                     Calculate Hash Value command objects.         */
000010191120/*                                                                   */
000011191120/*                     This program expects a single parameter       */
000012191120/*                     specifying the library to contain the         */
000013191120/*                     command objects.                              */
000014191120/*                                                                   */
000015191120/*                     Object sources must exist in the respective   */
000016191120/*                     source type default source files in the       */
000017191120/*                     command object library.                       */
000018191120/*                                                                   */
000019191120/*                                                                   */
000020191120/*                                                                   */
000021191120/*  Compile options:                                                 */
000022191120/*    CrtClPgm    Pgm( CBX277M )                                     */
000023191120/*                SrcFile( QCLSRC )                                  */
000024191120/*                SrcMbr( *PGM )                                     */
000025191120/*                                                                   */
000026191120/*-------------------------------------------------------------------*/
000027191120             Pgm        &UtlLib
000028191120
000029191120             Dcl        &UtlLib         *Char     10
000030191120
000031191120             MonMsg     CPF0000    *N        GoTo Error
000032191120
000033191120
000034191120             DltSrvPgm  &UtlLib/CBX277S
000035191120             MonMsg     CPF0000
000036191120             RcvMsg     MsgType( *LAST )   Rmv( *YES )
000037191120
000038191120
000039191120             CrtRpgMod  &UtlLib/CBX277S SrcFile( &UtlLib/SRCH ) SrcMbr( *Module ) DbgView( *LIST )
000043191120
000044191120             CrtSrvPgm  &UtlLib/CBX277S Module( &UtlLib/CBX277S ) Export( *SRCFILE ) SrcFile( SRCH ) SrcMbr( +
000045191120                          CBX277B ) ActGrp( QSRVPGM )
000050191120
000051191120
000052191120             CrtRpgMod  &UtlLib/CBX277 SrcFile( &UtlLib/SRCH ) SrcMbr( *Module ) DbgView( *LIST )
000056191120
000057191120             CrtPgm     &UtlLib/CBX277 Module( &UtlLib/CBX277 ) BndSrvPgm( CBX277S ) ActGrp( *NEW )
000061191120
000062191120
000063191120             CrtPnlGrp  &UtlLib/CBX277H SrcFile( &UtlLib/SRCH    ) SrcMbr( *PNLGRP )
000066191120
000067191120
000068191120             CrtCmd     Cmd( &UtlLib/CLCHASHVAL ) Pgm( CBX277 ) SrcFile( &UtlLib/SRCH    ) SRCMBR( CBX277X ) +
000069191120                          HlpPnlGrp( CBX277H ) HlpId( *CMD )
000074191120
000075191120
000076191120             CrtRpgMod  &UtlLib/CBX2772 SrcFile( &UtlLib/SRCH ) SrcMbr( *Module ) DbgView( *LIST )
000077191120
000078191120             CrtPnlGrp  &UtlLib/CBX2772H SrcFile( &UtlLib/SRCH    ) SrcMbr( *PNLGRP )
000079191120
000080191120             CrtCmd     Cmd( &UtlLib/CLCFILHASH ) Pgm( CBX2772 ) SrcFile( &UtlLib/SRCH    ) SRCMBR( CBX2772X ) +
000081191120                          HlpPnlGrp( CBX2772H ) HlpId( *CMD )
000082191120
000083191120
000089191120
000090191120             SndPgmMsg  Msg( 'Command CLCHASHVAL successfully'     *Bcat 'created in library'                  +
000091191120                          *Bcat &UtlLib                               *Tcat '.' ) MsgType( *COMP )
000092191120
000093191120
000094191120
000095191120
000096191120
000097191120             Call       QMHMOVPM    ( '    ' '*COMP' x'00000001' '*PGMBDY' x'00000001' x'0000000800000000' )
000102191120
000103191120             RmvMsg     Clear( *ALL )
000104191120
000105191120             Return
000106191120
000107191120/*-- Error handling:  -----------------------------------------------*/
000108191120 Error:
000109191120             Call       QMHMOVPM    ( '    ' '*DIAG' x'00000001' '*PGMBDY' x'00000001' x'0000000800000000' )
000116191120
000117191120             Call       QMHRSNEM    ( '    ' x'0000000800000000' )
000120191120
000121191120 EndPgm:
000122191120             EndPgm

#INCLUDE "rwmake.ch"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �CFGMI004  � Autor � Paulo Bindo        � Data �  15/01/12   ���
�������������������������������������������������������������������������͹��
���Descricao � Importa os arquivos XML para a rotina de geracao NFE       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP6 IDE                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function CFGMI004()
Local aFiles := {}
Local nX	 := 0                
Private aContas		:= {}
Private cIniFile	:= GetADV97()
Private cStartPath 	:= GetPvProfString(GetEnvServer(),"StartPath","ERROR", cIniFile )+'NFE\ENTRADA\'
Private c2StartPath	:= Trim(cStartLido)+AllTrim(Str(Year(Date())))+"\" 
Private c3StartPath	:= Trim(c2StartPath)+AllTrim(Str(Month(Date())))+"\"	//MES
Private cStartError	:= Trim(cStartPath)+"ERRO\"
Private cStartLido	:= Trim(cStartPath)+"OLD\"

RpcSetType(3)
RpcSetEnv("01","01")

//CRIA DIRETORIOS
MakeDir(GetPvProfString(GetEnvServer(),"StartPath","ERROR", cIniFile )+'NFE\')
MakeDir(Trim(cStartPath)) //CRIA DIRETOTIO ENTRADA
MakeDir(cStartLido) //CRIA DIRETORIO ARQUIVOS IMPORTADOS
MakeDir(c2StartPath) //CRIA DIRETOTIO ANO
MakeDir(c3StartPath) //CRIA DIRETOTIO MES
MakeDir(cStartError) //CRIA DIRETORIO ERRO



aFiles := Directory(GetSrvProfString("RootPath","") +"\" +cStartPath2 +"*.xml")
nXml := 0
For nX := 1 To Len(aFiles)
	nXml++
	U_ReadXML(aFiles[nX,1],.T.)
	
	//QUANDO TIVER 500 XML SAI DA ROTINA, SENAO ESTOURA O ARRAY DO XML
	If nXml == 500
		Return
	EndIf
	
Next nX

RpcClearEnv()


Return

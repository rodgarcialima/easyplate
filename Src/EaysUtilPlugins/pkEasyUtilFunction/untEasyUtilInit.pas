{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7
//                         һ�����е�����������                         
//                         @Copyright 2010 hehf                      
//                   ------------------------------------                       
//                                                                              
//           ���������ǹ�˾�ڲ�ʹ��,��Ϊ��������ʹ���κ�,�κ�����˸��𿪷�,�κ�
//       �˲�����й,�������Ը�.        
//
//            ʹ��Ȩ���Լ���ؽ�������ϵ�κ���  
//                
//                                                               
//            ��վ��ַ��http://www.YiXuan-SoftWare.com                                  
//            �����ʼ���hehaifeng1984@126.com 
//                      YiXuan-SoftWare@hotmail.com    
//            QQ      ��383530895
//            MSN     ��YiXuan-SoftWare@hotmail.com                                   
//------------------------------------------------------------------------------
//��Ԫ˵����
//
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyUtilInit;

interface

uses
  SysUtils, Classes, Windows, DB, DBClient;

type
  TLoadPkg = function (var AParamList: TStrings): Boolean; stdcall;
  
  //����ָ����
  function LoadPkg(APkgName, AFunctionName: string; var AParamList: TStrings): Integer;

  //���ݱ�Ż�ȡ��ִ�в�ѯ��SQL���
  function GetSysSQL(ASQLEName: string): string;

implementation

var
  tmpLoadPkg: TLoadPkg;

  //����ָ����
  function LoadPkg(APkgName, AFunctionName: string; var AParamList: TStrings): Integer;
  begin
//    Result := -1;
    try
      if not FileExists(APkgName) then
        Result := -2
      else
      begin
        try
          Result := LoadPackage(APkgName);
        except
          Result := -3;
        end;
        if Result > 0 then
        begin
          tmpLoadPkg := GetProcAddress(Result, PChar(AFunctionName));
          if @tmpLoadPkg <> nil then
            tmpLoadPkg(AParamList);
        end;
      end;
    except
      Result := -4;
    end;
  end;

  //���ݱ�Ż�ȡ��ִ�в�ѯ��SQL���
  function GetSysSQL(ASQLEName: string): string;
  var
    TmpClientDataSet: TClientDataSet;
  begin
    Result := '';
    TmpClientDataSet := TClientDataSet.Create(nil);
    try
//      TmpClientDataSet.
      with TmpClientDataSet do
      begin
        CommandText := 'SELECT sSQL FROM sysSQL WHERE iFlag = 1 AND sSQLEName = '
                       + QuotedStr(ASQLEName);
        Open;
        if TmpClientDataSet.RecordCount > 0 then
          Result := fieldbyname('sSQL').AsString;
      end;
    finally
      TmpClientDataSet.Free;
    end;
  end;
end.

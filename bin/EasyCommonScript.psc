//��ǰ��¼�û�GUID
function EasyGetUserGUID;
begin          
    Result := EasyGetUserGUID_at;
end;   

//��ǰ��¼�û���
function EasyGetUserName;
begin          
    Result := EasyGetUserName_at;
end;
                                                       
//����GUID
function EasyGenerateGUID;
begin
    Result := EasyGenerateGUID_at;
end;                                                             

function EasyGenerateTrue;
begin
  Result := EasyGenerateTrue_at;
end;

function EasyGenerateFalse;
begin
  Result := EasyGenerateFalse_at;
end;

function EasyGetServerTime;
begin                                               
    Result := EasyGetServerTime_at;
end;

function EasyGenerateInt(Value);
begin
    Result := EasyGenerateInt_at(Value);
end;

function EasyGenerateFloat(Value);
begin
    Result := EasyGenerateFloat_at(Value);
end;
                                          
function EasyGenerateString(Value);
begin
    Result := EasyGenerateString_at(Value);
end;                      

//���ذ�
function EasyLoadPackage(Value);
begin
    Result := EasyLoadPackage_at(Value);
end;     

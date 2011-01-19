unit untEasyBaseConst;

interface

uses DB, DBClient;

const
  EasyErrorHint_NRight = '����Ӧ�Ĳ���Ȩ��!';
  EasyHint_ConfirmDelete = '�Ƿ�ִ��ɾ��������';
  EasyEditHint_Edit = '�༭��������!';
  EasySaveHint_Success = '����ɹ�!';
  EasySaveHint_Error = '����ʧ�ܣ�ԭ��';
  EasyFindHint_Save = '�Ƿ񱣴浱ǰ���ģ��ٽ��в��Ҳ�����';
  EasyRefreshHint_Save = '�Ƿ񱣴浱ǰ���ģ��ٽ���ˢ�²�����';

  EasyNotNullField_Hint = '�ֶβ���Ϊ��!';
  EasyErrorHint_DirCreate = 'Ŀ¼��������ԭ��';

  ActionStr: array[TReconcileAction] of string = ('����', '�ж�', '�ϲ�',
    '��ȷ', 'ȡ��', 'ˢ��');
  UpdateKindStr: array[TUpdateKind] of string = ('�޸�', '����',
    'ɾ��');
  SCaption = '���³��� - %s';
  SUnchanged = '<δ�����ı�>';
  SBinary = '(Binary)';
  SAdt = '(ADT)';
  SArray = '(Array)';
  SFieldName = '�ֶ���';
  SOriginal = 'ԭʼֵ';          //Original Value
  SConflict = '��ͻֵ';          //Conflicting Value
  SValue = 'ֵ';                  //Value
  SNoData = '<�޼�¼>';        //No Records
  SNew = 'New';                   //New

implementation

end.

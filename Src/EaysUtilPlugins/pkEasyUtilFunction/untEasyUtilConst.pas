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
//------------------------------------------------------------------------------}
unit untEasyUtilConst;

interface

const
  EASY_RootGUID = '{00000000-0000-0000-0000-000000000000}';
  
  EASY_OPERATE_ADD   = '����';
  EASY_OPERATE_EDIT   = '�޸�';
  EASY_OPERATE_DELETE   = 'ɾ��';
  
  EASY_SYS_ERROR     = 'ϵͳ����';
  EASY_SYS_HINT      = 'ϵͳ��ʾ';
  EASY_SYS_EXCEPTION = 'ϵͳ�쳣';
  EASY_SYS_EXIT      = 'ϵͳ�˳�';
  EASY_SYS_ABORT     = 'ϵͳ�ж�';

  EASY_SYS_NOTNULL = '����Ϊ��ֵ!';
  EASY_SYS_DATANOCHANGE = '����δ�������,���ܽ��б���!';

  EASY_SYS_SAVE_SUCCESS = '����ɹ�!';
  EASY_SYS_SAVE_FAILED = '����ʧ��,ԭ��:';

//�������ļ�������
  EASY_BPL_NOTFOUND = '����ָ�����ļ�%s�Ѷ�ʧ!';
//���ݿ�����
  EASY_DB_CONNECT_ERROR = '����������ʧ��, ԭ��' ;
  EASY_DB_CONNECT_ERROR1 = '1������Ӧ�÷������Ƿ���;' ;
  EASY_DB_CONNECT_ERROR2 = '2������ͻ��˲��������Ƿ���ȷ.' ;
  
  EASY_DB_NOTFILE       = 'ϵͳ�ļ���ʧ,ԭ������ģ�鶪ʧ!';
  EASY_DB_INITERROR     = '����ģ���ʼ��ʧ��,������������ģ��!';
  EASY_DB_LOADERROR     = '����ģ�����ʧ��,ԭ������ģ���𻵻�ʧ!';

//������
  EASY_SPLASH_NOTFILE       = 'ϵͳ�ļ���ʧ,ԭ��������(SplashForm.dll)�ļ���ʧ!';

//��¼����
  EASY_LOGIN_NOTFILE        = 'ϵͳ��¼�ļ���ʧ!';

//��������ʾʱ
  EASY_DISPLAYUSERINFO_WELCOME = '��ӭ ';
  EASY_DISPLAYUSERINFO_DEPT    = '���� ';
  EASY_DISPLAYUSERINFO_NULL = '���û�δ��Ա��ʹ��,�޷���¼ϵͳ!';
  EASY_DISPLAYUSERINFO_MORE = '���û��ж��Ա��ʹ��,ϵͳ����ֹ��¼!';
  EASY_STATUBAR_APP = 'Ӧ�ó������� ';
  EASY_STATUBAR_DBHOST = ' ���ݷ����� ';

//Ȩ�޹���
  EASY_RIGHT_TOPARENT = 'ֻ�ܶԸ��ڵ����ڵ������ԴȨ�޷���!';

//ϵͳ������Կ
  EASY_KEY_DB = 'ABC1?*_+23XZY';
  EASY_KEY_FILE = 'acAB13XZ?*_+';
  EASY_KEY_IM = 'ABC_abc*12';
  EASY_KEY_MAIL = 'EASYMAILc*1';
  EASY_KEY_OTERHR = 'EASYOTHER?*KEY';

  EASY_DBCONNECT_SUCCESS = '�������������óɹ�,���µ�¼�����Ч!';
//�������
  EASY_PLUGIN_LOAD_FAILED = '���ز��%sʧ�ܣ�ԭ��';
  EASY_PLUGIN_CANNOT_LOAD = '���ܼ��ز��:%s ԭ��δ�ҵ������ں���!'; 
type
  //��������״̬
  TEasyOperateType = (eotAdd, eotEdit, eotDelete);
  
implementation

end.












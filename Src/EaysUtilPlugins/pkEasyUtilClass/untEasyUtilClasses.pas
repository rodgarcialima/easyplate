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
//     ����ϵͳ����ʹ�õ�һ���࣬��פ�ڴ�
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyUtilClasses;

interface

uses
  Windows, Classes;

type

  //�����
  PPLugin = ^TPlugin;
  TPlugin = record
    FileName: string; //����ļ�
    EName: string;   //Ӣ����
    CName: string;   //������
    image1: string;  //ͼƬ
    image2: string;  //���ʱͼƬ
    iOrder: Integer; //���
    Flag  : string; //��־��
  end;


implementation

end.

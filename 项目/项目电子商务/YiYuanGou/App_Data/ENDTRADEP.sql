/*����ռ�������Ժ���ã�Ӧ����ɵĹ���������
   1.����Ʒ������Ϣ��ӵ�cart���orders��
   2.��sitdown��÷����ռ����Ϣ���
   3.��room���и÷������Ϣ��ʼ�����޸�ˮ��������*/
CREATE OR REPLACE
PROCEDURE ENDTRADEP
( rid IN NUMBER
) AS
BEGIN
  delete from sitdown where roomid= rid; 
  update room set falseuser= trunc(limiteduser*newfaultuser/100) where statement=1 and roomid=rid;
  
END ENDTRADEP;
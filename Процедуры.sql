USE ��������2
GO

/*CREATE PROC ��������_����������_�����_��_������ @STARTDATE date, @ENDDATE date
AS
	WITH ������_��_������(���������, ����)
	AS
	(
		SELECT id_��������������_����������, ����_������
		FROM ������
		WHERE ����_������ >= @STARTDATE AND ����_������ <= @ENDDATE
	)
	SELECT �������, ���, ��������, COUNT(����) '���������� �����'
	FROM ���������
	LEFT JOIN ������_��_������ ON ������_��_������.��������� = id
	WHERE ��������� = '�������� �� ������ � ���������'
	GROUP BY �������, ���, ��������
	ORDER BY [���������� �����] DESC;

CREATE PROC ��������_������_����������_������ @TITLE varchar(50)
AS
	SELECT ���, �������, ����_��������� FROM ��������
	JOIN ������_���������� ON ��������.id = id_���������
	JOIN ���������� ON ����������.id = id_�����������
	WHERE ����������.�������� = @TITLE

CREATE PROC ��������_������_�������_��_��������� @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT ��������, ��������_�_����, �����_������ FROM ����������
	JOIN ������_���������� ON ����������.id = ������_����������.id_�����������
	JOIN �������� ON ��������.id = ������_����������.id_���������
	WHERE ��������.��� = @NAME AND ��������.������� = @SERNAME

CREATE PROC ��������_��������_������_����_���
AS
	DELETE FROM �������� WHERE ��������.���� < DATEADD(YEAR, -3, GETDATE())

CREATE PROC �������_��������_������_����_���
AS
	DELETE FROM �������� WHERE ��������.���� < DATEADD(YEAR, -5, GETDATE())


CREATE PROC ��������_������_�����������_�_������� @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT id_����������, ���_���������_��������, ���������_��������� FROM ������
	JOIN ������ ON ������.id = ������.id_�������
	JOIN ��������� ON ���������.id = ������.id_����������
	WHERE ������.��� = @NAME AND ������.������� = @SERNAME AND ����_�����������_���� is null

CREATE PROC ��������_������_��������_���������� @TITLE varchar(50)
AS
	SELECT ��������.����, (��������.���������� * ��������.����) '�����' FROM ��������
	JOIN ��������� ON ��������.id_���������� = ���������.id
	WHERE ���������.������������_����������� = @TITLE

CREATE PROC ������_����������_�����_��������� @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT ���������.������_����������_����� FROM ���������
	WHERE ���������.��� = @NAME AND ���������.������� = @SERNAME

CREATE PROC ������_���������_���������� @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT ���������.��������� FROM ���������
	WHERE ���������.��� = @NAME AND ���������.������� = @SERNAME

CREATE PROC �������_���������� @ID int
AS
	DELETE FROM ��������� WHERE ���������.id = @ID

CREATE PROC ��������_�������_������� @ID int, @VALUE smallint
AS
	UPDATE ������ SET ������� = @VALUE FROM ������ WHERE ������.id = @ID

CREATE PROC ������_����_��_���������_��_������ @ID int
AS
	SELECT ���������� - [���������� �������� �����������] - [���������� ��������� �����������]
	FROM ������_������
	WHERE ������_������.��������� = @ID

CREATE PROC ������_����������_������_���������� @TITLE varchar(50)
AS
	SELECT �������, [����������� �����], �������, ���
	FROM ����������_������_�����������
	WHERE ����������_������_�����������.����������� = @TITLE

CREATE PROC ������_������_���������� @TITILE varchar(50)
AS
	SELECT ����� FROM ���������
	WHERE ������������_����������� = @TITILE

CREATE PROC ����������_�����������
AS
	SELECT ��������, COUNT(������.id) '���������� �����' FROM ������
	JOIN ��������� ON ���������.id = ������.id_����������
	JOIN ���������� ON ����������.id = ���������.id_�����������
	GROUP BY ��������*/

CREATE PROC ����������_��_����������� @TITILE varchar(50)
AS
	SELECT ���������.id '���������' FROM ����������
	JOIN ��������� ON ���������.id_����������� = ����������.id
	WHERE ����������.�������� = @TITILE
/*****������� ����������*****/

CREATE TABLE dbo.����������(
	id int IDENTITY(1,1) NOT NULL,
	�������� varchar(150) NOT NULL,
	���� varchar(50) NOT NULL,
	���� varchar(50) NOT NULL,
	�����_������ varchar(50) NULL,
	������������ varchar(50) NOT NULL,
	���_������� date NOT NULL,
 CONSTRAINT PK_���������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/*****������� ������*****/

CREATE TABLE dbo.������(
	id int IDENTITY(1,1) NOT NULL,
	id_���������� int NOT NULL,
	id_������� int NOT NULL,
	id_��������������_���������� int NOT NULL,
	����_������ date NOT NULL,
	����_����������_��������� date NOT NULL,
	����_������ int NOT NULL,
	����_��������� int NOT NULL,
	�����_��������� money NOT NULL,
	�����_����������_�������� money NOT NULL,
	�����_������ money NOT NULL,
	�����_������ money NOT NULL,
	����_�����������_���� date NOT NULL,
	����_�����������_���� date NOT NULL,
	�����_�������������_������ money NOT NULL,
	������_������� varchar(500) NULL,
 CONSTRAINT PK_������ PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[������]  WITH CHECK ADD  CONSTRAINT [FK_������_������] FOREIGN KEY([id_�������])
REFERENCES [dbo].[������] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[������] CHECK CONSTRAINT [FK_������_������]

ALTER TABLE [dbo].[������]  WITH CHECK ADD  CONSTRAINT [FK_������_���������] FOREIGN KEY([id_��������������_����������])
REFERENCES [dbo].[���������] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[������] CHECK CONSTRAINT [FK_������_���������]

ALTER TABLE [dbo].[������]  WITH CHECK ADD  CONSTRAINT [FK_������_���������] FOREIGN KEY([id_����������])
REFERENCES [dbo].[���������] ([id])

ALTER TABLE [dbo].[������] CHECK CONSTRAINT [FK_������_���������]

/*****������� ������*****/

CREATE TABLE dbo.������(
	id int IDENTITY(1,1) NOT NULL,
	�����_����������_����� int NOT NULL,
	������� varchar(50) NOT NULL,
	��� varchar(50) NOT NULL,
	�������� varchar(50) NULL,
	��� varchar(3) NULL,
	����_�������� date NOT NULL,
	�����_�������� varchar(4) NOT NULL,
	�����_�������� varchar(6) NOT NULL,
	����� varchar(500) NOT NULL,
	����������_����� varchar(20) NOT NULL,
	�����������_����� varchar(50) NOT NULL,
	������� tinyint NOT NULL,
 CONSTRAINT PK_������ PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[������]  WITH CHECK ADD  CONSTRAINT [CK_������_����������_�����] CHECK  (([����������_�����] like '+7-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))

ALTER TABLE [dbo].[������] CHECK CONSTRAINT [CK_������_����������_�����]

ALTER TABLE [dbo].[������]  WITH CHECK ADD  CONSTRAINT [CK_������_�����������_�����] CHECK  (([�����������_�����] like '*@*.*'))

ALTER TABLE [dbo].[������] CHECK CONSTRAINT [CK_������_�����������_�����]

/*****������� �������*****/

CREATE TABLE dbo.�������(
	id int IDENTITY(1,1) NOT NULL,
	id_����������� int NOT NULL,
	�������� varchar(100) NOT NULL,
	���_����������� date NOT NULL,
 CONSTRAINT PK_������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[�������]  WITH CHECK ADD  CONSTRAINT [FK_�������_����������] FOREIGN KEY([id_�����������])
REFERENCES [dbo].[����������] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[�������] CHECK CONSTRAINT [FK_�������_����������]

/*****������� ��������*****/

CREATE TABLE dbo.��������(
	id int IDENTITY(1,1) NOT NULL,
	id_���������� int NOT NULL,
	id_������������_���������� int NOT NULL,
	id_���������� int NOT NULL,
	���� date NOT NULL,
	���� money NOT NULL,
	���������� int NOT NULL,
 CONSTRAINT PK_�������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[��������]  WITH CHECK ADD  CONSTRAINT [FK_��������_���������] FOREIGN KEY([id_����������])
REFERENCES [dbo].[���������] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[��������] CHECK CONSTRAINT [FK_��������_���������]

ALTER TABLE [dbo].[��������]  WITH CHECK ADD  CONSTRAINT [FK_��������_���������] FOREIGN KEY([id_����������])
REFERENCES [dbo].[���������] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[��������] CHECK CONSTRAINT [FK_��������_���������]

/*****������� ���������*****/

CREATE TABLE dbo.���������(
	id int IDENTITY(1,1) NOT NULL,
	������������_����������� varchar(100) NOT NULL,
	�������_��������� varchar(50) NOT NULL,
	���_��������� varchar(50) NOT NULL,
	��������_��������� varchar(50) NULL,
	����� varchar(500) NOT NULL,
	����������_����� varchar(20) NOT NULL,
	�����������_����� varchar(50) NOT NULL,
 CONSTRAINT PK_��������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [CK_���������_����������_�����] CHECK  (([����������_�����] like '+7-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [CK_���������_����������_�����]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [CK_���������_�����������_�����] CHECK  (([�����������_�����] like '*@*.*'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [CK_���������_�����������_�����]

/*****������� ������ ����������*****/

CREATE TABLE dbo.������_����������(
	id int IDENTITY(1,1) NOT NULL,
	id_����������� int NOT NULL,
	id_��������� int NOT NULL,
	����_��������� varchar(50) NOT NULL,
 CONSTRAINT PK_������_���������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[������_����������]  WITH CHECK ADD  CONSTRAINT [FK_������_����������_����������] FOREIGN KEY([id_�����������])
REFERENCES [dbo].[����������] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[������_����������] CHECK CONSTRAINT [FK_������_����������_����������]

ALTER TABLE [dbo].[������_����������]  WITH CHECK ADD  CONSTRAINT [FK_������_����������_��������] FOREIGN KEY([id_���������])
REFERENCES [dbo].[��������] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[������_����������] CHECK CONSTRAINT [FK_������_����������_��������]

/*****������� ���������*****/

CREATE TABLE dbo.���������(
	id int IDENTITY(1,1) NOT NULL,
	����_���������� date NOT NULL,
	��������� varchar(50) NOT NULL,
	������_����������_����� varchar(50) NOT NULL,
	������� varchar(50) NOT NULL,
	��� varchar(50) NOT NULL,
	�������� varchar(50) NULL,
	�����_�������� varchar(4) NOT NULL,
	�����_�������� varchar(6) NOT NULL,
	�����_��_�������� varchar(500) NOT NULL,
	�����_��������_������ varchar(7) NOT NULL,
	�����_����� varchar(11) NOT NULL,
	��� varchar(12) NOT NULL,
	����������_����� varchar(20) NOT NULL,
	������_������� varchar(1000) NULL,
 CONSTRAINT PK_��������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [CK_���������_���] CHECK  (([���] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [CK_���������_���]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [CK_���������_�����_��������] CHECK  (([�����_��������] like '[0-9][0-9][0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [CK_���������_�����_��������]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [CK_���������_�����_�����] CHECK  (([�����_�����] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9] [0-9][0-9]'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [CK_���������_�����_�����]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [CK_���������_�����_��������_������] CHECK  (([�����_��������_������] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [CK_���������_�����_��������_������]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [CK_���������_����������_�����] CHECK  (([����������_�����] like '+7-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [CK_���������_����������_�����]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [��_���������_�����_��������] CHECK  (([�����_��������] like '[0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [��_���������_�����_��������]

/*****������� ��������*****/

CREATE TABLE dbo.��������(
	id int IDENTITY(1,1) NOT NULL,
	id_���������� int NOT NULL,
	id_���������� int NOT NULL,
	���� date NOT NULL,
	������� varchar(1000) NOT NULL,
 CONSTRAINT PK_�������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[��������]  WITH CHECK ADD  CONSTRAINT [FK_��������_���������] FOREIGN KEY([id_����������])
REFERENCES [dbo].[���������] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[��������] CHECK CONSTRAINT [FK_��������_���������]

ALTER TABLE [dbo].[��������]  WITH CHECK ADD  CONSTRAINT [FK_��������_���������] FOREIGN KEY([id_����������])
REFERENCES [dbo].[���������] ([id])

ALTER TABLE [dbo].[��������] CHECK CONSTRAINT [FK_��������_���������]

/*****������� ��������*****/

CREATE TABLE dbo.��������(
	id int IDENTITY(1,1) NOT NULL,
	������� varchar(50) NOT NULL,
	��� varchar(50) NOT NULL,
	�������� varchar(50) NULL,
	���_�������� date NOT NULL,
 CONSTRAINT PK_�������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/*****������� ���������*****/

CREATE TABLE dbo.���������(
	id int IDENTITY(1,1) NOT NULL,
	id_����������� int NOT NULL,
	����_������������ date NOT NULL,
	����������_��������� int NOT NULL,
	���������_��������� int NOT NULL,
	���_���������_�������� varchar(50) NOT NULL,
	�����_�������� int NOT NULL,
	�����_����� int NOT NULL,
	����_���������� date NOT NULL,
	����_������� date NOT NULL,
 CONSTRAINT PK_��������� PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [FK_���������_����������] FOREIGN KEY([id_�����������])
REFERENCES [dbo].[����������] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [FK_���������_����������]
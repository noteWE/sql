/*****Таблица Видеофильм*****/

CREATE TABLE dbo.Видеофильм(
	id int IDENTITY(1,1) NOT NULL,
	Название varchar(150) NOT NULL,
	Жанр varchar(50) NOT NULL,
	Язык varchar(50) NOT NULL,
	Место_съемок varchar(50) NULL,
	Издательство varchar(50) NOT NULL,
	Год_выпуска date NOT NULL,
 CONSTRAINT PK_Видеофильм PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/*****Таблица Выдача*****/

CREATE TABLE dbo.Выдача(
	id int IDENTITY(1,1) NOT NULL,
	id_экземпляра int NOT NULL,
	id_клиента int NOT NULL,
	id_обслуживающего_сотрудника int NOT NULL,
	Дата_выдачи date NOT NULL,
	Дата_назначения_продления date NOT NULL,
	Срок_выдачи int NOT NULL,
	Срок_продления int NOT NULL,
	Сумма_продления money NOT NULL,
	Сумма_оплаченная_клиентом money NOT NULL,
	Сумма_полная money NOT NULL,
	Сумма_залога money NOT NULL,
	Дата_возвращения_факт date NOT NULL,
	Дата_возвращения_план date NOT NULL,
	Сумма_возвращенного_залога money NOT NULL,
	Особые_отметки varchar(500) NULL,
 CONSTRAINT PK_Выдача PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Выдача]  WITH CHECK ADD  CONSTRAINT [FK_Выдача_Клиент] FOREIGN KEY([id_клиента])
REFERENCES [dbo].[Клиент] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Выдача] CHECK CONSTRAINT [FK_Выдача_Клиент]

ALTER TABLE [dbo].[Выдача]  WITH CHECK ADD  CONSTRAINT [FK_Выдача_Сотрудник] FOREIGN KEY([id_обслуживающего_сотрудника])
REFERENCES [dbo].[Сотрудник] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Выдача] CHECK CONSTRAINT [FK_Выдача_Сотрудник]

ALTER TABLE [dbo].[Выдача]  WITH CHECK ADD  CONSTRAINT [FK_Выдача_Экземпляр] FOREIGN KEY([id_экземпляра])
REFERENCES [dbo].[Экземпляр] ([id])

ALTER TABLE [dbo].[Выдача] CHECK CONSTRAINT [FK_Выдача_Экземпляр]

/*****Таблица Клиент*****/

CREATE TABLE dbo.Клиент(
	id int IDENTITY(1,1) NOT NULL,
	Номер_клиентской_карты int NOT NULL,
	Фамилия varchar(50) NOT NULL,
	Имя varchar(50) NOT NULL,
	Отчество varchar(50) NULL,
	Пол varchar(3) NULL,
	Дата_рождения date NOT NULL,
	Серия_паспорта varchar(4) NOT NULL,
	Номер_паспорта varchar(6) NOT NULL,
	Адрес varchar(500) NOT NULL,
	Телефонный_номер varchar(20) NOT NULL,
	Электронная_почта varchar(50) NOT NULL,
	Рейтинг tinyint NOT NULL,
 CONSTRAINT PK_Клиент PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [CK_Клиент_Телефонный_номер] CHECK  (([Телефонный_номер] like '+7-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))

ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [CK_Клиент_Телефонный_номер]

ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [CK_Клиент_Электронная_почта] CHECK  (([Электронная_почта] like '*@*.*'))

ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [CK_Клиент_Электронная_почта]

/*****Таблица Награды*****/

CREATE TABLE dbo.Награды(
	id int IDENTITY(1,1) NOT NULL,
	id_видеофильма int NOT NULL,
	Название varchar(100) NOT NULL,
	Год_награждения date NOT NULL,
 CONSTRAINT PK_Награды PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Награды]  WITH CHECK ADD  CONSTRAINT [FK_Награды_Видеофильм] FOREIGN KEY([id_видеофильма])
REFERENCES [dbo].[Видеофильм] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Награды] CHECK CONSTRAINT [FK_Награды_Видеофильм]

/*****Таблица Поставка*****/

CREATE TABLE dbo.Поставка(
	id int IDENTITY(1,1) NOT NULL,
	id_поставщика int NOT NULL,
	id_принимающего_сотрудника int NOT NULL,
	id_экземпляра int NOT NULL,
	Дата date NOT NULL,
	Цена money NOT NULL,
	Количество int NOT NULL,
 CONSTRAINT PK_Поставка PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Поставка]  WITH CHECK ADD  CONSTRAINT [FK_Поставка_Поставщик] FOREIGN KEY([id_поставщика])
REFERENCES [dbo].[Поставщик] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Поставка] CHECK CONSTRAINT [FK_Поставка_Поставщик]

ALTER TABLE [dbo].[Поставка]  WITH CHECK ADD  CONSTRAINT [FK_Поставка_Экземпляр] FOREIGN KEY([id_экземпляра])
REFERENCES [dbo].[Экземпляр] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Поставка] CHECK CONSTRAINT [FK_Поставка_Экземпляр]

/*****Таблица Поставщик*****/

CREATE TABLE dbo.Поставщик(
	id int IDENTITY(1,1) NOT NULL,
	Наименование_организации varchar(100) NOT NULL,
	Фамилия_директора varchar(50) NOT NULL,
	Имя_директора varchar(50) NOT NULL,
	Отчество_директора varchar(50) NULL,
	Адрес varchar(500) NOT NULL,
	Телефонный_номер varchar(20) NOT NULL,
	Электронная_почта varchar(50) NOT NULL,
 CONSTRAINT PK_Поставщик PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Поставщик]  WITH CHECK ADD  CONSTRAINT [CK_Поставщик_Телефонный_номер] CHECK  (([Телефонный_номер] like '+7-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))

ALTER TABLE [dbo].[Поставщик] CHECK CONSTRAINT [CK_Поставщик_Телефонный_номер]

ALTER TABLE [dbo].[Поставщик]  WITH CHECK ADD  CONSTRAINT [CK_Поставщик_Электронная_почта] CHECK  (([Электронная_почта] like '*@*.*'))

ALTER TABLE [dbo].[Поставщик] CHECK CONSTRAINT [CK_Поставщик_Электронная_почта]

/*****Таблица Состав участников*****/

CREATE TABLE dbo.Состав_участников(
	id int IDENTITY(1,1) NOT NULL,
	id_видеофильма int NOT NULL,
	id_участника int NOT NULL,
	Роль_участника varchar(50) NOT NULL,
 CONSTRAINT PK_Состав_участников PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Состав_участников]  WITH CHECK ADD  CONSTRAINT [FK_Состав_участников_Видеофильм] FOREIGN KEY([id_видеофильма])
REFERENCES [dbo].[Видеофильм] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Состав_участников] CHECK CONSTRAINT [FK_Состав_участников_Видеофильм]

ALTER TABLE [dbo].[Состав_участников]  WITH CHECK ADD  CONSTRAINT [FK_Состав_участников_Участник] FOREIGN KEY([id_участника])
REFERENCES [dbo].[Участник] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Состав_участников] CHECK CONSTRAINT [FK_Состав_участников_Участник]

/*****Таблица Сотрудник*****/

CREATE TABLE dbo.Сотрудник(
	id int IDENTITY(1,1) NOT NULL,
	Дата_устройства date NOT NULL,
	Должность varchar(50) NOT NULL,
	Размер_заработной_платы varchar(50) NOT NULL,
	Фамилия varchar(50) NOT NULL,
	Имя varchar(50) NOT NULL,
	Отчество varchar(50) NULL,
	Серия_паспорта varchar(4) NOT NULL,
	Номер_паспорта varchar(6) NOT NULL,
	Адрес_по_прописке varchar(500) NOT NULL,
	Номер_трудовой_книжки varchar(7) NOT NULL,
	Номер_СНИЛС varchar(11) NOT NULL,
	ИНН varchar(12) NOT NULL,
	Телефонный_номер varchar(20) NOT NULL,
	Особые_отметки varchar(1000) NULL,
 CONSTRAINT PK_Сотрудник PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудник_ИНН] CHECK  (([ИНН] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [CK_Сотрудник_ИНН]

ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудник_Номер_паспорта] CHECK  (([Номер_паспорта] like '[0-9][0-9][0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [CK_Сотрудник_Номер_паспорта]

ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудник_Номер_СНИЛС] CHECK  (([Номер_СНИЛС] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9] [0-9][0-9]'))

ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [CK_Сотрудник_Номер_СНИЛС]

ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудник_Номер_трудовой_книжки] CHECK  (([Номер_трудовой_книжки] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [CK_Сотрудник_Номер_трудовой_книжки]

ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудник_Телефонный_номер] CHECK  (([Телефонный_номер] like '+7-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))

ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [CK_Сотрудник_Телефонный_номер]

ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [СК_Сотрудник_Серия_паспорта] CHECK  (([Серия_паспорта] like '[0-9][0-9][0-9][0-9]'))

ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [СК_Сотрудник_Серия_паспорта]

/*****Таблица Списание*****/

CREATE TABLE dbo.Списание(
	id int IDENTITY(1,1) NOT NULL,
	id_сотрудника int NOT NULL,
	id_экземпляра int NOT NULL,
	Дата date NOT NULL,
	Причина varchar(1000) NOT NULL,
 CONSTRAINT PK_Списание PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Списание]  WITH CHECK ADD  CONSTRAINT [FK_Списание_Сотрудник] FOREIGN KEY([id_сотрудника])
REFERENCES [dbo].[Сотрудник] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Списание] CHECK CONSTRAINT [FK_Списание_Сотрудник]

ALTER TABLE [dbo].[Списание]  WITH CHECK ADD  CONSTRAINT [FK_Списание_Экземпляр] FOREIGN KEY([id_экземпляра])
REFERENCES [dbo].[Экземпляр] ([id])

ALTER TABLE [dbo].[Списание] CHECK CONSTRAINT [FK_Списание_Экземпляр]

/*****Таблица Участник*****/

CREATE TABLE dbo.Участник(
	id int IDENTITY(1,1) NOT NULL,
	Фамилия varchar(50) NOT NULL,
	Имя varchar(50) NOT NULL,
	Отчество varchar(50) NULL,
	Год_рождения date NOT NULL,
 CONSTRAINT PK_Участник PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/*****Таблица Экземпляр*****/

CREATE TABLE dbo.Экземпляр(
	id int IDENTITY(1,1) NOT NULL,
	id_видеофильма int NOT NULL,
	Дата_приобретения date NOT NULL,
	Закупочная_стоимость int NOT NULL,
	Прокатная_стоимость int NOT NULL,
	Тип_цифрового_носителя varchar(50) NOT NULL,
	Номер_стеллажа int NOT NULL,
	Номер_полки int NOT NULL,
	Дата_размешения date NOT NULL,
	Дата_изъятия date NOT NULL,
 CONSTRAINT PK_Экземпляр PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Экземпляр]  WITH CHECK ADD  CONSTRAINT [FK_Экземпляр_Видеофильм] FOREIGN KEY([id_видеофильма])
REFERENCES [dbo].[Видеофильм] ([id])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Экземпляр] CHECK CONSTRAINT [FK_Экземпляр_Видеофильм]
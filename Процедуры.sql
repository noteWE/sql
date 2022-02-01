USE ПечкинИО2
GO

/*CREATE PROC Получить_количетсво_выдач_за_период @STARTDATE date, @ENDDATE date
AS
	WITH Выдачи_за_период(Сотрудник, Дата)
	AS
	(
		SELECT id_обслуживающего_сотрудника, Дата_выдачи
		FROM Выдача
		WHERE Дата_выдачи >= @STARTDATE AND Дата_выдачи <= @ENDDATE
	)
	SELECT Фамилия, Имя, Отчество, COUNT(Дата) 'Количество выдач'
	FROM Сотрудник
	LEFT JOIN Выдачи_за_период ON Выдачи_за_период.Сотрудник = id
	WHERE Должность = 'Менеджер по работе с клиентами'
	GROUP BY Фамилия, Имя, Отчество
	ORDER BY [Количество выдач] DESC;

CREATE PROC Получить_список_участников_фильма @TITLE varchar(50)
AS
	SELECT Имя, Фамилия, Роль_участника FROM Участник
	JOIN Состав_участников ON Участник.id = id_участника
	JOIN Видеофильм ON Видеофильм.id = id_видеофильма
	WHERE Видеофильм.Название = @TITLE

CREATE PROC Получить_список_фильмов_по_участнику @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT Название, Премьера_в_мире, Место_съемок FROM Видеофильм
	JOIN Состав_участников ON Видеофильм.id = Состав_участников.id_видеофильма
	JOIN Участник ON Участник.id = Состав_участников.id_участника
	WHERE Участник.Имя = @NAME AND Участник.Фамилия = @SERNAME

CREATE PROC Удаление_списаний_старше_трех_лет
AS
	DELETE FROM Списание WHERE Списание.Дата < DATEADD(YEAR, -3, GETDATE())

CREATE PROC Удалить_поставки_старше_пяти_лет
AS
	DELETE FROM Поставка WHERE Поставка.Дата < DATEADD(YEAR, -5, GETDATE())


CREATE PROC Получить_список_экземпляров_у_клиента @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT id_экземпляра, Тип_цифрового_носителя, Прокатная_стоимость FROM Выдача
	JOIN Клиент ON Клиент.id = Выдача.id_клиента
	JOIN Экземпляр ON Экземпляр.id = Выдача.id_экземпляра
	WHERE Клиент.Имя = @NAME AND Клиент.Фамилия = @SERNAME AND Дата_возвращения_факт is null

CREATE PROC Получить_список_поставок_поставщика @TITLE varchar(50)
AS
	SELECT Поставка.Дата, (Поставка.Количество * Поставка.Цена) 'Сумма' FROM Поставка
	JOIN Поставщик ON Поставка.id_поставщика = Поставщик.id
	WHERE Поставщик.Наименование_организации = @TITLE

CREATE PROC Узнать_заработную_плату_сорудника @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT Сотрудник.Размер_заработной_платы FROM Сотрудник
	WHERE Сотрудник.Имя = @NAME AND Сотрудник.Фамилия = @SERNAME

CREATE PROC Узнать_должность_сотрудника @NAME varchar(50), @SERNAME varchar(50)
AS
	SELECT Сотрудник.Должность FROM Сотрудник
	WHERE Сотрудник.Имя = @NAME AND Сотрудник.Фамилия = @SERNAME

CREATE PROC Уволить_сотрудника @ID int
AS
	DELETE FROM Сотрудник WHERE Сотрудник.id = @ID

CREATE PROC Изменить_рейтинг_клиента @ID int, @VALUE smallint
AS
	UPDATE Клиент SET Рейтинг = @VALUE FROM Клиент WHERE Клиент.id = @ID

CREATE PROC Узнать_есть_ли_экземпляр_на_складе @ID int
AS
	SELECT Количество - [Количество выданных экземпляров] - [Количество списанных экземпляров]
	FROM Баланс_склада
	WHERE Баланс_склада.Экземпляр = @ID

CREATE PROC Узнать_контактные_данные_поставщика @TITLE varchar(50)
AS
	SELECT Телефон, [Электронная почта], Фамилия, Имя
	FROM Контактные_данные_поставщиков
	WHERE Контактные_данные_поставщиков.Организация = @TITLE

CREATE PROC Узнать_адресс_поставщика @TITILE varchar(50)
AS
	SELECT Адрес FROM Поставщик
	WHERE Наименование_организации = @TITILE

CREATE PROC Популярные_видеофильмы
AS
	SELECT Название, COUNT(Выдача.id) 'Количество выдач' FROM Выдача
	JOIN Экземпляр ON Экземпляр.id = Выдача.id_экземпляра
	JOIN Видеофильм ON Видеофильм.id = Экземпляр.id_видеофильма
	GROUP BY Название*/

CREATE PROC Видеофильм_на_экземплярах @TITILE varchar(50)
AS
	SELECT Экземпляр.id 'Экземпляр' FROM Видеофильм
	JOIN Экземпляр ON Экземпляр.id_видеофильма = Видеофильм.id
	WHERE Видеофильм.Название = @TITILE
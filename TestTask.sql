CREATE DATABASE TestTaskDB;

USE TestTaskDB;

SET GLOBAL event_scheduler = ON;

CREATE TABLE CompaignOwners(
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    crypto_wallet_address VARCHAR(100) NOT NULL
);

CREATE TABLE CompaignStatuses(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

INSERT INTO CompaignStatuses (name)
VALUES ('active'), ('successful'), ('expired'), ('fraud');

CREATE TABLE Compaigns(
    compaign_id VARCHAR(50) NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(500) NOT NULL,
    goal_amount DECIMAL(13,2) NOT NULL,
    expiry_date DATE NOT NULL,
    status_id INT NOT NULL DEFAULT(1),
    collected_amount BIGINT NOT NULL DEFAULT(0),
    user_id INT NOT NULL,
    FOREIGN KEY (status_id) REFERENCES CompaignStatuses(id),
    FOREIGN KEY (user_id) REFERENCES CompaignOwners(user_id)
);

CREATE TABLE Currencies (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(5) NOT NULL,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Currencies (symbol, name)
VALUES ('AFA', 'Afghan Afghani'),
	('ALL', 'Albanian Lek'),
    ('DZD', 'Algerian Dinar'),
    ('AOA', 'Angolan Kwanza'),
    ('ARS', 'Argentine Peso'),
    ('AMD', 'Armenian Dram'),
    ('AWG', 'Aruban Florin'),
    ('AUD', 'Australian Dollar'),
    ('AZN', 'Azerbaijani Manat'),
    ('BSD', 'Bahamian Dollar'),
    ('BHD', 'Bahraini Dinar'),
    ('BDT', 'Bangladeshi Taka'),
    ('BBD', 'Barbadian Dollar'),
    ('BYR', 'Belarusian Ruble'),
    ('BEF', 'Belgian Franc'),
    ('BZD', 'Belize Dollar'),
    ('BMD', 'Bermudan Dollar'),
    ('BTN', 'Bhutanese Ngultrum'),
    ('BTC', 'Bitcoin'),
    ('BOB', 'Bolivian Boliviano'),
    ('BAM', 'Bosnia-Herzegovina Convertible Mark'),
    ('BWP', 'Botswanan Pula'),
    ('BRL', 'Brazilian Real'),
    ('GBP', 'British Pound Sterling'),
    ('BND', 'Brunei Dollar'),
    ('BGN', 'Bulgarian Lev'),
    ('BIF', 'Burundian Franc'),
    ('KHR', 'Cambodian Riel'),
    ('CAD', 'Canadian Dollar'),
    ('CVE', 'Cape Verdean Escudo'),
    ('KYD', 'Cayman Islands Dollar'),
    ('XOF', 'CFA Franc BCEAO'),
    ('XAF', 'CFA Franc BEAC'),
    ('XPF', 'CFP Franc'),
    ('CLP', 'Chilean Peso'),
    ('CNY', 'Chinese Yuan'),
    ('COP', 'Colombian Peso'),
    ('KMF', 'Comorian Franc'),
    ('CDF', 'Congolese Franc'),
    ('CRC', 'Costa Rican ColÃ³n'),
    ('HRK', 'Croatian Kuna'),
    ('CUC', 'Cuban Convertible Peso'),
    ('CZK', 'Czech Republic Koruna'),
    ('DKK', 'Danish Krone'),
    ('DJF', 'Djiboutian Franc'),
    ('DOP', 'Dominican Peso'),
    ('XCD', 'East Caribbean Dollar'),
    ('EGP', 'Egyptian Pound'),
    ('ERN', 'Eritrean Nakfa'),
    ('EEK', 'Estonian Kroon'),
    ('ETB', 'Ethiopian Birr'),
    ('EUR', 'Euro'),
    ('FKP', 'Falkland Islands Pound'),
    ('FJD', 'Fijian Dollar'),
    ('GMD', 'Gambian Dalasi'),
    ('GEL', 'Georgian Lari'),
    ('DEM', 'German Mark'),
    ('GHS', 'Ghanaian Cedi'),
    ('GIP', 'Gibraltar Pound'),
    ('GRD', 'Greek Drachma'),
    ('GTQ', 'Guatemalan Quetzal'),
    ('GNF', 'Guinean Franc'),
    ('GYD', 'Guyanaese Dollar'),
    ('HTG', 'Haitian Gourde'),
    ('HNL', 'Honduran Lempira'),
    ('HKD', 'Hong Kong Dollar'),
    ('HUF', 'Hungarian Forint'),
    ('ISK', 'Icelandic KrÃ³na'),
    ('INR', 'Indian Rupee'),
    ('IDR', 'Indonesian Rupiah'),
    ('IRR', 'Iranian Rial'),
    ('IQD', 'Iraqi Dinar'),
    ('ILS', 'Israeli New Sheqel'),
    ('ITL', 'Italian Lira'),
    ('JMD', 'Jamaican Dollar'),
    ('JPY', 'Japanese Yen'),
    ('JOD', 'Jordanian Dinar'),
    ('KZT', 'Kazakhstani Tenge'),
    ('KES', 'Kenyan Shilling'),
    ('KWD', 'Kuwaiti Dinar'),
    ('KGS', 'Kyrgystani Som'),
    ('LAK', 'Laotian Kip'),
    ('LVL', 'Latvian Lats'),
    ('LBP', 'Lebanese Pound'),
    ('LSL', 'Lesotho Loti'),
    ('LRD', 'Liberian Dollar'),
    ('LYD', 'Libyan Dinar'),
    ('LTL', 'Lithuanian Litas'),
    ('MOP', 'Macanese Pataca'),
    ('MKD', 'Macedonian Denar'),
    ('MGA', 'Malagasy Ariary'),
    ('MWK', 'Malawian Kwacha'),
    ('MYR', 'Malaysian Ringgit'),
    ('MVR', 'Maldivian Rufiyaa'),
    ('MRO', 'Mauritanian Ouguiya'),
    ('MUR', 'Mauritian Rupee'),
    ('MXN', 'Mexican Peso'),
    ('MDL', 'Moldovan Leu'),
    ('MNT', 'Mongolian Tugrik'),
    ('MAD', 'Moroccan Dirham'),
    ('MZM', 'Mozambican Metical'),
    ('MMK', 'Myanmar Kyat'),
    ('NAD', 'Namibian Dollar'),
    ('NPR', 'Nepalese Rupee'),
    ('ANG', 'Netherlands Antillean Guilder'),
    ('TWD', 'New Taiwan Dollar'),
    ('NZD', 'New Zealand Dollar'),
    ('NIO', 'Nicaraguan CÃ³rdoba'),
    ('NGN', 'Nigerian Naira'),
    ('KPW', 'North Korean Won'),
    ('NOK', 'Norwegian Krone'),
    ('OMR', 'Omani Rial'),
    ('PKR', 'Pakistani Rupee'),
    ('PAB', 'Panamanian Balboa'),
    ('PGK', 'Papua New Guinean Kina'),
    ('PYG', 'Paraguayan Guarani'),
    ('PEN', 'Peruvian Nuevo Sol'),
    ('PHP', 'Philippine Peso'),
    ('PLN', 'Polish Zloty'),
    ('QAR', 'Qatari Rial'),
    ('RON', 'Romanian Leu'),
    ('RUB', 'Russian Ruble'),
    ('RWF', 'Rwandan Franc'),
    ('SVC', 'Salvadoran ColÃ³n'),
    ('WST', 'Samoan Tala'),
    ('SAR', 'Saudi Riyal'),
    ('RSD', 'Serbian Dinar'),
    ('SCR', 'Seychellois Rupee'),
    ('SLL', 'Sierra Leonean Leone'),
    ('SGD', 'Singapore Dollar'),
    ('SKK', 'Slovak Koruna'),
    ('SBD', 'Solomon Islands Dollar'),
    ('SOS', 'Somali Shilling'),
    ('ZAR', 'South African Rand'),
    ('KRW', 'South Korean Won'),
    ('XDR', 'Special Drawing Rights'),
    ('LKR', 'Sri Lankan Rupee'),
    ('SHP', 'St. Helena Pound'),
    ('SDG', 'Sudanese Pound'),
    ('SRD', 'Surinamese Dollar'),
    ('SZL', 'Swazi Lilangeni'),
    ('SEK', 'Swedish Krona'),
    ('CHF', 'Swiss Franc'),
    ('SYP', 'Syrian Pound'),
    ('STD', 'São Tomé and Príncipe Dobra'),
    ('TJS', 'Tajikistani Somoni'),
    ('TZS', 'Tanzanian Shilling'),
    ('THB', 'Thai Baht'),
    ('TOP', 'Tongan paanga'),
    ('TTD', 'Trinidad & Tobago Dollar'),
    ('TND', 'Tunisian Dinar'),
    ('TRY', 'Turkish Lira'),
    ('TMT', 'Turkmenistani Manat'),
    ('UGX', 'Ugandan Shilling'),
    ('UAH', 'Ukrainian Hryvnia'),
    ('AED', 'United Arab Emirates Dirham'),
    ('UYU', 'Uruguayan Peso'),
    ('USD', 'US Dollar'),
    ('UZS', 'Uzbekistan Som'),
    ('VUV', 'Vanuatu Vatu'),
    ('VEF', 'Venezuelan BolÃ­var'),
    ('VND', 'Vietnamese Dong'),
    ('YER', 'Yemeni Rial'),
    ('ZMK', 'Zambian Kwacha');

CREATE TABLE Donations(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nick_name VARCHAR(30) NOT NULL,
    amount DECIMAL(13,2) NOT NULL,
    state ENUM ('valid', 'invalid') NOT NULL DEFAULT('valid'),
    currency_id INT NOT NULL DEFAULT(1),
    compaign_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (compaign_id) REFERENCES Compaigns(compaign_id),
    FOREIGN KEY (currency_id) REFERENCES Currencies(id)
);

DELIMITER #
create trigger compaign_insert before insert on Compaigns
for each row
begin
	SET NEW.compaign_id = UUID();
end;
#
DELIMITER ;

DELIMITER #
CREATE PROCEDURE getAllActiveCompaigns()
BEGIN
	SELECT Compaigns.* FROM Compaigns JOIN CompaignStatuses
    WHERE Compaigns.status_id = CompaignStatuses.id AND CompaignStatuses.name= 'active';
END
#
DELIMITER ;

DELIMITER #
CREATE PROCEDURE addDonation(IN nick_name NVARCHAR(30),
							 IN amount DECIMAL(13,2),
							 IN compaign_id NVARCHAR(50),
                             IN currency_id INT,
                             IN amount_in_usd DECIMAL(13,2)
)
BEGIN
	INSERT INTO Donations (nick_name, amount, compaign_id, currency_id)
    Values (nick_name, amount, compaign_id, currency_id);
    UPDATE Compaigns
	SET Compaigns.collected_amount = Compaigns.collected_amount + amount_in_usd
    WHERE Compaigns.compaign_id = compaign_id;
	UPDATE Compaigns
	SET Compaigns.status_id = (SELECT id FROM CompaignStatuses AS CS WHERE CS.name='successful')
	WHERE Compaigns.compaign_id = compaign_id AND Compaigns.collected_amount >= goal_amount;
END;
#
DELIMITER ;

DELIMITER #
CREATE PROCEDURE updateCompaignStatus(
	IN status_name NVARCHAR(20),
    IN compaign_id NVARCHAR(50)
)
BEGIN
	UPDATE Compaigns
    SET status_id = (SELECT id FROM CompaignStatuses AS CS WHERE CS.name = status_name)
    WHERE Compaigns.compaign_id = compaign_id;

	IF (status_name = 'fraud') THEN
		BEGIN
			UPDATE Donations
            SET state = 'invalid'
            WHERE Donations.compaign_id = compaign_id;
        END;
    END IF;
END;
#
DELIMITER ;

INSERT INTO CompaignOwners (user_name, crypto_wallet_address) 
Values ('john@123', 'absdksjn1234567'),
	   ('sam_123', 'asdfghj123456'),
       ('Lee_123', 'ghjsdfgh1234567'),
       ('amy@123', 'sdfghj1234567'),
       ('sara@123', 'dasdas12345678');
       
INSERT INTO Compaigns (name, description, goal_amount, expiry_date, user_id) 
Values ('Compaign 1', 'This is for collecting donations for orphans', 1000, STR_TO_DATE('17/01/2023', '%d/%m/%Y'), 1),
	   ('Compaign 2', 'Helping a family with ration', 500, STR_TO_DATE('10/02/2023', '%d/%m/%Y'), 1),
       ('Compaign 3', 'Collecting for a cancer patient', 5000, STR_TO_DATE('10/02/2023', '%d/%m/%Y'), 2),
       ('Compaign 4', 'Donations required for hospital', 7000, STR_TO_DATE('19/02/2022', '%d/%m/%Y'), 2),
       ('Compaign 5', 'Money required for fixing orphanage home', 1000, STR_TO_DATE('11/02/2023', '%d/%m/%Y'), 3),
       ('Compaign 6', 'Donations for flood victims', 10000, STR_TO_DATE('15/02/2023', '%d/%m/%Y'), 3),
       ('Compaign 7', 'Donations for helping a man with terminal disease', 1000, STR_TO_DATE('19/01/2023', '%d/%m/%Y'), 4),
       ('Compaign 8', 'Donations required for cancer research', 5000, STR_TO_DATE('21/01/2023', '%d/%m/%Y'), 4),
       ('Compaign 9', 'Collecting donations for providing food to homeless', 1000, STR_TO_DATE('20/01/2023', '%d/%m/%Y'), 5),
       ('Compaign 10', 'Donations required for a family in need', 1000, STR_TO_DATE('24/01/2023', '%d/%m/%Y'), 5);
       
DELIMITER #
CREATE PROCEDURE markExpired()
BEGIN
	UPDATE Compaigns
    SET Compaigns.status_id = (SELECT id FROM CompaignStatuses WHERE CompaignStatuses.name='expired')
    WHERE Compaigns.expiry_date <= NOW() AND  Compaigns.status_id = (SELECT id FROM CompaignStatuses WHERE name = 'active');
END
#
DELIMITER ;

DELIMITER #
CREATE PROCEDURE getCompaignStatus(
	IN compaign_id NVARCHAR(50)
)
BEGIN
	SELECT CompaignStatuses.name FROM CompaignStatuses
    WHERE CompaignStatuses.id = (SELECT status_id FROM Compaigns WHERE Compaigns.compaign_id = compaign_id);
END
#
DELIMITER ;
    
DELIMITER #
CREATE PROCEDURE getCurrencies()
BEGIN
	SELECT * FROM Currencies;
END
#
DELIMITER ;
    
    










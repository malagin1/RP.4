-- public.medical определение

-- Drop table

-- DROP TABLE public.medical;

CREATE TABLE public.medical (
	"medical-id" int4 DEFAULT nextval('"reception_patients_id_medical-id_seq"'::regclass) NOT NULL,
	last_name varchar(50) NULL,
	first_name varchar(50) NULL,
	patronymic varchar(50) NULL,
	profession varchar(70) NULL,
	CONSTRAINT medical_pk PRIMARY KEY ("medical-id")
);


-- public.patient определение

-- Drop table

-- DROP TABLE public.patient;

CREATE TABLE public.patient (
	patient_id serial4 NOT NULL,
	last_name varchar(50) NULL,
	first_name varchar(50) NULL,
	patronymic varchar(50) NULL,
	birthday_patient date NULL,
	address varchar(100) NULL,
	CONSTRAINT patient_pk PRIMARY KEY (patient_id)
);


-- public.reception_patients определение

-- Drop table

-- DROP TABLE public.reception_patients;

CREATE TABLE public.reception_patients (
	reception_patients_id serial4 NOT NULL,
	"medical-id" int4 NOT NULL,
	patient_id int4 NOT NULL,
	quintation_price numeric NULL,
	deduction_price numeric NULL,
	salary numeric NULL,
	CONSTRAINT reception_patients_pk PRIMARY KEY (reception_patients_id),
	CONSTRAINT reception_patients_medical_fk FOREIGN KEY ("medical-id") REFERENCES public.medical("medical-id") ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT reception_patients_patient_fk FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO public.medical ("medical-id",last_name,first_name,patronymic,profession) VALUES
	 (1,'Малагин','Артем','Сергеевич','Дантист'),
	 (2,'Елагин','Павел','Павлович','Хирург'),
	 (3,'Илагин','Искандер','Сергеевич','Костоправ'),
	 (4,'Алагин','Надир','Сергеевич','Невролог'),
	 (5,'Малыгин','Данил','Сергеевич','Эндокринолог'),
	 (6,'Илыгин','Родион','Сергеевич','Микробиолог'),
	 (7,'Пупков','Рустам','Сергеевич','Паталогонатом'),
	 (8,'Малагин','Платон','Сергеевич','Гастроинтеролог'),
	 (9,'Елкин','Вася','Сергеевич','Дерматолог'),
	 (10,'Мудрецов','Игорь','Юрьевич','Пидиатор');
INSERT INTO public.reception_patients (reception_patients_id,"medical-id",patient_id,quintation_price,deduction_price,salary) VALUES
	 (1,1,1,4000,20,696),
	 (2,2,2,3500,30,913.5),
	 (3,3,3,9000,15,1174.5),
	 (4,4,4,6000,25,1305),
	 (5,5,5,5500,22,1052.7),
	 (6,6,6,4500,18,704.7),
	 (7,7,7,8000,28,1948.9),
	 (8,8,8,3500,14,426),
	 (9,9,9,6500,26,1470.3),
	 (10,10,10,5800,19,958.74);
INSERT INTO public.patient (patient_id,last_name,first_name,patronymic,birthday_patient,address) VALUES
	 (1,'Малагин','Артем','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (2,'Елагин','Павел','Павлович','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (3,'Илагин','Искандер','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (4,'Алагин','Надир','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (5,'Малыгин','Данил','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (6,'Илыгин','Родион','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (7,'Пупков','Рустам','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (8,'Малагин','Платон','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (9,'Елкин','Вася','Сергеевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32'),
	 (10,'Мудрецов','Игорь','Юрьевич','2024-09-12','г.Зеленодольск, ул Строителей 5, дом 32');

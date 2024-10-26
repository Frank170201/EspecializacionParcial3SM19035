Create database Data2020SM19035
go


use Data2020SM19035

go

create table DimAirline(
AirlineKey int identity(1,1) primary key,
AirlineID int not null,
DOT_ID_Marketing_Airline varchar(255) not null,
IATA_Code_Marketing_Airline varchar(255) not null,
Marketing_Airline_Network varchar(255) not null,
Operating_Airline varchar(255) not null,
IATA_Code_Operating_Airline  varchar(100) not null,
)

create table DimDelay(
DelayKey int identity(1,1) primary key,
DelayID int not null,
WheelsOff varchar(255) not null,
DepTime varchar(255)
)

create table DimTime(
TiempoKey int identity(1,1) primary key,
Year int not null,
Month int not null,
Quarter int not null,
DayOfWeek int not null,
DayOfMonth int not null,
FligthDate datetime not null,
)

create table FactFlight(
AirlineKey int not null foreign key references DimAirline(AirlineKey),
DelayKey int not null foreign key references DimDelay(DelayKey),
TiempoKey int not null foreign key references DimTime(TiempoKey),
Flight_Number_Operating_Airline varchar(100) not null,
DepDelayMinutes int not null,
ArrDelayMinutes int not null,
Cancelled bit not null,
Diverted bit not null,
AirTime int not null,
OriginAirportID int not null,
DestinationAirportID int not null,
)
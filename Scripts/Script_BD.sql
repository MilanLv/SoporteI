create database tarea1;
use tarea1;

-- Tabla para Frequent Flyer Card
CREATE TABLE FrequentFlyerCard (
    FFCNumber INT PRIMARY KEY,
    Miles INT,
    MealCode VARCHAR(50)
);

-- Tabla para Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    FFCNumber INT,
    FOREIGN KEY (FFCNumber) REFERENCES FrequentFlyerCard(FFCNumber)
);

-- Tabla para Airport
CREATE TABLE Airport (
    AirportID INT PRIMARY KEY,
    Name VARCHAR(100),
    StartDate DATE,
    Goal VARCHAR(255)
);

-- Tabla para Airplane
CREATE TABLE Airplane (
    AirplaneID INT PRIMARY KEY,
    RegistrationNumber VARCHAR(50),
    BeginOperation DATE,
    Status VARCHAR(50),
    PlaneModelID INT
);

-- Tabla para Plane Model
CREATE TABLE PlaneModel (
    PlaneModelID INT PRIMARY KEY,
    Description VARCHAR(255),
    Graphic VARCHAR(255)
);

-- Tabla para Seat
CREATE TABLE Seat (
    SeatID INT PRIMARY KEY,
    AirplaneID INT,
    Size VARCHAR(50),
    Number INT,
    Location VARCHAR(50),
    FOREIGN KEY (AirplaneID) REFERENCES Airplane(AirplaneID)
);

-- Tabla para Flight
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(50),
    DepartureTime DATETIME,
    Description VARCHAR(255),
    Type VARCHAR(50),
    Airline VARCHAR(100),
    BoardingTime DATETIME,
    FlightDate DATE,
    Gate VARCHAR(50),
    CheckInCounter VARCHAR(50),
    AirportID INT,
    FOREIGN KEY (AirportID) REFERENCES Airport(AirportID)
);

-- Tabla para Available Seat (asociación entre Flight y Seat)
CREATE TABLE AvailableSeat (
    AvailableSeatID INT PRIMARY KEY,
    FlightID INT,
    SeatID INT,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    FOREIGN KEY (SeatID) REFERENCES Seat(SeatID)
);

-- Tabla para Ticket
CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    CustomerID INT,
    TicketingCode VARCHAR(50),
    Number VARCHAR(50),
    FlightID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- Tabla para Coupon
CREATE TABLE Coupon (
    CouponID INT PRIMARY KEY,
    DateOfRedemption DATE,
    Class VARCHAR(50),
    Standby BIT,
    MealCode VARCHAR(50),
    TicketID INT,
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

-- Tabla para Pieces of Luggage
CREATE TABLE PiecesOfLuggage (
    LuggageID INT PRIMARY KEY,
    Number INT,
    Weight DECIMAL(10, 2),
    CouponID INT,
    FOREIGN KEY (CouponID) REFERENCES Coupon(CouponID)
);

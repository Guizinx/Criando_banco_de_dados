create table Product(
    ProductID int not null,
    nome varchar(50),
    ProductNumber varchar(7),
    MakeFlag boolean,
    FinishedGoodsFlag boolean,
    Color text,
    SafetyStockLevel int,
    ReorderPoint int,
    StandardCost int,
    ListPrice int,
    Size int,
    SizeUnitMeasureCode int,
    WeightUnitMeasureCode varchar(2),
    Weight	int,
    DaysToManufacture int,
    ProductLine varchar(1),
    Class varchar(1),
    Style text,
    ProductSubcategoryID int,
    ProductModelID int,
    SellStartDate date,
    SellEndDate	date,
    DiscontinuedDate date,
    rowguid text,
    ModifiedDate timestamp,
    PRIMARY KEY (ProductID)
);

create table Person(
    BusinessEntityID int not null,
    PersonType varchar(2),
    NameStyle text,	
    Title varchar(15),	
    FirstName varchar(15),
    MiddleName varchar(15),
    LastName varchar(15),
    Suffix varchar(5),
    EmailPromotion int,
    AdditionalContactInfo text,
    Demographics text,
    rowguid text,
    ModifiedDate timestamp,
    PRIMARY KEY (BusinessEntityID)
);

create table Costumer(
    CostumerID int not null,
    PersonID int,
    StoreID int,
    TerritoryID int not null,
    AccountNumber varchar(10),
    rowguid text,
    ModifiedDate timestamp,
    PRIMARY KEY (CostumerID),
    FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
);


create table SpecialOfferProduct(
    SpecialOfferID int not null,
    ProductID int not null,
    rowguid text,
    ModifiedDate timestamp,
    PRIMARY KEY (SpecialOfferID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

create table SalesOrderHeader(
    SalesOrderID int not null,
    RevisionNumber int,
    OrderDate date,
    DueDate date,
    ShipDate date,
    Status varchar(15),
    OnlineOrderFlag boolean,
    SalesOrderNumber varchar(7),
    PurchaseOrderNumber text,
    AccountNumber varchar(15),
    CostumerID int not null,
    SalesPersonID int,
    TerritoryID	int not null,
    BillToAddressID int not null,
    ShipToAddressID int not null,
    ShipMethodID int,
    CreditCardID int,
    CreditCardApprovalCode text,
    CurrencyRateID int,
    SubTotal int,
    TaxAmt int,
    Freight int,
    TotalDue int,
    Comment text,
    rowguid	text,
    ModifiedDate date,
    PRIMARY KEY (SalesOrderID),
    FOREIGN KEY (CostumerID) REFERENCES Costumer (CostumerID)
);


create table SalesOrderDetail(
    SalesOrderID int not null,
    SalesOrderDetailID int not null,
    CarrierTrackingNumber int,
    OrderQty int,
    ProductID int not null,
    SpecialOfferID int not null,
    UnitPrice int,
    PRIMARY KEY (SalesOrderID),
    FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOfferProduct (SpecialOfferID),
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader (SalesOrderID)
);

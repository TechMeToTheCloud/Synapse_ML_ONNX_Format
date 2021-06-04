CREATE TABLE [dbo].[NYCTaxiRental] 
(
    [fareAmount] REAL, 
    [paymentType] BIGINT,
    [passengerCount] BIGINT, 
    [tripDistance] REAL,
    [tripTimeSecs] BIGINT, 
    [pickupTimeBin] VARCHAR (10)
);

INSERT INTO [dbo].[NYCTaxiRental] values (150,2,1,6,50,'Night')


BEGIN TRANSACTION
DECLARE @model varbinary(max) = (SELECT Model FROM [dbo].[MlModel] WHERE description = 'NYC Taxi Model SparkML');

SELECT p.*, d.*
FROM PREDICT(MODEL = @model, DATA = [dbo].[NYCRentalData] AS d, RUNTIME =ONNX) WITH (output_label  BIGINT) AS p;

COMMIT








CREATE EXTERNAL DATA SOURCE ModelStore WITH
(
	LOCATION = 'abfss://<Container Name>@<Storage Name>dfs.core.windows.net',
    CREDENTIAL = StorageCredential,
    TYPE = HADOOP
)

CREATE EXTERNAL FILE FORMAT csv
WITH (
FORMAT_TYPE = DELIMITEDTEXT,
FORMAT_OPTIONS (
FIELD_TERMINATOR = ',',
STRING_DELIMITER = '',
DATE_FORMAT = '',
USE_TYPE_DEFAULT = False
)
);

CREATE EXTERNAL TABLE [dbo].[MLModelExtSparkMLTaxi]
(
[Model] [varbinary](max) NULL
)
WITH
(
LOCATION='/misc/model/scikit-learn/taxi_model_sklearn.onnx.hex' ,
DATA_SOURCE = ModelStore ,
FILE_FORMAT = csv ,
REJECT_TYPE = VALUE ,
REJECT_VALUE = 0
)
GO

CREATE TABLE [dbo].[MLModel]
(
[Id] [int] IDENTITY(1,1) NOT NULL,
[Model] [varbinary](max) NULL,
[Description] [varchar](200) NULL
)
WITH
(
DISTRIBUTION = REPLICATE,
heap
)
GO

--Insert the model
INSERT INTO [dbo].[MLModel]
SELECT Model, 'NYC Taxi Model Sklearn'
FROM [dbo].[MLModelExtSparkMLTaxi]


SELECT * FROM dbo.MLModel

--Alternative to register the model
COPY INTO [MLModel] (Model)
FROM 'https://<Storage Name>.blob.core.windows.net/<Container Name>/misc/model/scikit-learn/taxi_model_sklearn.onnx.hex'
WITH (
    FILE_TYPE = 'CSV'
)


select * from dbo.MLModel


# Synapse_ML_ONNX_Format
A simple Azure Synapse example ONNX Model conversion based on the NYC Taxi Dataset

![image](https://user-images.githubusercontent.com/49620357/120843079-ab24f380-c53b-11eb-901b-77c231b0797a.png)

# Step 1

Execute the notebook to create the model.
<br> You will have to modify the Notebook to specify the location on your Datalake.
<br>Azure Databricks has been used but it can be executed with another product.
Notebook is from the following repo:
https://github.com/Azure-Samples/Synapse/blob/main/Notebooks/PySpark/tutorial-predict-nyc-taxi-tips-onnx.ipynb

The Hexadecimal conversion has been added

# Step 2 (Azure Synapse)

* Execute the script Taxi_Model_ONNX_external Storage_Registration_Model.sql
* Execute the script Prediction_ONNX_Model_NYC_Taxi.sql

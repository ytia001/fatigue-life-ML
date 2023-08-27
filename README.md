# fatigue-life-ML
Machine learning-based prediction of Polyacrlyamide (PAAm) hydrogel's fatigue life under the effect of dehydration.

# Project involves 3 stages:

# 1. Generation of Raw data
Raw data (90 samples) was generated from fatigue testing of PAAm hydrogel under dehydration
The testing was carried using the machine <b>instron 3366

Parameters varied : 
Loading rate of testing & maximum stretch of the PAAm hydrogel
Total 9 sets of parameters values varied in experiment ; for each set, 10 samples collected => total = 90 
<img src="https://github.com/ytia001/fatigue-life-ML/assets/136459037/452fffb8-1aa2-4a4e-821a-2c7fc6532402" alt="Example Image" width="400"/>


# 2. Data processing: Raw data was processed using MATLAB
Two MATLAB scripts were used, data analysis and feature extraction will be performed on raw data

## First MATLAB script : detect_break_cycle
Plot Average Loading Force & unloading Force against Cycle
Purpose:
1.Determine Fatigue Life  (Data analysis)
2.Extract New input variable (Feature Extraction)

## Second MATLAB script: Average_data
Plot Average Loading Force & unloading Force against Stretch
Purpose:
Determine Hysteresis Loss  (Data analysis)
Extract New input variable (Feature Extraction)


# 3. Machine learning prediction
The processed data will undergo data cleaning and data augmentation before fitting into the 5 different machine learning models. The accuracy of the models will be tested with the coefficent of value (R2)

Machine Learning used : 
a. SVM
b. Tree
c. Linear
d. KNN
e. ANN





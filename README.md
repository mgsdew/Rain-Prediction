Rainfall Prediction Using Ranfom Forest (RF) and  K-Nearest Neighbor (KNN)
--------------------------------------------------------------------------


**Problem Statement**
----------------------

Predicting heavy rainfall is a significant challenge for weather departments, directly impacting human lives and economies. New Zealand's agriculture-dependent economy (5% of GDP, $28 billion in exports) relies heavily on accurate rainfall predictions. Traditional statistical methods often fail due to the dynamic nature of atmospheric conditions.

**Key challenges:**
---------------------

High variability in rainfall patterns across regions

Economic impacts of droughts and extreme rainfall

Traffic congestion exacerbated by rainfall (especially in Auckland)

Need for both short-term and long-term forecasting


**Dataset**
------------
**Source:** "Rain in Australia" dataset from Kaggle (used due to lack of suitable NZ dataset with required features)

**Time period:** 10 years (2007-2017)

**Size:** 145,460 rows × 23 columns

**Key features:**

Location, date, Temperature (min/max), Rainfall (today/tomorrow), Evaporation, Sunshine, Humidity, Pressure, Cloud cover, Wind speed/direction

**Target variable:** 

RainTomorrow (binary classification)

![image](https://github.com/user-attachments/assets/7d138808-c6f4-4a5a-831e-7b8648becae9)

**Data Preprocessing**
----------------------
**Handling Imbalanced Data:**
Used oversampling to balance the dataset: -

**Before:** Significant imbalance in "RainTomorrow" classes
                  
**After:** Balanced distribution

![image](https://github.com/user-attachments/assets/10d4166e-efe3-440b-b781-70e524adf67c)
                       
**Missing Data Handling:** Identified and addressed missing values for columns with significant missing data like Sunshine, Evaporation, Cloud3pm, Cloud9am

![image](https://github.com/user-attachments/assets/ab75a5b6-d192-44cf-a65c-4f9db8f94d59)

![image](https://github.com/user-attachments/assets/35a4ad1d-ded5-43d9-8d17-94886c6dd59c)


**Feature Engineering:** 
Below facts need to be checked during feature engineering: 

1. Label encoding for categorical features

2. Outlier detection using IQR method

3. Correlation analysis to identify important features
                      

![image](https://github.com/user-attachments/assets/df1d44c9-c8f2-491d-89ee-62c0d6510d78)


**Methodology**
---------------

Two machine learning models were implemented and compared for these experiment,s which are below:

![image](https://github.com/user-attachments/assets/f8272b42-65be-46d5-b87a-4f296ad168e5)

**1. Random Forest (RF)**

Ensemble of decision trees.

Handles complex, non-linear relationships well and

Robust to outliers and missing data.

**2. K-Nearest Neighbors (KNN)**

Simple, distance-based classifier.

Uses Manhattan distance with k=7 neighbors, and

Distance-based weighting.


**Results**
-----------

![image](https://github.com/user-attachments/assets/81ef6c10-8954-45f4-9046-4f7a330ece23)

![image](https://github.com/user-attachments/assets/bd4e8558-1149-47c2-a371-9b3fd6a3c985)


Here's a comparison table for the Random Forest (RF) and K-Nearest Neighbors (KNN) results from project:

| **Metric**       | **Random Forest (RF)** | **K-Nearest Neighbors (KNN)** | **Comparison**                     |
|------------------|-----------------------|------------------------------|-----------------------------------|
| **Accuracy**     | 93.32%                | 90.13%                       | RF performs **3.19% better**      |
| **Precision (Rain)** | 91%               | 83%                          | RF more precise for rain prediction |
| **Recall (Rain)**    | 94%               | 98%                          | KNN slightly better at detecting rain |
| **F1 Score (Rain)**  | 93%               | 90%                          | RF better balanced performance    |
| **Precision (No Rain)** | 95%            | 98%                          | KNN slightly better for no-rain   |
| **Recall (No Rain)**    | 92%            | 84%                          | RF better at detecting no-rain    |
| **F1 Score (No Rain)**  | 94%            | 90%                          | RF better balanced performance    |
| **False Positives** | 1,437            | 3,128                        | RF makes **fewer false alarms**   |
| **False Negatives** | 842              | 242                          | KNN misses **fewer rain events**  |
| **Model Complexity** | High (100 trees) | Low (k=7 neighbors)          | KNN simpler to implement          |
| **Training Time**    | Longer            | Shorter                      | KNN faster to train               |
| **Prediction Speed** | Fast             | Slower (real-time distance calc) | RF faster at prediction          |


**Key Takeaways**
------------------

1. **RF is more accurate overall** (93.32% vs 90.13%)
2. **KNN has higher rain recall** (98% vs 94%) - better at catching actual rain events
3. **RF has better precision** - fewer false alarms about rain
4. **RF handles imbalanced data better** as shown by higher F1 scores
5. **KNN is simpler** but slower at prediction time

This table clearly shows why RF was your best-performing model while acknowledging KNN's strengths in certain areas. The comparison would help clients understand the trade-offs between the two approaches.























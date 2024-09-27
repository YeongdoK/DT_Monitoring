import pymysql
import pandas as pd
import shap
import xgboost
import json
from sklearn.preprocessing import LabelEncoder

try:
    # MySQL 연결 및 데이터 처리
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='1111',
        database='samsung_shipyard'
    )
    query = """
    SELECT defect_length, vessel_type_long, department_code, company_type, reason_details, welding_method
    FROM welding_defect_rate
    WHERE defect_length != 0
    """
    data = pd.read_sql(query, connection)

    # 데이터 전처리 및 Label Encoding
    X = data[['vessel_type_long', 'department_code', 'company_type', 'reason_details', 'welding_method']]
    y = data['defect_length']

    le = LabelEncoder()
    for column in X.columns:
        X[column] = le.fit_transform(X[column])

    # XGBoost 모델 학습
    model = xgboost.XGBRegressor()
    model.fit(X, y)

    # SHAP 값 계산
    explainer = shap.TreeExplainer(model)
    shap_values = explainer.shap_values(X)

    # SHAP 결과 저장
    shap_summary = {
        "shap_values": shap_values.tolist(),
        "base_value": explainer.expected_value.tolist()
    }

    # 결과를 JSON 파일로 저장
    output_path = 'server/scripts/shap_results.json'
    with open(output_path, 'w') as f:
        json.dump(shap_summary, f)

    connection.close()

except Exception as e:
    print(f"Error during SHAP analysis: {e}")

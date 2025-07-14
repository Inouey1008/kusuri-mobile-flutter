import pandas as pd
import re
import sqlite3

raw_file = './ファイルリスト.csv'
formatted_file = './drug_name.csv'
db_path = './kusuri.db'
sql_path = './drug_name_master.sql'
encoding = 'shift_jis'

def standardize_text(text):
    """文字を小文字に統一し、空白をトリミングし、ひらがなとカタカナを統一する関数。"""
    lower_text = text.lower()   # 文字を小文字に統一
    trimmed_text = lower_text.strip()   # 空白のトリミング
    hiragana_text = ''.join(chr(ord(char) - 0x60) if 0x30A1 <= ord(char) <= 0x30F6 else char for char in trimmed_text)  # ひらがなとカタカナの統一（カタカナをひらがなに変換）
    return hiragana_text

def format_drug_name(input_file, encoding, output_file):
    df = pd.read_csv(input_file, encoding=encoding)
    
    merged_list = df.iloc[1:, 3].tolist()

    filtered_list = [re.sub(r'「[^」]*」', '', item) for item in merged_list if item] # 文字列中の「」で囲まれた部分を削除
    sorted_list = sorted(set(filtered_list))  # 重複を削除し、昇順にソート
    processed_list = [[original, standardize_text(original)] for original in sorted_list if standardize_text(original)] # 空文字を除外し、処理前と処理後の文字列のリストを作成

    output_df = pd.DataFrame(processed_list, columns=['original_name', 'processed_name'])
    output_df.to_csv(output_file, index=False, quotechar='"', quoting=1)
    
    print("CSV file has been saved as", output_file)
    

def create_sql(input_file, output_file):
    df = pd.read_csv(input_file)

    with open(output_file, 'w') as file:
        create_table_statement = 'CREATE TABLE IF NOT EXISTS drug_name (id INTEGER PRIMARY KEY AUTOINCREMENT, original_name TEXT, processed_name TEXT);'
        create_index_statement = 'CREATE INDEX IF NOT EXISTS idx_processed_name ON drug_name (processed_name);'
        insert_statement = 'INSERT INTO drug_name (original_name, processed_name) VALUES\n'

        for i, (_, row) in enumerate(df.iterrows()):
            original_name = row['original_name'].replace("'", "''")
            processed_name = row['processed_name'].replace("'", "''")
            values = "('{}', '{}')".format(original_name, processed_name)
            if i < len(df) - 1:
                values += ','
            insert_statement += values + '\n'

        file.write(create_table_statement + '\n')
        file.write(create_index_statement + '\n')
        file.write(insert_statement)

    print("Successfully created SQL script")

def create_database(db_name):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    conn.commit()
    conn.close()

    print(f'Successfully created SQLite database file: {db_name}')

def execute_sql(db_file, sql_file):
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()

    with open(sql_file, 'r') as file:
        sql_statements = file.read()

    cursor.executescript(sql_statements)
    conn.commit()
    conn.close()

    print(f'Successfully executed SQL statements from: {sql_file}')

format_drug_name(raw_file, encoding, formatted_file)
create_database(db_path)
create_sql(formatted_file, sql_path)
execute_sql(db_path, sql_path)

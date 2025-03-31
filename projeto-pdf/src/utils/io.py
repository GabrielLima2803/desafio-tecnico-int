from pathlib import Path
from src.config.paths import INPUT_DIR, OUTPUT_DIR
import pandas as pd
import zipfile


def ensure_directories():
    """Cria os diretórios necessários se não existirem"""
    Path(INPUT_DIR).mkdir(parents=True, exist_ok=True)
    Path(OUTPUT_DIR).mkdir(parents=True, exist_ok=True)

def save_data(df, filename, format='csv'):
    """Salva os dados e retorna o caminho do arquivo para compactação"""
    filepath = OUTPUT_DIR / f"{filename}.{format}"
    
    if format == 'csv':
        df.to_csv(filepath, index=False)
    elif format == 'excel':
        df.to_excel(filepath, index=False)
    
    return filepath

def zip_files(filename, format='csv'):
    """Compacta o arquivo gerado"""
    file_to_zip = OUTPUT_DIR / f"{filename}.{format}"
    zip_path = OUTPUT_DIR / "Test_Gabriel_Lima.zip"
    
    with zipfile.ZipFile(zip_path, 'w') as zipf:
        zipf.write(file_to_zip, arcname=file_to_zip.name)
    
    return zip_path
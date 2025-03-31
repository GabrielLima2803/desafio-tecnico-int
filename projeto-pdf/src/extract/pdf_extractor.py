import pdfplumber
from src.config.paths import INPUT_DIR

def extract_tables(pdf_name):
    pdf_path = INPUT_DIR / pdf_name
    all_tables = []
    
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()
            for table in tables:
                all_tables.extend(table)
                
    return all_tables
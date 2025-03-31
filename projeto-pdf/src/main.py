from src.utils.io import ensure_directories, save_data, zip_files
from src.extract.pdf_extractor import extract_tables
from src.process.data_processor import process_raw_data

def main(pdf_name, output_format='csv'):
    ensure_directories()
    
    raw_data = extract_tables(pdf_name)
    
    df = process_raw_data(
        raw_data,
        headers=[
            "PROCEDIMENTO", "RN (Alteração)", "VIGÊNCIA", "OD",
            "AMB", "HCO", "HSO", "REF", "PAC", "DUT",
            "SUBGRUPO", "GRUPO", "CAPÍTULO"
        ]
    )
    
    saved_file = save_data(df, "procedimentos_ans", format=output_format)
    zip_path = zip_files("procedimentos_ans", format=output_format)
    
    print(f"""
    Arquivo gerado: {saved_file}
    ZIP criado: {zip_path}
    """)

if __name__ == "__main__":
    main("Anexo_I.pdf", output_format='csv')  # Ou 'excel'
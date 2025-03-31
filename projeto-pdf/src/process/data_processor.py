import pandas as pd

def process_raw_data(raw_data, headers=None):
    """Transforma dados brutos em DataFrame limpo"""
    df = pd.DataFrame(raw_data)
    
    if headers:
        df.columns = headers
        df = df.iloc[1:] 
        
    # Limpeza adicional
    df = df.dropna(how='all')
    df = df.reset_index(drop=True)
    
    return df
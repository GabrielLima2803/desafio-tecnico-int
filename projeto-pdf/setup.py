from setuptools import setup, find_packages

setup(
    name="projeto_pdf",
    version="0.1",
    packages=find_packages(),
    install_requires=["pdfplumber", "pandas", "openpyxl"]
)
package com.lima.services.compressor;

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipCompressor implements Compressor {

    @Override
    public void compress(String sourceFolder, String zipFileName) {
        File zipFile = new File(sourceFolder + zipFileName);
        File folder = new File(sourceFolder);
        File[] files = folder.listFiles((dir, name) -> name.endsWith(".pdf"));

        if (files == null || files.length == 0) {
            System.out.println("Nenhum arquivo PDF encontrado para compactação.");
            return;
        }

        try (FileOutputStream fos = new FileOutputStream(zipFile);
             ZipOutputStream zos = new ZipOutputStream(fos)) {

            System.out.println("Iniciando compactação dos arquivos...");

            for (File file : files) {
                adicionarArquivoAoZip(file, zos);
            }

            System.out.println("Compactação concluída: " + zipFile.getAbsolutePath());

            removerArquivosOriginais(files);

        } catch (IOException e) {
            System.err.println("Erro ao compactar os arquivos: " + e.getMessage());
        }
    }

    private void adicionarArquivoAoZip(File file, ZipOutputStream zos) throws IOException {
        try (FileInputStream fis = new FileInputStream(file)) {
            ZipEntry zipEntry = new ZipEntry(file.getName());
            zos.putNextEntry(zipEntry);

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) > 0) {
                zos.write(buffer, 0, bytesRead);
            }

            zos.closeEntry();
            System.out.println("Arquivo adicionado ao ZIP: " + file.getName());
        }
    }

    private void removerArquivosOriginais(File[] files) {
        System.out.println("Removendo arquivos originais...");

        for (File file : files) {
            if (file.delete()) {
                System.out.println("Arquivo removido: " + file.getName());
            } else {
                System.err.println("Falha ao remover: " + file.getName());
            }
        }
    }
}

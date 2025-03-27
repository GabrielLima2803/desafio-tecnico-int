package com.lima.services.downloader;

import org.apache.commons.io.FileUtils;
import com.lima.config.ConstConfig;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.*;

public class PdfDownloader implements Downloader {

    @Override
    public void download(String fileURL) {
        try {
            String fileName = extrairNomeArquivo(fileURL);

            if (!fileName.contains("Anexo")) {
                System.out.println("🔍 Ignorando arquivo: " + fileName);
                return;
            }

            File destino = new File(ConstConfig.DOWNLOAD_FOLDER + fileName);
            System.out.println("📥 Iniciando download: " + fileName);

            baixarArquivo(fileURL, destino);

            System.out.println("✅ Download concluído: " + destino.getAbsolutePath());

        } catch (IOException | URISyntaxException e) {
            System.err.println("❌ Erro ao baixar o arquivo: " + fileURL);
            e.printStackTrace();
        }
    }

    private String extrairNomeArquivo(String fileURL) {
        return fileURL.substring(fileURL.lastIndexOf("/") + 1);
    }

    private void baixarArquivo(String fileURL, File destino) throws IOException, URISyntaxException {
        URL url = new URI(fileURL).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("User-Agent", ConstConfig.USER_AGENT);
        connection.connect();

        int responseCode = connection.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            throw new IOException("Erro HTTP " + responseCode + " ao acessar: " + fileURL);
        }

        try (InputStream input = connection.getInputStream()) {
            FileUtils.copyInputStreamToFile(input, destino);
        }
    }
}

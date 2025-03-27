package com.lima;

import java.io.File;
import java.util.List;

import com.lima.config.ConstConfig;
import com.lima.services.Scraper;
import com.lima.services.compressor.Compressor;
import com.lima.services.compressor.ZipCompressor;
import com.lima.services.downloader.Downloader;
import com.lima.services.downloader.PdfDownloader;

public class App 
{
    public static void main(String[] args) {
        try {
            File folder = new File(ConstConfig.DOWNLOAD_FOLDER);
            if (!folder.exists()) {
                folder.mkdirs();
            }

            Scraper scraper = new Scraper();
            Downloader downloader = new PdfDownloader();
            Compressor compressor = new ZipCompressor();

            List<String> pdfLinks = scraper.extractPdfLinks();

            for (String link : pdfLinks) {
                downloader.download(link);
            }

            compressor.compress(ConstConfig.DOWNLOAD_FOLDER, ConstConfig.ZIP_FILE_NAME);

            System.out.println("Processo concluído!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

package com.lima.services;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import com.lima.config.ConstConfig;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Scraper {

    private static final String USER_AGENT = 
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " +
        "(KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36";
    private static final int TIMEOUT = 10000;

    public List<String> extractPdfLinks() {
        List<String> pdfLinks = new ArrayList<>();
        try {
            System.out.println("🔎 Acessando site: " + ConstConfig.URL_SITE);
            Document doc = fetchDocument(ConstConfig.URL_SITE);

            Elements links = doc.select("a[href$=.pdf]");
            for (Element link : links) {
                String pdfUrl = link.absUrl("href");
                if (isAnexo(pdfUrl)) {
                    System.out.println("📄 PDF encontrado: " + pdfUrl);
                    pdfLinks.add(pdfUrl);
                }
            }
            System.out.println("✅ Total de PDFs extraídos: " + pdfLinks.size());
        } catch (IOException e) {
            System.err.println("❌ Erro ao acessar o site: " + e.getMessage());
            e.printStackTrace();
        }
        return pdfLinks;
    }

    private Document fetchDocument(String url) throws IOException {
        return Jsoup.connect(url)
                .userAgent(USER_AGENT)
                .timeout(TIMEOUT)
                .get();
    }

    private boolean isAnexo(String url) {
        return url.contains("Anexo_I") || url.contains("Anexo_II");
    }
}

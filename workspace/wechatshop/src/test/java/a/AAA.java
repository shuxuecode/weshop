package a;

import com.sun.imageio.plugins.gif.GIFImageReader;
import com.sun.imageio.plugins.gif.GIFImageReaderSpi;
import com.sun.imageio.plugins.gif.GIFImageWriter;
import com.sun.imageio.plugins.gif.GIFImageWriterSpi;

import javax.imageio.spi.ImageReaderSpi;
import javax.imageio.spi.ImageWriterSpi;
import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.FileImageOutputStream;
import java.io.File;

/**
 * Created by QDHL on 2017/6/26.
 */
public class AAA {


    public static void main(String[] args) {

        String substring = "1,2,".substring(0, "1,2,".length() - 1);
        System.out.println(substring);

        String src = "C:\\Users\\QDHL\\Desktop\\111.gif";
        String target = "C:\\Users\\QDHL\\Desktop\\aaa";
//        get(src, target, 0);
//        get(src, target, 1);
//        get(src, target, 2);
//        get(src, target, 3);
//        get(src, target, 4);
//        get(src, target, 5);
    }


    public static void get(String src, String target, int n) {


        FileImageInputStream in = null;
        FileImageOutputStream out = null;

        try {
            in = new FileImageInputStream(new File(src));
            ImageReaderSpi readerSpi = new GIFImageReaderSpi();
            GIFImageReader gifReader = (GIFImageReader) readerSpi.createReaderInstance();
            gifReader.setInput(in);
            int num = gifReader.getNumImages(true);
//  要取的帧数要小于总帧数

            if (num > n) {
                ImageWriterSpi writerSpi = new GIFImageWriterSpi();
                GIFImageWriter writer = (GIFImageWriter) writerSpi.createWriterInstance();
                for (int i = 0; i < num; i++) {
                    if (i == n) {
                        File newfile = new File(target + (n + 1) + ".png");
                        out = new FileImageOutputStream(newfile);
                        writer.setOutput(out);
//              读取读取帧的图片
                        writer.write(gifReader.read(i));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

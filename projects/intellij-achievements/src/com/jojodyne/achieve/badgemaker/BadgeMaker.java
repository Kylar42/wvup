package com.jojodyne.achieve.badgemaker;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

/**
 * Created by Brendan A. McCarthy (brendan@apple.com)
 * Date: 7/19/12
 * Time: 6:19 PM
 */
public class BadgeMaker {

    private static final int TEXTPAD = 10;
    private static final int TEXTSIZE = 14;

    //private BadgeMakerOptions options = new BadgeMakerOptions();

    private BufferedImage leftBorder;
    private BufferedImage rightBorder;
    private BufferedImage center;
    //private BufferedImage resultImage;


    //private static BadgeMaker INSTANCE = new BadgeMaker();

    public BadgeMaker(){
        if(!loadImages()){
            throw new InstantiationError("Unable to load images for Badgemaker.");
        };
    }


    //public static BadgeMaker getInstance(){ return INSTANCE;}

    private BufferedImage loadOneImage(String imagePath) throws IOException{
        final URL u = BadgeMaker.class.getResource("/" + imagePath);
        BufferedImage toReturn;
        if (null != u) {
            return ImageIO.read(u);
        } else {
            return ImageIO.read(new File(imagePath));
        }
    }


    private final boolean loadImages() {
        try {
            leftBorder = loadOneImage(TrophyType.TROPHY.imageName());
            leftBorder.flush();
            rightBorder = loadOneImage("images/right_border.png");
            rightBorder.flush();
            center = loadOneImage("images/center.png");
            center.flush();
            //having an issue with these not being completely loaded.
            System.out.println("Loaded Left:"+leftBorder);
            System.out.println("Loaded Right:"+rightBorder);
            System.out.println("Loaded Center:"+center);
            return true;
        } catch (IOException ex) {
            System.err.println("ERROR initializing source images: " + ex.toString());
        }
        return false;
    }


    private void setTextAttributes(final Graphics2D g, final Font font) {
        g.setFont(font);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g.setColor(Color.WHITE);
    }


    public BufferedImage generateBadgeImage(final String title, final String message) {
        int outWidth = leftBorder.getWidth() + center.getWidth() + rightBorder.getWidth();
        int outHeight = leftBorder.getHeight();
        int outType = leftBorder.getType();

        BufferedImage resultImage = new BufferedImage(outWidth, outHeight, BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D g = resultImage.createGraphics();

        int textWidth = 0;
        int titleWidth = 0;
        int messageWidth = 0;
        int messageHeight = 0;

        Font font = new Font(Font.SANS_SERIF, Font.PLAIN, TEXTSIZE);

        if (null != title || null != message) {
            // measure the text
            setTextAttributes(g, font);
            FontRenderContext frc = g.getFontRenderContext();
            Rectangle2D titleBounds;
            Rectangle2D messageBounds;
            if (null != title) {
                titleBounds = font.getStringBounds(title, frc);
                titleWidth = (int)titleBounds.getWidth();
            }

            if (null != message) {
                messageBounds = font.getStringBounds(message, frc);
                messageWidth = (int)messageBounds.getWidth();
                messageHeight = (int)messageBounds.getHeight();
            }

            // get a new result image and graphics context, which is big enough for the text
            g.dispose();
            textWidth = Math.max(titleWidth, messageWidth);
            resultImage = new BufferedImage(outWidth + textWidth, outHeight, BufferedImage.TYPE_4BYTE_ABGR);
            g = resultImage.createGraphics();
        }

        int xpos = 0;
        g.drawImage(leftBorder, null, xpos, 0);
        xpos += leftBorder.getWidth();
        g.drawImage(center, null, xpos, 0);
        xpos += center.getWidth();

        // stamp out more center tiles
        if (0 < textWidth) {
            setTextAttributes(g, font);
            for (int i = 0; i < textWidth/center.getWidth(); i++) {
                g.drawImage(center, null, xpos, 0);
                xpos += center.getWidth();
            }
        }

        g.drawImage(rightBorder, null, xpos, 0);

        if (0 < textWidth) {
            if (null != title) {
                g.drawString(title, leftBorder.getWidth(), outHeight/2 - TEXTPAD);
            }
            if (null != message) {
                g.drawString(message, leftBorder.getWidth(), outHeight/2 + messageHeight - TEXTPAD/2);
            }
        }

        g.dispose();
        return resultImage;
    }


    /*private boolean saveBadge() {
        try {
            ImageIO.write(resultImage, "png", new File(options.outputPath()));
            return true;
        } catch (IOException ex) {
            System.err.println("ERROR saving badge: " + ex.toString());
        }
        return false;
    }  */


    /*public static void main(String[] args) {
        BadgeMaker maker = new BadgeMaker();
        CmdLineParser parser = new CmdLineParser(maker.options);

        try {
            parser.parseArgument(args);
        } catch (CmdLineException e) {
            System.err.println("ERROR - " + e.getMessage());
            parser.printUsage(System.err);
            System.err.println();
            System.exit(1);
        }

        if (maker.loadImages()) {
            if (maker.generateBadgeImage(maker.options.title(), maker.options.message())) {
                if (!maker.saveBadge()) {
                    System.err.println("");
                }
            } else {
                System.err.println("failed to create badge.");
            }
        }
        else {
            System.err.println("failed to initialize images.");
        }
    }   */

}

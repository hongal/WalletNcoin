package com.geopia.wallet_ncoin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ReceiveController {

    @RequestMapping("/receive")
    public String getReceivePage(Model model) {

        model.addAttribute("qrText", "www.naver.com");
/*        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        try {
            BitMatrix bitMatrix = qrCodeWriter.encode("abc", BarcodeFormat.QR_CODE, 200, 200);
            MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(0xFF2e4e96, 0xFFFFFFFF);
            BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);

            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "png", byteArrayOutputStream);

            byte[] byteArray = byteArrayOutputStream.toByteArray();

            String src ="data:image/png;base64,"+ Base64.encode(byteArray);
            model.addAttribute("src", src);



        }catch (Exception e){
            e.printStackTrace();
        }*/



        return "tiles/none/receive";
    }
}

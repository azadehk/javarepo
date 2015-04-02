package org.azadeh.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.azadeh.entity.FlowerModel;
import org.azadeh.entity.PayInfoModel;
import org.azadeh.utils.MerchantConfig;
import org.azadeh.utils.Status;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/payfirma")
public class PayfirmaController {
	
	@RequestMapping(value = "/pay", method = RequestMethod.POST) 
	public @ResponseBody Status pay(@RequestBody PayInfoModel payInfo){
		URL url = null;
        URLConnection connection = null;
        String inputLine = "";

        try
        {
            String strURL = String.format(MerchantConfig.URL, MerchantConfig.KEY, MerchantConfig.MERCHANT_ID, payInfo.getAmount());

            url = new URL(strURL);
            connection = url.openConnection();
            connection.setDoOutput(true);
            
            OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream());
            out.write("card_number="+ payInfo.getCardNumber() 
            		+"&card_expiry_month="+ payInfo.getExpiryMonth() 
            		+"&card_expiry_year="+ payInfo.getExpiryYear()
            		+"&cvv2="+ payInfo.getCvv2());
            
            out.close();
            
            BufferedReader inStream = new BufferedReader(new InputStreamReader(connection.getInputStream()));

            while ((inputLine = inStream.readLine()) != null)
            {
                System.out.println(inputLine);
            }
            inStream.close();
        }
        catch (MalformedURLException me)
        {
            System.err.println("MalformedURLException: " + me);
            return new Status(0, me.toString());
        }
        catch (IOException ioe)
        {
            System.err.println("IOException: " + ioe);
            
            InputStream error = ((HttpURLConnection) connection).getErrorStream();
            try
            {
                int data = error.read();
                while (data != -1) {
                    inputLine = inputLine + (char)data;
                    data = error.read();
                }
                error.close();
            }
            catch (Exception ex)
            {
                try
                {
                    if (error != null)
                    {
                        error.close();
                        return new Status(0, ex.toString());
                    }
                }
                catch (Exception e)
                {
                }
            }
        }
        System.out.println(inputLine);
        return new Status(1, "Paid Successfully !");
	}
}

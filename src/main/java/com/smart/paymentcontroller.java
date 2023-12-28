package com.smart;

import java.util.Map;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;

@RequestMapping("/payment")
public class paymentcontroller {
	     //creating order for payment
		@PostMapping("/create_order")
		@ResponseBody
		public String createOrder(@RequestBody Map<String,Object> data) throws Exception {
			System.out.println(data);
			//System.out.println("Order function");
			int amt=Integer.parseInt(data.get("amount").toString());
			RazorpayClient client = new RazorpayClient("rzp_test_ZfWHiBUXjACBdg", "Hyhflbi43bPyGSBO8VufZ8Nw");
			
			JSONObject ob=new JSONObject();
			ob.put("amount", amt*100);
			ob.put("currency","INR");
			ob.put("receipt","txn_235425");
			
			//creating new order
			Order order=client.orders.create(ob);
			System.out.println(order);
			return "done";
			}

}

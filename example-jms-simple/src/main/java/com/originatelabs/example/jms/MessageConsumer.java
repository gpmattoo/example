package com.originatelabs.example.jms;

import java.io.UnsupportedEncodingException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MessageConsumer {
	
	private static final Log log = LogFactory.getLog(MessageConsumer.class);
	
	public void handleMessage(String msg) {
		log.info("\n"+msg);
	}
	
	/** for stomp messages */
	public void handleMessage(byte[] msg) {
		try {
			log.info("\n"+new String(msg, "utf-8"));
		} catch(UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}
}

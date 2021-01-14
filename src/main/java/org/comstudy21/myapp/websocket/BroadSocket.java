package org.comstudy21.myapp.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/chatting/{userID}")
public class BroadSocket implements Runnable {
	static Map<String, Session> sessionMap = Collections.synchronizedMap(new HashMap<String, Session>());
	static int mapSize;
	static boolean sentFlag = false;
	static String closeUserID = "";

	public BroadSocket() {
		mapSize = sessionMap.size();
		new Thread(this).start();
	}

	@OnOpen
	public void onOpen(Session session, @PathParam("userID") String userID) throws IOException {
		sessionMap.put(userID, session);

		synchronized (sessionMap) {
			for (String userid : sessionMap.keySet()) {
				Session sess = sessionMap.get(userid);
				Set<String> keyset = sessionMap.keySet();
				Iterator<String> iter = keyset.iterator();
				StringBuffer strbf = new StringBuffer("[");
				while (iter.hasNext()) {
					strbf.append("\"" + iter.next() + "\",");
				}
				strbf.deleteCharAt(strbf.lastIndexOf(","));
				strbf.append("]");
				sess.getBasicRemote().sendText(strbf.toString());
			}
			mapSize = sessionMap.size();
		}

		for (String userid : sessionMap.keySet()) {
			(sessionMap.get(userid)).getBasicRemote().sendText(userID + "||님이 입장하였습니다!");
		}
	}

	@OnClose
	public void onClose(Session session, @PathParam("userID") String userID) throws IOException {
		System.out.println("소켓 서버" + session.getId() + "이(가) 닫혔습니다...");
		sessionMap.remove(userID);
		closeUserID = userID;
	}

	@OnMessage
	public void onMessage(String message, Session session, @PathParam("userID") String userID) throws IOException {
		System.out.println("받은 메세지 : " + message);
		synchronized (sessionMap) {
			System.out.println(message);
			StringTokenizer stk = new StringTokenizer(message, "||");
			String recipient = stk.nextToken().trim();
			String msg = stk.nextToken().trim();
			if ("All".equals(recipient)) {
				for (String userid : sessionMap.keySet()) {
					if (!userid.equals(userID)) {
						(sessionMap.get(userid)).getBasicRemote().sendText(userID + " : " + msg);
					}
				}
			} else {
				(sessionMap.get(recipient)).getBasicRemote().sendText(userID + " : " + msg);
			}
		}
	}

	@OnError
	public void onError(Throwable th) {
		th.printStackTrace();
	}

	@Override
	public void run() {
		while (true) {
			try {
				Thread.sleep(1000);
				if (mapSize != sessionMap.size()) {
					synchronized (sessionMap) {
						for (String userid : sessionMap.keySet()) {
							Session session = sessionMap.get(userid);
							Set<String> keyset = sessionMap.keySet();
							Iterator<String> iter = keyset.iterator();
							StringBuffer strbf = new StringBuffer("[");
							while (iter.hasNext()) {
								strbf.append("\"" + iter.next() + "\",");
							}
							strbf.deleteCharAt(strbf.lastIndexOf(","));
							strbf.append("]");
							session.getBasicRemote().sendText(strbf.toString());
							if (mapSize > sessionMap.size()) {
								session.getBasicRemote().sendText(closeUserID + "님이 퇴장 하였습니다!");
							}
						}
					}
					mapSize = sessionMap.size();
				}
			} catch (InterruptedException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
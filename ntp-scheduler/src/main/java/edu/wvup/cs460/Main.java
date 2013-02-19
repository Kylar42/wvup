package edu.wvup.cs460;

import edu.wvup.cs460.http.HttpServerPipelineFactory;
import org.jboss.netty.bootstrap.ServerBootstrap;
import org.jboss.netty.channel.socket.nio.NioServerSocketChannelFactory;

import java.net.InetSocketAddress;
import java.util.concurrent.Executors;

public class Main{
    public static void main(String[] args) {
        // Configure the server.
                  ServerBootstrap bootstrap = new ServerBootstrap(
                                  new NioServerSocketChannelFactory(
                                          Executors.newCachedThreadPool(),
                                          Executors.newCachedThreadPool()));

                  // Set up the event pipeline factory.
                  bootstrap.setPipelineFactory(new HttpServerPipelineFactory());

                  // Bind and start to accept incoming connections.
                  bootstrap.bind(new InetSocketAddress(8080));
    }
}

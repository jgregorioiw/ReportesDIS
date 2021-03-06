package mx.com.nmp.dis.generador.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ComponentScan({"mx.com.nmp.dis.generador","mx.com.nmp.dis.util","mx.com.nmp.dis.elastic.config"})
@PropertySource(value = { "classpath:application.properties" })
public class GeneradorConfig {

}

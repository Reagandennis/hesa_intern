package main.java.com.spring.Faida;

@Configuration
public class MongoConfig {

    @Value("${spring.data.mongodb.host}")
    private String mongoHost;

    @Value("${spring.data.mongodb.port}")
    private int mongoPort;

    @Value("${spring.data.mongodb.database}")
    private String mongoDatabase;

    @Bean
    public MongoClient mongoClient() {
        return new MongoClient(mongoHost, mongoPort);
    }

    @Bean
    public MongoTemplate mongoTemplate() {
        return new MongoTemplate(mongoClient(), mongoDatabase);
    }
}

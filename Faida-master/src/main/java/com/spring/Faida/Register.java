package main.java.com.spring.Faida;
@Import(MongoConfig.class)
@RestController
@RequestMapping("/api")

public class RegisterController {

    @Autowired
    private MongoTemplate mongoTemplate;

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody User user) {
        if (user.getUsername() == null || user.getPassword() == null) {
            return ResponseEntity.badRequest().body("Username and password are required");
        }

        Query query = new Query(Criteria.where("username").is(user.getUsername()));
        User existingUser = mongoTemplate.findOne(query, User.class);
        if (existingUser != null) {
            return ResponseEntity.badRequest().body("Username already exists");
        }

        mongoTemplate.save(user);
        return ResponseEntity.ok("Registration successful");
    }
}

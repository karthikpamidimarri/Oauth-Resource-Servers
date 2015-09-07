package karthik.service;

import java.util.List;
import java.util.Optional;
import java.util.HashSet;
import java.util.Set;

import karthik.oauth.domain.Authority;
import karthik.oauth.domain.User;
import karthik.oauth.domain.UserRepository;
import karthik.repository.AuthorityRepository;
import karthik.security.SecurityUtils;
import karthik.util.RandomUtil;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service class for managing users.
 */
@Service
@Transactional
public class UserService {

    private final Logger log = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorityRepository authorityRepository;

    
    public Optional<User> activateRegistration(String key) {
        log.debug("Activating user for activation key {}", key);
        ((Optional<User>) userRepository.findOneByActivationKey(key))
            .map(user -> {
                // activate given user for the registration key.
                user.setActivated(true);
                user.setActivationKey(null);
                userRepository.save(user);
                log.debug("Activated user: {}", user);
                return user;
            });
        return Optional.empty();
    }

    
    public User createUserInformation(String login, String password, String firstName, String lastName, String email,
            String langKey) {
        User newUser = new User();
        Authority authority = authorityRepository.findOne("ROLE_USER");
        Set<Authority> authorities = new HashSet<>();
        String encryptedPassword = passwordEncoder.encode(password);
        newUser.setLogin(login);
        // new user gets initially a generated password
        newUser.setPassword(encryptedPassword);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setEmail(email);
        newUser.setLangKey(langKey);
        // new user is not active
        newUser.setActivated(false);
        // new user gets registration key
       // newUser.setCreatedBy("ratnesh");
        newUser.setActivationKey(RandomUtil.generateActivationKey());
        authorities.add(authority);
        newUser.setAuthorities(authorities);
        userRepository.save(newUser);
        log.debug("Created Information for User: {}", newUser);
        return newUser;
    }

    
    public void updateUserInformation(String firstName, String lastName, String email) {
        (userRepository.findOneByLogin(SecurityUtils.getCurrentLogin())).ifPresent(u -> {
            u.setFirstName(firstName);
            u.setLastName(lastName);
            u.setEmail(email);
            userRepository.save(u);
            log.debug("Changed Information for User: {}", u);
        });
    }

    
    public void changePassword(String password) {
        userRepository.findOneByLogin(SecurityUtils.getCurrentLogin()).ifPresent(u-> {
            String encryptedPassword = passwordEncoder.encode(password);
            u.setPassword(encryptedPassword);
            userRepository.save(u);
            log.debug("Changed password for User: {}", u);
        } );
    }
    
    public void changeLoginAndPassword(String login, String password) {
    	userRepository.findOneByLogin(SecurityUtils.getCurrentLogin()).ifPresent( u -> {
    		String encryptedPassword = passwordEncoder.encode(password);
    		u.setLogin(login);
    		u.setPassword(encryptedPassword);
    		userRepository.save(u);
    		log.debug("changed user name and password for User : {}", u);
    	});
    }


    /**
     * Not activated users should be automatically deleted after 3 days.
     * <p/>
     * <p>
     * This is scheduled to get fired everyday, at 01:00 (am).
     * </p>
     */
//    @Scheduled(cron = "0 0 1 * * ?")
//    public void removeNotActivatedUsers() {
//        DateTime now = new DateTime();
//        List<User> users = userRepository.findAllByActivatedIsFalseAndCreatedDateBefore(now.minusDays(3));
//        for (User user : users) {
//            log.debug("Deleting not activated user {}", user.getLogin());
//            userRepository.delete(user);
//        }
//    }
}

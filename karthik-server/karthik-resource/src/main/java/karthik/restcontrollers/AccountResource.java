package karthik.restcontrollers;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import karthik.oauth.domain.User;
import karthik.oauth.domain.UserRepository;
import karthik.repository.AuthorityRepository;
import karthik.restDTO.UserDTO;
import karthik.service.AccountService;
import karthik.service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



/**
 * REST controller for managing the current user's account.
 */
@RestController
@RequestMapping("/api")
public class AccountResource {

    private final Logger log = LoggerFactory.getLogger(AccountResource.class);

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UserRepository userRepository;
    
  
    
    @Autowired 
    private AccountService accountService;

    @Autowired
    private UserService userService;
    
   

   
    
    @Autowired
    private AuthorityRepository authorityRepository;
    
   
   
    /**
     * POST  /register -> register the user.
     */
    
    @RequestMapping(value="/adduser",method=RequestMethod.POST,produces = "application/json")
    public ResponseEntity<?> addAccount(@RequestBody UserDTO userDTO, HttpServletRequest request){
//    	System.out.println("printing userdto, login: "+userDTO.getLogin()+"\npassword: "+userDTO.getPassword()+"\nname: "+userDTO.getFirstName());
    	User newuser=userRepository.findByLogin(userDTO.getFirstName());
//    	System.out.println(newuser);
    	if(newuser==null){
    		newuser = userService.createUserInformation(userDTO.getLogin(), userDTO.getPassword(),
                    userDTO.getFirstName(), userDTO.getLastName(), userDTO.getEmail().toLowerCase(),
                    userDTO.getLangKey());
    		return new ResponseEntity<>("successful created",HttpStatus.CREATED);
    	}else{
    		return new ResponseEntity<>("login already in use", HttpStatus.BAD_REQUEST);
    	}
    } 
    
   
   
}

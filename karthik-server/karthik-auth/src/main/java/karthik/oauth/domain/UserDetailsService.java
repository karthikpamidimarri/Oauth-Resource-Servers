package karthik.oauth.domain;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import karthik.oauth.security.UserNotActivatedException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

// @Component("userDetailsService")
public class UserDetailsService implements
		org.springframework.security.core.userdetails.UserDetailsService {

	private final Logger log = LoggerFactory
			.getLogger(UserDetailsService.class);

	@Autowired
	private UserRepository userRepository;



	@Override
	public UserDetails loadUserByUsername(final String identifier)
			throws UsernameNotFoundException {
		log.debug("Authentication {}", identifier);
		String lowercaseidentifier = identifier.toLowerCase();
		
		
			Optional<User> userFromDB = userRepository
					.findOneByLogin(lowercaseidentifier);
			if (userFromDB.isPresent()) {
				User user = userFromDB.get();

				if (!user.isActivated()) {
					throw new UserNotActivatedException("User "
							+ lowercaseidentifier + " was not activated");
				}
				List<GrantedAuthority> grantedAuthorities = user
						.getAuthorities()
						.stream()
						.map(authority -> new SimpleGrantedAuthority(authority
								.getName())).collect(Collectors.toList());
				return new org.springframework.security.core.userdetails.User(
						lowercaseidentifier, user.getPassword(),
						grantedAuthorities);
			} else

				throw new UsernameNotFoundException("User "
						+ lowercaseidentifier
						+ " was not found in the database");

		}

	
}
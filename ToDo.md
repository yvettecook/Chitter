##To Do

### Recreating Twitter UI

- Header
	- 
- Logo
- Colour palette
- Two columns 
	1. Smaller, left hand with user details. 
		- Name
		- Username 
		- User photo (placeholder image for now)
		- Compose new tweet button
	2. Larger, right hand with tweet stream
		- Tweets seperated by line
		- Each tweet:
			- Name (strong), username (light), Timestamp
			- Content
			






--------------
 
### Features:
- [ ]	Password reset process by sending token to user email address
- [x] Correct loss of peep issue (rake auto_migrate?)

### Deployment:
- [ ] Create a staging app for Heroku

### Appearance:
- [ ] Sort out CSS (generally!)
	- [ ] Peep list
	- [ ] Sign In button

### Learning:
- [ ] Understand process of creating and manageing databases with PostGreSQL and Heroku

### Refactoring
- [ ] Remove database dependencies from unit tests
- [ ] Ensure programme has it's 'own language'.
	- I.e. 'register user' rather than user.new on server-side
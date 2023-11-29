# 42-minitalk
## UNIX Signal Data Exchange Program

## About the Project

The purpose of this project is to code a small data exchange program using UNIX signals. The program consists of a server and a client, communicating through signals to exchange messages.

## 🛠️ Usage

### Requirements

The program is written in the C language and requires the gcc compiler and some standard C libraries to run.

### Instructions

1. **Compiling**

   To compile the project, navigate to the project path and run:

   ```bash
   $ make
   ```
2. **📋 Testing**
To test the program, follow these steps:

3. **Launch Server:**

Run the following command in one shell tab:

```bash
$ ./server
```

4. **Launch Client:**

In another shell tab, execute the following command:

```bash
$ ./client "PID" "Your message string"
```

By launching it, this will show "Your message string" on the server window.

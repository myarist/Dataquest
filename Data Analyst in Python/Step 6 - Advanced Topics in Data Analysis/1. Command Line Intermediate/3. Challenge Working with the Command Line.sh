## 1. Introduction ##

/home/dq$ pwd

## 2. Create a Script ##

/home/dq$ echo -e 'import sys\n\nif __name__ == "__main__":\n print(sys.argv

## 3. Change File Permissions ##

/home/dq$ chmod 0700 script.py

## 4. Create a Virtual Environment ##

/home/dq$ source script/bin/activate

## 5. Move the Script ##

(script) /home/dq$ mv script.py printer

## 6. Execute the Script ##

(script) /home/dq/printer$ python script.py "I'm so good at challenges!"
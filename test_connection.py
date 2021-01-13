#!/usr/bin/env python

import requests, sys

if __name__ == "__main__":
    code=0
    serv_ip=sys.argv[1]

    try:
        code=requests.get('http://%s:8000/myapp/' % serv_ip).status_code
    except requests.exceptions.RequestException as e:
        # Forcing a succesfull exit code because run.sh will interrupt its execution if any error occurs
        print (code)
        sys.exit(0)

print (code)

from __future__ import print_function
#from cls import cls
import rlcompleter
import readline
readline.parse_and_bind('tab:complete')
import clipboard
import os
import sys
os.environ.update({"XDG_SESSION_TYPE":"wayland"})
#def copy(data):
#    clipboard.copy(str(data))

def setdebug(debug=None, host=None, traceback_debugger_server=None, reset=False):
	if debug:
		os.environ.update({'DEBUG':str(debug)})
	os.environ.update({'DEBUG_SERVER':'1'})
	if host:
		os.environ.update({'DEBUGGER_SERVER':host})
	os.environ.update({'TRACEBACK_DEBUG_SERVER':'1'})
	if traceback_debugger_server:
		os.environ.update({'TRACEBACK_DEBUGGER_SERVER':str(traceback_debugger_server)})
	if reset:
		os.environ.pop('DEBUG')	
		os.environ.pop('DEBUG_SERVER')	
		os.environ.pop('DEBUGGER_SERVER')	
		os.environ.pop('TRACEBACK_DEBUG_SERVER')	
		os.environ.pop('TRACEBACK_DEBUGGER_SERVER')	

def set_debug(debug=None, host=None, traceback_debugger_server=None, reset=False):
	setdebug(debug, host, traceback_debugger_server, reset)

def ls(path=None):
    if path == None:
        path = os.getcwd()
    return os.listdir(path)

def cd(path):
	return os.chdir(path)

def mkdir(path):
    return os.makedirs(path)

def kill(pid):
    return os.kill(pid, pid)

def cls():
	if sys.platform == 'win32':
		os.system('cls')
	else:
		os.system('clear')
		
def pwd():
	return os.getcwd()

def expand(env=None):
	if env:
		if sys.version[0] == 3:
			print(os.getenv(env))
		else:
			print(str(os.getenv(env)))
	else:
		for i in os.environ:
			if sys.version[0] == 3:
				print(i, "=", os.environ.get(i))
			else:
				print(str(i, "=", os.environ.get(i)))
def now():
	from datetime import datetime
	return datetime.now().ctime()
	


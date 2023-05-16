import json
import math
import oracledb
from flask import Flask, request, render_template


app = Flask(__name__)


def getFromDB(entity, page, pagesize):
    with oracledb.connect(user="dmytro", password="dmytro", dsn="192.168.1.230:1521/XEPDB1") as connection:
        with connection.cursor() as cursor:
            sql = f"""select json_arrayagg(json_object(*)) from ( select * from \"{entity}\" offset {(page*pagesize)-pagesize} rows fetch next {pagesize} rows only) limited_rows"""
            return cursor.execute(sql).fetchone()[0]


def getPageCount(entity, pagesize):
    with oracledb.connect(user="dmytro", password="dmytro", dsn="192.168.1.230:1521/XEPDB1") as connection:
        with connection.cursor() as cursor:
            sql = f"""select count(*)/{pagesize} from \"{entity}\""""
            return int(math.ceil(float(cursor.execute(sql).fetchone()[0])))


@app.route('/cars', methods=['GET'])
def getCars():
    parameters = request.args
    try:
        page = int(parameters['page'])
        pagesize = int(parameters['pagesize'])
    except:
        page = 1
        pagesize = 5
    
    try:
        cars = json.loads(getFromDB("Cars", page, pagesize))
    except:
        return "Bad request!", 400

    return render_template(
        'main.html', 
        path="/cars", 
        array=cars, 
        page=page,
        pagesize=pagesize, 
        pageCount=getPageCount("Cars", pagesize)
        )


@app.route('/clients', methods=['GET'])
def getCustomers():
    parameters = request.args
    try:
        page = int(parameters['page'])
        pagesize = int(parameters['pagesize'])
    except:
        page = 1
        pagesize = 5
    
    try:
        clients = json.loads(getFromDB("Clients", page, pagesize))
    except:
        return "Bad request!", 400

    return render_template(
        'main.html', 
        path="/clients", 
        array=clients, 
        page=page,
        pagesize=pagesize,
        pageCount=getPageCount("Clients", pagesize)
        )


app.run(host='0.0.0.0', port=5000)
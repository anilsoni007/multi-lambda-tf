# Lambda Functions with Layers

## Structure
- **Function1**: 
- **Function2**: 

## Creating Lambda Layers

### Generate Requests Layer
```bash
mkdir -p layers/requests_layer/python
pip install requests -t layers/requests_layer/python
cd layers/requests_layer
zip -r ../../requests_layer.zip python
cd ../..
```

### Generate BeautifulSoup layer
```bash
mkdir -p layers/beautifulsoup_layer/python
pip install beautifulsoup4 -t layers/beautifulsoup_layer/python
cd layers/beautifulsoup_layer
zip -r ../../beautifulsoup_layer.zip python
cd ../..
```

### Generate Custom Layer (Template)
```bash
mkdir -p layers/<layer_name>/python
pip install <package_name> -t layers/<layer_name>/python
cd layers/<layer_name>
zip -r ../../<layer_name>.zip python
cd ../..
```

mkdir kakaku
curl -o kakaku/settings.py https://raw.githubusercontent.com/gkjg8787/kakakuscraping-fastapi/refs/heads/main/kakaku/settings.py
sed -i 's|AUTO_STARTUP_BACKSERVER = {"auto": False}|AUTO_STARTUP_BACKSERVER = {"auto": True}|g' kakaku/settings.py
sed -i 's|ALLOW_UNSUPPORTED_LINKS_IN_HTML = False|ALLOW_UNSUPPORTED_LINKS_IN_HTML = True|g' kakaku/settings.py
sed -i 's|"enable": False,|"enable": True,|g' kakaku/settings.py

mkdir search2kakaku
curl -o search2kakaku/settings.py https://raw.githubusercontent.com/gkjg8787/search2kakaku/refs/heads/master/search2kakaku/settings.py
sed -i 's|http://localhost:8060/api/|http://search:8060/api/|g' search2kakaku/settings.py
sed -i 's|http://localhost:8000/api/|http://kakaku:8000/api/|g' search2kakaku/settings.py

mkdir search
curl -o search/settings.py https://raw.githubusercontent.com/gkjg8787/external_search/refs/heads/main/ex_search/settings.py
sed -i 's|"base_url": "http://nodriver:8090"|"base_url": "http://nodriver_api:8090"|g' search/settings.py
docker compose down
docker compose up --build -d

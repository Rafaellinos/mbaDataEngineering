import requests
import logging
import os

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    datefmt='%m/%d/%Y %I:%M:%S %p',
)
logger = logging.getLogger(__name__)


links = [
    "https://ckan.pbh.gov.br/dataset/b127c1d8-9e1b-4820-884a-8bd8129ba5e3/resource/903286ca-b77f-44ad-aa6a-958aa018c33f/download/si_env-2019.csv",
    "https://ckan.pbh.gov.br/dataset/a07412b3-8371-402a-8ca6-68a518bf2403/resource/ad490dd1-7af5-4868-b35f-9471f15be744/download/si-log-2019.csv",
    "https://ckan.pbh.gov.br/dataset/6511cb66-3635-4560-95cc-d0c39aafb547/resource/ab6db535-b706-4e7b-9fdc-3bc1e823401e/download/si-bol-2019.csv",
]

DOWNLOAD_LOCATION = "./tabelas"


def check_dir(dir):
    if not os.path.isdir(dir):
        os.mkdir(dir)
    return dir


def download_file(url):
    logger.info(f"baixando arquivo {url}")
    local_filename = url.split('/')[-1]
    path = DOWNLOAD_LOCATION + "/" + local_filename
    check_dir(DOWNLOAD_LOCATION)
    try:
        with requests.get(url, stream=True, timeout=3) as r:
            r.raise_for_status()
            with open(path, 'wb') as f:
                for chunk in r.iter_content(chunk_size=8192):
                    f.write(chunk)
    except Exception as e:
        logger.error(f"Erro ao baixar arquivo: {e}")
    logger.info(f"arquivo {url} baixado com sucesso em {path} ...")
    return local_filename

logger.info("Iniciando...")

for link in links:
    filename = download_file(link)
    logger.info(f"localfile baixado em: {link}")


logger.info("Processamento conluído")

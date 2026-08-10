import log
from app.utils import StringUtils
from app.utils.types import DownloaderType
from app.downloader.client._base import _IDownloadClient
from app.downloader.client._pypan115 import PyPan115


class Pan115(_IDownloadClient):
    """
    115网盘下载器 / 115 Cloud Drive Downloader
    """

    schema = "pan115"
    # 下载器ID / Client ID
    client_id = "pan115"
    client_type = DownloaderType.PAN115
    client_name = DownloaderType.PAN115.value
    _client_config = {}

    _client = None
    cookie = None
    lasthash = None
    download_dir = []

    def __init__(self, config=None):
        if config:
            self._client_config = config
        self.init_config()
        self.connect()

    def init_config(self):
        if self._client_config:
            self.cookie = self._client_config.get("cookie")
            self.download_dir = self._client_config.get('download_dir') or []
            if self.cookie:
                self._client = PyPan115(cookie=self.cookie)

    @classmethod
    def match(cls, ctype):
        return True if ctype in [cls.client_id, cls.client_type, cls.client_name] else False

    def get_type(self):
        return self.client_type

    def connect(self):
        if self._client:
            self._client.login()

    def get_status(self):
        if not self._client:
            return False
        ret = self._client.login()
        if not ret:
            log.info(f"【{self.client_name}】{self._client.err}")
            return False
        return True

    def get_torrents(self, ids=None, status=None, tag=None):
        tlist = []
        if not self._client:
            return tlist, True
        ret, tasks = self._client.gettasklist(page=1)
        if not ret:
            log.info(f"【{self.client_name}】获取任务列表错误：{self._client.err}")
            return tlist, True
        if tasks:
            for task in tasks:
                if ids:
                    if task.get("info_hash") not in ids:
                        continue
                if status:
                    if task.get("status") not in status:
                        continue
                ret, tdir = self._client.getiddir(task.get("file_id"))
                task["path"] = tdir
                tlist.append(task)
        return tlist or [], False

    def get_completed_torrents(self, ids=None, tag=None):
        torrents, _ = self.get_torrents(status=[2])
        return torrents

    def get_downloading_torrents(self, ids=None, tag=None):
        torrents, _ = self.get_torrents(status=[0, 1])
        return torrents

    def remove_torrents_tag(self, ids, tag):
        pass

    def set_torrents_status(self, ids, tags=None):
        pass

    def get_transfer_task(self, tag=None, match_path=False):
        pass

    def get_remove_torrents(self, config=None):
        return []

    def add_torrent(self, content, download_dir=None, **kwargs):
        if not self._client:
            return False
        if isinstance(content, str):
            ret, self.lasthash = self._client.addtask(tdir=download_dir, content=content)
            if not ret:
                log.error(f"【{self.client_name}】添加下载任务失败：{self._client.err}")
                return None
            return self.lasthash
        else:
            log.info(f"【{self.client_name}】暂时不支持非链接下载")
            return None

    def start_torrents(self, ids):
        pass

    def stop_torrents(self, ids):
        pass

    def delete_torrents(self, delete_file, ids):
        if not self._client or not ids:
            return False
        if isinstance(ids, list):
            for tid in ids:
                self._client.deltask(tid)
        else:
            self._client.deltask(ids)
        return True

    def get_files(self, tid):
        return None

    def set_files(self, **kwargs):
        pass

    def set_torrent_tag(self, ids, tags):
        pass

    def get_download_dirs(self):
        return []

    def change_torrent(self, **kwargs):
        pass

    def get_downloading_progress(self, tag=None, ids=None):
        Torrents = self.get_downloading_torrents() or []
        DispTorrents = []
        for torrent in Torrents:
            DispTorrents.append({
                'id': torrent.get('info_hash'),
                'name': torrent.get('name'),
                'nomenu': True,
                'noprogress': True
            })
        return DispTorrents

    def set_speed_limit(self, download_limit=None, upload_limit=None):
        pass

    def recheck_torrents(self, ids):
        pass

    def get_client_speed(self):
        return False

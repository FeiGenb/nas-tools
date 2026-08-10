import asyncio

from pikpakapi import PikPakApi, DownloadStatus

import log
from app.downloader.client._base import _IDownloadClient
from app.utils.types import DownloaderType


class PikPak(_IDownloadClient):
    """
    PikPak网盘下载器 / PikPak Cloud Drive Downloader
    """

    schema = "pikpak"
    # 下载器ID / Client ID
    client_id = "pikpak"
    client_type = DownloaderType.PIKPAK
    client_name = DownloaderType.PIKPAK.value
    _client_config = {}

    _client = None
    username = None
    password = None
    proxy = None

    def __init__(self, config=None):
        if config:
            self._client_config = config
        self.init_config()
        self.connect()

    def init_config(self):
        if self._client_config:
            self.username = self._client_config.get("username")
            self.password = self._client_config.get("password")
            self.proxy = self._client_config.get("proxy")

            if self.username and self.password:
                self._client = PikPakApi(
                    username=self.username,
                    password=self.password,
                    proxy=self.proxy,
                )

    @classmethod
    def match(cls, ctype):
        return True if ctype in [cls.client_id, cls.client_type, cls.client_name] else False

    def get_type(self):
        return self.client_type

    def connect(self):
        try:
            asyncio.run(self._client.login())
        except Exception as err:
            log.error(f"【{self.client_name}】PikPak 登录出错：{str(err)}")

    def get_status(self):
        if not self._client:
            return False
        try:
            asyncio.run(self._client.login())
            if self._client.user_id is None:
                log.info(f"【{self.client_name}】PikPak 登录失败")
                return False
        except Exception as err:
            log.error(f"【{self.client_name}】PikPak 登录出错：{str(err)}")
            return False
        return True

    def get_torrents(self, ids=None, status=None, tag=None):
        rv = []
        if self._client.user_id is None:
            if self.get_status():
                return [], True

        if ids is not None:
            for tid in ids:
                status = asyncio.run(self._client.get_task_status(tid, ''))
                if status == DownloadStatus.downloading:
                    rv.append({"id": tid, "finish": False})
                if status == DownloadStatus.done:
                    rv.append({"id": tid, "finish": True})
        return rv, False

    def get_completed_torrents(self, ids=None, tag=None):
        return None

    def get_downloading_torrents(self, ids=None, tag=None):
        if self._client.user_id is None:
            if self.get_status():
                return []
        try:
            offline_list = asyncio.run(self._client.offline_list())
            return offline_list['tasks']
        except Exception as err:
            log.error(f"【{self.client_name}】获取下载列表出错：{str(err)}")
            return []

    def remove_torrents_tag(self, ids, tag):
        pass

    def set_torrents_status(self, ids, tags=None):
        pass

    def get_transfer_task(self, tag=None, match_path=False):
        pass

    def get_remove_torrents(self, config=None):
        return []

    def add_torrent(self, content, download_dir=None, **kwargs):
        try:
            task = asyncio.run(self._client.offline_download(content, download_dir))
            taskId = task.get('task', {}).get('id')
            return taskId is not None and bool(taskId)
        except Exception as e:
            log.error(f"【{self.client_name}】添加离线下载任务失败：{str(e)}")
            return None

    def delete_torrents(self, delete_file, ids):
        pass

    def start_torrents(self, ids):
        pass

    def stop_torrents(self, ids):
        pass

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
        """
        获取正在下载的种子进度 / Get downloading torrent progress
        """
        Torrents = self.get_downloading_torrents()
        DispTorrents = []
        for torrent in Torrents:
            DispTorrents.append({
                'id': torrent.get('id'),
                'file_id': torrent.get('file_id'),
                'name': torrent.get('file_name'),
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

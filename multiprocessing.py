import time
import multiprocessing
import socket


# マルチプロセス TCP サーバ
class MultiprocessingSocketStreamServer(object):

    # 待ち受けポートとワーカープロセスの数を指定する
    def __init__(self, port, processes):
        # IPv4 / TCP のソケットを用意する
        self._serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # localhost / port ポートで待ち受ける
        self._serversocket.bind(('localhost', port))
        # 接続待ちのキューのサイズは 5 にする
        self._serversocket.listen(5)
        # ワーカープロセスの数
        self.processes = processes

    # 接続を処理するハンドラを指定する
    def start(self, handler):
        for i in range(self.processes):
            # ワーカープロセスを生成する
            p = multiprocessing.Process(target=handler,
                                        args=(self._serversocket, ))
            # 子プロセスはデーモンにする
            p.daemon = True
            # プロセスを開始する
            p.start()
        # メインループに入る
        self._parent_main_loop()

    # 親プロセスのメインループ
    def _parent_main_loop(self):
        while True:
            # 親プロセスは特に何もしない
            time.sleep(1)


# TCP を処理するハンドラ (抽象クラス / テンプレートメソッドパターン)
class SockerStreamHandler(object):

    def __init__(self):
        # メンバ変数を定義しておく
        self._sock = None
        self._address = None

    def __call__(self, serversocket):
        while True:
            # 接続を受ける
            (self._sock, self._address) = serversocket.accept()
            # with ステートメントは後始末のため
            with self:
                # ハンドラを起動する
                self.handle()

    def __enter__(self):
        pass

    def __exit__(self, exc_type, exc_value, traceback):
        # ソケットの後始末
        self._sock.shutdown(socket.SHUT_RDWR)
        self._sock.close()

    # 中身はサブクラスで定義してもらう
    def handle(self):
        raise NotImplementedError


# ただ Hello, World! 言うだけのハンドラ
class HelloWorldHendler(SockerStreamHandler):

    def handle(self):
        self._sock.send('Hello, World!\n')


if __name__ == '__main__':
    # 待ち受けポートは 8080, ワーカープロセスは 5 つ
    server = MultiprocessingSocketStreamServer(8080, 5)
    # 接続を処理するハンドラ
    handler = HelloWorldHendler()
    # TCP サーバを開始する
    server.start(handler)

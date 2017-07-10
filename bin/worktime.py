import datetime
from pathlib import Path
from os.path import expanduser


WORKDIR = expanduser("~") + "/.worktime/"
TIME_FORMAT = "%H:%M:%S"


class WorkTime(object):
    """Docstring for WorkTime. """

    def __init__(self):
        """TODO: to be defined1. """
        self.path = self._get_file()
        self.db = self._load(self.path)

    def update(self):
        self.db.append(datetime.datetime.today().time())

    def get_first(self):
        return self.db[0]

    def __enter__(self):
        self.__init__()
        return self

    def __exit__(self, *a):
        self._write_db()

    def _write_db(self):
        self.path.write_text(
                "\n".join(
                    sorted(set([t.strftime(TIME_FORMAT) for t in self.db]))))

    def _get_file(self):
        """TODO: Docstring for get_file_name.

        :returns: TODO """
        return Path(WORKDIR + str(datetime.date.today()))

    def _load(self, path):
        """TODO: Docstring for load.
        :arg1: TODO
        :returns: TODO
        """
        if path.exists():
            return [datetime.datetime.strptime(s, TIME_FORMAT).time()
                    for s in path.read_text().split('\n')]
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            return [datetime.datetime.today().time()]


def main():
    """TODO: Docstring for main.
    :returns: TODO
    """
    with WorkTime() as wt:
        wt.update()
        print(str(
                datetime.datetime.today()
                - datetime.datetime.combine(
                    datetime.date.today(),
                    wt.get_first())
                ).split('.')[0])


if __name__ == "__main__":
    main()

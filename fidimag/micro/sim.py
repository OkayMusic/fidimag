from . import llg
from . import llg_stt
from . import llg_stt_cpp
from . import baryakhtar

KNOWN_DRIVERS = {'llg': llg.LLG,
                 'llg_stt': llg_stt.LLG_STT,
                 'llg_stt_cpp': llg_stt_cpp.LLG_STT_CPP,
                 'llbar': baryakhtar.LLBar,
                 'llbar_full': baryakhtar.LLBarFull}


def Sim(*args, **kwargs):

    driver = 'llg'

    if 'driver' in kwargs:
        driver = kwargs.pop('driver')

    if driver not in KNOWN_DRIVERS:
        raise NotImplementedError("""Driver '{}' is not implemented.
                                  Valid choices: one of '{}'.""".format(driver, KNOWN_DRIVERS.keys()))

    return KNOWN_DRIVERS[driver](*args, **kwargs)
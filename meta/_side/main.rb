require_relative './config'


number = 42
CounterWorker.perform_async(number)

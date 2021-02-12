"""Module for defining application-level constants."""
import string

IMAGE_SIZE = (64, 64)
TRAIN_ALL_PATH = 'C:\\Training Dataset\\training_all'
VALIDATION_ALL_PATH = 'C:\\Training Dataset\\validation_all'
MERGED_CLASSES = string.ascii_lowercase + string.digits
TRAIN_MERGED_PATH = 'C:\\Training Dataset\\non_filtered_training_merged'
VALIDATION_MERGED_PATH = 'C:\\Training Dataset\\non_filtered_validation_merged'
DATETIME_FORMAT = '%d-%b-%Y-%H%M'
DOCX_MIME_TYPE = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
CHARACTER_PADDING = 18
SPACE = 'SPACE'
INFINITY = 2**64

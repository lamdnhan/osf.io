# -*- coding: utf-8 -*-

from framework.tasks import app
from framework.tasks.handlers import queued_task

from . import piwik


@queued_task
@app.task(bind=True, max_retries=5, default_retry_delay=60)
def update_node(self, node_id, updated_fields=None):
    # Avoid circular imports
    from framework.transactions.context import TokuTransaction
    from website import models
    node = models.Node.load(node_id)
    try:
        with TokuTransaction():
            piwik._update_node_object(node, updated_fields)
    except Exception as error:
        raise self.retry(exc=error)

from .conftest import get_client, verify_request_count


def test_attachments_upload() -> None:
    """Test upload endpoint with WireMock"""
    test_id = "attachments.upload.0"
    client = get_client(test_id)
    client.attachments.upload(
        inbox_id="inboxId",
        filename="filename",
        content_type="contentType",
        size=1,
        checksum_sha256="checksumSha256",
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/attachments", None, 1)


def test_attachments_complete() -> None:
    """Test complete endpoint with WireMock"""
    test_id = "attachments.complete.0"
    client = get_client(test_id)
    client.attachments.complete(
        inbox_id="inboxId",
        attachment_id="attachmentId",
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/attachments/attachmentId/complete", None, 1)


def test_attachments_download() -> None:
    """Test download endpoint with WireMock"""
    test_id = "attachments.download.0"
    client = get_client(test_id)
    client.attachments.download(
        inbox_id="inboxId",
        attachment_id="attachmentId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId/attachments/attachmentId/download", None, 1)

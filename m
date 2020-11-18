Return-Path: virtio-comment-return-1525-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1B839860C4
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Nov 2020 12:45:25 +0000 (UTC)
MIME-Version: 1.0
From: Olivier Delande <olivier.delande@gmail.com>
Date: Wed, 18 Nov 2020 13:45:13 +0100
Message-ID: <CANkLV9gRR_EkrCK4czwWiH6toffKN12vSd6M9FFrtvQwU3bmHQ@mail.gmail.com>
Subject: [virtio-comment] Writes to the Device Status field race with DEVICE_NEEDS_RESET
Content-Type: text/plain; charset="UTF-8"
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

As far as I understand the Virtio 1.1 spec, a driver must not clear
any bit in the Device Status field when it writes a non-zero value.
How can it comply with this requirement, when the device may be
concurrently setting DEVICE_NEEDS_RESET? There does not seem to be any
facility to atomically set some bits and leave the others unchanged.

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/


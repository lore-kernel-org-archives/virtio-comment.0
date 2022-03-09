Return-Path: <virtio-comment-return-2793-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46965986596
	for <virtio-comment@lists.oasis-open.org>; Wed,  9 Mar 2022 13:00:21 +0000 (UTC)
MIME-Version: 1.0
From: Awais Masood <awais@bedrocksystems.com>
Date: Wed, 9 Mar 2022 18:00:08 +0500
Message-ID: <CAJ3Dt_XZJX=f-WkbD_wESFLztFyKNW_3TUAPnG-H_SpL6H0YaQ@mail.gmail.com>
Subject: [virtio-comment] virtio-net : 5.1.6.2 descriptor-chains on transmitq
Content-Type: text/plain; charset="UTF-8"
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

Seeking some clarity on:

 5.1.6.2
 Packet Transmission

 5. The header and packet are added as one output descriptor to the
transmitq, and the device is notified of the new entry

Does it imply no descriptor-chains for packets in transmitq? If
descriptor-chains are allowed on transmitq then why does it not state
'output buffer' instead of 'output descriptor'?

Regards,
Awais

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


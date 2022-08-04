Return-Path: <virtio-comment-return-3319-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E32A986590
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Aug 2022 19:24:54 +0000 (UTC)
MIME-Version: 1.0
References: <001a01d8a828$df564200$9e02c600$@kalray.eu>
In-Reply-To: <001a01d8a828$df564200$9e02c600$@kalray.eu>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu, 4 Aug 2022 22:24:15 +0300
Message-ID: <CAJs=3_Ax+LoPT-SXbFFcRhuEQ+eyMrqxc8PMkJMQkRgt_1qqEQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] virtio-net : Fix virtio_net_hdr struct
 size when VIRTIO_NET_F_HASH_REPORT feature is negociated.
Content-Type: text/plain; charset="UTF-8"
To: Cyril Germond <cgermond@kalray.eu>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,
The header size is 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated.

struct virtio_net_hdr {
        u8 flags;
        u8 gso_type;
        le16 hdr_len;
        le16 gso_size;
        le16 csum_start;
        le16 csum_offset;
        le16 num_buffers;
        le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
        le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
        le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
};

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


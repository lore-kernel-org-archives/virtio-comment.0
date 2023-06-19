Return-Path: <virtio-comment-return-6368-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A38EB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0448441EE3
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBE659863E1
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D958D986396; Mon, 19 Jun 2023 08:35:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3470C986397
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 08:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163633; x=1689755633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVa3zqxJWxZ4/W85KCX5m/04Zp6p7aM6lPX3V2LpkT4=;
        b=fi8frcmhnGIt785M3QYPLSnoOBBvaZpCzMgP0+3WB3dejlYctTE0Nb5H5ktT0hLPhN
         WjGA2UxrZ0JBBWXCh8lLm2qUs/UziSgHdjrW6HTWzegD4UrQReWXhTsKzHAeFee9D5XS
         vcQYNFJrSPq6IXI6cNRTXxdXuuFxatukNQw8M7OHj+VF6gE4+EayP6OGJ9CTpa0FmX2H
         CsyiP05iGZLPmZ24OEia4HbbOyLA1QL+BXPw5tMgKtlWnttjdbmEWyw5JfK3kgjYWM2z
         fEBluDLRQRe23+bQmsNpRm/24mkHvLn0gQUF3AIyHqE7z8Hi2l/zCWGkir+WyKyRNMTL
         I3mw==
X-Gm-Message-State: AC+VfDx94GyNu15cYkBfo5F629RKDx5IX2pB6iTaDnPa1LaJebkmQy8B
	LO9Ogfs5eKnn2rG+Tb9kx59zJA==
X-Google-Smtp-Source: ACHHUZ5/tNoEMT8A5ucR/p3pUavdt59cv5Cx0pagcppw+IvSVLPQ1OVuh9/ODl77K2ZXpuRcWPG7/Q==
X-Received: by 2002:a05:6808:6398:b0:39c:8bc5:f8db with SMTP id ec24-20020a056808639800b0039c8bc5f8dbmr6718625oib.37.1687163632659;
        Mon, 19 Jun 2023 01:33:52 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: stefanha@redhat.com,
	mst@redhat.com,
	parav@nvidia.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	xinhao.kong@duke.edu,
	helei.sig11@bytedance.com,
	zhouhuaping.san@bytedance.com,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Mon, 19 Jun 2023 16:31:24 +0800
Message-Id: <20230619083131.1544999-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 0/7] Introduce Virtio Over Fabrics

v2 -> v3:
[PATCH v2 01/11] transport-fabrics: introduce Virtio Over Fabrics
- Drop referring to PCI.
- Drop undefined concept 'vring'.
- Add 'Virtio-oF'(short for 'Virtio Over Fabrics'), and use this instead.
- Add mapping between target and initiator.
- Add Virtio-oF queue mapping.
- Fix grammar flaws.

[PATCH v2 02/11] transport-fabrics: introduce Virtio Qualified Name
- Use 'NUL' instead of 'NULL'.
- Add 'including the NUL character' in maximum name.

[PATCH v2 03/11] transport-fabircs: introduce Segment Descriptor
[PATCH v2 04/11] transport-fabrics: introduce Stream Transmission
[PATCH v2 05/11] transport-fabrics: introduce Keyed Transmission
- Merge three patches into one.
- Rename this section to 'Virtio-oF Protocol Data Unit' instead of 'Transmission Protocol'.
- Remove undefined 'opcode' reference.
- Drop common 'struct virtio_of_vring_desc'
- For stream data transfers, use a single command/completion instead of descriptors.
- For keyed data transport, use a single descriptor instead of multi descriptors. Also support keyed descriptor count probe.

[PATCH v2 06/11] transport-fabrics: introduce command set
[PATCH v2 07/11] transport-fabrics: introduce opcodes
[PATCH v2 08/11] transport-fabrics: introduce status of completion
- Merge three patches into one.
- Drop common data structures definition, define data structure for each command.
- Drop virtio_of_op_get_num_queues, the Virtio-oF device instance would response error status on invalid virtqueue.
- Allow Virtio-oF virtqueue to use empty connect body.
- Allow Virtio-oF virtqueue to specify queue size on connecting.
- Drop errno like status, define detailed status.
- Other minor fixes.

[PATCH v2 09/11] transport-fabrics: add TCP&RDMA binding
- Rename TCP to TCP/IP to avoid ambiguity.
- Add TLS TCP/IP transport.
- Add RDMA opcode usage.

[PATCH v2 10/11] transport-fabrics: add device initialization
- Drop PCI reference, describe device initialization instead.
- Fix grammar flaws.

[PATCH v2 11/11] transport-fabrics: support inline data for keyed
- Use eager buffer instead.


v1 -> v2:
- Suggested by Parav, split a large patch into several small patches.
- Small changes for VQN, add "There is no strict style limitation".
- Move *bytes* field limitation from get/set config opcode section to
  Config Command.


v1:
Introduce Virtio-oF specification, include:
- overview
- Virtio Qualified Name
- Segment Descriptor definition
- Buffer Mapping definition: Stream Transmission and Keyed Transmission
- Command set definition
- opcode definition
- status definition
- transport binding: TCP and RDMA
- device initialization

Previous discussion:
https://lists.oasis-open.org/archives/virtio-comment/202304/msg00442.html

zhenwei pi (7):
  transport-fabrics: introduce Virtio Over Fabrics overview
  transport-fabrics: introduce Virtio-oF Qualified Name
  transport-fabrics: introduce Virtio-oF Protocol Data Unit
  transport-fabrics: introduce command set
  transport-fabrics: introduce transport binding
  transport-fabrics: add device initialization
  transport-fabrics: introduce keyed eager buffers

 content.tex           |   1 +
 transport-fabrics.tex | 881 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 882 insertions(+)
 create mode 100644 transport-fabrics.tex

-- 
2.25.1


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


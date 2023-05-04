Return-Path: <virtio-comment-return-5756-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B559C77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2DCE6F3EA5
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16C709866B0
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 05355983EB5; Thu,  4 May 2023 08:21:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E712598663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188481; x=1685780481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=be1YkT4Vf3r+TNOfRoqm+bZwkEkhHkhZOMishGswX+k=;
        b=J3q3odZOMdiUP+oc06hFlOVi2DmQ1DciPGvyFTZhMr/PdkwCJ+rewkl4IBOWoxTJrr
         NXKn4QE7HqUIXftpzbB0auDVwGe5IMcwPIFXb4lGirV5Re/RFgIww/837IutQRFTXO4m
         MBTiXfLspy88wSdSy4QxJ1Snjw2OEPdZ69Tnz037lMssstCySeVU355n79slZ8wY7MVu
         3p8DtOz9Wbe/R1GhfC6beWVRhWZshgnsGr261MHBXa8mTBaRUwdHKgaVJiL69TfvS4PS
         GCy/+uOCfJLi64iaXrudYMUUBKSArcfnUYtLxfgDNClAUp3JmyT9qt1Iy75NPxjQi5oH
         q66Q==
X-Gm-Message-State: AC+VfDwGbkRxCHbSC0BbI/qBOYJIT0HHFe7/3ot9h1cIgSlzIBR7wU7B
	1CPXMBNtrax9HWfuVbK/yg6gCw==
X-Google-Smtp-Source: ACHHUZ5fTsUBt/9ZsOYTrOs+egjNGnq2QYvwNRES11lt+kxluCVWfe5/Oqpcy9+Qu59dFOCBJK3oFg==
X-Received: by 2002:a17:90b:164f:b0:23f:2661:f94c with SMTP id il15-20020a17090b164f00b0023f2661f94cmr1267343pjb.47.1683188481024;
        Thu, 04 May 2023 01:21:21 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: parav@nvidia.com,
	mst@redhat.com,
	stefanha@redhat.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	helei.sig11@bytedance.com,
	xinhao.kong@duke.edu,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Thu,  4 May 2023 16:18:59 +0800
Message-Id: <20230504081910.238585-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 00/11] Introduce Virtio Over Fabrics

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

zhenwei pi (11):
  transport-fabrics: introduce Virtio Over Fabrics overview
  transport-fabrics: introduce Virtio Qualified Name
  transport-fabircs: introduce Segment Descriptor Definition
  transport-fabrics: introduce Stream Transmission
  transport-fabrics: introduce Keyed Transmission
  transport-fabrics: introduce command set
  transport-fabrics: introduce opcodes
  transport-fabrics: introduce status of completion
  transport-fabrics: add TCP&RDMA binding
  transport-fabrics: add device initialization
  transport-fabrics: support inline data for keyed transmission

 content.tex           |    1 +
 transport-fabrics.tex | 1021 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1022 insertions(+)
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


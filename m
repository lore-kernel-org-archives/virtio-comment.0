Return-Path: <virtio-comment-return-6156-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF1AC77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A85D92AC47
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C5489864BB
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C1D09864A3; Tue,  6 Jun 2023 17:55:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 693E19864A4
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 17:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 06Popf0nPCSI_WA7IiOj8Q-1
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com,
	alvaro.karsz@solid-run.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>,
	longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>,
	parav@nvidia.com,
	stefanha@redhat.com,
	Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	jasowang@redhat.com,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>,
	mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com,
	mst@redhat.com
Date: Tue,  6 Jun 2023 19:55:09 +0200
Message-Id: <20230606175511.2337208-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] [PATCH 0/2] Selective queue enabling

This series allows the driver to start the device (as set DRIVER_OK) with o=
nly=0D
some queues enabled, and then enable another queues later.=0D
=0D
This is the current way to migrate net device state through control=0D
virtqueue, in a software assisted framework with vDPA:=0D
* First, only net CVQ is enabled at DRIVER_OK=0D
* All the control commands (mac address, mq, etc) needed for the device=0D
to behave the same as the source of migration are sent=0D
* Finally all the dataplane queues are enabled.=0D
=0D
Eugenio P=C3=A9rez (2):=0D
  virtio: introduce selective queue enabling=0D
  virtio: pci support virtqueue selective enabling=0D
=0D
 content.tex       | 15 +++++++++++++--=0D
 transport-pci.tex |  4 ++++=0D
 2 files changed, 17 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/


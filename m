Return-Path: <virtio-comment-return-7300-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C04EEB572
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6DCC47078D
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62DE298664F
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 58F85986608; Sat,  9 Sep 2023 14:32:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48CF8986644
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSYCodJZ9H6vcl9TTjt8O6g0yODc1altBsWUFpXwh4VmYS3UcGoJsmdbf+VkIAwqwnm0FiluvYF/x51XRGE6OzHeL+ECXnwltyhSA/6IjHlDVS67M+WyLNC80H79GRUmkZVj8sKCpzALJSTRAi4Fv+ys8Twaa/dJc6xn6k0Rsuk/JU07QZ4zqRtbhmSybavikZg036oiypa8arv/IwvUNxQKJ5ls0DEaJPnUV2EP0K+Ar8uMsCR+AXuQHOk22Zqn5tuOq0odoRLSQZxI0rzH4EDFM5cSav+P/1w7YUkSBV0dpZqkOS7RTQyXWejMJ36dOZkaT/khOjl/mOjexlVTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NziTSeiN2on+hZz2NrYF7aktP5KZHSlcVx4KyEa0uAM=;
 b=aEin/XVzCEBNCWkEgt9aBvsyErE2G0g7uVavmWZq/saKwg+jHALs+ctyP0Uop1nXWnVoFzf8ZC6klSeI9nms+OK03M45jWey//9yUvrsR6HSIrQ5JHMByuz6CnfGb+7+K63q0qSxAzskM+LI74SC/rT4CbK112UJxRjN4NdCoz6KYhDlTgr/piG5EP3YXyJ5gxstXIoWNXHEBN2zojuPAw6Dx2CcPhFs57bgmV0UTOYMlvsWwj9Fx5QhtBwNaw/rjXWaTEIU4HoG2UWmWgPob7KCPS7yBpM7hH1YGQgwHuAtD80l7FLF5E5kb/Vr+uu3gzMKPlY9cK1IvkgrO2FhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sat, 9 Sep 2023 17:32:17 +0300
Message-ID: <20230909143218.524481-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909143218.524481-1-parav@nvidia.com>
References: <20230909143218.524481-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc8a458-9b66-4b75-c85c-08dbb141a335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	btK8MXQCLNZHe6LycrhQ3d93MGn2c1NbUZZjUs179gCjPdw/Z6/SRQmDIiuBTFlV1MqghJqr9xRgIvxAH8oD02YulGE8OB9d32vEmsHuRz4jfCvczzH/8Gr2oWb1U00rsrTmGwB/+HTnphrCvOymyJOh0H9HOCqdXrAyYuKCewuANJfiqeg8IRvLcTT27BTwRogtwli0OFDjhZrMU98J7I8YX3cmTIMETSzUHuCcXm5Kz1gDu3hq91QP+WoByGi0MEkvycUloA+8X8BX1sBSPN7iS07Bzl0fJ+OThQV0XhwUwz9I7ARNT4YpIb3eXTCgseSXpzlmt6bFD83I5PNKwN6I9Qz9meJXbXMUEYgOVT5is+Ir2P9mBseVYWLXB+SzlGXGZQ6rtrMgDimj4TI66MWrjJv8L0LvzBPrA9i+abugQSzZtifm2NPJ6pB/HbTalNtIGiobh4F4NGrWgFf1JQVG9L7QEpZKKZ/YN6sgKt2vMwpMwlR3zPJ5qrOL5EPq/6i5ZDnMxenvXBkgCaA5GKRVVZpICMOP31bCy16wk1OU5DQwKologOCzwHM3CmH/R9QAuB0sB5cXOqxTCLCYMMS+/fjppH0lvjVbOduhHyoim4WEeDyLbYkIe1fRV4VZqm15Mgm6bT+Zlpv/PDO/OVCQYF6pB9OR8TzRVfHe1JZZiwtvMbswFHukXjGZDq0PTQVRaycaSD8I3evbJYWf6a/WQalwLl2lLne90GyLvnC3MMDxANjGHOwf7nKJc0dg
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(82310400011)(186009)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(6666004)(86362001)(40460700003)(36756003)(7636003)(356005)(82740400003)(47076005)(40480700001)(36860700001)(336012)(2616005)(107886003)(2906002)(26005)(16526019)(426003)(83380400001)(70206006)(478600001)(41300700001)(5660300002)(1076003)(70586007)(8676002)(4326008)(8936002)(316002)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:32:47.0696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc8a458-9b66-4b75-c85c-08dbb141a335
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
Subject: [virtio-comment] [PATCH 1/2] conformance: Add missing virtqueue reset conformance references

Add the missing references to the virtqueue reset related conformance
requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 conformance.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index dc00e84..863f9c5 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -76,6 +76,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -162,6 +163,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
-- 
2.34.1


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


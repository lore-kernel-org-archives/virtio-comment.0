Return-Path: <virtio-comment-return-8944-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BE2C47077
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C2D232AC49
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A38E986636
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7B46C98402B; Tue, 16 Jan 2024 05:43:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6941598657E
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 05:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TArKjOKGLnXwRz7tkOqjUINiP+ER8URtDnGId7djKQfAIvAPD5DqmLTa3VDc9Fc1AEObOGgsbcrYRS4uCe77gsJFRLPg/5o4QVA2w9RtZfQC3Aw3/H9yviV+VvuL1qAo1aRQRoniG0LCNcmOImgiOqCngMNgmCd67q8TO6iM9rrLex0TbOU4mOu0zUwjSTV8eFZDfyZzonbBAUl4EBmCXgDaxQlEO1aXbEL1Ip5u1aehV6QdbgzoqxB597+FlznH0XU6BlrqYsXfifBsRtsUQaivowE3Pvqsn9wbA63y1HU7cDH4age6qKsrHOOTIPGQ0NfTw/Vp/TjSDOCwPOVSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JzlU39mGuRWKYCtYFYlAKgRjDPHX2a28OUIfADdna4=;
 b=ReTz1WSyD81YriRohiwNPg2qtcoKbAx0mBtjJRPBNP/d5QNDCdckbZPQBHrT24/OLszMwg6LvH+XuTXhlIzZk08rUlVOCj4jYBL4iG+4AZPKRgD7iOlFaIvT6y1FxSfg+kCvbXTXorrVRVtAFnkZzubbD/f4K/LMXyZKD2bHG6BOqBUCWtazyXhPXth/yvF/BSfH5sH1ORo4tMK9pbrRKccKuAB6pxJSbIUsHdr9Qj2LuzfxeeatzbfGwP6AbKTP6SgzQeywFXJjgCFkDCBjehxHwvx55n8qOhkLtF0jue/GXhWQCNPN26Q28qY14+8gtxHGiHt6SzT77ME3dszy9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Date: Tue, 16 Jan 2024 07:42:35 +0200
Message-ID: <20240116054236.3546213-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116054236.3546213-1-parav@nvidia.com>
References: <20240116054236.3546213-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f86f3c4-7c6e-43ff-82e6-08dc16560496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mJ7B8N8U2zRRon+sp6MjSfVsVjNNhid6ylhDxbVMjviUIW6BGcDwnHwDfmoHeTmZocsZP9o8fqhoUxcuLNeMN6lgJUao7bUI1DuBSPsp0Eu6Uf0umQNf6UNFWKFivMluc6ldmjIoscZ4d0CMN/4yLBaDQqEoDCxwWJEWtlsbR9ddbrCleINpO8TedoeCIQDFeNRJqyEV6iG5bMd0fzNcHhET2QTdHldgjmJ63desrcT8yFAXTW8FZve1dqeXgvAHQ+7P2UlW4/l16+eXBGay604W/E4Lb47qjMtr9ia2Vi1aZuxlaFqN+8aLRBZhHZHgB7a1eSkrZLwfNHBTOsLW6NK3zdaqTdUPqDtvVc3uSatGbWbIIV5auYJWbw10e/TBxuUXioBqPcKhXNdy/vEf5Mt/l9thFfR29svIREn17SeqQTt5JHQDClSM6J8zrPbU+Hio4MsgynuOt4yUVeCJ0NjB28meo9IsqvcxCNaWbvGFI83hsxHCyVbEjKuSI1/Zy2wjDLAg3IE2ytDXknioXNby17XwF711x6LN31wjlaZHQ69+/Udxs/195p3C6S48hThf29PxJTQIx/qHKl6224V42FtOvQJUu+YKeHfM72stnKjYqy7ralnhxukk3sUi2D8oA0HqEHQopSD4zsDUwbzSohk+zgXcTKQ3c4j2HqC2Rwef0WqatFdCberqfYFrcHdz4+4cwHCUJQUhzhcLRZsyYDXcTeq9cR+P5LC1KUmw/cmGKgQsehjyXHErzfCDq9EK4I0Yi7rr7apf2EThU8Kyox+tKIpTNZHI2eroXm4Lgazvv5KZ/YcswBiJf8Gd
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(46966006)(40470700004)(36840700001)(426003)(6666004)(36756003)(2616005)(478600001)(966005)(47076005)(36860700001)(41300700001)(16526019)(26005)(336012)(1076003)(107886003)(83380400001)(40460700003)(40480700001)(5660300002)(110136005)(70586007)(2906002)(70206006)(8936002)(356005)(54906003)(4326008)(7636003)(8676002)(316002)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 05:43:07.7707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f86f3c4-7c6e-43ff-82e6-08dc16560496
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750
Subject: [virtio-comment] [PATCH v3 1/2] virtio-net: Fix receive buffer size calculation text

Receive buffer size calculation is based on the following
negotiated features.

The text has wrong calculation for IPv6 and also it has missed
VIRTIO_NET_F_HASH_REPORT.

The problem of igorance of VIRTIO_NET_F_HASH_REPORT is reported
in [1], however fix for ipv6 payload length must also be
considered.

Since for the both the fixes touching same requirements, a
new issue is created as [2].

This patch brings following fixes.

1. Fix annotating struct virtio_net_hdr as field
2. Fix receive buffer calculation for guest GSO cases to consider
   ipv6 payload length
3. small grammar corrections for article
4. reword the requirement to consider the virtio_ndr_hdr which is
   depends on the negotiated feature, hence first clarify the
   struct virtio_net_hdr size

[1] https://github.com/oasis-tcs/virtio-spec/issues/170
[2] https://github.com/oasis-tcs/virtio-spec/issues/183

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v2->v3:
- addressed comments from Cornelia
- added virtio_net_hdr inclusion description in buffer size calculation text
v1->v2:
- addressed comments from Cornelia
- rephrase buffer size wording without explicit length of virtio_net_hdr
  at 3 places.
- replaced otherwise to ', otherwise'
- rephrase non normative to write as driver normative
---
 device-types/net/description.tex | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..3e75c92 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -657,10 +657,15 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
 VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6
 features are used, the maximum incoming packet
-will be to 65550 bytes long (the maximum size of a
-TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
-making for 65562 or 1526 bytes.
+will be 65589 bytes long (14 bytes of Ethernet header, plus 40 bytes of
+the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
+extension header), otherwise 1514 bytes.
+When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
+size is either 65601 or 1526 bytes accounting for 20 bytes of
+\field{struct virtio_net_hdr} followed by receive packet.
+When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
+size is either 65609 or 1534 bytes accounting for 12 bytes of
+\field{struct virtio_net_hdr} followed by receive packet.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
@@ -669,18 +674,24 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
   \begin{itemize}
     \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
 	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
-      the receive queue(s) with buffers of at least 65562 bytes.
+      the receive queue(s) with buffers of at least 65609 bytes if
+      VIRTIO_NET_F_HASH_REPORT is negotiated, and of at least 65601 bytes if not.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
-      with buffers of at least 1526 bytes.
+      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
+      is negotiated, and of at least 1526 bytes if not.
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
-least the size of the struct virtio_net_hdr.
+least size of \field{struct virtio_net_hdr},
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
 \end{itemize}
 
 \begin{note}
 Obviously each buffer can be split across multiple descriptor elements.
 \end{note}
 
+The driver MUST consider size of field \field{struct virtio_net_hdr}
+20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
 
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


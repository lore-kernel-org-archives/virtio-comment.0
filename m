Return-Path: <virtio-comment-return-8331-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD9EC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2F5697234F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 261AF986D0D
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 197FF986D04; Fri, 10 Nov 2023 12:41:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AB6D986D10
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg8gHC+tow35ximfCR15Z1yCZ8KmGvBRbrG3YbsK8y+qLYcF1TGaTP2B3kgqRDM6hc2zZ/FaJE4/49ZRnk7TNYrdg7iEa+a/FCJdRqy3R0ZOlljV9eA0j4y9YF2Pq9aT186Xq/kwSDrIA8/fRIEq79AkzQ3fnyDW3Z7ryPtwOxmQo1qO+aW4Fpr7s2VoUJDsiy6nkVFafAxU8YLTq69/tuo+ESKpAQHaYLF/Q6n/57tQsBCVDIEGV/ruIVDzOblpmq90jMPW6nmDr4VoXlGB2V3Hy+/CXnOn83Kcr5qN32ZZLf04VRepJIPVleYZYNlu0lw+uw+cBTwtdrzOHQ6MJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLpAnbPyaUGiDKmNbtEpsxA3hnDahQ3bQ702D4W7U6E=;
 b=SB1UH+y4uEgwkq4dcU86JU3g3J2Vm/P76PTnX5gpRaR4Ex60oHGdsg4fCD7DVeLhjG9soCDMPxjQTVum45bUYcS1Ny1K48hFBG/TTPcnLfY08dfJojgf532IbO594rp1XlXBUR/9OpkHCtGb2kgND2XEs//GadkO5OGbJHttmzTR9Ld8XuZNtATvEW8nZUe3wXJv8CZFCYNRAJBwhFMb0Kmjo9sWhIMNvo48oQv+/Ms8pJ6zgnO0MmEUcwQk37Kmgh4kEkUd+fEsp8db6S85DRt7NyXeYZXOII9Ydyuifum3/C9B/18y/rD9tvLbN0GIGPzkUnyTUxHjvyZtv+7lhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Fri, 10 Nov 2023 14:40:39 +0200
Message-ID: <20231110124040.2093394-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110124040.2093394-1-parav@nvidia.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|MW6PR12MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dff23b-f4b2-49e6-70d3-08dbe1ea5186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NCcXBAOmZfioynhYT6WKM9ySHltlx3+PPpPXDZ9RI/rn50pLpT8pb/TTmL6tvdmt54gsfHli1tDuRPvCWUq6mLw5PPcySmn/R98pTdVicZiNzLjggfsJvZ65Lm5VShwmEYEuuSCNMEYVw/tGRKaXzWlH+f2GDdHtaps4TjoPYWdkmqNOkSd/a6p+SJCQVPQNhvO3+qJOhZLXRplEO0fy2vg+Pnh6YHEHLEFvFIQZWGT+fZ/DliYxX9OTALaGIAcIBqDEXWD3jSV/Nk0XXZXFBNHf8C6Yw8r+W6eZPkBR0A61L47r1q/b9/wOYmKYZoEv84gMcRruIm/ZtV+ilYaHLgj0YgZoajTEj9YpWRgFbaiuh/NGdxs1LkCv55f0yudV1mTRnQNHDu+ZFuKuImqpQgjs/KP8Vw+JC/BA6Js+JFmcTeVzIyjp8UerhT4bwH58tMeTYMTNxrfy5ljobW7Fze/1HuXR8+Tped1ed1KoEjg1ij684SQNU1TZ6wRWrukJ3gX+kv0wf9IUMpWuQ6QKxkzmsPbcy7PDdUpvijadmYgGuKIdQtxIxRi2uW25HpjzIOUoHLTsEdEBnQxjd6zrnn/bugc+iAyLY0hcj7jqZPns0loYiNJ1b6KQBgD9HUUU1Zb49ZI0jCreOzwe9eBo5hfjGfFuh+TR2g2JaZaIEjpi6ydY6Fy9IBLTbwdz7lk84WI5iWcbgWB/FQeed4RGM1S0H27hLKsw2ziBjKJc44Tb2Cj5yx5Fg3iQI4QxY77PDbyohza31ORmlxu4X01fkxChArKImGlbU4ZqUBpbA056l9CEngswJYttGduB7Ryv
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(82310400011)(451199024)(186009)(1800799009)(64100799003)(40470700004)(46966006)(36840700001)(40480700001)(356005)(2906002)(4326008)(8676002)(8936002)(7636003)(41300700001)(83380400001)(36860700001)(5660300002)(86362001)(47076005)(16526019)(40460700003)(336012)(82740400003)(426003)(107886003)(2616005)(1076003)(316002)(70206006)(70586007)(966005)(6666004)(54906003)(26005)(110136005)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:41:10.7856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dff23b-f4b2-49e6-70d3-08dbe1ea5186
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8949
Subject: [virtio-comment] [PATCH 1/2] virtio-net: Fix receive buffer size calculation text

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
 device-types/net/description.tex | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 96f7dc5..f5647d4 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -660,24 +660,35 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
 VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6
 features are used, the maximum incoming packet
-will be to 65550 bytes long (the maximum size of a
-TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
-making for 65562 or 1526 bytes.
+will of size 65589 bytes long (14 bytes of Ethernet header, plus 40 bytes of
+the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
+extension header) otherwise 1514 bytes.
+When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
+size is either 65601 or 1526 bytes.
+When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
+size is either 65609 or 1534 bytes.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
+If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
+\field{struct virtio_net_hdr} is 12 bytes.
+
+If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
+\field{struct virtio_net_hdr} is 20 bytes.
+
 \begin{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is not negotiated:
   \begin{itemize}
     \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
 	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
-      the receive queue(s) with buffers of at least 65562 bytes.
+      the receive queue(s) with buffers of at least 65589 bytes plus the size
+      of the \field{struct virtio_net_hdr}.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
-      with buffers of at least 1526 bytes.
+      with buffers of at least 1514 bytes plus the size of the
+      \field{struct virtio_net_hdr}.
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
-least the size of the struct virtio_net_hdr.
+least the size of the \field{struct virtio_net_hdr}.
 \end{itemize}
 
 \begin{note}
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


Return-Path: <virtio-comment-return-8889-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283C5C3DA6E
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 08:01:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 62DEC2B018
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 08:01:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F6DC9865D7
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 08:01:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 25D3E9865AB; Fri,  5 Jan 2024 08:01:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1307D9865B3
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Jan 2024 08:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMizmNQnFm4iOr3yYjsJryW9OwYkEIhfu6/+B6yw7vuhMc37XhW/eo2/GZsKDwh3pGaXwcOQJ+um5mO+oiY3IJnkHmq9FQFofWC+UvQBQKGfdZoPoP/l15VqID+kHQsQRH7rgY0Wj6wYep6IagoEdeJAfQjnXpdJtwZ62DIIxwILZi4NDpsOCxIIh/Y8z4Q2un9ahqK35gEYShnJGOAL2P8TTqWuU4pmA+v+oKlNiWXj+MFYkkGGOzRj1lA8mTbGk6O7QPu38fVBngkOzQfKZY7+YDU53i626d8sjFpDxGeTX6KdOjwhmXWNmkh6fyhN9y5cuGW2RbsUwtSDF9juZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kACjD+tdepDl+OF03FiXdvl6cAjVKNZnluLYMg5Etrk=;
 b=dNXuG0Z4MvHmFKrwwDkvn0MnHgzvFdxXVcP85Wi+hzGfOJYujSDxGIj9tvdvCcKKDhXDYAgSYK7mft5j13FHEKl5+H6zIcDDZrdUCY7Seq1zP8oKAPqRmLPTNX+Hcd/DWCIysRa8N71/s/hzFcE42b5brx2hECz1fueYz76QZ14Q/40+MzRZ81+6+gvfftabGOMN6cUjUYND1fPIznpFnNIhGaylsLB8M9/FIYES0ygDtqNiaFyR/FlOsY/7KsmRRA/t6AsAgKVyc9LUL5hc2jIncboDAjl7bt/K2dJlTV3DC9YdeL4yxhAEpdApqYJf0wghA/MM1Fldor+7ggBPNQ==
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
Date: Fri, 5 Jan 2024 10:00:54 +0200
Message-ID: <20240105080055.3459531-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105080055.3459531-1-parav@nvidia.com>
References: <20240105080055.3459531-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|DM4PR12MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 795e9602-62ba-4ffd-1fb0-08dc0dc48527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L4wUnsHizyEyqOOv/gCo5XDA034Q81TBPsiiXT/fagqqgkm6m5bSxZWZkCZtA425U8fHkLeTeSy3a0Z7jSL/tSeD+L1yzoY8VdQQSyYvYoVw7NDkF73Vsr6PlGn7AnK7/SGjxF4QyBzyTEKDjUJZVL/o6dE0L+FTHvm9hV0gXkYU6hgYMbLzXeI0k0OnkepKSkFAd3vDiblXn8b6ahDXPlM3qZGCM5qAJ7osCWlnh4Hy/TJ42Lht94AyUqV36mXHncYnp4b2WbShkam1aZ8qsJEBuMqaIKSWFb1mJe7iE0+JfGavV2CYE564S27muL/Rw3YF0ePyhxbSo3j+dtXzUdagR7pQ3vSHOc0zPxbpPNVddawT5P/Z6GvQOEVSerwDi2WkzbN1uQ9yPqoseuRNcRxz1UMyWZ+LjdkfrRUHZivr9b88qb/N79Xu/daYvE8e0KYpJeR/yOmoJDms9h2AkpFBbXhNiz7qZBB7oO4YbfOb82dHaOuebHa5lj8MMyl0lp1brFLe4aYbhrGXc+s6HDqJyTwzRpiBLJdX5omFY7inIPQzrBS15USIE9iZY/t4NGX+48s2uQQpyG5iF3G0SrNWgNZUSONe2U4pL7wRHsCseIaEOaxrApF6y+EyLGRDmeC/HMlrWMdESmrDTMEnQnnNM38DRaH+ti/UtILm2HQzxqUNTHRU5Djbc+VbaFMPcQT4T1dYxnTYJ1yDSs7OotR1ChprMst3ZC19ZqM8lLTZrBxhpxChxNzkw8ZSNUCi+ng/hlqCGampRTUnvf8kAsBJu3/w/S0k3fjPODXS9Dk=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(2616005)(426003)(26005)(336012)(1076003)(6666004)(478600001)(966005)(82740400003)(36756003)(86362001)(7636003)(356005)(2906002)(41300700001)(36860700001)(47076005)(16526019)(83380400001)(107886003)(70586007)(110136005)(54906003)(316002)(70206006)(5660300002)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 08:01:27.7515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 795e9602-62ba-4ffd-1fb0-08dc0dc48527
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5056
Subject: [virtio-comment] [PATCH v1 1/2] virtio-net: Fix receive buffer size calculation text

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
index aff5e08..a1f40f7 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -657,24 +657,35 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
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


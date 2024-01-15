Return-Path: <virtio-comment-return-8925-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08CEC3DA79
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 273AE120D45
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F035F9863A8
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D5E2898403A; Mon, 15 Jan 2024 09:32:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C70DE986367
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Jan 2024 09:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InyHshcxTRb4tQmYnMRsYLQNwKgKpwrO+Us54pOJ/8aT1C+9C59j6uenIPelRz1mWLwm1wa2OjhqCWGaRN3pg81GbzNDQPGu54F1a6qg/dfSV+HnxNH6eHj0JrrB7LT/7T6pJaFVayXyYFGa81snfFm1dvIR9mKqZL6hKXq1izRC5tXnpzPLn2/dhzTwjWaFQKEySbjumr122Ey62wiMKfpXT8PinkCaz3gczsLw+h0wNQn+MrZvW3B/XmC4DDGYp+wUnG+E9p7X5QA7llIgtJxdVDm9HBSlrPQt1C0lRfSut+I4h/i7bRoBbhWDFqxS2Jtf02tJKCUtpMS5DPIULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhuRLv+1CXBG1QUFK9g2pWsp1q1qwXU9cKdGI6BDWzI=;
 b=IbwFx7NJUYxv0uKNWusIkYZ3EzC6ysczqvnmgqqLydHKVcwMHMYrLnxs5XUvWk5v1MNiPC5uBwKoKbdpqOoaqNK6q/PQwx9qdVsDzu5VOEVM5s/nalOPYPIXuUt8TyrKWH6cMQQsUbcF4SEG2LOIg/ao24KCwR0NS8+jTgrKKi0Q57i7YB0NAVqN4YzABkkRPIP1+WpaQppEIlvPagmYtpEISSZw8iBNprJM2sUmHa04u8cGzu8UsfwCRhHzMgsL4/HloUIf1UL+78GHh4hKvauzYSRDUQ6xQ7lwpVQffRT6iDYlcO47qFf6CldU9/jvBgI6w473Ny1wXbYsUkQBDg==
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
Date: Mon, 15 Jan 2024 11:31:40 +0200
Message-ID: <20240115093141.3539316-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115093141.3539316-1-parav@nvidia.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: da4a7928-1495-42cf-cdec-08dc15acda74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DQByA0t62i8rwOg41kknh6UDZcmSCebcvrd5xamGfJ69BsnUKFexuMgT+hkqFx3JwNNgLPSHlo7Ra9kBtcR0C6FpwP98C4uFbXMvefLSl/PQdBbgj0Y9rOb8ofr6ROAhDNa4Rg5vmLxN2z4Cy8tZ1fvZBGc+JRBTh/to0aTGHFoYwIHE/y9adrZ1TyP2Uhzm9qpSMNI4AOrNykp4t+Xp7MSZWLun26FGJuk5ym1HvdOvmfxsM6wFUoR+B6lTIgjGg9F3xi9iZoeIeTdNb/8nRX8tO0OX8Sqz8kuH9KpYvKggzOmtLmqZ7lTbw4W7LlPf2I4wqTk1rtf2044XtR7u80iBKS9JwNdY0d98qlss2YEY/ohzHXSOEDMoZ9t2Kz9yQiwJlnRGRCpjW21hOfGG1lraTq3A2C0cJ/hHpKwLDoAz/wRqYJ7QLExhRNfKK0twO42dyCBbjNPCiEkXE0lr8nUTiUWcF1ZFcNwN1/QXyD9RZfJOf/WQFl2xGOFEENO8Hz8mlO6kICzKFJmDVRgh6e+anCIU8yiEwRrG31prbGpUYtIvqlX49jlwdrpW+PO6VBXEkWPo4bIxujXxkGnLHymPIU9f3WRDAiPvsHQvNjbZS4PzPCHmE6Lcj1ka9fqA8mNVhOcBMU1Pmmc5dgLYnYnpZkc3BL3MhL1B0W1aohZ8Uh70I0CQIUse3Qz8z1GP+9AxE2Yn39tIP8FZyxjGFl3IXAWP3lnVia6KkMK+qS5TuKgXcfgOCJ+8IiC9uOTiDZx8wi9Xlx7o2y8pSoIa/VDektdHmBZc8ylkolLh5YnncTe8bvFQ8GAIPI8c2UFY
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(82310400011)(1800799012)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(47076005)(83380400001)(107886003)(86362001)(36756003)(7636003)(356005)(82740400003)(36860700001)(6666004)(5660300002)(8936002)(4326008)(8676002)(26005)(16526019)(2616005)(1076003)(426003)(336012)(70586007)(70206006)(316002)(54906003)(110136005)(2906002)(41300700001)(478600001)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 09:32:12.2007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4a7928-1495-42cf-cdec-08dc15acda74
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
Subject: [virtio-comment] [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation text

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
v1->v2:
- addressed comments from Cornelia
- rephrase buffer size wording without explicit length of virtio_net_hdr
  at 3 places.
- replaced otherwise to ', otherwise'
- rephrase non normative to write as driver normative
---
 device-types/net/description.tex | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..53a56ee 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -657,10 +657,13 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
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
+size is either 65601 or 1526 bytes.
+When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
+size is either 65609 or 1534 bytes.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
@@ -669,18 +672,24 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
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


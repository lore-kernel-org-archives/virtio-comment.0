Return-Path: <virtio-comment-return-9102-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984A8C4829B
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ED0772AF96
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7AC5986496
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CA849985E9E; Sun, 11 Feb 2024 09:48:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BCE32985F89
	for <virtio-comment@lists.oasis-open.org>; Sun, 11 Feb 2024 09:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiJr8mgiCGIOC5Vy8G3v8ZUtNH7dNaKn8XDOm7HSdc5LAGNKq0hx2nBPmnzdWTF65z+CUbmTxC92UZ2LA/fCyg0zbN1nNeJkOlXWXrB8UYfJ88+LLRLlI0e1ei8hOgcJSX/luIna9AKjlrcgYAUiPkZPV6bvSWJ/597rmiF1waxYgM0C4zCxJFMFqSgkRo9dZZStyUuktkgLT5YC08KLIhej2G4/K/MJXmH+L508pwRpBwn/9QUuCVmE4wLo1ffB9cXEXOgyTMQ04vGQXe2ObANEIpklm0JUCk8367tqa6UNraYENUO2uHgNkrX4bS0xYZScLkWja3RBRLMh/U9jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNCzPjBszAs3q8fdCtzp+uOSh9PLMUgezbls6ZcvtMk=;
 b=B3MqSKnR7lnwnclCFU329EMnTp+S4Wwo5JcmiQbge9UTJCMOpVyGHe46htBTg4a78N1G08sDw7yQ+L6jtxUja/He/bItc/jjYd29jxGfDTcbgep1Z+phsHR3fWTbevMnf5sIzyam8uImSHoOgkuJm0sTjG8uDpkX3tKXnk1RB91DHFuWJQ7YWR0TS6QllQqJCDxm0F4FO9ckVdU2BL40lmAjoesq4pVZvfFp57pRgybNyvVgSFaQtIIXRl5JbYvfjwaYjkP48T9rZ8Roo6tQNkY/4Gui08il8Q8s+feY0ViaFkxhMy/iVQ+6Vp347I72IqtFUVOff8rJa239cI1sEw==
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
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 11 Feb 2024 11:47:59 +0200
Message-ID: <20240211094800.5397-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240211094800.5397-1-parav@nvidia.com>
References: <20240211094800.5397-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: d4efebc8-ff4a-4aa2-c1c6-08dc2ae69cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H6xZQtBKNvEe72AaebQ/9UrxBgqV+FyMBnyTjGvRFag2iyXqaaQlJLQOWiXzfLJuVP9uOEAaDF2FIoXbXSv1Aw8eSORQiq0aHxa5fhBDxfX1Q0zZfRwtRadetlaNmPV8W/CIcpL4TsbaNCAoCvJHzoHNUZ9PRhoZ90Qe4WlMXMDEESdsbDl1nb6Rbz/7aHk7Gt7zHAzgVua4UbQCrMA9VcLS2ZnJPDlRwlALsu5DjJ0JTiHe2VfYKDawP9/Gv2SrG/elSSOUEHaxLV35NM+eiLEdCi+3PwskZtH9K9BIqVu18Xf7StKlSLPKgoXsm+rnbERaIKpT6SvLmEX+/dQ4Q2zjFzejlktC1xzZ97RK8Qrh7yF+M+giRnsfHX50jSHe7vAbqaEERj+M5bbYaNhiidbzg1XOinhNvwszkNRR8mQj8NWaxR+mO3KZjQSrE3PfahFocTXz6Z1UqvfeJp8s3xxfFL0tbqeIu1Bhspim+zYzosBYrYGxf9OlIv6+SiCEm9bH+nQWHGVx9lBNfKQZbsftJFdBM/k6/cGeFsB3b4bB7fGrUFpPzaSLG7iwLJClkAfKZRqCvVYyeeLfxMZ19+IRyReTvow+UZ5obThRDLxxdx7cv8jbSmKAl6f468MHRMt5C/bZNARWa38pAzbPsSQJMIjanisNoLGV1WEJTYt3+ReEE2mFDH5GO2pmTXK0
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(36756003)(966005)(2616005)(478600001)(107886003)(1076003)(16526019)(26005)(8676002)(336012)(70206006)(70586007)(54906003)(8936002)(6666004)(4326008)(110136005)(83380400001)(316002)(426003)(7636003)(356005)(41300700001)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 09:48:33.9261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4efebc8-ff4a-4aa2-c1c6-08dc2ae69cd1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565
Subject: [virtio-comment] [PATCH v4 1/2] virtio-net: Fix receive buffer size calculation text

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
v3->v4:
- addressed comments from Cornelia
- rephrase for virtio_net_hdr size calculation
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
 device-types/net/description.tex | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..17e33fa 100644
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
 
@@ -669,18 +674,25 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
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
 
+When calculating the size of \field{struct virtio_net_hdr}, the driver
+must consider all the fields inclusive up to \field{padding_reserved},
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
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


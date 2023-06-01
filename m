Return-Path: <virtio-comment-return-6081-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C82C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D4E1356DB
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA8F3986808
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A16B4986849; Thu,  1 Jun 2023 22:03:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 908609867D2;
	Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leVcW7C4t+Xn8zgbsCkzMJblC0vl38jqAaRn2P8BDgrNkrnK6lcYVXAQmf7ytnk3PcsvNOC57A4A17nXB1Sh4Nc85FhiqMVft6qXuFy6nO1Ad7RXIoeCDqKdXxmYjvsuhk2aZzxyDtM4hX28pjxIKQcB6KvNRE7P0sL4BgN1fCAidEtxw/FcJ5/uD/wZ09HHoofjgUk2E0pOD7IiQ99xFnQxAtZkkDn+TR3LZ1kcgw1faAd3Hx9aB1+Rlt2xGCmv+itq/IlkwPq88rZkJQVuCTzRZysRxst2AJvjmhs+3eeTgTy7pW4ktlAlCoHypGkZphLfWhL1ORPOwF9fDaqA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+/iWaW/wWueIIMblUtsBowRgntXRcdcdVFzpAhimIU=;
 b=CwyhNXXq1GwbiNjTP4JZ5Xjtd5RO2+bnHVjRQDAEjzhAtVuChXggxoJQ+PhaP1d3pIINuY2WfJaBYi9qI1QiK1taqkaPKClA3/nG0fh5v+4SytSAy1m+lhqm18+j02oWCsinY7nnOGRCFAVkpOgt7031ioghXygaul35SgIL0mQlcs1fYLrfu8QxPZh7cDnElg2Tn5HrH89J3oJhgyXfAAStIx0mLF8iL7lVWBE7ioC22m8v2zNZ7ZhoPPSyfNVlvKXHZjhz+r2YUQpgMJZi6qndE/81PqFrC/rDxzF/6JrK9+hhS3pNbc2HlWXa2cFviuJeLvPGI0NM9gNjDOo5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 2 Jun 2023 01:03:05 +0300
Message-ID: <20230601220305.587034-8-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230601220305.587034-1-parav@nvidia.com>
References: <20230601220305.587034-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT060:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4898191b-720a-47a7-e904-08db62ec0b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wcp4UZo53iK4EScbbYWxz9iHaL80ohAPK844XvBAtyzOFvyCLt6M7kGCagfBkvSTcRvW6KrmwC0sRw4hNi/k3hId7uO+/EooLI80/ho4mczRutlQA5yAtm1zDTlYaDfu5Sn/lfv/hLCTGag59z3nr1wX7eKTlEc8TLKe4BYZ6XPGkvKlBC/OL7vr5ftuOPoM7CSnA/eUqJzSUzgyHQHO/Ar5EutsGka2awtyvlqgHIOe9plq+i1+eqfCWziJmv9P8ftNGkFaHJCFwr9r4ll4cGnrVZxgPAr+BYcSs7feIxeJRAAiJwacJkcy0jGVU2B1wdA4mOYUr5npTNdgaLMju+7zssHpT6fholp28MwcHwXGrBQflGLSLPDxV5agbxuio++WZ4DD9OwWwY12tX/hnmQ4LZ3UFaFhy/q7xerQBP0L3H8wP8B6WbgsFrdIeiPNkMzblLi7j84AriSbkGtVcJao54GycJXcWlkYssn+gvnUCMtfF3nb4kvn2QqRW02Jr2HEFk7G8JE/Bcy2bp7nnCiyDOJaX9kZslrM3Fyev1BaUbpIlLT+K+LrQjrBphp/sfJryr4hafSFsODVFI3VBtQfrTiFvM3F5frJ7wjPdRh58S4e+zqD+2S3f6OU6/JF0Y2sODxjtLXTgibwaTHk/4qK4GqZ2Ww4YkH4hVhMu0Y8RZbbQQJSkbQN3/8hhJfFblXFTCaZ0RZrw2XMcp+kB3O4vRzQakOgcQ5nn+quLqQWNv5Yj7PAp+Y1BYyNWUE9
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(86362001)(41300700001)(4326008)(40480700001)(40460700003)(478600001)(6916009)(6666004)(316002)(70206006)(70586007)(450100002)(36756003)(36860700001)(5660300002)(186003)(16526019)(2906002)(336012)(1076003)(47076005)(26005)(107886003)(8936002)(83380400001)(82740400003)(356005)(426003)(8676002)(54906003)(7636003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:34.5197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4898191b-720a-47a7-e904-08db62ec0b74
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680
Subject: [virtio-comment] [PATCH requirements 7/7] net-features: Add header data split requirements

Add header data split requirements for the receive packets.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index f94848e..31680b7 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
 3. Virtqueue notification coalescing re-arming support
 4. Receive virtqueue n-tuple steering
 5. Device timestamp for tx and rx packets
+6. Header data split for the receive virtqueue
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -209,3 +210,15 @@ struct vnet_rx_completion {
    point of reception from the network.
 3. The device should provide a receive packet timestamp in a single DMA
    transaction along with the rest of the receive completion fields.
+
+## 3.6 Header data split for the receive virtqueue
+1. The device should be able to DMA the packet header and data to two different
+   memory locations, this enables driver and networking stack to perform zero
+   copy to application buffer(s).
+2. The driver should be able to configure maximum header buffer size per
+   virtqueue.
+3. The header buffer to be in a physically contiguous memory per virtqueue
+4. The device should be able to indicate header data split in the receive
+   completion.
+5. The device should be able to zero pad the header buffer when the received
+   header is shorter than cpu cache line size.
-- 
2.26.2


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


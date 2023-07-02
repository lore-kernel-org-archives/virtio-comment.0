Return-Path: <virtio-comment-return-6675-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36517EB64DD
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:45:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 879427C6DF
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78635986563
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6F18F98643D; Sun,  2 Jul 2023 23:44:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09E49986593;
	Sun,  2 Jul 2023 23:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPRMxE4glCZAjEaCyvl2lO+g88uu8dHzpOV+hQaVpqndrAINfLqeQU9u/ohSKZCkd+R4/biYIsqcsgQ+W4zR/ZotWHYF72E61SVc7iENamAzqS73QXatZY08BcKGanxwgHH1KXUsPvq5hydAM8vLOVdfXwpmzkSi3cYs9TzvaG/mGXexfnwCkT8Ubhi3HnbGWCfdbTqZz3a1jUVP/i68TkVYOy0+vHJARDUtA87wi1reF5PbxqxgG0b2f/3jew2OAFGUJuK/J/i+4apvb/r3mEwkc+di8A1AYuobKuiGm373ZaaQVcfdEtVQRaHiUIszyVSZYDf2kBHAJJQnQyg5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeC/bvTrcLh8Ysh3Y0fak8ashqJLVTKluHIeX8Q/QBM=;
 b=EN6E8Uf5IHvkA56aNX6m7uC1wFKiFCE4I/JJf6MD45QfSbYRaq9vjyXY0Haptfs9tUp8k5ISdDBZiWTxY0mME8WcIDUMf6QUOd44ogKZv6d1PrEC489QwWZy/lwPGCmjYmyP/szDTdm8jGxTeXXdaoKHr2UMAtdFQYiIydLa334yZeaqL8GFzoKdTKwzzh2QApUuIaO3In1welYDDbne5BOUsDCANYcmOTDUeWCVHRblvXDWSA7bAS6gmZeDY/A8uvjJqOx0QfDI7X280D2FP1Su12k0ssZjRP5p8wW4suYyhq2/fBvkTwZH6DtbpJrmtbdaefBhp1LSVn7ZjtHjyg==
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
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <hengqi@linux.alibaba.com>,
	<virtio@lists.oasis-open.org>, Parav Pandit <parav@nvidia.com>
Date: Mon, 3 Jul 2023 02:44:10 +0300
Message-ID: <20230702234410.47546-8-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230702234410.47546-1-parav@nvidia.com>
References: <20230702234410.47546-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|IA0PR12MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a55ce47-a83e-40a2-5b7d-08db7b56498e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wV38MOZVL/YPkc0n2BUhQf/xYK0339aAuhFw645VAfjX9g/yAMXOPVVv5mWtOfnM0fK4qddfXdQcIl3ByqbGYTHgHzavotOO2bm38uFJrmUkeY+OcInxH1IBoTc0Ku1RojosBiLBcSnf1G80cIu1i4X9W7AhnX1fWTTOXVgynCZPAh5CPhxzMcYOjY3z4tyv7LNuOCG9MEJlxjPuf3hmlqJr9/S/hYTCsP93iWT1nFGorrwAIiB/5JArNLLJJUtY+HpH10oP7CTeOyvoyYqiJrAjIWlY98G51VZ7orKMRvXpsHA1c3LW2ApHJjM9KELz+LBQjncF91ZuSGEnvTjItZpRC9YLmT+2DVQLeYS55lbr3PN13FSsop1sVHsY4iD9s0oDg4isusFJJc2L1x4TkpBhOG1/0Cz507yTxMqQgZgIQ4bynGfri4po/M4n9fn2CwgbZ2ky4wHiSHPWYgLZeDMu7c4zrP4dYgZsbGqvuR2qsXud8AKP8KhXbranfObzhi2VKiK27d4R7aSssX/v2XmEu9c4C9pT03O2XP2vdAARhqLhR+SOV9C4WF0PUTRlMdPEkc9rqm9U5VbRtJTyCpomteffa5zwjiKddAG0DJ5N1NtcjNRS4E+43SAPmhJ92KITgNd49hOreKkUpctUtGDklBWtyDFs6ymfzEYoOiygoyOPGlDtfDrdoj5hLdIyXamqTi3/NVS1Nrav/sNNjopnpVd40FrvLimycjNQRcHaGScH8USPISmgmGXCqDn7
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(336012)(40460700003)(41300700001)(82310400005)(6666004)(82740400003)(7636003)(356005)(2616005)(107886003)(83380400001)(426003)(1076003)(26005)(186003)(16526019)(47076005)(36860700001)(40480700001)(86362001)(54906003)(478600001)(316002)(2906002)(36756003)(6916009)(4326008)(70586007)(70206006)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:33.3589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a55ce47-a83e-40a2-5b7d-08db7b56498e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 7/7] net-features: Add header data split requirements

Add header data split requirements for the receive packets.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 466e4db..1bbf430 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
 5. Device timestamp for tx and rx packets
+6. Header data split for the receive virtqueue
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -293,3 +294,15 @@ struct virtio_net_rff_delete {
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


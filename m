Return-Path: <virtio-comment-return-8968-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC991C47DD3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6089C55CC
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4ED1B9867D0
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 434E1986484; Fri, 19 Jan 2024 19:25:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 364BA9867B8
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaALOiRMWhR/rHciXjH0cs8WhopPeY8Z/wHyf+CzT+D2hR+z/OWONfNJplNVUMBky7MmdXgnSoinZJzH+fwlgmAW9xeQKOwXHA+6bEOuWvwrDDaSo0+ashSOeFa28ric6wlHgWymtMLLKB5UypRUt8p5+pXu9fCjKJiyBd2r0r6D0tyrmtdqXlrSUCosSSn/OQC8oEMEXz8VCUS0Pp2PrwepZG3u8nn/tTN3wLgo+0ffRAtghWTK72ly7dYuAxf4hAqfsKSTfSR/D6wkYo148Cd6FgW4/8OKHjCRvcA2tRfM87seYHn0EcnMP2DZtAaNZrF5c4Au1gFMO0QaWUZ4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbWVfHIlxLsMHy5wnqpsWolcwPAmafDGlh5Pf7nT8dg=;
 b=RraaImgXA84cCotfLPXPYFxiEN6MvCPzfa0Z9Sfb332pjZwraYKLzY6I4svFsnt5QKi40NXcLm0RWngAkzO38LuspX1f868NjHSb2wjoXRsPEPyEAzhtg2u1iAvjRXFWGwppp0hFVLF0pdrhVvLSpaJ2f4Gbt66LEb9OTCAdCtYBbGUXdvlwIAum728o+GUb/ckM2IYpvL4fJG72qO8MjrWOWnlYE77VYV96h09HtoA6ByKzDOr1TnRte1Re2VTWoyRE2fawXY71niYzLgZhoFyWPWe4VIiWZ4KXA0PW44WqxPUHEc5PVKAtm8nNYdDGLNLkxd6MNLHaWzQuAc3Z1g==
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
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 19 Jan 2024 21:24:41 +0200
Message-ID: <20240119192452.3571467-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119192452.3571467-1-parav@nvidia.com>
References: <20240119192452.3571467-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|PH8PR12MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba7d09c-005a-409e-d9db-08dc19246c82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pMsppZQRtTXXoEbsqjrrH5/1ZJ4mWX5Ho+KJxAtm7LwM2604Y6nKCqCP//AoAEdNaPTie1mWBFQBaJhtE0/C/E09NDfx3tYzqjU9dIcHgAyKCZ0c+YFcfN1RyxeKKnwjPM/5CYwV/zQMndSeCPmqw5mq9b94G4fBc4ipuJYlhp6yOIBgIN6K1twrUzVyZ3ctWcc5bF8IKtE6UY8XSqD0rHgqvU8noCfNiGsEMw8H1upgJhGYFgRoMmy0lE+s+eux7VhlrlQxrIiqwwZ1kNPTitDuoINK8o06+XIpBXZpoQXQE63JW4yw7WF2NLMRB6M2QhnyjfhmcL+C5TJZBXMB3xXnv8C14xTMtTrPJzTQcVXz4dmeMh4syABWJWzMTb/ERBN/CFg69PsIozYaSYfFadtOsnWncMYCHMPKYvVKjaX2CdVUqhUa8YwO10qQvpccf30oGFL8t2lFOWAK6gzTEZBb6sF+VXybAe4uhAv16XaR5M4RQrh1IFpRfd6qk+G7x8Muz7e5ONuHvA7GC5rXkEvzx5WQznGjqHnDijfasMme6reV+3SFGem5mNIx7n7HBzCFCKehBYEumdMOlYhxnopfujcqbdA47T9liAJFFFoQvF2cqY8BVFo95kg0H6DpAW59jF/h3Ja4ItDfH5nhq5HpjV8aMIwhfXUVRabiTAC+42ItAOoEeUdH8ImGpopmwBkvX4LMnlz9/LpVgHkHjMB7ipsGicDn6bml0b8krCC3AopJAhTS+W8vmC3D6gB1ozZPLk3LtBgVj0xbygbK2g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(7636003)(16526019)(26005)(478600001)(1076003)(426003)(336012)(40460700003)(40480700001)(356005)(966005)(2616005)(6666004)(107886003)(316002)(86362001)(70586007)(70206006)(54906003)(83380400001)(110136005)(41300700001)(5660300002)(8676002)(8936002)(82740400003)(47076005)(4326008)(2906002)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:25:40.8237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba7d09c-005a-409e-d9db-08dc19246c82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6771
Subject: [virtio-comment] [PATCH v7 02/13] admin: Add more admin command status error codes

Add more error code values to be used by new administration
commands in subsequent patches.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/admin.tex b/admin.tex
index 00784b3..fdf25c5 100644
--- a/admin.tex
+++ b/admin.tex
@@ -159,12 +159,20 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline \hline
 00   & VIRTIO_ADMIN_STATUS_OK    & successful completion  \\
 \hline
+06   & VIRTIO_ADMIN_STATUS_ENXIO & no such resource or address present \\
+\hline
 11   & VIRTIO_ADMIN_STATUS_EAGAIN    & try again \\
 \hline
 12   & VIRTIO_ADMIN_STATUS_ENOMEM    & insufficient resources \\
 \hline
+16   & VIRTIO_ADMIN_STATUS_EBUSY     & device or resource busy \\
+\hline
+17   & VIRTIO_ADMIN_STATUS_EEXIST    & device or resource exists \\
+\hline
 22   & VIRTIO_ADMIN_STATUS_EINVAL    & invalid command \\
 \hline
+28   & VIRTIO_ADMIN_STATUS_ENOSPC    & resources exhausted on device \\
+\hline
 other   & -    & group administration command error  \\
 \hline
 \end{tabular}
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


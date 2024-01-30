Return-Path: <virtio-comment-return-9040-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F62CC48285
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C26B42236D
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AFAC49868B9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A224C98687B; Tue, 30 Jan 2024 14:07:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94D6D986888
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQn8iHwcOm9YbU9qymbQ1ktvSdhriL+8WE6iM02AvmT78Yyg5eJKw3YUSUq6FTcwJ726byEq6OZsnTyUmuT0FXS+t7/+1FW3RmoRHgwAUMGoKxH6yjapfKGsXjibmFuU3lIKL0vRVdWTv6YEwUWP/LqTelpJ85S+S8yt+Tz3pAV4WL+ip6PH7D0Cb79qsJ3vdi304ZqPTdLfWTL1s9eTO4mIH78e3eV8BpsyDWUnxFAqV+/wZjRqAybcOSOa0kIOhHOhX2S1Mp88q1FCoqJ6naku++2DBj3S6GD+5PT27pAgpoXs+FJPFfRbQhaa9BkD73G/u79pHevNK9MZGdxgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbWVfHIlxLsMHy5wnqpsWolcwPAmafDGlh5Pf7nT8dg=;
 b=fZUt1fHpNKk/o4ABTxvocwT1YmBc6QdMjY69zXZ4+5VUpkgXjXQNB1LielHq0o/YmlY6WrO/GbTN3bt12kgsHDv3gjxySm1Kx9X09mN4E6XSkd7+wd4jHdDowNM49mYKLB6nwCIGFhhxf+8HRCcwBDlS46+9EtHuz7pSKEqZwYsOeD8cLo9jBySNrw5SH6Iv6Zq+h+sg3eCyoHgGS/c3pX3qKuN7H4pbhregDWXSMb2w3jACTwkOWYYWFoXAjXsUx8rSQf2AOcqbJn/XN16jXSK9BuiaqVIZuNE5H2I9gd5gyeDcOZ3hVzmggNAGwJZKgNIifmP2sjbvN/ITIpIdNw==
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
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 30 Jan 2024 16:06:31 +0200
Message-ID: <20240130140642.406882-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130140642.406882-1-parav@nvidia.com>
References: <20240130140642.406882-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DM6PR12MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec8080a-95b4-4b4f-8e4f-08dc219cc72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uMxiYEBBAip89MyoCp5OmdNqPgK+em07s45upnFs9Md5XvrImL87o7SCuE88BecV0v3JsNsQi6KueldwUpExtiIpcTlrtWdl2bujT6R0i8OhBE9ANQMJKtreSfPQsRZQxQduOQhYyDIh+3h1nlExDXGbSRLRP34MocsMT8fgMo9MvfqnehnAJJuwdHcKvITYQpK+2m/yvOxzVMdWIxN0Z1VHH6FKMlOIfj1h90gbVNtuufMJY+fOHlxiW/sEUoYj4y4BtQgOIITfYBP10fq6jmtzpxQbGLvenDCnFRBSBgizTa9ruIXQrC0e0eB+zaVrfEdjsF3+niyuTtAda/eEghy4v6DgXZWDw+8mrtj9djagjBhaoEjzI+aVznd6FY8VcDT3UpFs8dAwGeYYfD42f1HM1QIy5603oe/Gs1U6XpE8FxQTU4q+dwS7xHhWrwTT7Om5XeLlT6/XpvpVq5ke6BKe+XQByYgGpWnYwEufUKRmOHYO1EiWMoY3tkak2YZ0tWb1jcI0TiU/84od89v9i0X5oJLWk0Ag7ULiFrCOXfDPeNVWFfkSzrMT4HD49xlFhmGEqctWRZoPn/xqQ+G6zWEI03qMwwE8XycMd0beY++5xAawH29I53lK+yPa4B6oOgZ+wQego1ThvY7FocRmI742QD5dXtA2WZz1Yqce8NSyPnxvL8uNEm17T+B8ECSCTLYC7GtpIMzOh2kTe2ynYtsUXm88tXpAkRMVFxIYA8/7JuMaf5dDzjWYzG4iFJpqdswDEIQ68NeeAgBgXFBPrQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(8676002)(8936002)(4326008)(2906002)(5660300002)(86362001)(110136005)(70586007)(54906003)(70206006)(316002)(36756003)(966005)(36860700001)(47076005)(7636003)(82740400003)(356005)(478600001)(6666004)(83380400001)(26005)(1076003)(16526019)(2616005)(107886003)(426003)(336012)(41300700001)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:21.8758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec8080a-95b4-4b4f-8e4f-08dc219cc72f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315
Subject: [virtio-comment] [PATCH v8 02/13] admin: Add more admin command status error codes

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


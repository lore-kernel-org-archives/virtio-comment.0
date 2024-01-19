Return-Path: <virtio-comment-return-8967-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F9DC47DD3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DFB9141475
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF03F9867EF
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C3FA59867B5; Fri, 19 Jan 2024 19:25:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6A9A9867C3
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXNCofUvNlMJcgARcL9Jwmd3gcylmIylG2iX0KMZrDEdqayU2R6tFbmjucivdVErz1PE+iqY4+wbmelsKc3gO5mhJ2Qh6Rd+WQdskM9og7q4TGnmQGdBOVNqFGrBxr4jF8CMy40EqMtJ4HW+rH7rY/yQbZa1YT8q5ZYK0Wt+9lNIm6TUYKfrG84ZO11Tnvk/sibue/lM0Jgjy1mH9Vo/voTu6YQpQCFojC2YR/ZLDBOMNneqot2QPiwV8p+ib3LTfg70+cr+GztuPyKyWWqjMoUIrNlq4kzo4W4hEz/UXtI/CfhNYGLHDlV0LQgJTWTImuBXL/OvSjIgTsG7owJMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YSZDR227wiRxpo4fdWZEX8t2PQs3+lZL0G7e/kR2zc=;
 b=bxkH/TjCQXb7MsJcuGuPog/+Vn7sMBLv5tVODvi3R6h9pKL4uaSoarjhBlnarixvCgEugm83exTHpR87R24MmPwoaJOg9lHThvy0WMbXkis1+oi1BRRHwYo4MytvcwkHiiTS1QIoTKrftSlBO1ydAxOQXVZ8vb6p70Nae9OJsxQI+qw5WM/yWawAHCnK/xpBR4oTuOm0TpRgl5qHVphZMBBI92xoF7nKa2yVVy2FepZi37ixsxSnEF6uycULFyiqPs6AS1tC36OK8ciKfoskoQb0W92Yl59YcsfTKdRKCGCEW7PQgpPoia9JzrZSMQ7+G7DLiFu7Fw+nvIeCL2hLQQ==
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
Date: Fri, 19 Jan 2024 21:24:40 +0200
Message-ID: <20240119192452.3571467-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: de82c83f-4f87-4dab-630f-08dc192469ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wIMIZHvzbfivMZ9Wg7FpCCMFqYJumEUFLuDTCLXJKMdigplDcQib+6a3RwnaqbBAq2JJ69ja91vyCHx1kPjJN8owuAfScNrw80xj+xEghBe36lE+z6N8IGygY3ecQqozWGMbj/E3bocZdo2yxETY1QXh06WHgTINguqM4oUpV7m+UegrMaHV2ZQiC/PiTx78o1XQB/w7+zWW3BSWgj8CvdT0WPyaY6BDzZXwOkKEfFAVehAZq20rnXLr03qQBdFGv+zgZKugWqtPqhmb8a2hsSffHN/NLPzdzxtRyfb3TxPxEblSvwVhgpcnxdJS9cPsQQiCIUJDuNUN0fd5k3iYnrX8OuRt5iGAl52qG8nSJ53F4UQbI/qJZbOQltmoRbeOOqI2ORCn6azoo/7YLvcWzmWZsKokurnRX0nqoCKOG5I2tUNdvX4lUoSARhKNCU+gSVwBO0pkZms0umeVw/TWvxEQ9oBAXiFmP81RKZBD0nHhrSI+VeVWY+/gI6TdcxiPIZSvarqEoN9OiMEGFq6ORFlP180TGJpUGy7Uh/7ey1QGTrXGdTrIkNizvhyHjJ3DHHY7oGrlrX+QVXwyRBuPv/VQzka4YIkIgY7BtAfeL5K0lCnZUS6//QFz/B1Mn0FkC1awF+xMC5PmE+/21ByjZwzzvDp3c4k729TZvG4ZW4eVSwpsfVq437vLcUEFCBVWslCAyMe+0ZE+RKBUzfbhtk4WQZpBlW3rtoUal+1hQbRvv8wY/jAOkmaMDvy8eMMlN9yFjn4wv4fTWJRri45B+b7xbUP8QyAV/Z13QDcTDDs=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(83380400001)(966005)(41300700001)(478600001)(40460700003)(36860700001)(40480700001)(82740400003)(356005)(47076005)(7636003)(426003)(16526019)(26005)(6666004)(316002)(54906003)(2906002)(86362001)(8936002)(8676002)(336012)(4326008)(36756003)(70586007)(70206006)(110136005)(5660300002)(1076003)(107886003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:25:36.1232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de82c83f-4f87-4dab-630f-08dc192469ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
Subject: [virtio-comment] [PATCH v7 01/13] admin: Introduce self group

Define self group to control the self device itself.

Subsequent patches introduces the concept of device capabilities
and device resources which utilizes the self group to access
capabilities and uses device resources to refer to the device itself.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 0803c26..00784b3 100644
--- a/admin.tex
+++ b/admin.tex
@@ -1,7 +1,7 @@
 \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device groups}
 
 It is occasionally useful to have a device control a group of
-other devices. Terminology used in such cases:
+other devices or self control. Terminology used in such cases:
 
 \begin{description}
 \item[Device group]
@@ -37,6 +37,11 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
 
 The following group types, and their identifiers, are currently specified:
 \begin{description}
+\item[Self group type (0x0)]
+This device group refers to the device itself.
+The member identifier for this group has a value of 0x0. This group type
+is used by the driver to control the device itself.
+
 \item[SR-IOV group type (0x1)]
 This device group has a PCI Single Root I/O Virtualization
 (SR-IOV) physical function (PF) device as the owner and includes
@@ -78,6 +83,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
         /* Device-readable part */
         le16 opcode;
         /*
+         * 0       - Self
          * 1       - SR-IOV
          * 2-65535 - reserved
          */
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


Return-Path: <virtio-comment-return-8978-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A144C47DD3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9A8122B058
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 846419867E3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6BC2C9867DE; Fri, 19 Jan 2024 19:26:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D84B9867C0
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqcrJoOvSPYeoW6JFTahLlxlhzA+gNeIsTethGGVReQQjDdco/tzIWRRCB2NQuMwTs/hmcU08qQKSaHQGEytQtDsMKrPdM6L5wzZOHRdK/WqeEeixOTDPXJ/p7FKGSgE6dGzxotBptyh3IP5H4fj1N3meQZXhnBrsyG5z++lDznz+1B2817l0o4nLV+SSlCoW0VA3Zx/X+6E4qm9mYmQCJ1GfrLpz6700VBbiJ5dBOpm2WTnrkHEJRevcfelDW+9qA7X3X02IPoJMo7Oh1bUlq9pO1SK0VBVm0t1UvyDHXbo3meGTFsXmSx28zXEVI5x73wdihp+ZAZ6qQCvUzQUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qeh2rfog77hlftkIETglsQbUYi4r2R2IhjxWFsvVEIY=;
 b=cw5ZyBuDRdZ3yuZfVpYx6d9XO+/T6YJdoMpX4V5JxK+lIk+EkgD7oNUx0ObMERmDCJJUd6LXsshsqEWMWRRfPUj8HmZcIgG/W1GARfITt5TM2kNERIhmeWius5uRnJqyFaaVa1l2fhTFYdsn1m51lDo7rs/0bLStFc6EZCCfEQjnAXVmGMXPOQpEq+ssPW0pjRZTZiOBjs2S4qSL7YZxVGLlZPjRg73YTZCfweFxBW/DnmXetwSKpvuFR8Sa0OaehY3mz74wsnj+gx8JBdH8fpu41R7+HG+FO9qpCfq3RW+Bq216MoCLS7nsfZeiNNcLSAUgtbUrsJLP0ggsP+cfBQ==
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
Date: Fri, 19 Jan 2024 21:24:51 +0200
Message-ID: <20240119192452.3571467-13-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MN2PR12MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: 14da1e1b-6d21-4d16-22f7-08dc19247e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5z+09W0oTYlHGMtILVS8OZE5Viv1q4fSxQxehY0MLAAQZ4aTBD5DJoWdXnqCFVN8hTtHWWa8YM5DiOF6KofWgFZ20uncrLg9DMV0+zqIoAghCDZ67UZmXuC76twvXJgmzt/4pN5W1b4pfQsYoUko3/0DGuo0zY+BMSh7CHuhoBSbfezBm8+VXxbPduAZDcvFp4yeyI970Q+K89aT1rusLGMAZ9zW/y88Sb86Rn8r0z6RA381cvSekG5O4K6TD0TsJ39mK9EXOmnTbO7n3V3//IfO8fzggUdvbBrjxnuaI3qXbsi032e3EOLXlnfZVZboyCXbt1rbHlbkIdNMxUiKAkqXdETvfyKQ+OmR1JrVuSmDMB1pqfKjVv9V4gA1foJwEHY9ZRqxQHjqdNOE3SSbY43zck13w6Wcv0HYM6+fj1gsVCXzQOmNvynKoGvc5DmKrZQjDViBXpaw6pMkBMTmllBZrUYdEXovZwZw3eHj4ILs/Nu0TK23XqYLkILSOQZ2Ol9FAiCAWj0wmRXDcD1AI6WwjIrSj033Qx0pPkIOsfCRgdPGNBcd7AEJ9HsS9QiSHoZ2UI5m3Pfnbn9ksHNoc4AB3FhSlthfXT/UA82HsEuqmuly9RjfX2uapq/xwm95tf1RUkveB+9eCwplpdSQzwSi/RHb4qkGqGMOhhKnmsSODaIqt+QKK3PYqPWJFWFcukDJiTlu/DctHCHroT16e+8iB/XGh4dP5ROpEkGHaULKAcZwAKxRz7r8sbp5n5W7DnNgKqDEarCMQ7bpK4lFumZt1BmFddJKYcmsXajieB8=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(7636003)(16526019)(26005)(478600001)(1076003)(426003)(336012)(40460700003)(40480700001)(356005)(966005)(2616005)(107886003)(316002)(86362001)(70586007)(70206006)(54906003)(83380400001)(110136005)(41300700001)(5660300002)(8676002)(8936002)(82740400003)(47076005)(4326008)(2906002)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:26:11.0694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14da1e1b-6d21-4d16-22f7-08dc19247e91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
Subject: [virtio-comment] [PATCH v7 12/13] newdevice: Improve the appendix chapter heading to reflect the content

Current appendix chapter already covers useful notes for creating
new device types and also for extending the device in
'device improvements' section.

The chapter heading was not reflecting it. This sometimes creates
confusion/misinterpretation to readers.

Hence fix the heading to reflect the written sections.

While at it, remove the empty lines at the end of the file.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 newdevice.tex | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/newdevice.tex b/newdevice.tex
index 28e1c7b..93feb71 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -1,9 +1,9 @@
-\chapter{Creating New Device Types}\label{sec:Creating New Device Types}
+\chapter{Creating New Device Types or Extending the Device}\label{sec:Creating New Device Types or Extending the Device}
 
 Various considerations are necessary when creating a new device
-type.
+type or when extending the device functionality.
 
-\section{How Many Virtqueues?}\label{sec:Creating New Device Types / How Many Virtqueues?}
+\section{How Many Virtqueues?}\label{sec:Creating New Device Types or Extending the Device / How Many Virtqueues?}
 
 It is possible that a very simple device will operate entirely
 through its device configuration space, but most will need at least one
@@ -13,7 +13,7 @@ \section{How Many Virtqueues?}\label{sec:Creating New Device Types / How Many Vi
 receive input, and one which the driver places buffers to
 transmit output.
 
-\section{What Device Configuration Space Layout?}\label{sec:Creating New Device Types / What Device Configuration Space Layout?}
+\section{What Device Configuration Space Layout?}\label{sec:Creating New Device Types or Extending the Device / What Device Configuration Space Layout?}
 
 Device configuration space should only be used for initialization-time
 parameters.  It is a limited resource with no synchronization between
@@ -26,14 +26,14 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 writable by the driver.  Therefore, no writeable field which triggers an
 action ought to be wider than 32 bits.
 
-\section{What Device Number?}\label{sec:Creating New Device Types / What Device Number?}
+\section{What Device Number?}\label{sec:Creating New Device Types or Extending the Device / What Device Number?}
 
-Device numbers can be reserved by the OASIS committee: email
+Device numbers for the new devices can be reserved by the OASIS committee: email
 virtio-dev@lists.oasis-open.org to secure a unique one.
 
 Meanwhile for experimental drivers, use 65535 and work backwards.
 
-\section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types / How many MSI-X vectors?  (for PCI)}
+\section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types or Extending the Device / How many MSI-X vectors?  (for PCI)}
 
 Using the optional MSI-X capability devices can speed up
 interrupt processing by removing the need to read ISR Status
@@ -51,7 +51,7 @@ \section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types
 number of vectors as possible, or disabling MSI-X capability
 altogether.
 
-\section{Device Improvements}\label{sec:Creating New Device Types / Device Improvements}
+\section{Device Improvements}\label{sec:Creating New Device Types or Extending the Device / Device Improvements}
 
 Any change to device configuration space, or new virtqueues, or
 behavioural changes, should be indicated by negotiation of a new
@@ -63,5 +63,3 @@ \section{Device Improvements}\label{sec:Creating New Device Types / Device Impro
 can use a single bit, but if one feature makes sense without the
 others they should not be gratuitously grouped together to
 conserve feature bits.
-
-
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


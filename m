Return-Path: <virtio-comment-return-8977-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569DDC47DD3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1FED71A98C3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15DFB9867D4
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0AA1D9867D2; Fri, 19 Jan 2024 19:26:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D947F9867CD
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsdrK3glQoNFEw2ZxPcvWMdvsGUL3jg4MSnVVfyTwedWxAtBSe3WWCAKtiFLgcu0jcpUhJP7CRdBROTRACVrSiKhQPUCZF97GHqm4gOX3Si2TdFvwElgF1ngFZ4zUTfudlzHnT74OqNAh3SCxIC4pTEat3Onhb7i8faY78J9NpdXPX8k3ats2yNJeggi/urJd365nHBM3VtlqkBa0wG1YqeIokIzYmh0Qq2LWH4U57d62HaVgPSeDjDhHiA8P2pySVNPKoBu7IU02wZDftjtcyjzkSI7jCRQlh25gFTVC0UdlrJ0rZjRK9J9KaE+yK8iVND/Gqs/832dAjSa4+R0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giHo6oWy1sxVnkylrqTHKqtnowLgVuIRMRKZ1dE8vYQ=;
 b=cSfhk+dsux+PO5lirwq+LTeKgeruI4Sz2q4hgtO+UeVH7i24wiUWfAlFB1ZdBJjEcssMut1h/+VYPm1yBqIn6LR14d5kty2YixNs8pUp2V6xWWQytDlKdEmjlO6PFZ3fcqGdabwCqqGLh8kWq+NEqT2pqif+u5qsd2hxDV2MiOCRoYYKKlEmnHeHWSO3cJPvHWWC0haax3HHClWdrv0Dd7s1OAduoB5ZXVVQ77M6Cx1NunBzoEWhDzCk54Zv4tQaGrsxl9DD0OpKitxfYp2zKLnuzLMMVBclP+6pqbui2AGXAEKIf689OT0vl77rq43bE8MWBg+SB/eZQSHmCmcAsA==
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
Date: Fri, 19 Jan 2024 21:24:52 +0200
Message-ID: <20240119192452.3571467-14-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|DM8PR12MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: 26642805-76a2-4ee0-f682-08dc19247d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fsGRAWWmWw8tWr2joHKP3rWEdhhRgLvgGUApUfiA9sTL8+S0SiUG+HSkONG6ddrHdKMgDXqfD+dfJ2rbNdH5xkyDJOIN5RFYOzVPCY+CJMyIiVqnU2OhTc9t72nbgloDBV9ArWoX+poFJv2C/i31mk2K4XwENOXUx/poXCtzDUBidGthg1qKaMoL4KquXYMw8WqBTdldi3AhNad+n0nbq7QBUkwh20RbZAb4oqK0B1FUfrIiMtlek6jw51IRQscVaiGm0uGyXN4f5sf8ogJJc5yJo4cpwMGdT1pnAqz+BN8+JlRDto8PZA5LsTfm0DthoE6L7Yp8vil4sinUxe8uhZF7gkVXyTmgH0JNXJTryZ3omgEANWjVedwtNa71e9dHlp5A7erk/jCkmmlcaX4NgUPEzGwmP1Zwd4Qeu5EXmrJC5eHRHEZZ0HsOcMvvZoi0pJ/Aky/pcMbfBvf+Tdpi8aNGeWcOAZ72EhPSPt6iJIZi8W/v0pgrxAyOtaRT19VyrH3LRbM/oIHsfUiNsjD8WAvH5wosDFejkgv/dY/6WlLp44YjsPwgvNoCUGykpOMCLYXXLIJCHYj04ngPhuRW55eONTEkOgFDwSAsmuKuLKIaQouVPnnLI+WGsPRJ5Zgj97fw9Byl9mOe/N0QrTNJ3FsDLGRjz6+mGP0SLP52AZdQOA0xeFeu63xRVJ7K76WYDFhGqEomrNOhH2t2DZOmOh6oX2Dh2/lyZ1zDJhRnd/vgWnY/CkRhyTsit8U2rFvgM7XCRHECh+p4WPB/Giaa8HmuJAjkjgP8PbxrTclFVCc=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(966005)(8676002)(4326008)(83380400001)(1076003)(426003)(336012)(5660300002)(8936002)(2616005)(47076005)(316002)(70206006)(70586007)(478600001)(54906003)(107886003)(26005)(16526019)(110136005)(7636003)(356005)(82740400003)(2906002)(86362001)(36756003)(41300700001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:26:09.5690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26642805-76a2-4ee0-f682-08dc19247d91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5463
Subject: [virtio-comment] [PATCH v7 13/13] newdevice: Extend informative guidance on capabilities, resources

Add few informative guidance/notes about which use cases to use
device capabilities, and device resources.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 newdevice.tex | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/newdevice.tex b/newdevice.tex
index 93feb71..fc10632 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -26,6 +26,29 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 writable by the driver.  Therefore, no writeable field which triggers an
 action ought to be wider than 32 bits.
 
+\section{When to use Device Resource?}\label{sec:Creating New Device Types or Extending the Device / When to use Device Resource?}
+For a desired functionality if majority of fields are configured by the
+driver, or if device sets majority of fields which are changing often and
+driver wants to query them, in both of those cases, using a device
+resource is preferred.
+
+Even if such functionality is limited to small count as small as one,
+using a device resource can be helpful with large number of devices.
+
+\section{When to use the Capabilities?}\label{sec:Creating New Device Types or Extending the Device / When to use the Capabilities?}
+Any field which is more than a bit that a device want to expose to the
+driver, can be exposed as a device capability. Device and driver
+capabilities are not constantly changing fields during the life cycle
+of the driver and device; capabilities are rarely changing parameters
+used during the life time of driver possibly dynamically. Sometimes a
+system may have many similar devices, but each device may have different
+attributes, it is better to use capabilities for such attributes as well.
+
+\section{Read only attributes as capabilities?}\label{sec:Creating New Device Types or Extending the Device / Read only attributes as capabilities?}
+If there are one or more device attributes which are read only for the driver,
+they can also be used as device capabilities. They must be documented as
+read only so that driver do not try to change them.
+
 \section{What Device Number?}\label{sec:Creating New Device Types or Extending the Device / What Device Number?}
 
 Device numbers for the new devices can be reserved by the OASIS committee: email
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


Return-Path: <virtio-comment-return-9087-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C287FC4828D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 455E42A892
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2FFB59868EF
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 24F8C9868D7; Wed,  7 Feb 2024 07:24:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FC8E9868DE
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWAH9zLdQf9a8rmd8TmdGFY9AEpCRae17Jxl9R2AJP6Qkd7TGHFBmLxmei81t21FHqEvqyplg6z7X44le0c/N5g8a1xevnLM2bYezRPK7BKxOct2wP6cb1r/2+JE/RNbQJ7V7H1yU/V6dX0MFr502ty6SakUQrOOipiOnz2C5LX2IDCbF/bqhyggEaDY+0rSbuSrNji7LljO3IDSWkXzNzKnIXqt0BJsShlKRdo1sB5mctH0I4/pq9RbLBUCoR3AopmRd69bRmunhzBKZDC/8P6CRac+K35uH8u2nhz1sKHoseNI2WlW3x6ha5bPEA9xHWCT6ORJtg9ye2FMICn0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DXnPotUe+VHv1eiDLUilyv5hPOZ12EljrDAZ+h/Wdo=;
 b=MQq0XNvOQM0VRl2ZBbIJhu7MJNizx/Iwe6IiiHT0TKPNmgwSPsyclBfOJtup00k4JpN2ir6rQGxt/XQsCSNiIiJZ71eoEClRidMaC7cw8G28iqX9XTgl4t5EFOTr/LW6sHlPKdPffugswqDuwzhR3nk+zcyaZivVgjcw1wqKNDY216O46wsAMwvnQoNoAaBLxo0rj4THWKft+2XolL8Qk02CiikwKaaeeMUh8FEcT1+GgRZ3cwjWH+6C/7UiYC5lsYD+mC6+B4s6If8K409NoLOJznJyrKRI3liuQMIHgRKZp1ApcskbhqufDlzPxdiWz0Q77S6NCHWKDdLN3zj9LA==
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
Date: Wed, 7 Feb 2024 09:23:35 +0200
Message-ID: <20240207072336.477606-13-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207072336.477606-1-parav@nvidia.com>
References: <20240207072336.477606-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|SJ0PR12MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa97d93-bdef-4a5c-9f7a-08dc27addf89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mgGbm5Arl0jI+qC8HzkStZJX11qfV+BVzmXAZDRgR282RN4k28f+4xYJ4iMRN67Rp5pwxGdPOu203sP7plFVgRDnScarYc0wFpJ8ytc2ccavrtKMFsnA1zzLtxW3OAD9hWDGKQ2VsKj2ZiH0H8rM3cP9p5DebjhYsDXY7/C7rcKXIrOLX2+LWiDpL0mFoKc8FkxekgMKix0FSWSL8nYYMV1ALREuKpaUfCVy3q4vrvoSMN3ac7YaMKTcAeaoPol/pJbi9RuRFpzEgHW4aO5Fy4GpJTEE+41nDWNStunto4mq4+RRgehxf7imShoP8GZ7s7HcF7o7BeOhWRjJ7rBiN3hkPdqO5B1xYfxS2WALHKBZit/5CGkKzYnSw7fNRKGSW9ZiaRk223mRJW8Jz72d0RV39FgLVq87ReEHlQ/B+E/Ps78gt3+RJbVS3p0Zd/dhQPxAYKwyNkK49nZcuFauC5NQaEnuUpDxh8Z6sNB580dp6MyU6fOvXkN4AZQJVcVVm+zaTgrQFttgke/sGubHlLdrryGiLUaIzrlz7wuheYVduaqvlF3GlM9zCJr46Fd1HuWrvrtBOmYjpRbWYYJNSRFoK2Sym1vFaOJDVCStzx7wdt9hHBkW5+ae/OhCBPlYzfGrcqM309O2BYDHIZWhhNqMKNw4k/gRv3Hcv5cBktkDyRa088yo3jnU5yqqYtcGrB1zZy+kTUzbwiJ+TIsqtsfIDbnq5rDEWK7yeMy0eYD/EH+H5n/NYHExYsfa6NC//zV7Qx+JMTDaHJapv7FwPDyQ5I042NDSB5zoGj7S2vg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(40470700004)(36840700001)(46966006)(36756003)(5660300002)(2906002)(41300700001)(86362001)(107886003)(426003)(83380400001)(47076005)(2616005)(336012)(16526019)(26005)(36860700001)(40480700001)(966005)(478600001)(40460700003)(1076003)(6666004)(356005)(82740400003)(7636003)(70586007)(8936002)(110136005)(70206006)(316002)(54906003)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:51.1525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa97d93-bdef-4a5c-9f7a-08dc27addf89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5469
Subject: [virtio-comment] [PATCH v9 12/13] newdevice: Improve the appendix chapter heading to reflect the content

Current appendix chapter already covers useful notes for creating
new device types and also for extending the device in
'device improvements' section.

The chapter heading was not reflecting the notation for extending the
existing device. This sometimes creates confusion/misinterpretation to readers.

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

